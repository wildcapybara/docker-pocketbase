# Docker PocketBase Image

A lightweight Docker image for running PocketBase on Alpine Linux.

## Features

- Alpine-based, minimal footprint
- Runs as unprivileged `pocketbase` user
- Data persisted in `/home/pocketbase/pb_data`

## Pull the Image

```bash
docker pull ghcr.io/wildcapybara/docker-pocketbase:master
```

## Run a Container

```bash
docker run -d \
  --name pocketbase \
  -p 8080:8080 \
  -v "$(pwd)/pb_data":/home/pocketbase/pb_data \
  ghcr.io/wildcapybara/docker-pocketbase:master
```

Replace `$(pwd)/pb_data` with the path to your local data directory. Access PocketBase at http://localhost:8080

## Advanced Usage

To use a different PocketBase version, rebuild the image with:

  ```bash
  docker build \
    --build-arg PB_VERSION=<version> \
    -t ghcr.io/wildcapybara/docker-pocketbase:custom .
  ```

Mount local migrations or hooks:

  ```bash
  docker run ... \
    -v "$(pwd)/pb_migrations":/home/pocketbase/pb_migrations:ro \
    -v "$(pwd)/pb_hooks":/home/pocketbase/pb_hooks:ro \
    ...
  ```

## Docker Compose Example

```yaml
services:
  pocketbase:
    image: ghcr.io/wildcapybara/docker-pocketbase:master
    ports:
      - "8080:8080"
    volumes:
      - ./pb_data:/home/pocketbase/pb_data
```

```bash
docker-compose up -d
```
