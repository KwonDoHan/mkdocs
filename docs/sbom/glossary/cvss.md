# CVSS

### CVSS란 무엇인가?

CVSS(Common Vulnerability Scoring System)는 소프트웨어 취약점의 심각성을 평가하고, 이를 표준화된 방식으로 점수화하여 표현하는 시스템입니다. CVSS는 보안 전문가들이 취약점의 심각성을 일관되게 평가하고 비교할 수 있게 하여, 효율적인 취약점 관리와 우선순위 결정을 도와줍니다.

### CVSS의 주요 구성 요소

CVSS 점수는 세 가지 메트릭 그룹으로 구성됩니다:

1. 기본 메트릭 (Base Metrics)
2. 시간 메트릭 (Temporal Metrics)
3. 환경 메트릭 (Environmental Metrics)

이 세 그룹의 메트릭을 조합하여 취약점의 최종 점수를 산출합니다. 다음은 각 메트릭 그룹의 상세 설명입니다.

#### 1. 기본 메트릭 (Base Metrics)

기본 메트릭은 취약점의 본질적인 특성과 영향을 측정합니다. 이는 취약점의 고유한 특성을 나타내며, 모든 상황에서 변하지 않습니다.

- **공격 벡터 (Attack Vector, AV)**: 취약점이 악용될 수 있는 위치 또는 접근 방법
    - 물리적 (Physical, P)
    - 로컬 (Local, L)
    - 인접 네트워크 (Adjacent Network, A)
    - 네트워크 (Network, N)

- **공격 복잡성 (Attack Complexity, AC)**: 공격이 성공하기 위해 필요한 조건의 복잡성
    - 낮음 (Low, L)
    - 높음 (High, H)

- **권한 필요성 (Privileges Required, PR)**: 공격자가 공격을 수행하기 위해 필요한 권한 수준
    - 없음 (None, N)
    - 낮음 (Low, L)
    - 높음 (High, H)

- **사용자 상호작용 (User Interaction, UI)**: 공격 성공을 위해 필요한 사용자 상호작용
    - 없음 (None, N)
    - 필요 (Required, R)

- **범위 (Scope, S)**: 취약점의 악용이 다른 구성 요소에 영향을 미치는지 여부
    - 변경 (Changed, C)
    - 변경 없음 (Unchanged, U)

- **기밀성 영향 (Confidentiality Impact, C)**: 데이터 기밀성에 미치는 영향
    - 없음 (None, N)
    - 낮음 (Low, L)
    - 높음 (High, H)

- **무결성 영향 (Integrity Impact, I)**: 데이터 무결성에 미치는 영향
    - 없음 (None, N)
    - 낮음 (Low, L)
    - 높음 (High, H)

- **가용성 영향 (Availability Impact, A)**: 서비스 가용성에 미치는 영향
    - 없음 (None, N)
    - 낮음 (Low, L)
    - 높음 (High, H)

#### 2. 시간 메트릭 (Temporal Metrics)

시간 메트릭은 취약점에 대한 정보의 변화에 따라 점수가 변할 수 있는 요소를 평가합니다. 이 메트릭은 시간에 따라 변경될 수 있는 특성을 포함합니다.

- **악용 가능성 (Exploit Code Maturity, E)**
    - 미확인 (Unproven, U)
    - 개념 증명 (Proof-of-Concept, P)
    - 기능적 (Functional, F)
    - 높은 (High, H)
    - 악용되지 않음 (Not Defined, X)

- **수정 가능성 (Remediation Level, RL)**
    - 공식 수정 (Official Fix, O)
    - 임시 수정 (Temporary Fix, T)
    - 작업 방법 (Workaround, W)
    - 수정 불가 (Unavailable, U)
    - 정의되지 않음 (Not Defined, X)

- **보고 신뢰도 (Report Confidence, RC)**
    - 미확인 (Unknown, U)
    - 합리적 (Reasonable, R)
    - 확인됨 (Confirmed, C)
    - 정의되지 않음 (Not Defined, X)

#### 3. 환경 메트릭 (Environmental Metrics)

환경 메트릭은 특정 환경에 따라 점수가 변할 수 있는 요소를 평가합니다. 이 메트릭은 각 조직의 환경과 자산에 따라 다르게 설정될 수 있습니다.

- **기밀성 요구 사항 (Confidentiality Requirement, CR)**
    - 낮음 (Low, L)
    - 중간 (Medium, M)
    - 높음 (High, H)
    - 정의되지 않음 (Not Defined, X)

- **무결성 요구 사항 (Integrity Requirement, IR)**
    - 낮음 (Low, L)
    - 중간 (Medium, M)
    - 높음 (High, H)
    - 정의되지 않음 (Not Defined, X)

- **가용성 요구 사항 (Availability Requirement, AR)**
    - 낮음 (Low, L)
    - 중간 (Medium, M)
    - 높음 (High, H)
    - 정의되지 않음 (Not Defined, X)

- **수정된 공격 벡터 (Modified Attack Vector, MAV)**, **수정된 공격 복잡성 (Modified Attack Complexity, MAC)**, **수정된 권한 필요성 (Modified Privileges Required, MPR)**, **수정된 사용자 상호작용 (Modified User Interaction, MUI)**, **수정된 범위 (Modified Scope, MS)**, **수정된 기밀성 영향 (Modified Confidentiality Impact, MC)**, **수정된 무결성 영향 (Modified Integrity Impact, MI)**, **수정된 가용성 영향 (Modified Availability Impact, MA)**
  - 앞서 설명한 기본 메트릭과 동일한 개념으로, 특정 환경에 맞춰 수정된 값입니다.

### CVSS 점수 계산

CVSS 점수는 기본 메트릭, 시간 메트릭, 환경 메트릭의 값을 바탕으로 계산되며, 최종 점수는 0에서 10까지의 값으로 나타납니다. 기본 점수는 취약점의 본질적인 심각성을 나타내며, 시간 점수와 환경 점수는 기본 점수를 조정하여 최종 점수를 도출합니다.

### 요약

CVSS는 소프트웨어 취약점의 심각성을 표준화된 방식으로 평가하고 점수화하는 시스템입니다. 기본 메트릭, 시간 메트릭, 환경 메트릭을 통해 취약점의 다양한 특성과 영향을 평가하여 최종 점수를 산출합니다. 이를 통해 보안 전문가들은 취약점을 일관되게 평가하고 관리할 수 있습니다.