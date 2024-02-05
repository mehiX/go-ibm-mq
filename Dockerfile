FROM golang

WORKDIR /source
COPY . ./

RUN mkdir -p /work

RUN go env -w CGO_ENABLED='1'

RUN /source/script.sh

WORKDIR /work

CMD [ "ls", "-l" ]