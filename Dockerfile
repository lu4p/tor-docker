FROM alpine:3.10.3
EXPOSE 9050 9051 5353
RUN apk add --no-cache tor
CMD tor -f /etc/tor/torrc