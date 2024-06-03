# Ubuntu에 Docker 설치

## 실행환경

- Ubuntu 22.04

## Docker 설치 방법

1. Ubuntu 시스템 패키지 업데이트
```
$ sudo apt-get update
```

2. 필요한 패키지 설치
```
$ sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

3. Docker의 공식 GPG 키 추가
```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

4. Docker의 공식 apt 저장소를 추가
```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

5. 시스템 패키지 업데이트
```
$ sudo apt-get update
```

6. Docker 설치
```
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

7. Docker 설치 확인
```
$ sudo systemctl status docker
```

```
$ sudo docker run hello-world
```

## REFERENCE

- [Ubuntu에 Docker 설치](https://haengsin.tistory.com/128)