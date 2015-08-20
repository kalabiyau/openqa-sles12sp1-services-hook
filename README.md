# zypper Services Micro-Service

Intention is to provide a way to tamper repositories on the system under test


# HowTo:

## Standalone

* `bundle install -j8`
* populate services folder with services for all the products supposed to be tested
  setting filename to service/product name which can be extracted from existing service files
  after you performed initial registration of all products you want to test.
  `/etc/zypp/services.d` is the location of those file and under name= section you can
  find service/product name

* run `bundle exec ruby main.rb`
* Replace url in service on the target machine from
  `https://scc.suse.com/access/services/1106?credentials=SUSE_Linux_Enterprise_Server_12_x86_64`
  to
  `http://<your microservice host>:3002/access/services/SUSE_Linux_Enterprise_Server_12_x86_64`
  where the last section after `/services/` and `credentials=` is the product/service name
* perform `zypper refs`
* proceed with testing

## Dockerized

* Install docker
* Install docker-compose
* add scc Docker registry to insecure registry on your docker instance
`/etc/sysconfig/docker`
```
## Path           : System/Management
## Description    : Extra cli switches for docker daemon
## Type           : string
## Default        : ""
## ServiceRestart : docker

DOCKER_OPTS="--insecure-registry registry.scc.suse.de"

```

* restart docker
* populate services folder with services for all the products supposed to be tested
  setting filename to service/product name which can be extracted from existing service files
  after you performed initial registration of all products you want to test.
  `/etc/zypp/services.d` is the location of those file and under name= section you can
  find service/product name
* build image of a micro service `docker-compose build`
* run microservice via `docker-compose up` or `docker-compose up -d`
* Replace url in service on the target machine from
  `https://scc.suse.com/access/services/1106?credentials=SUSE_Linux_Enterprise_Server_12_x86_64`
  to
  `http://<your microservice host>:3002/access/services/SUSE_Linux_Enterprise_Server_12_x86_64`
  where the last section after `/services/` and `credentials=` is the product/service name
* perform `zypper refs`
* proceed with testing
