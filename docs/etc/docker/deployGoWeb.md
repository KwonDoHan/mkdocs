# Go 웹 애플리케이션 배포하기

## Docker에 대한 이해

### 개발과정 중 Docker 장점

프로그램 개발 시 Docker를 사용하면 아래와 같은 장점을 얻을 수 있다.

- 모든 팀원들이 사용하는 표준 Development 환경
- 중앙에서 종속성을 업데이트하고 모든 곳에서 동일한 컨테이너를 사용
- Production 환경과 동일한 Development 환경
- Production 환경에서만 나타날 수 있는 잠재적인 문제점을 해결

### Go 웹 애플리케이션이 Docker를 사용하는 이유

대부분의 Go Application은 간단한 바이너리^Binary^이다.
Go 개발 시 Docker를 사용하는 이유는 아래와 같다.

- 웹 애플리케이션에는 일반적으로 템플릿과 구성 파일이 있다. 도커는 이러한 파일을 바이너리와 동기화할 수 있도록 도와준다.
- 도커는 Development와 Production에서 동일한 설정을 보장한다. 애플리케이션이 Development에서는 작동하지만 Production에서는 작동하지 않는 경우가 있다. 도커를 사용하면 이런 문제에 대해서 걱정할 필요가 없다.
- Machine, Operating System 및 설치된 소프트웨어는 대규모 팀에 따라 크게 다를 수 있다. 도커는 일관된 개발 설정을 보장하는 매커니즘을 제공한다. 따라서 팀의 생산성이 향상되고 개발 중 마찰과 피할 수 있는 문제가 줄어든다.

## 간단한 Go 웹 애플리케이션 만들기




### Step 3 - Running the Container

```sh
$ docker run -it --rm -p 8010:8010 -v $PWD/src:/go/src/mathapp mathapp-development
```


## ETC

- `gin`
    - [https://github.com/gin-gonic/gin](https://github.com/gin-gonic/gin)
- `testify`
    - [https://github.com/stretchr/testify](https://github.com/stretchr/testify)


## REFERENCE

- [How to Deploy a Go Web Application with Docker](https://semaphoreci.com/community/tutorials/how-to-deploy-a-go-web-application-with-docker)
- [Top 6 Best Golang Testing Frameworks in 2024](https://reliasoftware.com/blog/golang-testing-framework)
- [Set Up a Simple Go Development Environment with Docker](https://levelup.gitconnected.com/setup-simple-go-development-environment-with-docker-b8b9c0d4e0a8)
- [Create a Containerized Go Development Environment in Docker](https://www.brettfullam.com/create-a-containerized-go-development-environment-in-docker)
- [Go development with Docker Containers](https://blog.jetbrains.com/go/2020/05/04/go-development-with-docker-containers/)
- [Golang Debugging Tutorial](https://www.rookout.com/blog/golang-debugging-tutorial/)