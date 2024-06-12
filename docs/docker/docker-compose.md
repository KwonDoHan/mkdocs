# Docker Compose

## 도커 컴포즈란?

도커 컴포즈는 단일 서버에서 여러 개의 컨테이너를 하나의 서비스로 정의해 컨테이너의 묶음으로 관리할 수 있는 작업 환경을 제공하는 관리 도구이다.

## 도커 컴포즈를 사용하는 이유

여러 개의 컨테이너가 하나의 어플리케이션으로 동작할 때 도커 컴포즈를 사용하지 않는다면, 이를 테스트하려면 각 컨테이너를 하나씩 생성해야 한다. 
예를 들면, 웹 어플리케이션을 테스트하려면 웹 서버 컨테이너, 데이터베이스 컨테이너 두 개의 컨테이너를 각각 생성해야 한다.

즉, 아래와 같이 두 개의 run 명령어를 입력해야 한다.

```sh
$ docker run --name wordpress_db -d mysql:8

$ docker run -d -p 8080:80 \
--link wordpress_db:mysql --name web_wordpress \
wordpress:latest
```

위의 예제를 실행하면 wordpress와 mysql 컨테이너를 생성한다.
이처럼 여러 개의 컨테이너로 구성된 어플리케이션을 구축하기 위해 run 명령어를 여러 번 사용할 수 있지만, 각 컨테이너가 제대로 동작하는지 확인하는 테스트 단계에서는 이런 식으로 일일히 여러 개의 컨테이너를 실행하기는 번거롭다.
매번 run 명령어에 옵션을 설정해 CLI로 컨테이너를 생성하기보다는 여러 개의 컨테이너를 하나의 서비스로 정리해 컨테이너 묶음으로 관리할 수 있다면 좀더 편리할 것이다.
이를 위해 도커 컴포즈는 컨테이너를 이용한 서비스의 개발과 CI를 위해 여러 개의 컨테이너를 하나의 프로젝트로서 다룰 수 있는 작업 환경을 제공한다.

## REFERENCE 

- [도커 컴포트 - 개념 정리 및 사용법](http://localhost:8080/etc/docker/docker-compose/)
- [Docker Compose에서 각 서비스 컨테이너에 쓰이는 환경변수를 다루는 방법](https://seongjin.me/environment-variables-in-docker-compose/)
- <https://docs.docker.com/compose/environment-variables/variable-interpolation/>