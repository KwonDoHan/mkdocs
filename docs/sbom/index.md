# SBOM (Software Bill of Materials)

## SBOM 개념

**SBOM(Software Bill of Materials)은 소프트웨어의 구성 컴포넌트에 관한 메타정보, 제조업 BOM으로부터 파생한 용어이지만 활용 목적에서 식품원재료표와 유사하다.**

- SBOM은 소프트웨어 구성요소 식별용 명세서로 소프트웨어 공급망 관점에서 중요하다.
  - “Software Bill of Materials” or “SBOM” means a formal record containing the details and supply chain relationships of various components used in building software. ... (2021.5, US EO14028)

- SBOM은 제조업에서 널리 사용되고 있는 자재명세서 또는 부품표(Bill Of Materials, 이하 BOM)의 개념을 소프트웨어 분야에 적용한 것

    - 제조업 BOM은 특정 제품을 구성하는 모든 부품을 목록화하여 관리함으로써 제조업체의 지속적인 양산체제 유지를 위한 공급망 관리 목적
    - 유사 개념으로 제조되어 유통되는 식품에 사용된 구성성분을 표시한 식품 원재료표(food indredients)가 있는데, 이용자의 인지 및 위험성 확인 목적
    * System BOM이 동일한 약어를 사용하여 혼동 발생 가능

- SBOM은 수혜자, 표기할 목록 범위, 외부 구성요소 관련성 등에서 제조업의 BOM, 식품원재료표 등과 차이가 있음
    - 제조업 BOM은 생산관리를 위해 주로 사용하고, 식품원재료표는 일부 구성요소만 목록에 포함한다는 점에서 SBOM과 같지 않음

    | 구분                                    | BOM                          | SBOM                                                   | 식품원재료표<br />(food ingredients) |
    | --------------------------------------- | ---------------------------- | ------------------------------------------------------ | ------------------------------------ |
    | 수혜자<br />**(주 수혜자는 굵은 글씨)** | **생산자**<br />(부품공급자) | 생산자 (모듈공급자 포함)<br />**구매자 (운영자 포함)** | **구매자**                           |
    | 목록 대상                               | 모든 구성요소                | 모든 구성요소                                          | 주요 구성요소                        |
    | 외부 연결                               | 없음                         | 있음 (예: API 연결)                                    | 없음                                 |

    - SBOM은 디지털 재화인 소프트웨어를 대상으로 하기 때문에 API 연결 등과 같은 외부 구성요소와의 연결이 존재하여 이들 외부 구성요소 포함 여부가 이슈라는 점에서 다른 것들과 차이가 있음

### CVE / CWE / CCE / CVSS

- CVE (Common Vulnerabilities and Exposures)
    - 공개적으로 알려진 보안 취약점을 식별하고 추적하기 위한 표준 식별자이다.
    - 이 식별자는 벤더가 제공하는 패치와 관련된 취약점의 특성과 함께 공개된다.
    - 다양한 보안 도구, 운영체제, 애플리케이션 및 데이터베이스에서 해당 취약점을 찾을 수 있도록 돕는다.
    - 표시 형식 : `CVE-YYYY-NNNN` (YYYY : 연도, NNNN : 일련번호)
        - CVE 식별자는 보안 기업, 리서치 조직 및 RedHat, IBM, Cisco, Oracle, Microsoft와 같은 주요 IT 벤더를 대표하는 CNA(CVE Numbering Authority)에서 할당한다.
    - 사용 분야 : 보안 취액점 식별 및 추적, 취약점 데이터베이스 및 도구, 보안 패치 관리 시스템
- [CWE (Common Weakness Enumeration)](https://cwe.mitre.org/index.html)
    - 소프트웨어 취약점 목록으로 소스코드 취약점을 정의한 데이터베이스이다.
    - 보안 엔지니어 및 개발자가 소프트웨어를 설계, 개발 및 테스트할 때 고려해야 할 취약점이다.
    - 다양한 취약점 유형을 계층적으로 구조화하여 특정 취약점을 더 쉽게 이해하고 관리할 수 있도록 돕는다.
    - 표시 형식 : `CWE-XXX` (XXX : 고유한 숫자 식별자)
    - 사용 분야 : 보안 취약점 분류 및 정의, 취약점 분석 및 관리, 보안 교육 및 인지
- [CCE (Common Configuration Enumeration)](https://cce.mitre.org)
    - 시스템 및 네트워크 구성 요소의 취약점을 식별하고 점검항목을 표준화하기 위한 표준 식별자이다.
    - 비밀번호 길이/복잡성, 기본 계정 삭제 등 시스템 구성 및 설정에 관한 규정(또는 정책)을 설명한다.
    - 시스템 및 네트워크 구성의 일관성을 유지하고 보안을 강화할 수 있다.
    - 표시 형식 : `CCE-NNN-NNNN`
    - 사용 분야 : 시스템 및 네트워크 구성 요소의 표준화, 보안 구성 관리, 취약점 관리 및 해결
- [CVSS (Common Vulnerability Scoring System)](https://www.first.org/cvss/)
    - 보안 취약점의 중요도 및 심각성을 측정하고 평가하는데 사용되는 표준 메트릭이다.
    - 취약점의 기반 특성, 영향 및 가능한 해결 방법을 고려하여 위험도를 계산할 수 있는 개방형 Framework이다.
    - 조직의 취약성 관리 프로세스를 평가하고 우선순위를 지정할 수 있다.
    - 표시 형식 : `CVSS:VV.Y/AV:N/AC:L/PR:N/UI:N/S:U/C:H/Ih/A:H` ([CVSS V4.0 Calculator](https://www.first.org/cvss/calculator/4.0))
        - `VX.Y`: CVSS 버전을 표시
        - `AV`: 취약점에 대한 Attack Vector를 표시
        - `AC`: Attack Complexity을 설명
        - `PR`: Privileges Required 등
    - 사용 분야: 보안 취약점 평가 및 등급화, 위험 관리, 보안 우선순위 결정

## Tools

- [CVE Binary Tool](https://cve-bin-tool.readthedocs.io/en/latest/index.html)

    - What CVE Binary Tool does when it runs:

      ![CVE Binary Tool 실행](img/image.png)

      1. CVE 데이터 다운로드 (from NVD, OSV, GAD, REDHAT, Curl)
      2. 컴포넌트 목록 생성/읽기
      3. CVE 목록 생성
      4. 트리아지(Triage)/추가 데이터 포함시키기
      5. 리포트 생성

## Data Sources

[CVE Binary Tool](https://cve-bin-tool.readthedocs.io/en/latest/MANUAL.html#data-sources) 매뉴얼에 설명된 데이터 소스는 아래와 같다.

- National Vulnerability Database (NVD)
- Open Source Vulnerability Database (OSV)
- Gitlab Advisory Database (GAD)
- RedHat Security Database (REDHAT)
- Curl Database (Curl)

## 참고자료

- [SBOM 가이드](https://www.globalict.kr/sbom/sbom.do?menuCode=040600)
- [미국 SBOM(Software Bill of Materials) 정책 분석 및 시사점](https://spri.kr/posts/view/23537?code=data_all&study_type=issue_reports)
- [CVE Binary Tool](https://cve-bin-tool.readthedocs.io/en/latest/index.html)
- [SBOM 구현을 위한 개방형 표준](https://www.digitalmarket.kr/web/board/BD_board.view.do?domainCd=2&bbsCd=1030&bbscttSeq=20230427113013723&registPassword=Y&othbcAt=Y)
- [[정보보안] 취약점 관리 및 식별 방법(CVE / CWE / CCE / CVSS)](http://yesxyz.kr/explanation-on-cve-cwe-cce-cvss/)