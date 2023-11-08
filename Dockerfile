# syntax=docker/dockerfile:1
# Desafio Go
FROM golang:1.21 as build
WORKDIR /src
COPY <<EOF /src/main.go
package main

import "fmt"

func main() {
  fmt.Println("Full Cycle Rocks!!")
}
EOF
RUN CGO_ENABLED=0 go build -o /bin/fullcycle-app ./main.go

FROM scratch
COPY --from=build /bin/fullcycle-app /bin/fullcycle-app
CMD ["/bin/fullcycle-app"]
