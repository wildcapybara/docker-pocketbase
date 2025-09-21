FROM alpine:latest
ARG PB_VERSION=0.30.0

# Setup requirements
RUN apk add --no-cache unzip ca-certificates && addgroup -g 1000 pocketbase && adduser -u 1000 -G pocketbase -s /bin/bash -D pocketbase
USER pocketbase
WORKDIR /home/pocketbase
VOLUME /home/pocketbase/pb_data
EXPOSE 8080

# Install PocketBase
RUN wget "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip" -O pb.zip && unzip pb.zip && rm pb.zip

# Optional if you have local migrations or hooks
# COPY --chown=pocketbase --chmod=700 ./pb_migrations/ ./pb_migrations
# COPY --chown=pocketbase --chmod=700 ./pb_hooks/ ./pb_hooks

# start PocketBase
CMD ["/home/pocketbase/pocketbase", "serve", "--http=0.0.0.0:8080"]
