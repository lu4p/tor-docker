FROM alpine:3.10.3

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF org.label-schema.vcs-url="https://github.com/lu4p/tor-docker"

EXPOSE 9050 9051 5353
RUN apk add --no-cache tor
CMD tor -f /etc/tor/torrc