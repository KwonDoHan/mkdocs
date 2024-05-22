# DevNotes by HAN

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

```sh
docker run --rm --name mkdocs -it -p 8080:8000 -v ${PWD}:/docs mkdocs-material
```

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