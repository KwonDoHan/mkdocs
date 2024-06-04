# Ubuntu의 `apt` 명령어

## 패키지와 패키지 매니저

리눅스 운영체제에서는 패키지와 패키지 매니저를 지원한다.
리눅스 패키지는 여러 파일을 모아 하나의 파일로 저장하고 있는 압축파일이다. 각 패키지 안에 들어 있는 파일들의 구성은 다음과 같다.

- 프로그램 파일
- 프로그램 설치 파일
- 프로그램 설치 설명서
- 프로그램에 대한 정보를 담은 파일

패키지 안에는 하나의 프로그램이 정상적으로 설치되고 동작하기 위한 모든 파일들이 압축되어 있으며, 프로그램에 대한 정보도 담겨 있다.
따라서, A라는 프로그램을 설치하기 위해 B라는 프로그램이 필요하다는 가정을 하고, B라는 패키지가 설치되지 않은 상태에서 A라는 프로그램을 설치한다면, 패키지에 포함된 정보를 통해 프로그램 B를 먼저 설치하고 나서 프로그램 A를 설치한다.

패키지 매니저는 패키지의 설치, 변경, 삭제 등을 편리하게 관리할 수 있도록 해주는 도구이다. 
사용자가 패키지 매니저를 통해 특정 프로그램의 설치를 요청하면, 패키지 매니저는 패키지가 저장된 위치에서 패키지를 다운로드하여 설치 프로그램을 실행한다.

즉, 리눅스 패키지와 패키지 매니저는 스마트폰의 어플리케이션과 앱스토어와 같은 역할을 한다.
스마트폰에서 앱스토어 역할을 하는 리눅스의 패키지 매니저는 대표적으로 apt와 rpm이 있다.

apt는 데비안 계열의 리눅스 운영체제에서 사용되고, rpm은 레드햇 계열의 리눅스 운영체제에서 사용된다. 여기서는 우분투(데비안 계열 운영체제)를 활용한 apt 사용하는 방법에 대해서 알아본다.

## `apt` 명령어

우분투는 기본적으로 `apt`라는 패키지 매니저가 내장되어 있다.
터미널 창에서 프롬프트에 `apt`라고 입력해서 사용 가능하다.

```sh
apt <명령어>
```

### apt update ^★^

패키지를 다운로드할 수 있는 저장소의 최신 정보를 업데이트한다.

### apt list --upgradable

업그레이드가 가능한 패키지 목록을 출력한다.

### apt upgrade ^★^

전체 패키지를 업그레이드한다.

### apt --only-upgrade install <패키지 이름> ^★^

특정 패키지만 업그레이드한다.

### apt install <패키지 이름> ^★^

특정 패키지를 설치한다.

### apt list --installed

설치된 패키지 목록을 출력한다.

### apt search <검색어>

패키지를 검색한다.

### apt show <패키지 이름>

특정 패키지에 대한 정보를 확인한다.

### apt remove <패키지 이름> ^★^

특정 패키지를 삭제한다.

### apt purge <패키지 이름> ^★^

특정 패키지를 완전히 삭제한다.

## `apt` vs `apt-get` 명령어

| apt 명령어                | apt-get, apt-cache, dkpg 명령어 | 설명                                                    |
| ------------------------- | ------------------------------- | ------------------------------------------------------- |
| apt update                | apt-get update                  | Refreshes repository index                              |
| apt install <패키지 이름> | apt-get install <패키지 이름>   | Install a package                                       |
| apt upgrade               | apt-get upgrade                 | Upgrade available package updates                       |
| apt remove <패키지 이름>  | apt-get remove<패키지 이름>     | Remove a package                                        |
| apt purge <패키지 이름>   | apt-get purge <패키지 이름>     | Remove a package with configuration                     |
| apt autoremove            | apt-get autoremove              | Remove unnecessary dependencies                         |
| apt full-upgrade          | apt-get dist-upgrade            | Update all packages and remove unnecessary dependencies |
| apt search <패키지 이름>  | apt-cache search <패키지 이름>  | Search for a package                                    |
| apt show <패키지 이름>    | apt-cache show <패키지 이름>    | Show package details                                    |
| apt policy                | apt-cache policy                | Show active repo information                            |
| apt policy <패키지 이름>  | apt-cache policy <패키지 이름>  | Show installed and available package version            |
| apt list --installed      | dpkg --list                     | Show installed package                                  |

## `apt-get` 명령어

### 패키지 인덱스 정보를 업데이트

`apt-get`은 인덱스를 가지고 있는데, 이 인덱스는 `/etc/apt/sources.list`에 있다. 
이곳에 저장된 저장소에서 사용할 패키지의 정보를 얻는다.

```sh
sudo apt-get update
```

### 설치된 패키지 업그레이드

설치되어 있는 패키지를 모두 새 버전으로 업그레이드한다.

```sh
sudo apt-get upgrade
```

의존성 검사하며 설치하기

```sh
sudo apt-get dist-upgrade
```

### 패키지 설치

```sh
sudo apt-get install <패키지 이름>
```

### 패키지 재설치

```sh
sudo apt-get --reinstall install <패키지 이름>
```

### 패키지 삭제

설정 파일은 지우지 않음

```sh
sudo apt-get remove <패키지 이름>
```

설정 파일까지 모두 지움

```sh
sudo apt-get --purge remove <패키지 이름>
```

### 패키지 소스코드 다운로드

```sh
sudo apt-get source <패키지 이름>
```

위에서 받은 소스코드를 의존성있게 빌드

```sh
sudo apt-get build-dep <패키지 이름>
```

### 패키지 검색

```sh
sudo apt-cache search <패키지 이름>
```

### 패키지 정보 보기

```sh
sudo apt-cache show <패키지 이름>
```

`apt`를 이용해서 설치된 deb 패키지는 `/var/cache/apt/archive/`에 설치가 된다.

## REFERENCE

- [[Linux] 리눅스의 apt 명령어 정리](https://ittrue.tistory.com/82)
- [apt vs apt-get 차이](https://yooloo.tistory.com/50)
- [Ubuntu의 apt-get 명령어 정리](https://blog.outsider.ne.kr/346)