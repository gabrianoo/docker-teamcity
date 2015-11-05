# Docker Teamcity

Docker build file for Team City server. You need to have [Docker](https://www.docker.com/) installed and running to make this useful.
Container is exposing default Teamcity port `8111` and data volume is at `/data/teamcity`

## Build from source

### How to build

```
git clone https://github.com/gabrianoo/docker-teamcity.git
docker build -t docker-teamcity-custom docker-teamcity
```

### How to run

```
docker run -d --name docker-teamcity -p 8111:8111 docker-teamcity-custom
```

## Versions

### Teamcity Latest

#### What is inside

1. Ubuntu 14.04
2. Oracle Java 8 Latest
3. Teamcity 9.1.3

#### How to run

```
docker run -d --name teamcity -p 8111:8111 otasys/teamcity
```

### Teamcity [9.1.3](https://github.com/gabrianoo/docker-teamcity/releases/tag/9.1.3)

#### What is inside

1. Ubuntu 14.04
2. Java 1.8.0_66
3. Teamcity 9.1.3

#### How to run

```
docker run -d --name teamcity -p 8111:8111 otasys/teamcity:9.1.3
```
