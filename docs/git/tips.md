# Git TIPs

## `.gitignore`에 `.env`를 포함시켰는데, `.env`파일이 modified 상태인 이유

`.gitignore`를 처음 만들기 전에 이미 `.env` 파일을 푸시^Push^해 둔 상태이기 때문이다.

modified 상태에서 `.env` 파일이 나오지 않도록 하기 위해서는 원격 저장소^Remote Repository^에 `.env` 파일을 제거해야만 한다.
아래의 순서로 작업을 진행하면 된다.

1. `.gitignore`에 무시할 파일[^1]인 `.env`를 추가한다.
2. 저장소에서 `.env`를 삭제하기 위해 로컬에서 `.env` 파일을 삭제한다.
3. 커밋^Commit^ 및 푸시^Push^ (여기에서 원격 저장소에 `.env`가 삭제됨)
4. `.env` 파일을 다시 만든다.

[^1]: 파일 이외에도 폴더(디렉토리)나 패턴도 가능

좀더 좋은 방법은 아래의 명령어를 순차적으로 실행하는 것이다.

```sh
git rm .env --cached    # 폴더를 대상으로 할 때에는 -r 옵션을 추가
git add .               # 필요한 명령어인지 확인이 필요 (위 명령어로 .env 파일이 staging area로 이동됨)
git commit -m "remove .env file from git"
git push
```

## REFERENCE

- <https://velog.io/@choji95/.gitignore%EC%97%90-.env%EB%A5%BC-%ED%8F%AC%ED%95%A8%EC%8B%9C%EC%BC%B0%EB%8A%94%EB%8D%B0%EB%8F%84-.env%EA%B0%80-%EC%98%AC%EB%9D%BC%EA%B0%80%EB%8A%94-%EC%9D%B4%EC%9C%A0>