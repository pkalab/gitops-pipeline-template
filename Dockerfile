FROM alpine:3.20 AS base
RUN apk add --no-cache ca-certificates
COPY app /app
ENTRYPOINT ["/app"]

FROM gcr.io/distroless/static-debian12:nonroot AS production
COPY --from=base /app /app
USER nonroot:nonroot
ENTRYPOINT ["/app"]
