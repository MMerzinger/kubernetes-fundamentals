FROM docker.io/joseluisq/static-web-server:2.0.2

ENV SERVER_PORT=8000
USER 55555:55555
COPY ./content /public

ENTRYPOINT ["/static-web-server"]

