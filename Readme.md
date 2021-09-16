## Installation

1. Build/run containers with (with and without detached mode)

    ```bash
    $ docker-compose build
    $ docker-compose up -d
    ```

## Usage

Just run `docker-compose up -d`, then:

* React front app: visit [client](http://localhost:3000) side
* Symfony api app: visit [api](http://localhost:8080) side
* Logs (files location): docker/nginx/logs and docker/php/logs
<!-- * Logs (Kibana): [symfony.local:81](http://symfony.local:81) -->

<!-- ## Sources && FAQ -->

<!-- [Symfony docker stack](https://github.com/maxpou/docker-symfony) -->