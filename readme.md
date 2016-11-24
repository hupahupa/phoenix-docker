## Installation


### Install software

1. Install Docker [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)
2. Install Docker Machine
3. Install Docker Compose

### Clone the project

1. Clone project: `git clone git@github.com:hupahupa/phoenix-docker.git`
2. Change to site folder: `cd phoenix-docker`
3. Copy sample local config, update the `app_name`
4. Create new docker machine `docker-machine create -d virtualbox local`
5. Set Shell termial connect to machine: `eval $(docker-machine env local)`
6. Build the images `docker-compose -f docker-compose.yml -f docker-compose.local.yml build`
7. Bring up services `docker-compose -f docker-compose.yml -f docker-compose.local.yml up`
8. Browse at:
	* Publish site:[http://local.domain.com](http://local.domain.com)
	* Admin: [http://local-admin.domain.com](http://local-admin.domain.com)
	*(note should config your local domain)*

## Working tips

### Useful comands work with docker, docker-compose, docker-machine

#### docker-machine
- **Set Shell Command Connect to Machine** `eval $(docker-machine env local)` change `local` to `dev` or `prod`
- **Access Machine** `docker-machine ssh <machine_name>` i.e: `docker-machine ssh local`
- **Show list current machine** `docker-machine ls`

#### docker-compose
- **Build again the services** `docker-compose -f docker-compose.yml -f docker-compose.local.yml build`
- **Take all services up and run** `docker-compose -f docker-compose.yml -f docker-compose.local.yml up`
- **Stop all docker-compose progress**
- **Stop all services**


#### docker
- **Stop all images** `docker stop $(docker ps -a -q)`
- **Delete image** `docker rmi IMAGE_ID`
- **Delete all images** `docker rmi $(docker images -q) -f`
- **Delete all dangling images** `docker rmi -f $(docker images -q -a -f dangling=true)`
- **Remove all volumes** `docker volume rm $(docker volume ls -q)`
- **Remove all dangling volumes** `docker volume rm $(docker volume ls -q -f dangling=true)`
- **Access container via terminal** `docker exec -i -t IMAGE_ID /bin/bash`
- **Inspect details of container** `docker inspect IMAGE_ID`


### Migrations (TO BE UPDATED)
* Create new migration

```
goose create DoSomeThing sql
```

  + In the new migration file define you will see `goose Up` and `goose Down` like this:

```
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TYPE USERS_STATUS_ENUM AS ENUM ('activated', 'inactivated', 'block');
CREATE TABLE tbl_user (
  id SERIAL NOT NULL PRIMARY KEY,
  username TEXT,
  password TEXT,
  email TEXT,
  status USERS_STATUS_ENUM,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  UNIQUE(username)
);

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE tbl_user;
DROP TYPE USERS_STATUS_ENUM;
```

* Rollback the previous version

```
  goose down
```
Doc: [https://bitbucket.org/liamstask/goose](https://bitbucket.org/liamstask/goose)

