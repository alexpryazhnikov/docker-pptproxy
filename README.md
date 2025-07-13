# pptproxy

A simple container which provides SOCKS5 proxy over PPTP VPN.

## Environment variables

- SERVER: PPTP server address
- USERNAME: PPTP client username
- PASSWORD: PPTP client password

## Examples

Run a proxy container named `proxy00` and obtain the IP address:
```
$ docker build -t pptproxy . && docker run --privileged -d \
  -e SERVER=us.hma.rocks \
  -e USERNAME=your_hma_username \
  -e PASSWORD=your_hma_password \
  -p 1085:1080 \
  --name pptproxy \
  pptproxy
17e7d8869cccae6cccf5b28e28d87c6d3ebe0fd75044a23efd9c976ca0f1312e
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' pptproxy
172.17.0.2
```

Then, try:
```
$ curl ifconfig.co
(Your current IP address)
$ curl -x socks5://myuser:mypassword@172.17.0.2:1080 ifconfig.co
$ curl -x socks5://myuser:mypassword@localhost:1085 ifconfig.co
(VPN powered address)
```

## Notes

### LCP: timeout sending Config-Requests
```
sudo modprobe nf_conntrack_pptp
```
- See: https://askubuntu.com/questions/269399/failed-to-connect-to-pptp-vpn-server-on-ubuntu
