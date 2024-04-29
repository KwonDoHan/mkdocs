## Shift + Space 키로 한/영 전환

하안글 워드프로세스를 많이 사용했던 사람이라면 한/영 전환을 위해서 Shift + Space 키를 한/영 전환을 위해서 많이 사용했을 것 같다.
나 역시 마찬가지다.

혹시라도 Windows를 설치하다가 3번째 타입의 키보드를 선택하지 않았다면 키보드 상의 한/영 전환키를 이용해서 사용해야 할 것이다.
무엇보다도 익숙하지 않기 때문일테지만 나는 이것이 상당히 귀찮다고 느낀다.
그래서 이미 설치되어있는 Windows 시스템에서는 한/영 전환키를 Shift + Space 키로 바꾸는 일을 꼭 한다.

방법은 레지스트리 편집기를 통해서 할 수 있다.

`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\i8042prt\Parameters` 키에 보면, `LayerDriver KOR` 문자열에 `kdb101c.dll` 로 수정한 다음 시스템을 재부팅하면 끝이다.

## Windows 탐색기 팝업메뉴를 통한 명령 프롬프트 실행하기

Windows 탐색기를 사용하다가 현재 폴더에 명령 프롬프트를 실행해야 하는 경우가 종종 있다.
이 때, Window + R(실행)을 누르고, cmd 명령을 입력해서 명령 프롬프트를 띄운 다음 현재 폴더로 변경하는 일련의 작업은 상당히 귀찮다.

이러한 일련의 작업을 레지스트리에 등록해놓으면 Windows 탐색기의 팝업메뉴를 통해 편하게 명령 프롬프트를 실행할 수 있다.
변경해야 하는 레지스트리 값은 아래와 같다.

1. `HKEY_CLASSES_ROOT\Directory\shell\cmdprompt` 키 추가
    - (기본값) REG_SZ `명령 프롬프트 실행`
    - Icon REG_SZ `cmd.exe, 1`
1. `HKEY_CLASSES_ROOT\Directory\shell\cmdprompt\command` 키 추가
    - (기본값) REG_SZ `cmd.exe /s /k pushd "%V"`
1. `HKEY_CLASSES_ROOT\Directory\Background\shell\cmdprompt` 키 추가
    - (기본값) REG_SZ `명령 프롬프트 실행`
    - Icon REG_SZ `cmd.exe, 1`
1. `HKEY_CLASSES_ROOT\Directory\Background\shell\cmdprompt\command` 키 추가
    - (기본값) REG_SZ `cmd.exe /s /k pushd "%V"`

레지스트리 편집기에서 정상적으로 값들을 모두 입력하였다면 Windows 탐색기에서 팝업메뉴로 "명령 프론프트 실행"라는 항목이 추가되었음을 확인할 수 있다. 
아울러, 아이콘도 표시되어 눈으로 찾기가 쉽다.

레지스트리 열어서 편집하기 귀찮아서 그냥 파일을 하나 첨부했다.
첨부된 파일을 다운로드하고 기존 레지스트리에 병합하면 OK~!

## 명령 프롬프트에 TrueType 글꼴 사용하기

명령 프롬프트에는 기본적으로 "레스터 글꼴"을 사용하도록 초기화되어 있다.
이 글꼴이 마음에 들지 않아서 "속성"에서 글꼴을 변경하려고 하면 굴림체만 등록되어 있는 것을 확인할 수 있다.
하지만 나는 굴림체도 싫기 때문에 다른 TrueType 글꼴을 사용하고자 한다.

개발자인 나로서는 개인적으로 Bitstream Vera Sans Mono 글꼴을 무척이나 많이 사용한다.
프로그래밍할 때 발생할 수 있는 실수를 줄여줄 수 있기 때문에 영문은 왠만해서 거의 이 글꼴을 기본으로 사용하고 있다.
글꼴은 인터넷에 다운로드받을 수 있는 곳이 많으니 각자 알아서 구한다.

명령 프롬프트에 바꿀 수 있는 글꼴을 굴림체에서 다른 TrueType 글꼴로 변경하기 위해서는 레지스트리를 변경해야 한다.
레지스트리 편집기를 열고 아래 값을 변경한다.

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont`

여기에 있는 값들 중 949값을 변경하고자 하는 글꼴(Bitstream Vera Sans Mono)로 수정한다.
당연히 글꼴은 이미 시스템에 설치되어 있어야 하고, 수정한 후에 명령 프롬프트에서 글꼴을 변경하려고 하면 굴림체 대신 등록한 글꼴이 보인다는 것을 확인할 수 있다.

## Windows 탐색기 Context Menu에서 새로 만든 Text Document(*.txt)의 기본 문자열 넣기

요즘 하는 업무로 Windows 탐색기의 Context Menu에서 Text Document 새로 만들기를 많이 하고 있다.
같은 일을 반복해서 많이 하다보니 새로 만든 TXT 파일에 의미없는 내용을 입력하는 작업이라도 줄여보고자 레지스트리(registry)를 뒤져봤다.

Windows 탐색기를 실행하고, 마우스 오른쪽 버튼을 누르면 나오는 Context Menu에서 "새로 만들기 > Text Document" 메뉴를 선택하면 "새 텍스트 문서.txt" 파일이 만들어지는데, 이 파일은 기본적으로 아무런 값도 가지고 있지 않은 널 파일(Null File)이다.

새로 생성되는 TXT 파일에 내가 지정한 문자열을 자동으로 갖도록 하기 위해서는 아래 레지스트리 편집을 하면 가능하다.

`HKEY_CLASS_ROOT\.txt\ShellNew` 키에 Data 문자열 값 "TEST FILE"을 추가한다.

이제부터는 새로 만드는 Text Document가 Null 파일이 아니라, 내가 지정한 값을 가지고 있는 파일로 생성되는 것을 확인할 수 있다.