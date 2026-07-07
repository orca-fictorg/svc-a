FROM golang:1.26

COPY main.go main.go

RUN go build -o /usr/local/bin/svc-a main.go

ENTRYPOINT ["/usr/local/bin/svc-a"]