FROM golang:latest
WORKDIR /go
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
COPY tracker.db ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./final
CMD ["/go/final"]