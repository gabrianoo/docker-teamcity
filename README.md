# Docker Teamcity
Docker build file for Team City server. You need to have [Docker](https://www.docker.com/) installed and running to make this useful.

## Environment

1. Ubuntu 14.04
2. Oracle Java 8 Latest
3. Teamcity 9.1.3

## To Run

### Latest

```
docker run -d --name teamcity -p 8111:8111 otasys/teamcity
```

### Teamcity [1489](https://github.com/gabrianoo/docker-teamcity/releases/tag/1489)

1. Ubuntu 14.04
2. Java 1.8.0_66
3. Teamcity 9.1.3

```
docker run -d --name teamcity -p 8111:8111 otasys/teamcity:1489
```

## To build

```
git clone https://github.com/gabrianoo/docker-teamcity.git
docker build -t docker-teamcity-custom docker-teamcity
```

then to run that

```
docker run -d --name docker-teamcity -p 8111:8111 docker-teamcity-custom
```
