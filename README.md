# http-proxy

Http proxy. With http-proxy, you can assign a socks5 proxy as upstream proxy,
and, use "chnroute" to by pass proxy.

Note:

  With "--chnroute", you should make sure that the dns resolve result is clean.
  You can use [CleanDNS], [ChinaDNS] or similar utilities to get clean dns result.

## Install

### Linux

```bash
git clone https://github.com/GangZhuo/http-proxy.git

git submodule init

git submodule update

cd http-proxy

make clean

make
```

### Windows

```
1) Download source code from https://github.com/GangZhuo/http-proxy.

2) Download http-parser from https://github.com/nodejs/http-parser.git.

3) Open http-proxy/windows/http-proxy.sln with visual studio 2019, build project.

4) build project.
```

## Usage

```
$>http-proxy -h

http-proxy 0.0.1

Usage:

http-proxy [-b BIND_ADDR] [-p BIND_PORT] [--config=CONFIG_PATH]
         [--log=LOG_FILE_PATH] [--log-level=LOG_LEVEL]
         [--chnroute=CHNROUTE_FILE] [--proxy=SOCKS5_PROXY]
         [--daemon] [--pid=PID_FILE_PATH] [-v] [-V] [-h]

Http proxy. With http-proxy, you can assign a socks5 proxy as upstream proxy.
And, use "chnroute" to by pass proxy.

Note:
  With "--chnroute", you should make sure that the dns resolve result is clean.
  You can use CleanDNS (https://github.com/GangZhuo/CleanDNS),
  ChinaDNS (https://github.com/shadowsocks/ChinaDNS) or similar utilities to
  get clean dns result.

Options:

  -b BIND_ADDR             Address that listens, default: 0.0.0.0.
                           Use comma to separate multi addresses, e.g. -b 127.0.0.1:5354,[::1]:5354.
  -p BIND_PORT             Port that listen on, default: 1080.
                           The port specified in "-b" is priority .
  -t TIMEOUT               Timeout seconds, default: 30.
  --daemon                 Daemonize.
  --pid=PID_FILE_PATH      pid file, default: /var/run/http-proxy.pid, only available on daemonize.
  --log=LOG_FILE_PATH      Write log to a file.
  --log-level=LOG_LEVEL    Log level, range: [0, 7], default: 5.
  --config=CONFIG_PATH     Config file, find sample at https://github.com/GangZhuo/http-proxy.
  --chnroute=CHNROUTE_FILE Path to china route file, e.g.: --chnroute=lan.txt,chnroute.txt,chnroute6.txt.
  --proxy=SOCKS5_PROXY     Socks5 proxy, e.g. --proxy=127.0.0.1:1080 or --proxy=[::1]:1080.
                           Only socks5 with no authentication is supported.
  -v                       Verbose logging.
  -h                       Show this help message and exit.
  -V                       Print version and then exit.

Online help: <https://github.com/GangZhuo/http-proxy>
```

### Examples

```bash
-b 127.0.0.1 -p 1081 --proxy=127.0.0.1:1080 --chnroute=lan.txt,chnroute.txt,chnroute6.txt -vvvv
```

### Update chnroute (IPv4)

See [About chnroute] on [ChinaDNS].

### Update chnroute (IPv6)

You can generate latest chnroute6.txt using this command:

    curl 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | \
	grep ipv6 | grep CN | awk -F\| '{ printf("%s/%d\n", $4, $5) }' > chnroute6.txt

[CleanDNS]:  https://github.com/GangZhuo/CleanDNS
[ChinaDNS]:  https://github.com/shadowsocks/ChinaDNS
[About chnroute]:  https://github.com/shadowsocks/ChinaDNS#about-chnroute