# Tor docker image
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/lu4p/tor)
![MicroBadger Size](https://img.shields.io/microbadger/image-size/lu4p/tor)
![Docker Pulls](https://img.shields.io/docker/pulls/lu4p/tor)

# Example usage with docker-compose
### 1. Create tor-example directory
```
mkdir tor-example
cd tor-example
```
### 2. Create a docker-compose.yml with the following content
```yaml
version: "3"
volumes:
  nextcloud:
services:
  tor:
    image: tor
    volumes:
       - ./tor:/var/lib/tor/ 
       - ./torrc:/etc/tor/torrc
    restart: always
  nextcloud:
    image: nextcloud
    volumes:
      - nextcloud:/var/www/html
    restart: always
```


### 3. Create the tor config
- torrc documentation https://2019.www.torproject.org/docs/tor-manual.html.en

```
$ nano ./torrc
HiddenServiceDir /var/lib/tor/hs/
HiddenServicePort 80 nextcloud:80
```


### 4. Start docker-compose
```
sudo docker-compose up -d
```

### 5. Get the onion address (hostname)
```
sudo cat ./tor/hs/hostname
```
Output: youronionaddress.onion

### 6. Access Nextcloud over Tor
Download and install Tor Browser from https://www.torproject.org/download/

Now Nextcloud can be accessed at http://youronionaddress.onion from any Tor Browser.
