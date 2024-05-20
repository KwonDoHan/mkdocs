## Linux 정보 확인

아래 명령어들 중에 임의의 하나를 사용할 수 있다.

1. `cat /etc/os-release`    
    ```
    $ cat /etc/os-release 
    NAME="Ubuntu"
    VERSION="20.04.6 LTS (Focal Fossa)"
    ID=ubuntu
    ID_LIKE=debian
    PRETTY_NAME="Ubuntu 20.04.6 LTS"
    VERSION_ID="20.04"
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    VERSION_CODENAME=focal
    UBUNTU_CODENAME=focal
    ```

2. `grep '^VERSION' /etc/os-release` 또는 `grep -E '^(VERSION|NAME)=' /etc/os-release`
    ```
    $ grep '^VERSION' /etc/os-release
    VERSION="20.04.6 LTS (Focal Fossa)"
    VERSION_ID="20.04"
    VERSION_CODENAME=focal
    ```
    ```
    $ grep -E '^(VERSION|NAME)=' /etc/os-release
    NAME="Ubuntu"
    VERSION="20.04.6 LTS (Focal Fossa)"
    ```

3. `hostnamectl`
    ```
    $ hostnamectl
    Static hostname: COONTEC
            Icon name: computer-desktop
            Chassis: desktop
            Machine ID: 7cb3f6529f464bcea5bdb2bd25ffbaeb
            Boot ID: 7796b2105f2246bb8bea43c47edb14d5
    Operating System: Ubuntu 20.04.6 LTS
                Kernel: Linux 5.15.0-105-generic
        Architecture: x86-64
    ```

4. `uname -a`
    ```
    $ uname -a
    Linux COONTEC 5.15.0-105-generic #115~20.04.1-Ubuntu SMP Mon Apr 15 17:33:04 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
    ```

## IP 주소 확인

아래 명령어들 중에 임의의 하나를 사용할 수 있다.

### Public IP 주소

1. `curl ifconfig.me`
    ```
    $ curl ifconfig.me
    183.xx.xx.176
    ```
2. `dig +short myip.opendns.com @resolver1.opendns.com`
    ```
    $ dig +short myip.opendns.com @resolver1.opendns.com
    183.xx.xx.176
    ```

### Private IP 주소

1. `ifconfig -a`
2. `ip addr` 또는 `ip a`
3. `hostname -I | awk '{print $1}'`
4. `ip route get 1.2.3.4 | awk '{print $7}'`

## 명령어/단축키 팁

### 실행 가능한 파일을 찾아서 삭제

- `find` 명령어를 사용해서 실행 가능한 모든 파일을 찾기
```
find . -type f -executable
```

- 현재 디렉토리에서만 검색하는 것으로 제한해서 찾기
```
find . -maxdepth 1 -type f -executable
```

- 현재 디렉토리에 있는 실행 가능한 모든 파일을 찾아서 삭제하기
```
find . -maxdepth 1 -type f -executable -exec rm {} +
```

- As a side note, if you want to find files executable by any user, not just the current user (set as regular execute permission bits):
```
find . -type f -perm /111
```
```
find . -type f -perm +0111
```

- `.git` 디렉토리를 제외한 나머지 디렉토리의 실행 가능한 모든 파일 삭제하기
```
find . -not -iwholename '*.git*' -type f -executable - exec rm {} +
```

### tar, gz 압축 및 해제

- tar -cvf [파일명.tar] [폴더명]
```
tar -cvf xyz.tar abc
```

- tar -xvf [파일명.tar]
```
tar -xvf xyz.tar
```

- tar -zcvf [파일명.tar.gz] [폴더명]
```
tar -zcvf xyz.tar.gz abc
```

- tar -zxvf [파일명.tar.gz]
```
tar -zxvf xyz.tar.gz
```

### 홈/마지막 작업 디렉토리로 이동

- 홈 디렉토리로 이동하기
```
cd ~
```

- 현재 디렉토리로 이동하기 바로 직전 디렉토리로 이동하기
```
cd -
```

### Command 줄의 처음/끝으로 이동

- Command 명령줄에 입력된 내용의 처음으로 이동하기 단축키 : `Ctrl + A`
- Command 명령줄에 입력된 내용의 마지막으로 이동하기 단축키 : `Ctrl + E`

### 커서 위치에서 앞/뒤 내용 삭제

- 커서 위치에서 앞(왼쪽) 내용 삭제하기 단축키 : `Ctrl + U`
- 커서 위치에서 뒤(오른쪽) 내용 삭제하기 단축키 : `Ctrl + K`

## REFERENCE

- [시간을 절약하는 리눅스 명령어 TIP 모음](https://inpa.tistory.com/entry/LINUX-%F0%9F%93%9A-%EC%8B%9C%EA%B0%84%EC%9D%84-%EC%A0%88%EC%95%BD%ED%95%98%EB%8A%94-%ED%84%B0%EB%AF%B8%EB%84%90-%EB%8B%A8%EC%B6%95%ED%82%A4-Command-Line-Tip)