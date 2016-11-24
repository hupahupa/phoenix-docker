FROM golang:1.7
MAINTAINER dung_nguyen@dakra.me

RUN ["go", "get", "bitbucket.org/liamstask/goose/cmd/goose"]
COPY . $GOPATH/src/app/
WORKDIR $GOPATH/src/app/
CMD ["sh", "migrate.sh"]
