# GNU make 유틸리티

## make 설치

MS-Windows에서 GNU make 유틸리티를 사용하기 위해 먼저 설치한다.

> 설치 링크 : <http://gnuwin32.sourceforge.net/packages/make.htm>

## make 사용법

### 예제 #1 (mkdocs)

첫 번째 예제는 실제 본 문서를 작성하기 위해 사용된 프로젝트에서 사용하고 있는 내용이다.

```title=".env"
USER = dohan
PORT = 8080

DOCKER_IMAGE = dohan4k/mkdocs-material
DOCKER_IMAGE_VERSION = 1.0

DOCKER_IMAGE_TAG = ${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}
DOCKER_IMAGE_LATEST = ${DOCKER_IMAGE}:latest
```

```makefile title="Makefile"
.PHONY: help up down logs ps build push
.DEFAULT_GOAL := help

include .env

up: ## 도커 컴포즈 업(up) W/ Hot Reload
	docker-compose -p ${USER} up -d

down: ## 도커 컴포즈 다운(down)
	docker-compose -p ${USER} down

logs: ## 도커 컴포즈 로그(log) 조회
	docker-compose -p ${USER} logs -f

ps: ## 도커 컨테이너 상태 확인
	docker-compose -p ${USER} ps

build: ## 도커 이미지 빌드(build)
	docker build -t ${DOCKER_IMAGE_TAG} .
	docker tag ${DOCKER_IMAGE_TAG} ${DOCKER_IMAGE_LATEST}

push: ## 도커 이미지 푸시(push)
	docker push ${DOCKER_IMAGE_TAG}
	docker push ${DOCKER_IMAGE_LATEST}
	
help: ## 현재 옵션 보여주기
	@awk 'BEGIN {FS = ":.*##"; printf "명령어 사용법: make <target>\ntarget: \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
```

### 예제 #2 (golang)

## REFERENCE

- [Windows 10에서 make 사용하기](https://jstar0525.tistory.com/264)