# Material for MkDocs

## 시작하기

### 설치

**`with pip`** recommended

```
pip install mkdocs-material
```

## 사이트 만들기

Material for MkDocs 설치 후에 `mkdocs` 명령어를 사용하여 프로젝트 문서를 시작할 수 있다.

```
mkdocs new .
```

이 명령어를 실행하고 나면 아래와 같은 구조와 파일/폴더가 만들어진다.

```
.
├─ docs/
│  └─ index.md
└─ mkdocs.yml
```

### 설정

#### 최소한의 설정

`mkdocs.yml` 파일에 아래와 같이 최소한의 설정을 추가해 본다.

```
site_name: My site
site_url: https://mydomain.org/mysite
theme:
  name: material
```

#### 고급 설정

- [색상 변경하기](https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/)
- [글꼴 변경하기](https://squidfunk.github.io/mkdocs-material/setup/changing-the-fonts/)
- [언어 변경하기](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/)
- [로고/아이콘 변경하기](https://squidfunk.github.io/mkdocs-material/setup/changing-the-logo-and-icons/)

<!-- TODO: 고급 설정 추가하기 -->


### 작성한 내용 확인하기

`mkdocs.yml` 파일을 저장하고, 아래의 명령어를 실행 후 웹브라우저로 화면에 보이는 URL을 접속해 본다.

```
mkdocs serve --dirtyreload
```

웹브라우저에 아래 그림과 같이 첫 번째 화면을 확인할 수 있다.

![Material for MkDocs 첫 화면](imgs/material4mkdocs001.png)

### 문서 사이트 만들기

```
mkdocs build
```
