FROM alpine:3.10.3

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF org.label-schema.vcs-url="e.g. https://github.com/microscaling/microscaling"

EXPOSE 9050 9051 5353
RUN apk add --no-cache tor
CMD tor -f /etc/tor/torrc