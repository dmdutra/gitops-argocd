FROM golang as build

WORKDIR /app
COPY . .

RUN CGO_ENANLED=0 go build -o server main.go

FROM alpine:3.14
WORKDIR /app

COPY --from=build /app/server .

CMD ["./server"]
