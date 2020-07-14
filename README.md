# datavirtuality-docker
This repository includes all needed configuration and scripts to run Data Virtuality Server as a Docker container.

:warning: **This is a technology preview**: It is not yet recommended to be used in productive setups!

## How to build this image
### Prerequisites
* Before being able to build the image, you will the Data Virtuality Server Linux ZIP archive. Please ask your technical Data Virtuality contact on how to retrieve it.
* A separate PostgreSQL database server is required to host the configuration database. This can be either a separate Docker container or a conventional server. 

### Build the image
Run the provided script to build the image, passing the name and version of the image, as well as the Data Virtuality Server Linux ZIP archive:
```console
$ ./dvserver-build.sh dvserver:2.3.10 dvserver-RELEASE_2.3.10.linux.x86_64.zip
```

## How to use this image
Before starting the image, open the file `config.env` and provide the credentials on how to connect to the PostgreSQL configuration database.

### Start a Data Virtuality Server container
Starting a container is simple, a bash script is included in the repository:
```console
$ ./dvserver-run.sh dvserver 2.3.10
```

### Where to store data
By default, all data created during the runtime of the container remains within the container (except for the configuration database). This includes certain configuration files, the license and log files. To store these files permanently outside of the container, you can pass a volume as `-v $volume_name:/opt/datavirtuality/persistent_data`.
The `dvserver-run.sh` script has this mechanism already built-in and you can pass the name of the volume to be used as a second parameter. The volume will be created automatically if it doesn't exist yet:

```console
$ ./dvserver-run.sh dvserver 2.3.10 dv_data
```

### docker-compose
You can also use `docker compose` to manage the Data Virtuality Server container and the PostgreSQL configuration database container. See [dvserver-compose.yml](dvserver-compose.yml) for an example configuration that can be started with `docker-compose -f dvserver-compose.yml up`.
