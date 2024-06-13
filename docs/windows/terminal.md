# 비밀번호 없이 SSH 접속하기

`ssh-keygen`을 사용하면 SSH 원격 접속 시 비밀번호를 입력하지 않을 수 있다.
이 글은 Windows 10의 Windows 터미널^Terminal^에서 우분트^Ubuntu^로 SSH 접속하는 것을 가정한다.

## `ssh-keygen`으로 공유키 생성

++win+r++ 키를 누르고 `cmd` 명령어를 실행해서 '명령 프롬프트'를 실행시킨다.
`ssh-keygen` 명령어를 입력하면 아래와 같이 출력이 되는데, 자세한 내용은 주석 라인을 참고한다.

```{.command .no-copy}
C:\Users\root>ssh-keygen
Generating public/private rsa key pair.
# 파일이 저장될 위치, 그냥 엔터치면 기본 설정으로 C:\Users\root/.ssh/ 에 파일이 생성
Enter file in which to save the key (C:\Users\root/.ssh/id_rsa):  
# 일종의 비밀번호, 생략가능, 생략할때는 그냥 엔터 
Enter passphrase (empty for no passphrase):  
# 위에서 입력한 passphrase 를 입력, 여기도 위에서 생략했으면 그냥 엔터
Enter same passphrase again:  
Your identification has been saved in C:\Users\root/.ssh/id_rsa.
Your public key has been saved in C:\Users\root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:woeifhOEIHfoWHFOIoiehOihfoweihFWFWEOIFHFw97G9 root@DESKTOP-97RFCC1
The key`s randomart image is:
+---[RSA 3072]----+
|+=o.  ..=+..     |
|+oooo+ =..  .    |
|.E.oo + o  . .   |
|o +  + *  . +    |
|.. o+ X S  o .   |
|.    B = .  =    |
|      + o  = .   |
|  ...  +  ...    |
|      .+.....    |
+----[SHA256]-----+

C:\Users\root>
```

ssh key 파일이 생성되었는지 확인한다.

```{.command .no-copy}
C:\Users\root>cd .ssh

C:\Users\root\.ssh>dir
 Volume in drive C is Windows
 Volume Serial Number is CEE4-FE07

 Directory of C:\Users\root\.ssh

2021-05-28  오전 11:23    <DIR>          .
2021-05-28  오전 11:23    <DIR>          ..
2021-05-28  오전 11:23             2,610 id_rsa
2021-05-28  오전 11:23               577 id_rsa.pub
               2 File(s)          3,187 bytes
               2 Dir(s)  463,762,251,776 bytes free

C:\Users\root\.ssh>
```

## 원격 서버에 공유키 등록

이제 생성된 public key인 `id_rsa.pub` 파일을 `scp` 명령어를 통해서 원격 서버에 전송한다.

```{.command .no-copy}
# scp 명령어
# scp -P {전송 받을 서버의 포트} {전송할 파일} {서버 계정}@{서버 아이피}:{전송한 파일을 저장할 경로}
C:\Users\root>scp -P 22 ./.ssh/id_rsa.pub root@127.0.231.12:.
root@127.0.231.12's password:
id_rsa.pub                                                  100%  577     8.5KB/s   00:00
```

파일이 전송된 뒤 원격 서버에 비밀번호를 사용해서 접속한 후, `id_rsa.pub` 파일의 내용을 `.ssh/authorized_keys` 파일에 추가한다.

```sh
cat id_rsa.pub >> .ssh/authorized_keys
```

여기까지 작업을 한 다음에 Windows 터미널에서 SSH 원격 접속을 하면, 비밀번호를 요구하지 않고 바로 연결되는 것을 확인할 수 있다.

설정이 꼬였거나 여전히 비밀번호를 요구하는 경우에는 [ssh-keygen 에러가 나는 경우들](https://light-tree.tistory.com/234)를 참고해서 문제를 해결하도록 한다.


## REFERENCE

- [ssh로 windows10 에서 비밀번호 없이 원격 접속하기](https://light-tree.tistory.com/232)
- [ssh-keygen 에러가 나는 경우들](https://light-tree.tistory.com/234)