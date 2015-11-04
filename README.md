# Docker Teamcity
Docker build file for Team City server. You need to have https://www.docker.com/ installed and running to make this useful.

## Environment

1. Ubuntu 14.04
2. Oracle Java 8 Latest
3. Teamcity 9.1.3

To Run
------

```
docker run -d --name teamcity otasys/teamcity
```

To build
--------

```
git clone https://github.com/gabrianoo/docker-teamcity.git
docker build -t docker-teamcity-custom docker-teamcity
```

then to run that

```
docker run -d --name docker-teamcity docker-teamcity-custom
```
