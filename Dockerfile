# Build
FROM golang:1.8-alpine3.6 as builder
MAINTAINER Xuejie Xiao <xxuejie@gmail.com>
RUN apk --no-cache add git
RUN go get -u github.com/aliyun/ossutil

# Run
FROM alpine:3.6
MAINTAINER Xuejie Xiao <xxuejie@gmail.com>
COPY --from=builder /go/bin/ossutil /bin/ossutil
CMD ["/bin/ossutil", "--help"]
