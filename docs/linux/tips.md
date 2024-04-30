## Linux 정보 확인

아래 명령어들 중에 임의의 하나를 사용할 수 있다.

1. `cat /etc/os-release`
2. `grep '^VERSION' /etc/os-release`
`grep -E '^(VERSION|NAME)='/etc/os-release'`
3. `hostnamectl`
4. `uname -a`

## IP 주소 확인

아래 명령어들 중에 임의의 하나를 사용할 수 있다.

### Public IP 주소

1. `curl ifconfig.me`
2. `dig +short myip.opendns.com @resolver1.opendns.com`

### Private IP 주소

1. `ifconfig -a`
2. `ip addr` 또는 `ip a`
3. `hostname -I | awk '{print $1}'`
4. `ip route get 1.2.3.4 | awk '{print $7}'`

