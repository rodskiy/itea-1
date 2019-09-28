FROM alpine

MAINTAINER Pavel Rodskiy <rodskiy@ukr.net>

ARG reponame

RUN apk update

RUN apk add git

CMD cd /data ; git clone "$REPOURL" 


