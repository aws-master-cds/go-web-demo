FROM golang:1.22-alpine3.19 as go-build

WORKDIR /app
COPY app.go .
COPY go.mod .
COPY go.sum .
RUN go build .


FROM alpine:3.12.3

WORKDIR /app
COPY --from=go-build /app/go-web-demo .
CMD ["/app/go-web-demo"]