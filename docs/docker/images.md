# 도커 이미지 종류

Docker Image를 작성하고 사용하였지만, 대부분 alpine으로만 작성하고 있었다.
다시 돌아보니 다른 이미지 버전들에 비해 어떤 장점이 있는지 생각을 해보지 않고 사용한 것 같아 Docker Image 종류에 대해서 정리를 해보려고 한다.

## 이미지 종류
 
- `name:version`
- `name:version-stretch`
- `name:version-buster`
- `name:version-jessie`
- `name:version-slim`
- `name:version-alpine`

### name:version

기본적으로 Docker는 `name:version`에 해당하는 버전을 사용한다(Base 이미지).
해당 버전의 이미지는 가장 최근의 안정적인 데비안 운영체제 릴리스를 기반으로 한다.

> python:3.8.3

### name:version-==stretch==, name:version-==buster==, name:version-==jessie==

`stretch`, `buster`, `jessie` 태그가 붙은 이미지의 경우, 다양한 데비안 릴리스의 코드명이다.

### name:version-==slim==

실행하기 위한 최소한의 패키지만 설치된 이미지이다.
(파이썬으로 가정했을 경우, 파이썬을 실행하기 위한 최소한의 환경이 꾸려져 있는 이미지라고 볼 수 있다)

> python-3.8.3-slim

### name:version-==alpine==

`alpine` 이미지는 컨테이너 내부에서 사용하기 위해 특별히 제작된 운영체제인 [알파인 리눅스 프로젝트](https://alpinelinux.org)를 기반으로 한다.
`alpine` 이미지의 경우, 이미지를 가능한 한 작게 만들기 위해 사용된다.

> python:3.8.3-alpine


### name:version-==windowsservercore==

Windows Server 기반으로 작성된 이미지이다.

> python:3.8.3-windowsservercore

## REFERENCE

- [Docker | 도커 이미지 종류](https://no-easy-dev.tistory.com/entry/Docker-Docker-Image-Differences)