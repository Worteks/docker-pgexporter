FROM golang:1.9 as builder

WORKDIR /go/src/github.com/wrouesnel/postgres_exporter

COPY cmd ./cmd
COPY tools ./tools
COPY vendor ./vendor
COPY mage*go ./

RUN go run mage.go binary \
    && cp ./postgres_exporter /postgres_exporter

FROM scratch

# Postgres Exporter image for OpenShift Origin

LABEL io.k8s.description="Postgres Prometheus Exporter." \
      io.k8s.display-name="Postgres Exporter" \
      io.openshift.expose-services="9113:http" \
      io.openshift.tags="postgres,exporter,prometheus" \
      io.openshift.non-scalable="true" \
      help="For more information visit https://github.com/Worteks/docker-pgexporter" \
      maintainer="Samuel MARTIN MORO <faust64@gmail.com>" \
      version="1.0"

COPY --from=builder /postgres_exporter /postgres_exporter

ENTRYPOINT ["/postgres_exporter"]
