# DevNotes by HAN

## 사용 방법

먼저 아래 샘플 `.env` 파일을 참조하여 `Makefile`이 있는 폴더에 `.env` 파일을 하나 만든다[^1].

[^1]: `.env` 파일은 각자 개인화와 관련된 내용을 포함하고 있기 때문에 Git 저장소에는 올리지 않도록 `.gitignore` 파일에 포함시켜놓았다.

### `.env` 파일

```
USER = dohan
PORT = 8080

DOCKER_IMAGE = dohan4k/mkdocs-material
DOCKER_IMAGE_VERSION = 1.0

DOCKER_IMAGE_TAG = ${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}
DOCKER_IMAGE_LATEST = ${DOCKER_IMAGE}:latest
```

- `USER` 값은 같은 도커엔진에 여러 개의 컨테이너를 사용할 수 있기 때문에 구분하기 위한 목적이다. 리눅스에서는 로그인 사용자 아이디로 환경변수 값을 사용하므로 지정할 필요가 없다. MS-Windows에서는 임의의 값을 지정한다.
- `PORT` 값은 문서 개발(작성)할 때 사용자마다 서로 다른 포트로 지정하여 서비스할 수 있도록 하기 위해서 약속된 포트 번호를 사용한다.
- `DOCKER_IMAGE` 값은 SS연구팀이 사용하는 도커 레지스트리(Harbor)에 맞춰서 저장소<sup>Repository</sup> 이름을 정했으므로 변경할 필요가 없다.
- `DOCKER_IMAGE_VERSION` 값은 도커 이미지 버전 관리를 위한 값이다. 도커 이미지의 변경이 필요한 경우에 관리자가 변경한다.
- `DOCKER_IMAGE_TAG`, `DOCKER_IMAGE_LATEST` 값은 편의를 위한 값이므로 변경없이 그대로 사용한다.

### `make` 명령어로 실행

- 도커 컴포즈 업(up)
```sh
$ make up
```

- 도커 컴포즈 다운(down)
```sh
$ make down
```

- 도커 이미지 빌드(build) : `.env` 파일에 선언한 `DOCKER_IMAGE_VERSION` 값의 태그(tag)와 `latest` 태그를 같이 만들어준다.
```sh
$ make build
```

- 도커 이미지 푸시(push)
```sh
$ make push
```

<!--
## 문서 작성 방법

Docker를 이용해서 아래와 같은 방법으로 문서를 작성한다.

```yaml title="Dockerfile"
FROM squidfunk/mkdocs-material
RUN pip install mkdocs-awesome-pages-plugin
```

```sh
docker build -t mkdocs-material .
```

### 개발 서버 시작하기

`mkdocs.yml` 파일이 있는 폴더에서 아래와 같이 docker를 실행한다.
Mount the folder where your `mkdocs.yml` resides as a volume into `/docs`:

```
docker run --rm --name my-mkdocs -it -p 8000:8000 -v ${PWD}:/docs mkdocs-material
```

위와 같이 docker를 실행하면, 8000번 포트를 통해서 문서를 확인할 수 있다. 만약, 다른 포트를 사용해야 하는 경우라면 `-p 7000:8000` 옵션을 사용함으로써 7000번 포트로 개발 서버를 사용할 수 있다.

### 문서 빌드하기

```sh
docker run --rm --name mkdocs -it -v ${PWD}:/docs mkdocs-material build
```

### GitHub 페이지로 문서 배포하기

```sh
docker run --rm --name mkdocs -it -v ~/.ssh:/root/.ssh -v ${PWD}:/docs mkdocs-material gh-deploy
```


## 참고

- https://squidfunk.github.io/mkdocs-material/getting-started/
- https://hub.docker.com/r/squidfunk/mkdocs-material/
- [How to install MkDocs on Mac and setup the integration to GitHub pages?](https://suedbroecker.net/2021/01/25/how-to-install-mkdocs-on-mac-and-setup-the-integration-to-github-pages/)
- https://github.com/marketplace/actions/deploy-mkdocs

-->