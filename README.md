# Simple LAMP Docker

This is a simple docker compose set up to configure some LAMP containers with the configuration set via an environment (.env) file. The compose file will create a PHP/Apache container with MySQL, PDO and rewrite enabled, along with separate containers for MySQL and PHPMyAdmin.

## Installation

First clone the repository to your own project directory.

```
git clone https://github.com/venomdev/simple-lamp-docker.git my-lamp-project
cd my-lamp-project
```

Copy the `.env.example` environment file to `.env`

```
cp .env.example .env
```

Edit the `.env` file for your requirements. 

First set the `PROJECT_NAME` and the `PROJECT_ID` variables for your project.

```
PROJECT_NAME=My Lamp Project
PROJECT_ID=my-lamp-project
```

The `PROJECT_NAME` variable is not used by Simple LAMP Docker but could be available to the PHP code if necessary.

The `PROJECT_ID` variable is used to name the docker containers and the network. It must not contain spaces or any special characters.

To create the containers you can use either `composer`, `npm` or `make`.

```
composer docker-dev
```

or

```
npm run docker:dev
```

or

```
make docker-dev
```

Open the pages in your browser.

```
# PHP/Apache (Port 80 is default)
open http://localhost

# PHPMyAdmin (Port 8080 is default)
open http://localhost:8080
```

## PHP source code

The default PHP source directory is `src/` and this directory is mapped to the PHP/Apache container volume so that code changes can be viewed immediately with a browser refresh.

## PHP Environment variables

The default PHP/Apache environment variables are mapped from the included `_.env` file. This is a safety feature for docker compose to continue without errors and can be changed in the `.env` file using the `ENV_FILE` property.

To include any `.env` environment variables use the PHP `parse_ini_file()` and `putenv()` functions.

```
// Load and set the .env variables
$env = parse_ini_file('.env');
foreach ($env as $key => $value) {
    putenv($key . "=" . $value);
}
```

This will add your environment variables so that you can retrieve the values using the `getenv()` function.

**Note:** When copying the `.env.example` file the `ENV_FILE` variable is set to use the new `.env` file and will ingore the default `_.env` file.

## Importing data to MySQL

All valid MySQL import files that are included in the initdb directory will automatically be imported to the MySQL database during the initial creation.

MySQL docker hub: [Initializing a fresh instance](https://hub.docker.com/_/mysql/)

## Additional Docker commands

The included scripts in the various files offer other Docker commands such as 

```
docker-stop
docker-down
docker-build
```

To see the full list of available commands included please review the files `composer.json`, `Makefile` or `package.json` for your specific building tool.

## Contributing

Simple LAMP Docker is an open source project and contributions are welcome.

If you have a contribution to add please fork the repository, make the changes and then submit a pull request.

Thank you.

[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/ISC)

