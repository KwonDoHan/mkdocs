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

### `prune`으로 사용하지 않는 오브젝트만 삭제하기

다음 명령어는 중지된 컨테이너를 삭제한다.

```sh
$ docker container prune
```

다음 명령어는 dangling 상태의 이미지를 삭제한다. dangling 이미지는 이미지 목록에서 태그가 없이 `<none>`으로 보이는 이미지이다.

```sh
$ docker image prune
```

`-a` 옵션을 사용하면, dangling 이미지와 컨테이너에서 사용되지 않는 이미지를 모두 삭제한다.

```sh
$ docker image prune -a
```

`system prune` 명령어를 사용하면 중지된 컨테이너, dangling 이미지, 사용하지 않는 볼륨, 사용하지 않는 네트워크를 한꺼번에 삭제한다.
사용하지 않는 이미지도 함께 삭제하려면 `-a` 옵션을 사용한다.

```sh
$ docker system prune
```
