# Docker PHP-FPM & Nginx on Alpine Linux

> Docker setup for PHP applications using PHP-FPM and Nginx

## Images used

- PHP-FPM `7.4-fpm-alpine` : [Docker Hub](https://hub.docker.com/_/php/) | [Github](https://github.com/docker-library/php)
- Nginx `1.19-alpine` : [Docker Hub](https://hub.docker.com/_/nginx/) | [Github](https://github.com/nginxinc/docker-nginx)

## Usage

Required development environment:
- [Docker](https://www.docker.com)
- [Docker Compose](https://docs.docker.com/compose/install/)

Configure the development environment on your local machine:
```bash
$ git clone https://github.com/t-hugo/docker-php.git
$ cd docker-php
$ make compose:up
```

You can now access the app: [http://localhost:8080/](http://localhost:8080/).

### Environment Variables

#### Nginx configuration

| Variable                              | Default value  |
| ------------------------------------- | -------------  |
| `PHP_UPSTREAM_CONTAINER`              | `php-fpm`      |
| `PHP_UPSTREAM_PORT`]                  | `9000`         |

### Build arguments

| Argument         | Default value |
| ---------------- | ------------- |
| `SERVER_NAME`    | `localhost`   |
| `DOCUMENT_ROOT`  |               |

### Project tree

```bash
.
├── .docker
│   └── nginx
│       ├── Dockerfile
│       ├── docker-entrypoint.sh
│       ├── docker.conf
│       ├── include
│       │   ├── general.conf
│       │   ├── php_fastcgi.conf
│       │   └── security.conf
│       └── nginx.conf
├── .gitignore
├── Makefile
├── README.md
├── app
│   └── index.php
└── docker-compose.yml
```

## Use Makefile

When developing, you can use [Makefile](https://en.wikipedia.org/wiki/Make_(software)) for doing the following operations :

```bash
❯ make help                          
Usage: make <command>

Commands:
  help                           Provides help information on available commands
  compose/build                  Build all Docker images of the project
  compose/up                     Start all containers (in the background)
  compose/down                   Stops and deletes containers and networks created by "up".
  compose/restart                Restarts all containers
  compose/start                  Starts existing containers for a service
  compose/stop                   Stops containers without removing them
  compose/purge                  Stops and deletes containers, volumes, images (local) and networks created by "up".
  compose/purge/all              Stops and deletes containers, volumes, images (all) and networks created by "up".
  compose/rebuild                Rebuild the project
  compose/top                    Displays the running processes.
  compose/monitor                Display of container(s) resource usage statistics
  compose/monitor/follow         Display a live stream of container(s) resource usage statistics
  docker/urls                    Get project's URL

NOTE: the / is interchangable with the : in target names
```
