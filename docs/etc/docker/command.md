# Docker 명령어

## Tips

### 실행 중인 컨테이너 한 번에 종료하기

```sh
$ docker rm -f $(docker ps -qa)
```

### 등록된 모든 이미지를 한 번에 삭제하기

```sh
$ docker rmi $(docker images -q)
```

또는

```sh
$ docker image rm -f $(docker images -q)
```
