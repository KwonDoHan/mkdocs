# 도커(Docker) 입문

도커<sup>Docker</sup>는 2013년에 등장한 컨테이너 기반 가상화 도구입니다. 파이콘 US 2013<sup>Pycon US 2013</sup>에서 솔로몬 하이크<sup>Solomon Hykes</sup>는 리눅스 컨테이너의 미래<sup>The Future of Linux Container</sup>라는 라이트닝 토크에서 도커를 처음 소개했습니다.

도커는 리눅스 상에서 컨테이너 방식으로 프로세스를 격리해서 실행하고 관리할 수 있도록 도와주며, 계층화된 파일 시스템에 기반해 효율적으로 이미지(프로세스 실행 환경)을 구축할 수 있도록 해줍니다. 도커를 사용하면 이 이미지를 기반으로 컨테이너를 실행할 수 있으며, 다시 특정 컨테이너의 상태를 변경해 이미지로 만들 수 있습니다. 이렇게 만들어진 이미지는 파일로 보관하거나 원격 저장소를 사용해 쉽게 공유할 수 있으며, 도커만 설치되어 있다면 필요할 때 언제 어디서나 컨테이너로 실행하는 것이 가능합니다.

## 도커(Docker) 시작하기

컨테이너는 하드웨어를 소프트웨어로 재구현하는 가상화(= 가상머신)와는 달리 프로세스의 실행 환경을 격리합니다.
컨테이너가 실행되고 있는 호스트 입장에서 컨테이너는 단순히 프로세스에 불과합니다만, 사용자나 컨테이너 입장에서는 호스트와는 무관하게 동작하는 가상머신처림 보입니다.
그래서 컨테이너형 가상화라고 부르기도 합니다.
도커는 이러한 컨테이너형 가상화를 지원하는 도구 중 하나입니다.
도커는 가상머신의 역할을 넘어서 어느 플랫폼에서나 특정한 상태를 그대로 재현가능한 애플리케이션 컨테이너를 관리하는 도구를 목표로 합니다.
LXC(리눅스 컨테이너)로부터 파생된 도커 컨테이너는 가상머신과는 근본적으로 다른 접근이라는 점을 짚어둘 필요가 있습니다.

도커는 가상머신과 같이 하드웨어를 가상화하는 것이 아니라, 리눅스 운영체제에서 지원하는 다양한 기능을 사용해 컨테이너(하나의 프로세스)를 실행하기 위한 별도의 환경(파일 시스템)을 준비하고, 리눅스 네임스페이스와 다양한 커널 기능을 조합해 프로세스를 특별하게 실행시켜 줍니다.
이는 가상머신과 같이 하드웨어를 갓아화하는 것이 아니라, 운영체제 상에서 지원하는 방법을 통해서 하나의 프로세스(컨테이너)를 실행하기 위한 별도의 환경을 구축하는 일을 지원하고, 도커는 바로 프로세스를 격리시켜 실행해 주는 도구라고 할 수 있습니다.

가상머신과의 차이를 보기 위해서, 간단히 예를 살펴보겠습니다.
예를 들어 우분투<sup>Ubuntu</sup> 22.04에서 센트OS<sup>CentOS</sup> 환경을 구축하는데 시간이 얼마나 걸릴까요?
먼저 우분투 상에서 작업을 하고 있다고 가정해 보겠습니다.

```sh
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.3 LTS"
```

이미 도커가 설치되어 있는 환경이라면, 명령어 하나로 센트OS 머신을 실행할 수 있습니다.[^1]

[^1]: Docker 명령어를 실행하는 환경이 반드시 우분투여야 하는 것은 아닙니다. 다른 리눅스 배포판이나 맥OS<sup>macOS</sup>에서도 도커가 설치되어 있다면 아래 내용을 똑같이 실행해 볼 수 있습니다.

```sh
$ docker run -it --rm centos:latest bash
Unable to find image 'centos:latest' locally
latest: Pulling from library/centos
a1d0c7532777: Pull complete
Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177
Status: Downloaded newer image for centos:latest

[root@d30e509b4692 /]#
```

`docker run -it centos:latest bash` 명령어는 `centos:latest` 이미지로부터 `bash`를 실행하라는 의미입니다.
아직 이미지가 없다면, 도커의 공식 저장소에서 이ㅣ 이미지를 풀<sup>Pull</sup> 받아옵니다.
그리고 이 이미지를 기반으로 `bash` 프로세스를 실행합니다.
마지막에 셸<sup>Shell</sup> 프롬프트가 달라진 것을 볼 수 있습니다.

그럼, 지금 실행중인 셀의 환경이 정말 센트OS인지 확인해 보도록 하겠습니다.

```sh
[root@d30e509b4692 /]# cat /etc/redhat-release
CentOS Linux release 8.4.2105
```

## 도커(Docker) 설치하고 기본 설정하기

<!-- TODO: 내용 추가하기 -->

## 도커 이미지(Docker Image) 기초

이미지와 컨테이너는 도커를 이해하는 데 있어 가장 중요한 개념입니다.
여기서는 먼저 이미지 개념에 대해서 같이 살펴보겠습니다.
이미지는 가상머신에서 사용하는 이미지와 비슷한 역할을 합니다.
한 마디로 정의해 보자면 이미지는 어떤 애플리케이션을 실행하기 위한 환경이라고 할 수 있습니다.
그리고 이 환경은 파일들의 집합입니다.
도커에서는 애플리케이션을 실행하기 위한 파일들을 모아놓고, 애플리케이션과 함께 이미지로 만들 수 있습니다.
그리고 이 이미지를 기반으로 애플리케이션을 바로 배포할 수 있습니다.

처음에 간단히 살펴 본 예제에서는 `centos` 컨테이너에서 `bash` 셀을 실행했습니다.
이 과정을 좀 더 풀어써보면 다음과 같습니다.

1. 도커 레지스트리에서 `centos` 이미지를 풀<sup>Pull</sup> 받는다.
2. 이 이미지를 통해서 컨테이너를 실행한다.

이번에는 이 과정을 나눠서 진행해 보겠습니다.
먼저 1의 이미지를 풀 받는 부분만 진행합니다.
이제 막 도커를 설치했으니 이미지가 없다는 것을 확인해 봅니다.

```sh
$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

아무 것도 출력되지 않습니다. 
그렇다면 `centos` 이미지를 도커 레지스트리 상에서 풀 받아보겠습니다.
도커에서는 `docker pull <IMAGE_NAME>` 명령어로 이미지를 풀 받을 수 있습니다.

```sh
$ docker pull centos
Using default tag: latest
latest: Pulling from library/centos
a1d0c7532777: Pull complete
Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177
Status: Downloaded newer image for centos:latest
docker.io/library/centos:latest
```

이미지 이름은 `:`을 구분자로 이미지 이름과 태그로 구분됩니다.
태그를 지정하지 않으면 기본값으로 `latest`가 사용됩니다.
따라서 `centos`는 `centos:latest`와 같습니다.
도커는 먼저 이 이미지를 로컬에서 찾아보고, 찾을 수 없으면 도커 공식 저장소에서 찾아봅니다.
저장소에 해당하는 이미지가 있으면 이미지를 풀 받아옵니다.
마지막 줄의 메시지로부터 `centos:latest` 이미지가 다운로드된 것을 알 수 있습니다.

앞서 사용해 본 `images` 명령어로 다운받은 이미지를 확인해 보겠습니다.

```sh
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
centos       latest    5d0da3dc9764   2 years ago   231MB
```
`centos:latest` 이미지가 추가된 것을 볼 수 있습니다.
앞서 `pull` 명령어가 CVS 명령어와 비슷한 것처럼 도커에서는 하나의 이미지를 저장소<sup>Repository</sup>라고 부릅니다.
`TAG`는 임의로 붙여진 추가적인 이름입니다.
일반적으로 이미지의 버저닝을 하기 위해서 사용됩니다.
`IMAGE ID`는 이미지를 가리키는 공유한 해시<sup>Hash</sup>값입니다.
`CREATED`는 이미지가 생성된 시간, `SIZE`는 이미지의 용량을 나타냅니다.

`docker images`는 앞으로 자주 사용하게 될 명령어이니 꼭 기억해 두시기 바랍니다.

### 도커 허브(Docker Hub) - 공식 이미지 레지스트리

<!-- TODO: 내용 추가 -->

## 컨테이너(Container) 이해하기





## 도커와 버전 관리 시스템





## Dockerfile로 이미지 만들기





## 실전: 도커 이미지로 서버 애플리케이션 배포하기




## REFERENCE

- [도커(Docker) 입문편](https://www.44bits.io/ko/post/easy-deploy-with-docker)
- [WSL 2에서 Docker 원격 컨테이너 시작](https://learn.microsoft.com/ko-kr/windows/wsl/tutorials/wsl-containers)
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)