#!/bin/bash

export MQ_INSTALLATION_PATH=/source/client
export CGO_CFLAGS="-I$MQ_INSTALLATION_PATH/inc"
export CGO_LDFLAGS="-L$MQ_INSTALLATION_PATH/lib64 -Wl,-rpath,$MQ_INSTALLATION_PATH/lib64"

cd /source/mq-golang/samples

for samp in *.go
do
  exe=`basename $samp .go`
  echo "Building program: $exe"
  go build -o /work/$exe $samp
done

#go build -o /work/mqitest -a -ldflags '-extldflags "-static"' mqitest/mqitest.go
go build -o /work/mqitest  mqitest/mqitest.go