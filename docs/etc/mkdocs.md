# MkDocs

개발노트를 위해서 MkDocs를 이용하고, 변경이력은 [Git]()을 사용한다. Git 저장소(respository)는 GitHub를 이용하고, GitHub Action을 통해 GitHub Pages로 Deploy한다.

변경된 내용을 등록하기 전에 로컬PC에서 내용을 확인하기 위해 각자 MkDocs를 설치/실행해야 한다.
이를 위해 본 문서를 통해 MkDocs의 설치 및 사용방법을 알아보자.

## MkDocs 설치

MkDocs [홈페이지](https://www.mkdocs.org)를 통해서 설치 방법과 사용 방법을 자세히 알 수 있다.
여기에서는 그 내용을 참고하여 조금 다르게 정리하고자 한다.

### Anaconda(Python) 다운로드/설치

MkDocs를 사용하기 위해서는 먼저 Python이 설치되어 있어야 한다.
Python 설치는 [홈페이지](https://www.python.org)를 통해서 할 수 있다. 하지만, 여기서는 오픈소스인 [Anaconda Distribution](https://www.anaconda.com)을 설치한다.

- [Anaconda Distribution 다운로드](https://www.anaconda.com/download)에서 설치하고자 하는 운영체제(OS)에 맞는 파일을 다운로드한다.

![Anaconda Distribution](img/anaconda001.png)

!!! note
    특별히 신경써야 하는 부분이 없으므로 설치와 관련된 화면을 굳이 넣음으로써 불필요하게 문서량을 늘이지 않는다.

### MkDocs 패키지 설치

- Anaconda를 설치하고 `Ananconda Prompt`를 실행하면, Windows Prompt와는 조금 다른 모양의 프롬프트 창이 실행된다.
이것은 Python을 실행하기 위해 설정해야 하는 내용들이 적용된 프롬프트이다.

![Anaconda Prompt](img/anaconda010.png)

- `Ananconda Prompt`를 실행하고 MkDocs 패키지를 설치하려면 아래와 같이 명령한다.

```sh
$ pip install mkdocs
```

- 설치가 끝나고 정상적으로 실행되는지 확인하기 위해 설치된 mkdocs의 버전을 확인한다.

```sh
$ mkdocs --version
mkdocs, version 0.17.4
```

!!! note
    Ananconda Prompt는 Windows 10 화면의 캡춰이다. 하지만 명령어 입력은 MS-Windows 제품보다는 Linux나 MacOS의 쉘(shell) 프롬프트 형식인 `$`를 사용했다.
    이것은 본 문서를 Windows 10에서 작성하다보니 화면 캡춰의 편리함 때문이라고 이해를 부탁한다. 일반적으로 명령어는 Linux에서 사용한다는 전제로 작성한다.

## MkDocs 문서 작성

설치를 끝내고 나서 새로운 문서를 작성하기 위해서 처음 사용하는 명령어는 매우 간단하다.

```sh
mkdocs new my-project
```

위 명령어로 현재 폴더에 `my-project`라는 하위 폴더가 생성된다. 그리고 `my-project` 폴더에는 아래와 같은 구조로 파일이 생성된 것을 확인할 수 있다.

```
mkdocs.yml
docs/
     index.md
```

문서를 작성하다보면 점점 복잡해지겠지만, 처음 문서를 작성하기 위해서 필요한 파일은 `mkdocs.yml` 파일과 `docs` 폴더이다. `index.md` 파일은 실제 문서의 내용을 담고 있는 파일이다.

### mkdocs.yml

`mkdocs.yml` 파일에서 MkDocs 문서의 환경 구성을 작성한다.

일반적으로 문서 전반적인 환경설정은 변경할 필요없다. 새로운 문서를 추가하거나 문서의 위치를 변경하는 부분만 확인한다.
`pages` 항목에 작성한 문서의 위치를 선언한다.
하위 항목을 위해서 어떻게 구성해야 하는지 아래 예제를 참고한다.

!!! note
    `docs` 폴더가 웹페이지의 최상위 폴더이다.

```yml
pages:
- Home: 'index.md'
- GruCore:
    - Atom Editor: 'GruCore/Atom.md'
    ... 생략 ...
    - Linux Tips:
        - Screen: 'GruCore/Screen.md'
        - Zip/Unzip: 'GruCore/ZipUnzip.md'
```

## Material Theme for MkDocs

Material Theme를 로컬PC에 설치하기 위해서는 아래 명령어를 실행한다.

```sh
pip install mkdocs-material
```

`mkdocs.yml` 파일에 아래 내용을 추가해서 Material Theme를 적용한다.

```yml
theme:
    name: 'material'
    feature:
        tabs: true
```

!!!warning
    로컬PC에서 확인을 하기 위해서 일부 내용은 수정할 수도 있겠지만, `pages` 항목을 제외한 부분은 가급적 수정하지 말 것을 권장한다.

### Markdown Extensions

문서를 작성하기 위해 [Markdown](Markdown.md)의 기본문법을 알아야 한다.

MkDocs의 테마(theme)로 Material은 설정에 따라서 여러 가지 다양한 형태의 Markdown 확장(extension)을 지원한다.

여기에서는 우리회사에서 사용하는 확장에 대해서 알아본다.
우리회사에서 사용하는 `mkdocs.yml` 파일을 열어보면, 아래와 같은 내용이 있는 것을 확인할 수 있다.

```yml
markdown_extensions:
    - admonition
    - codehilite
    - footnotes
    - pymdownx.tasklist
    - pymdownx.tilde
    - pymdownx.betterem:
        smart_enable: all
    - pymdownx.superfences:
        custom_fences:
            - name: flow
              class: uml-flowchart
              format: !!python/name:pymdownx.superfences.fence_code_format
            - name: sequence
              class: uml-sequence-diagram
              format: !!python/name:pymdownx.superfences.fence_code_format
```

!!! note
    필요한 확장(extension)이 늘어나면 위의 내용은 변경될 수 있다.

이제부터 Marterial Theme를 통해 설정한 Markdown 확장에 대해서 하나씩 알아보자.

#### admonition

##### 원문 자료
[Material for MkDocs - Extensions - Admonition](https://squidfunk.github.io/mkdocs-material/extensions/admonition/)

##### 사용법

admonition은 3개 이상의 느낌표(`!!!`)로 시작하고, 이후에 타입별로 키워드를 사용한다.
그리고 다음 줄에서 4개의 공백으로 들여쓰기를 하여 내용을 입력한다.

```markdown
!!! note
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.
```

##### 타입

!!! note
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! abstract
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! info
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! tip
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! success
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! question
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! warning
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! failure
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! danger
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! bug
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! example
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

!!! quote
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

#### codehilite

##### 원문 자료
[Material for MkDocs - Extensions - CodeHilite](https://squidfunk.github.io/mkdocs-material/extensions/codehilite/)

##### 예제

!!! example
    ```javascript tab="Output"
    function sum(a, b) {
        return a + b;
    }
    var a = 10;
    var b = 20;
    var c = sum(a, b);
    ```

    ````markdown tab="Source"
    ```javascript
    function sum(a, b) {
        return a + b;
    }
    var a = 10;
    var b = 20;
    var c = sum(a, b);
    ```
    ````

#### footnotes

##### 원문 자료
[Material for MkDocs - Extension - Footnotes](https://squidfunk.github.io/mkdocs-material/extensions/footnotes/)

#### keys

##### 원문 자료
[PyMdown Extensions - Keys](https://facelessuser.github.io/pymdown-extensions/extensions/keys/)

#### tasklist

##### 원문 자료
[PyMdown Extensions - Tasklist](https://facelessuser.github.io/pymdown-extensions/extensions/tasklist/)

#### tilde

##### 원문 자료
[PyMdown Extensions - Tilde](https://facelessuser.github.io/pymdown-extensions/extensions/tilde/)

#### betterem

##### 원문 자료
[PyMdown Extensions - BetterEm](https://facelessuser.github.io/pymdown-extensions/extensions/betterem/)

#### superfences

##### 원문 자료
[PyMdown Extensions - SuperFences](https://facelessuser.github.io/pymdown-extensions/extensions/superfences/)

#### flow chart

[flowchart.js](http://flowchart.js.org)에서 제공하는 기능을 MkDocs에 적용한 확장이다.
자세한 내용은 해당 홈페이지를 참고한다.

!!! example

    ```flow tab="Output"
    st=>start: Start:>http://www.google.com[blank]
    e=>end:>http://www.google.com
    op=>operation: My Operation
    sub=>subroutine: My Subroutine
    cond=>condition: Yes or No?:>http://www.google.com
    io=>inputoutput: catch something...

    st->op->cond
    cond(yes)->io->e
    cond(no)->sub(right)->op
    ```

    ```` tab="Source"
    ```flow
    st=>start: Start:>http://www.google.com[blank]
    e=>end:>http://www.google.com
    op=>operation: My Operation
    sub=>subroutine: My Subroutine
    cond=>condition: Yes or No?:>http://www.google.com
    io=>inputoutput: catch something...

    st->op->cond
    cond(yes)->io->e
    cond(no)->sub(right)->op
    ```
    ````

#### sequence dialog

[js-sequence-diagrams](https://bramp.github.io/js-sequence-diagrams/)에서 제공하는 기능을 MkDocs에 적용한 확장이다.
자세한 내용에 대해서 설명을 읽기보다는 예제 코드를 보면 직관적으로 이해할 수 있을 정도로 쉽다.

Syntax에 대한 문법은 아래와 같다.

![Grammer of Js-Sequence](img/sequence001.png)

그리고 아래와 예제를 참고하자.

!!! example 

    ```sequence tab="Output"
    participant CLIENT as client
    participant SVN REPOSITORY as svn 
    participant MKDOCS SERVER as mkdocs

    client->svn: SVN COMMIT
    svn->mkdocs: SVN UPDATE
    mkdocs->mkdocs: BUILD 수행
    note right of mkdocs: MKDOCS SERVICE 갱신
    client-->mkdocs: PAGE REQUEST
    mkdocs-->client: RESPONSE
    ```

    ```` tab="Source"
    ```sequence
    participant CLIENT as client
    participant SVN REPOSITORY as svn 
    participant MKDOCS SERVER as mkdocs

    client->svn: SVN COMMIT
    svn->mkdocs: SVN UPDATE
    mkdocs->mkdocs: BUILD 수행
    note right of mkdocs: MKDOCS SERVICE 갱신
    client-->mkdocs: PAGE REQUEST
    mkdocs-->client: RESPONSE
    ```
    ````
