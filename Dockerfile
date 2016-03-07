FROM golang

VOLUME /opt

RUN apt-get update && apt-get install -y wget git make ; \
        export PATH=$GOROOT/bin:$GOPATH/bin:$PATH ; 
COPY . $GOPATH/src/github.com/pingcap/tidb

RUN cd $GOPATH/src/github.com/pingcap/tidb ; \
        make ; make server ; cp tidb-server/tidb-server /usr/bin/ 

EXPOSE 4000

CMD ["/usr/bin/tidb-server"]

