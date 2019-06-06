FROM golang:1.12

RUN go get -u -v github.com/golang/dep/cmd/dep
WORKDIR /go/src/github.com/kubermatic/k8sniff
ADD . .
RUN dep ensure
RUN CGO_ENABLED=0 go build -ldflags '-s' -o /go/bin/k8sniff .

FROM alpine
COPY --from=0 /go/bin/k8sniff /pipeline/source/k8sniff
CMD ["/pipeline/source/k8sniff"]
