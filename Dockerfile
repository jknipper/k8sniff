FROM golang:1.17 as builder

WORKDIR /go/src/github.com/kubermatic/k8sniff
ADD . .
RUN CGO_ENABLED=0 go build -ldflags '-s' -o /go/bin/k8sniff .

FROM alpine
LABEL source_repository="https://github.com/databus23/k8sniff"
COPY --from=builder /go/bin/k8sniff /pipeline/source/k8sniff
CMD ["/pipeline/source/k8sniff"]
