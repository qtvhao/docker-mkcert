FROM vishnunair/go-alpine-edge:latest

RUN cd /go && \
    go get -u github.com/qtvhao/mkcert && \
    cd src/github.com/qtvhao/mkcert && \
    go build -o /bin/mkcert

WORKDIR /root/.local/share/mkcert

CMD mkcert -install && for i in $(echo $domain | sed "s/,/ /g"); do mkcert $i; done && tail -f -n0 /etc/hosts
