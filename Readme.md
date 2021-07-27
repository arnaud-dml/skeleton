## Installation

1. Build/run containers with (with and without detached mode)

    ```bash
    $ docker-compose build
    $ docker-compose up -d
    ```

2. Update your system host file (add symfony.local)

    ```bash
    # UNIX only: get containers IP address and update host (replace IP according to your configuration) (on Windows, edit C:\Windows\System32\drivers\etc\hosts)
    $ sudo echo $(docker network inspect bridge | grep Gateway | grep -o -E '([0-9]{1,3}\.){3}[0-9]{1,3}') "symfony.local" >> /etc/hosts
    ```

    **Note:** For **OS X**, please take a look [here](https://docs.docker.com/docker-for-mac/networking/) and for **Windows** read [this](https://docs.docker.com/docker-for-windows/#/step-4-explore-the-application-and-run-examples) (4th step).

3. Prepare Symfony app
    1. Update settings

        ```yml
        # [...]/server/config/services.yaml
        parameters:
            database_host: db
        ```

    2. Init and install (database & composer)

        ```bash
        $ docker-compose exec -it project.web-srv bash
        $ composer install
        $ sf doctrine:database:create
        $ sf doctrine:schema:update --force
        # Only if you have `doctrine/doctrine-fixtures-bundle` installed
        $ sf doctrine:fixtures:load --no-interaction
        ```

## Usage

Just run `docker-compose up -d`, then:

* Symfony app: visit [symfony.local](http://symfony.local)  
* Symfony dev mode: visit [symfony.local/app_dev.php](http://symfony.local/app_dev.php)  
* Logs (files location): docker/nginx/logs and docker/php/logs
<!-- * Logs (Kibana): [symfony.local:81](http://symfony.local:81) -->

<!-- ## Sources && FAQ -->

<!-- [Symfony docker stack](https://github.com/maxpou/docker-symfony) -->