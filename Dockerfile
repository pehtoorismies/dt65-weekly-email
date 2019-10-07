FROM alpine:3.8

RUN apk add --no-cache curl
RUN apk add --no-cache jq

ENV WORKDIR=/home/app

WORKDIR ${WORKDIR}

COPY ./sendWeekly.sh ${WORKDIR}

ENTRYPOINT ${WORKDIR}/sendWeekly.sh