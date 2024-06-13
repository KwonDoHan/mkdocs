.PHONY: help up down logs ps build push
.DEFAULT_GOAL := help

include .env

up: ## 도커 컴포즈 업(up) W/ Hot Reload
	docker-compose up -d

down: ## 도커 컴포즈 다운(down)
	docker-compose down

logs: ## 도커 컴포즈 로그(log) 조회
	docker-compose logs -f

ps: ## 도커 컨테이너 상태 확인
	docker-compose ps

build: ## 도커 이미지 빌드(build)
	docker build -t ${DOCKER_IMAGE_TAG} .
	docker tag ${DOCKER_IMAGE_TAG} ${DOCKER_IMAGE_LATEST}

push: ## 도커 이미지 푸시(push)
	docker push ${DOCKER_IMAGE_TAG}
	docker push ${DOCKER_IMAGE_LATEST}
	
help: ## 현재 옵션 보여주기
	@awk 'BEGIN {FS = ":.*##"; printf "명령어 사용법: make <target>\ntarget: \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)