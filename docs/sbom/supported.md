# SBOM 엔진(스캐너) 기능

## 지원범위

### 개발언어

- C
- C++
- C#
- Java
- Kotlin
- JavaScript
- Python
- Go

### 바이너리 포맷
- Native Binaries
    - ELF (Executable and Linkable Format)
        - 유닉스 계열 운영체제의 실행, 오브젝트 파일, 공유 라이브러리 또는 코어 덤프를 할 수 있게 하는 바이너리 파일이다. 원래 뜻은 Extensible Linking Format이라는 뜻을 가지고 있었다.
    - PE
    - Mach-O
- Java Binaries
    - Java Class
    - JAR
    - WAR
    - APK
    - DEX/ODEX
- Linux Kernel
- Base64
- bFLT
- IPA

### 파일 시스템

- Docker,Android,SparseCramfs,Ext2/3/4,ISO,JFFS2,Minix,RomFS,Squashfs, UBIFS,Yaffs2,WIM

### 압축 파일

- 7z,Ar,Arj,bzip,2cab,cpio,gzip,lrzip,lzip,lzma,lzop,rar,rzip,tar,upx,xar,xz,z,zip,lz4,zst

## SBOM 표준

### SPDX

- SPDX는 여러 파일형식의 소프트웨어 구성 요소와 관련된 구성요소, 라이선스, 저작권 및 보안 정보를 전달하기 위한 표준 언어를 제공

### CycloneDX

- CycloneDX는 애플리케이션 보안 컨텍스트 및 공급망 구성 요소 분석에 사용하도록 설계된 경량 SBOM 표준

### SWID (소프트웨어 식별 태그)

- NIST에 따르면 "SWID 표준은 SWID 태그가 소프트웨어 제품 설치 프로세서의 일부로 끝점에 추가되고 제품 제거 프로세스에 의해 삭제되는 라이프 사이클
- 제품 이름 및 버전에 대한 세부 정보가 포함된 일관된 레이블을 통해 장치에 소프트웨어 제품이 있음을 나타내는 표준 표시기

### SPDX Lite

- SPDX Lite는 전체 SPDX가 필요하지 않은 상황을 위한 SPDX의 경량하위 집합
- 오픈소스 라이선스에 대한 지식이나 경험이 없는 사람들도 쉽게 사용할 수 있도록 하고 "일부 산업에서 SPDX 표준과 실제 워크플로우 간의 균형"을 유지하기 위한 것


