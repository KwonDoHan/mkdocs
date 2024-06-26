# CPE

### CPE란?

소프트웨어 명세서(SBOM: Software Bill of Materials)는 소프트웨어 제품 및 구성 요소의 목록을 제공하는 문서입니다. SBOM에서 사용하는 용어인 CPE(Common Platform Enumeration)는 특정 소프트웨어 제품을 명확히 식별하기 위한 표준화된 명명 체계입니다. CPE는 소프트웨어 보안 취약점을 관리하고 취약한 소프트웨어를 신속하게 파악하는 데 중요한 역할을 합니다.

### CPE 명명 규칙의 전체 항목

CPE는 두 가지 형식으로 표현됩니다: URI 형식과 WFN(Well-Formed Name) 형식. 주로 URI 형식이 많이 사용됩니다.

#### CPE URI 형식

CPE URI 형식은 다음과 같습니다:

```{.cpe .no-copy}
cpe:2.3:part:vendor:product:version:update:edition:language:sw_edition:target_sw:target_hw:other
```

각 항목의 의미는 다음과 같습니다:

1. **cpe**: CPE의 고정 접두사
2. **2.3**: CPE 명세 버전 번호 (현재 사용되는 주요 버전은 2.3)
3. **part**: 대상 유형 - 애플리케이션(application, `a`), 운영 체제(operating system, `o`), 하드웨어(hardware, `h`)
4. **vendor**: 소프트웨어 공급자 또는 제조업체 (예: `microsoft`)
5. **product**: 제품명 (예: `office`)
6. **version**: 제품 버전 (예: `2016`)
7. **update**: 업데이트 버전 또는 서비스 팩 정보 (예: `sp1`)
8. **edition**: 제품 에디션 (예: `professional`)
9. **language**: 소프트웨어의 언어 (예: `en`)
10. **sw_edition**: 소프트웨어 에디션 (예: `pro`)
11. **target_sw**: 대상 소프트웨어 플랫폼 (예: `windows`)
12. **target_hw**: 대상 하드웨어 플랫폼 (예: `x64`)
13. **other**: 기타 추가 정보 필드 (예: `beta`)

### 예제

"Microsoft Office 2016 Professional SP1"의 CPE URI는 다음과 같습니다:

```{.cpe .no-copy}
cpe:2.3:a:microsoft:office:2016:sp1:professional:en:pro:windows:x64:beta
```

#### 각 필드의 상세 설명

1. **part (대상 유형)**:
    - `a`: 애플리케이션
    - `o`: 운영 체제
    - `h`: 하드웨어

2. **vendor (공급자)**:
    - 소프트웨어를 개발한 회사나 조직의 이름
    - 예: `microsoft`, `apple`

3. **product (제품명)**:
    - 소프트웨어 제품의 이름
    - 예: `office`, `windows`

4. **version (버전)**:
    - 소프트웨어의 버전 번호
    - 예: `2016`, `10.0.19041`

5. **update (업데이트)**:
    - 업데이트 수준 또는 서비스 팩 정보
    - 예: `sp1` (Service Pack 1)

6. **edition (에디션)**:
    - 제품의 에디션(예: 프로페셔널, 엔터프라이즈 등)
    - 예: `professional`, `home`

7. **language (언어)**:
    - 제품의 언어 코드
    - 예: `en` (영어), `ko` (한국어)

8. **sw_edition (소프트웨어 에디션)**:
    - 소프트웨어의 특별 에디션
    - 예: `pro`, `enterprise`

9. **target_sw (대상 소프트웨어 플랫폼)**:
    - 소프트웨어가 실행되는 목표 소프트웨어 환경
    - 예: `windows`, `linux`

10. **target_hw (대상 하드웨어 플랫폼)**:
    - 소프트웨어가 실행되는 목표 하드웨어 환경
    - 예: `x64`, `arm`

11. **other (기타 추가 정보)**:
    - 기타 추가 정보를 나타내는 필드
    - 예: `beta` (베타 버전)

### CPE WFN 형식

WFN 형식은 사람이 읽기 쉬운 형태로, 다음과 같이 구성됩니다:

```{.wfn .no-copy}
wfn:[part=part][vendor=vendor][product=product][version=version][update=update][edition=edition][language=language][sw_edition=sw_edition][target_sw=target_sw][target_hw=target_hw][other=other]
```

### 예제

위 예제의 WFN 형식은 다음과 같습니다:

```{.wfn .no-copy}
wfn:[part=a][vendor=microsoft][product=office][version=2016][update=sp1][edition=professional][language=en][sw_edition=pro][target_sw=windows][target_hw=x64][other=beta]
```

### 요약

CPE는 소프트웨어 제품을 유일하게 식별할 수 있도록 하는 표준 명명 체계로, 보안 취약점 관리 및 특정 소프트웨어의 취약성을 신속하게 파악하는 데 사용됩니다. CPE URI와 WFN 형식 모두 소프트웨어의 세부 정보를 구조화하여 명확하게 식별할 수 있도록 돕습니다.