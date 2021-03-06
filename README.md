# Docker Teamcity

Docker build file for Team City server. You need to have [Docker](https://www.docker.com/) installed and running to make this useful.
Container is exposing default Teamcity port `8111` and data volume is at `/data/teamcity`

## Build from source

### How to build

```
git clone https://github.com/gabrianoo/docker-teamcity.git
docker build -t docker-teamcity docker-teamcity
docker build -t docker-teamcity-data
```

### How to run

```
# Running the teamcity data volume
docker run -d --name docker-teamcity-data docker-teamcity-data
# Running the teamcity server
docker run -d --name docker-teamcity --volumes-from docker-teamcity-data -p 8111:8111 docker-teamcity
# Running the teamcity agent
docker run -d --name docker-teamcity-agent -e TEAMCITY_SERVER=http://<TC_SERVER_IP>:<TC_SERVER_PORT> \
-p 9090:9090 docker-teamcity-agent
```

### Checking everything is OK

Go to the docker engine URL [I assume it is localhost] `http://localhost:8111/tc`

## Versions

### Teamcity Latest

#### What is inside

1. Ubuntu 14.04
2. Oracle Java 8 Latest
3. Teamcity Latest

#### How to run

```
docker run -d --name teamcity-data otasys/teamcity-data
docker run -d --name teamcity -p 8111:8111 --volumes-from teamcity-data otasys/teamcity
```

### Teamcity [9.1.4](https://github.com/gabrianoo/docker-teamcity/releases/tag/9.1.4)

#### What is inside

1. Ubuntu 14.04
2. Java 1.8.0_66
3. Teamcity 9.1.4

#### How to run

```
docker run -d --name teamcity-data otasys/teamcity-data
docker run -d --name teamcity -p 8111:8111 --volumes-from teamcity-data otasys/teamcity:9.1.4
```


### Teamcity [9.1.3](https://github.com/gabrianoo/docker-teamcity/releases/tag/9.1.3)

#### What is inside

1. Ubuntu 14.04
2. Java 1.8.0_66
3. Teamcity 9.1.3

#### How to run

```
docker run -d --name teamcity-data otasys/teamcity-data
docker run -d --name teamcity -p 8111:8111 --volumes-from teamcity-data otasys/teamcity:9.1.3
```

