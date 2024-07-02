---
# draft: true
date: 2024-06-26
authors:
    - dohan
categories:
    - IP Address
tags:
    - IP Address
    - CIDR
slug: cidr
---

# CIDR<sup>Classless Inter-Domain Routing</sup>

IP 주소를 `192.168.0.0/24`와 같은 형식으로 표현하는 것은 **CIDR (Classless Inter-Domain Routing)** 표기법을 사용하는 것입니다. CIDR 표기법은 IP 주소와 서브넷 마스크를 결합하여 네트워크를 식별하는 방식입니다. 이를 통해 더 유연하고 효율적인 IP 주소 할당이 가능해졌습니다.

<!-- more -->

### CIDR 표기법 설명

CIDR 표기법은 다음과 같이 구성됩니다.

- IP 주소 부분: `192.168.0.0`
- 슬래시(`/`) 뒤에 오는 숫자: `24`

이 숫자는 **서브넷 마스크** 를 나타내며, IP 주소의 네트워크 부분과 호스트 부분을 구분하는 역할을 합니다.

#### 서브넷 마스크

서브넷 마스크는 32비트 주소 공간을 네트워크 부분과 호스트 부분으로 나누기 위한 것입니다. `192.168.0.0/24`에서 `/24`는 서브넷 마스크의 처음 24비트가 1로 설정된 것을 의미합니다. 이를 이진수로 표현하면 다음과 같습니다:

- 서브넷 마스크: `255.255.255.0`
- 이진수: `11111111.11111111.11111111.00000000`

따라서 `192.168.0.0`의 네트워크 부분은 첫 24비트(`192.168.0`)이고, 마지막 8비트는 호스트 부분입니다.

### 네트워크와 호스트 부분

#### 네트워크 주소
`192.168.0.0/24`에서 `192.168.0.0`은 네트워크 주소입니다. 네트워크 주소는 호스트 부분이 모두 0으로 설정된 주소로, 특정 네트워크를 식별하는 데 사용됩니다.

#### 브로드캐스트 주소
브로드캐스트 주소는 호스트 부분이 모두 1로 설정된 주소로, 네트워크 내의 모든 호스트에게 패킷을 전송하는 데 사용됩니다. `192.168.0.0/24` 네트워크의 브로드캐스트 주소는 `192.168.0.255`입니다.

### IP 범위

`192.168.0.0/24` 네트워크에서 사용할 수 있는 IP 주소 범위는 다음과 같습니다.

- 네트워크 주소: `192.168.0.0`
- 호스트 주소 범위: `192.168.0.1`부터 `192.168.0.254`까지
- 브로드캐스트 주소: `192.168.0.255`

네트워크와 브로드캐스트 주소는 호스트에 할당되지 않으므로, 실제로 사용할 수 있는 호스트 주소는 254개입니다.

### 요약

- **CIDR 표기법**: IP 주소와 서브넷 마스크를 결합하여 네트워크를 식별하는 방식.
- **서브넷 마스크**: 네트워크 부분과 호스트 부분을 구분하는 역할을 하며, CIDR 표기법에서 `/` 뒤에 오는 숫자로 표현.
- **네트워크 주소**: 네트워크를 식별하는 주소로, 호스트 부분이 모두 0으로 설정.
- **브로드캐스트 주소**: 네트워크 내 모든 호스트에게 패킷을 전송하는 주소로, 호스트 부분이 모두 1로 설정.
- **IP 주소 범위**: 네트워크 내에서 실제로 사용할 수 있는 호스트 주소 범위.

`192.168.0.0/24`은 `192.168.0.0` 네트워크에서 256개의 IP 주소를 포함하며, 그 중 `192.168.0.1`부터 `192.168.0.254`까지가 호스트에 할당 가능한 주소입니다.