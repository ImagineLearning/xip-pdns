# il-pdns

## Basis
This is a piped backend provider using [PowerDNS](http://powerdns.com/)

## Installation

#### Install powerdns
```
sudo apt install pdns-server
sudo apt install pdns-backend-pipe
```
#### Move simple file out
This will interfere with the pipe backend so move or delete /etc/powerdns/pdns.d/pdns.simplebind.conf

### Pull down source
Clone this git repo to somewhere accessible

#### Adjust pdns configuration to use a pipe backend
Open /etc/powerdns/pdns.conf and make these adjustments.

```
launch=pipe
pipe-command=/path/to/xip-pdns/bin/xip-pdns /path/to/xip-pdns/etc/xip-pdns.conf
```

#### Application
This will only respond to dns requests that end in imaginelearningmedia.net.

Effectively if you ask for 1-2-3-4.imaginelearningmedia.net it will return 1.2.3.4 as the IP address. This results in being able to maintain an ssl certificate on a server that may change addresses.

