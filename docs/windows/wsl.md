# WSL을 사용한 Linux 설치

## 필수 조건

WSL<sup>Windows Subsystem for Linux</sup> 설치를 하려면 Windows 10 버전 2004 이상(빌드 19041 이상) 도는 Windows 11을 실행해야 한다.

## wsl 설치 명령

관리자 모드에서 PowerShell 또는 Windows 명령 프롬프트를 마우스 오른쪽 버튼으로 눌러 "관리자 권한으로 실행"을 선택하여 열고 `wsl --install` 명령을 입력한 다음 컴퓨터를 다시 시작한다.

```prompt
wsl --install
```

`--install` 명령은 다음 작업을 수행합니다.

- 옵션인 WSL과 Virtual Machine Platform 구성요소 사용
- 최신 Linux 커널을 다운로드하여 설치
- WSL 2를 기본값으로 설정
- Ubuntu Linux 배포판을 다운로드하여 설치 (재부팅이 필요할 수 있음)


## REFERENCE

- [How to install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
- [Set up a WSL development environment](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password)
- [Get started with Docker remote containers on WSL 2](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers)