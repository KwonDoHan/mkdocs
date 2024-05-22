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
앞서 `pull` 명령어가 VCS<sup>Version Control System</sup> 명령어와 비슷한 것처럼 도커에서는 하나의 이미지를 저장소<sup>Repository</sup>라고 부릅니다.
`TAG`는 임의로 붙여진 추가적인 이름입니다.
일반적으로 이미지의 버저닝을 하기 위해서 사용됩니다.
`IMAGE ID`는 이미지를 가리키는 공유한 해시<sup>Hash</sup>값입니다.
`CREATED`는 이미지가 생성된 시간, `SIZE`는 이미지의 용량을 나타냅니다.

`docker images`는 앞으로 자주 사용하게 될 명령어이니 꼭 기억해 두시기 바랍니다.

### 도커 허브(Docker Hub) - 공식 이미지 레지스트리

<!-- TODO: 내용 추가 -->

## 컨테이너(Container) 이해하기

앞서 `centos` 컨테이너를 실행하는 것은 다음과 같은 두 단계를 거친다고 이야기했습니다.

1. 도커 레지스트리에서 `centos` 이미지를 풀<sup>Pull</sup> 받는다.
2. 이 이미지를 통해서 컨테이너를 실행한다.

이번에는 두 번째 단계에 대해서 좀 더 자세히 다뤄보겠습니다.
이미지는 어떤 환경이 구성되어 있는 상태를 저장해 놓은 파일 집합이라고 이야기했습니다.
바로 이 이미지의 한경 우에서 특정한 프로세스를 격리시켜 실행한 것을 컨테이너라고 부릅니다.
컨테이너를 실행하려면 반드시 이미지가 있어야 합니다.
다시 한 번 정리합니다.
==이미지는 파일들의 집합이고, 컨테이너는 이 파일들의 집합 위에서 실행된 특별한 프로세스입니다.==

컨테이너는 `docker run`를 통해서 실행할 수 있습니다.
여기서는 셀을 실행하기 위해서 `-it` 옵션을 붙였습니다.
`docker run -it <이미지이름:태그> <명령어>`로 `centos` 이미지 기반의 컨테이너를 하나 실행시켜 보겠습니다.

```sh
$ docker run -it centos:latest bash
[root@8e3362104708 /]#
```

이제 새로운 명령어를 하나 배워보도록 하겠습니다.
앞서 사용가능한 이미지들을 확인하는 명령어는 `docker images`였습니다.
이번에 사용할 명령어는 현재 실행중인 컨테이너 목록을 출력하는 명령어 `docker ps`입니다.
컨테이너로 실행된 셀을 그대로 놔두고 별도의 셀이나 터미널을 열고 `docker ps` 명령어를 실행해 봅니다.

```sh
$ docker ps
CONTAINER ID   IMAGE           COMMAND   CREATED         STATUS         PORTS     NAMES
8e3362104708   centos:latest   "bash"    2 minutes ago   Up 2 minutes             boring_albattani
```

`ps` 명령어의 결과로 실행중인 컨테이너 정보를 확인할 수 있습니다.
맨 앞의 `CONTAINER ID`는 앞으로 도커에서 컨테이너를 조작할 때 사용하는 아이디이기 때문에 핈후적으로 알아둘 필요가 있습니다.
마지막 컬럼은 임의로 붙여진 컨테이너의 이름입니다.
컨테이너를 조작할 때는 `CONTAINER ID`를 사용할 수도 있고, `NAMES`를 사용할 수도 있습니다.
이름은 `docker run` 명령어에서 `--name <이름>`으로 옵션을 사용해 명시적으로 지정할 수 있지만, 지정하지 않으면 임의의 이름이 자동으로 부여됩니다.

컨테이너는 독립된 환경에서 실행됩니다만, 컨테이너의 기본적인 역할은 이미지 위에서 미리 규정된 명령어를 실행하는 일입니다. 
이 명령어가 종료되면 컨테이너도 종료 상태(Exit)에 들어갑니다. 
이러한 죽은 컨테이너의 목록까지 확인하려면 `docker ps -a` 명령어를 사용하면 됩니다. 
셀을 종료하고 컨테이너 목록을 확인해보겠습니다.

앞서 실행된 `centos`의 `bash` 셀에서 `exit` 명령어로 셀을 종료합니다.

```sh
[root@8e3362104708 /]# exit
```

컨테이너가 종료되었는지 `docker ps`를 통해서 살펴봅니다.

```sh
$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

컨테이너 목록이 비어있는 것을 볼 수 있습니다.
종료된 컨테이너까지 보기 위해서는 `-a` 옵션을 사용해야 합니다.

```sh
$ docker ps -a
CONTAINER ID   IMAGE           COMMAND   CREATED         STATUS                      PORTS     NAMES
8e3362104708   centos:latest   "bash"    9 minutes ago   Exited (0) 57 seconds ago             boring_albattani
```

9분 전에 만들어진 `8e3362104708` 컨테이너가 57초 전에 종료된 것을 알 수 있습니다.
이번엔 `restart` 명령어를 통해 이미지를 되살려 보겠습니다.

```sh
$ docker restart 8e3362104708
8e3362104708
$ docker ps
CONTAINER ID   IMAGE           COMMAND   CREATED          STATUS         PORTS     NAMES
8e3362104708   centos:latest   "bash"    11 minutes ago   Up 3 seconds             boring_albattani
```

컨테이너가 되살아났습니다.
하지만 셀과 입출력을 주고받을 수 있는 상태는 아닙니다.
컨테이너로 실행된 프로세스와 터미널 상에서 입출력을 주고 받으려면 `attach` 명령어를 사용해야 합니다.

```sh
$ docker attach 8e3362104708
[root@8e3362104708 /]#
```

다시 도커 컨테이너 안으로 들어왔습니다.
여기까지 도커 컨테이너의 생명주기를 살펴보았습니다.
도커 컨테이너를 실행시키는 `run`부터 실행이 종료되었을 때 다시 실행하는 `restart`를 배웠습니다. 
이 외에도 실행된 컨테이너를 강제로 종료시키는 `stop` 명령어가 있으며, 종료된 컨테이너를 삭제하는 `rm` 명령어도 있습니다. 
잠시 기억을 더듬어 올라가 이 글의 초반부에서 `run` 명령어와 함께 사용한 `--rm` 플래그는 컨테이너가 종료 상태가 되면 자동으로 삭제를 해주는 옵션입니다.

## 도커와 버전 관리 시스템

계속 해서 강조하지만 이미지와 컨테이너는 다릅니다. 
그렇다면 한가지 질문을 던져보죠. 
어떤 컨테이너를 지지고 볶고 삶고 데치고 하면 이미지에는 어떤 변화가 생길까요?

==컨테이너를 지지고 볶고 삶고 데치고 해도, 이미지에는 아무런 변화도 생기지 않습니다.==

이미지는 불변이지만, 그 대신 도커에서는 이 이미지 위에 무언가를 더해서 새로운 이미지를 만들어내는 일이 가능합니다.
이미지를 기반으로 만들어진 컨테이너는 변경 가능^Mutable^하기 때문입니다.
도커의 또 하나의 중요한 특징은 바로 계층화된 파일 시스템을 사용한다는 점입니다.
특정한 이미지로부터 생성된 컨테이너에 어떤 변경사항을 더하고(파일들을 변경하고), 이 변경된 상태를 새로운 이미지로 만들어 내는 것이 가능합니다.
도커의 모든 이미지는 기본적으로 이 원리로 만들어집니다.
바로 이러한 점 때문에 도커에서는 저장소^Repository^, 풀^Pull^, 푸시^Push^, 커밋^Commit^, 차분^Diff^ 등 VCS에서 사용하는 용어들을 차용한 것으로 보입니다.

마치 깃^Git^ 저장소에 새로운 커밋을 추가하듯이, 도커에서 새로운 이미지를 생성하는 과정을 따라가 보겠습니다.
이번에는 우분투 이미지를 사용하겠습니다.
먼저 우분투 바이오닉 비버<sup>Ubuntu Bionic Beaver</sup>[^2] 이미지를 다운로드 받고, 앞선 예제와 같이 `bash` 셀을 실행해 봅니다.

[^2]: 바이오닉 비버(Bionic Beaver)는 우분투 18.04 LTS의 코드명입니다. 2028년 EOL<sup>End of List</sup> 예정입니다.

```sh
$ docker pull ubuntu:bionic
...
$ docker run -it ubuntu:bionic bash
root@22ea990ab247:/#
```

이 컨테이너에 깃^Git^을 설치해 보겠습니다.
먼저 이 우분투 기본 이미지에는 깃이 설치되어 있지 않다는 것을 확인해 봅니다.

```sh
root@22ea990ab247:/# git --version
bash: git: command not found
```

깃을 설치하기 전에 하나 더 확인하고 넘어가겠습니다.
도커는 마치 자신의 VCS라도 된 것마냥, 어떤 컨테이너와 이 컨테이너의 부모 이미지 간의 파일 변경사항을 확인할 수 있는 명령어를 제공합니다.
`git diff` 명령어로 프로젝트의 변경사항을 확인하듯이, `docker diff` 명령어로 부모 이미지와 여기서 파생된 컨테이너의 파일 시스템 간의 변경사항을 확인할 수 있습니다.
우분투에 셀이 실행된 컨테이너를 그대로 두고, 다른 셀에서 `docker diff` 명령어를 실행해 보겠습니다.


```sh
$ docker ps
CONTAINER ID   IMAGE           COMMAND   CREATED         STATUS         PORTS     NAMES
22ea990ab247   ubuntu:bionic   "bash"    3 minutes ago   Up 3 minutes             optimistic_noether
$ docker diff 22ea990ab247
```

아무 것도 출려고디지 않나요? 그럼 정상입니다.
왜냐하면 이 컨테이너는 아직 이미지 파일 시스템 상태 그대로이기 때문입니다.
이제 깃을 설치합니다.
다음 명령어들을 차례대로 실행합니다.

```sh
root@22ea990ab247:/# apt update
...
root@22ea990ab247:/# apt install -y git
...
root@22ea990ab247:/# git --version
git version 2.17.1
```

우분투의 패키지 관리자 `apt`를 사용해 버전 관리 시스템 깃^Git^ 명령어를 설치했습니다.
다시 셀을 그대로 두고 다른 셀에서 `docker diff`를 실행해 봅니다.

```sh
$ docker diff 22ea990ab247 | head
C /lib
C /lib/x86_64-linux-gnu
A /lib/x86_64-linux-gnu/libkeyutils.so.1.5
A /lib/x86_64-linux-gnu/libbsd.so.0
A /lib/x86_64-linux-gnu/libkeyutils.so.1
A /lib/x86_64-linux-gnu/libbsd.so.0.8.7
A /lib/x86_64-linux-gnu/libexpat.so.1
A /lib/x86_64-linux-gnu/libexpat.so.1.6.7
C /bin
A /bin/lesskey
```

결과가 너무 많기 때문에 `head`로 앞부분만 출력하도록 했습니다.
여기서 `A`는 Add, `C`는 Change, `D`는 Delete를 의미합니다.
결과를 보면 알 수 있지만 패키지 하나를 설치하는 것만으로도 아주 많은 파일들이 추가되거나 변경된 것을 알 수 있습니다.
앞서 이야기했지만 컨테이너에서 어떤 작업을 한다고 원래 이미지가 달라지지는 않습니다.

이제 `ubuntu:bionic` 이미지에 깃이 설치된 새로운 이미지를 생성해 보도록 하겠습니다.
이 또한 VCS와 매우 비슷합니다.
도커에서는 이 작업을 `commit`이라고 합니다.


```sh
$ docker commit 22ea990ab247 ubuntu:git
sha256:743d8cb2c092e78f35738d62510710e21e9423ef1d7e6174f6a768e07bd96c57
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ubuntu       git       743d8cb2c092   27 seconds ago   203MB
ubuntu       bionic    f9a80a55f492   11 months ago    63.2MB
centos       latest    5d0da3dc9764   2 years ago      231MB
```

단지 커밋을 하고 뒤에 이름을 붙여주면 바로 새로운 도커 이미지가 생성됩니다.
이미지로부터 컨테이너를 실행시키고 이 컨테이너의 수정사항을 통해서 새로운 이미지를 만들었습니다.
그렇다면 정말로 이 이미지를 통해서 컨테이너를 실행하면 `git` 명령어가 있을까요?

직접 확인해 보죠.


```sh
$ docker run -it ubuntu:git bash
root@ffbcf6adab21:/# git --version
git version 2.17.1
```

`git`이 설치되어 있는 것을 확인할 수 있습니다.

하지만 이 이미지는 별로 쓸모가 없네요. 
필요없는 이미지는 정리하고 넘어가겠습니다.
하나 알아두셔야 하는 중요한 사항은 이미지에서 파생된 (종료 상태를 포함한) 컨테이너가 하나라도 남아있다면 이미지는 삭제할 수 없습니다.
따라서 먼저 컨테이너를 종료하고, 삭제까지 해주어야 합니다.
`docker rm`은 컨테이너를 삭제하는 명령어이고, `docker rmi`는 이미지를 삭제하는 명령어입니다. 
이 두 명령어를 혼동하지 않아야 합니다.

먼저 컨테이너를 지우고, 이미지를 삭제해 보겠습니다.

```sh
$ docker ps -a
CONTAINER ID   IMAGE           COMMAND   CREATED          STATUS                        PORTS     NAMES
ffbcf6adab21   ubuntu:git      "bash"    41 seconds ago   Exited (0) 3 seconds ago                magical_hugle
22ea990ab247   ubuntu:bionic   "bash"    9 minutes ago    Exited (0) 53 seconds ago               optimistic_noether
8e3362104708   centos:latest   "bash"    48 minutes ago   Exited (127) 22 minutes ago             boring_albattani
$ docker rm ffbcf6adab21
ffbcf6adab21
$ docker rmi ubuntu:git
Untagged: ubuntu:git
Deleted: sha256:743d8cb2c092e78f35738d62510710e21e9423ef1d7e6174f6a768e07bd96c57
Deleted: sha256:bb12abda110b9821434bb8b6ad9cf9699c59295f774005207e3a27488265aa4f
```

이번에는 도커 이미지의 생명주기를 배웠습니다.
도커 이미지를 `pull`로 받아고, `commit`으로 새로운 이미지를 만들고, `rmi` 명령어로 삭제해 보았습니다.
컨테이너와 이미지의 생명주기만 이해하고 나면 도커의 대부분을 이해한 거나 다름 없습니다.
도커로 할 수 있는 대부분의 작업은 이미지와 컨테이너 개념으로 커버할 수 있습니다.
이제 남은 일은 자신에게 필요한 **이미지**를 만들고 이 이미지를 통해서 컨테이너를 실행하는 일입니다.

그리고 이제 기본적인 개념들을 배웠으니 중앙 저장소인 [도커 허브](https://hub.docker.com)에서 이미 만들어져 있는 다양한 이미지들을 활용할 수도 있습니다.
무엇을 하건 도커의 모토를 잊지 마시기 바랍니다.
거짓말 조금 보태서 완성된 이미지는 언제 어디에서라도 실행 가능합니다.


## Dockerfile로 이미지 만들기

도커 이미지를 추가하는 방법은 크게 세 가지가 있습니다. 
먼저 `pull`을 사용해 미리 만들어져있는 이미지를 가져오는 방법입니다.
그리고 컨테이너의 변경사항으로부터 이미지를 만드는 법에 대해서도 소개했습니다. 
두 번째 방법은 아주 흥미롭지만, 이렇게 이미지를 만드는 경우는 거의 없습니다. 
세 번째 방법은 `Dockerfile`을 빌드하는 방법입니다. 
`Dockerfile`은 도커만의 특별한 DSL로 이미지를 정의하는 파일입니다. 
여기서부터는 세 번째 방법으로 도커 이미지를 만들어보겠습니다.

### Git이 설치된 우분투 이미지 만들기

먼저 `Dockerfile`을 만들기 위한 디렉토리를 만듭니다.

```sh
$ mkdir git-from-dockerfile
$ cd git-from-dockerfile
```

이제 다음 내용으로 `Dockerfile`을 작성합니다.

```title="Dockerfile"
FROM ubuntu:bionic
RUN apt-get update
RUN apt-get install -y git
```

앞서 `commit` 명령어로 도커 이미지를 만들었던 것과 `Dockerfile` 내용이 그 방식이 다르지 않음을 알 수 있습니다.
먼저 `FROM`은 어떤 이미지로부터 이미지를 생성할지 지정합니다.
`Dockerfile`에서는 필수 항목이며, 여기서는 `ubuntu:bioni`을 지정했습니다.
다음으로 `RUN` 지시자는 명령어를 실행하라는 의미입니다.
먼저 `apt-get update`를 실행하고, 다음으로 `apt-get install -y git`을 실행합니다.
앞서 `apt` 명령어를 사용했지만, 여기서는 `apt-get` 명령어를 사용했습니다.
명령어의 차이일 뿐 `git` 패키지를 설치하는 것은 같습니다.

이제 `Dockerfile`로 이미지를 빌드해 보겠습니다.

```sh
$ docker build -t ubuntu:git-from-dockerfile .
[+] Building 0.1s (7/7) FINISHED                                                       docker:default
 => [internal] load build definition from Dockerfile                                             0.0s
 => => transferring dockerfile: 103B                                                             0.0s
 => [internal] load metadata for docker.io/library/ubuntu:bionic                                 0.0s
 => [internal] load .dockerignore                                                                0.0s
 => => transferring context: 2B                                                                  0.0s
 => [1/3] FROM docker.io/library/ubuntu:bionic                                                   0.0s
 => CACHED [2/3] RUN apt-get update                                                              0.0s
 => CACHED [3/3] RUN apt-get install -y git                                                      0.0s
 => exporting to image                                                                           0.0s
 => => exporting layers                                                                          0.0s
 => => writing image sha256:e62615a56cb7c8830b0a572cc33a3f6a0b8ad0a6ce148c399727ea4b0010262f     0.0s
 => => naming to docker.io/library/ubuntu:git-from-dockerfile                                    0.0s
```

이미지가 새로 잘 만들어졌는지 확인해 보겠습니다.

```sh
$ docker images
REPOSITORY   TAG                   IMAGE ID       CREATED         SIZE
ubuntu       git-from-dockerfile   e62615a56cb7   3 hours ago     203MB
ubuntu       bionic                f9a80a55f492   11 months ago   63.2MB
centos       latest                5d0da3dc9764   2 years ago     231MB
```

이제는 새로 만든 이미지에 깃^Git^이 잘 설치되어 있는지 확인해 보겠습니다.

```sh
$ docker run -it ubuntu:git-from-dockerfile bash
root@7c92151a907e:/# git --version
git version 2.17.1
```

깃이 잘 설치되어 있는 것을 확인할 수 있습니다.


## 실전: 도커 이미지로 서버 애플리케이션 배포하기




## REFERENCE

- [도커(Docker) 입문편](https://www.44bits.io/ko/post/easy-deploy-with-docker)
- [WSL 2에서 Docker 원격 컨테이너 시작](https://learn.microsoft.com/ko-kr/windows/wsl/tutorials/wsl-containers)
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [도커와 컨테이너의 이해 (1/3) - 컨테이너 사용법](https://tech.cloudmt.co.kr/2022/06/29/%EB%8F%84%EC%BB%A4%EC%99%80-%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88%EC%9D%98-%EC%9D%B4%ED%95%B4-1-3-%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88-%EC%82%AC%EC%9A%A9%EB%B2%95/)