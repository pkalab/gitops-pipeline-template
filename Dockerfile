FROM golang:alpine AS builder
WORKDIR /src
COPY go.mod main.go ./
RUN CGO_ENABLED=0 go build -o /app .

FROM gcr.io/distroless/static-debian12:nonroot AS production
LABEL org.opencontainers.image.source="https://github.com/myorg/gitops-pipeline-template"
COPY --from=builder /app /app
USER nonroot:nonroot
ENTRYPOINT ["/app"]
