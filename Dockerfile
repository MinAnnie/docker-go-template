FROM golang:alpine AS build

# GOPROXY resolves dependencies treefrom cache or repository
ENV GOPROXY=https://proxy.golang.org

WORKDIR /go/src/go-template
COPY . .
# Set OS as linux
RUN GOOS=linux go build -o /go/bin/go-template main.go

FROM alpine
COPY --from=build /go/bin/go-template /go/bin/go-template
ENTRYPOINT ["go/bin/go-template"]