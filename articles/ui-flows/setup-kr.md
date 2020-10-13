---
title: UI 흐름(UI flows) 및 Power Automate Desktop (preview) 설정하기 | Microsoft Docs
description: UI 흐름(UI flows) 및 Power Automate Desktop (preview) 설정하기
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/22/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# UI 흐름(UI flows) 및 Power Automate Desktop (preview) 설정하기

UI 흐름(UI flows)을 사용중인 장치에 생성하고 사용하시기 전에 필요사항을 사전에 준비하셨는 지 확인해주세요.

> [!TIP]
> UI 흐름(UI flow)을 생성하기 전에 [커넥터 리스트](https://flow.microsoft.com/connectors/)를 확인하셔서 자동화 하려는 애플리케이션에 이미 커넥터가 있는 것은 아닌지 확인해주세요. 만일 있다면 UI 흐름(UI flow)을 사용하지 말고 그러한 흐름을 활용하는 것을 고려해주세요. 물론 [나만의 맞춤형 커넥터](https://docs.microsoft.com/connectors/custom-connectors/)를 만드셔도 됩니다.

## 사전준비사항

- Power Automate 유인 RPA용 [유료](https://flow.microsoft.com/pricing/) 또는 [무료체험](https://flow.microsoft.com/manage/) 라이선스가 있어야 합니다.

- 어드민 권한을 가진 직장 또는 학교 계정으로 윈도우 장치와 Power Automate에 로그인(sing in)을 해주세요.

- 사용하려는 장치는 Windows 10 Pro, Windows 10 Entreprise, Windows Server 2016, 또는 Windows Server 2019 이어야 합니다.

- [Microsoft Edge](https://www.microsoft.com/edge/) (80 또는 나중 버전) 또는 Google Chrome browser를 사용해주세요.

- [환경(environment)](https://docs.microsoft.com/power-platform/admin/environments-overview) 은 [Common Data Service database](https://docs.microsoft.com/power-platform/admin/create-database)가 있어야 합니다.

- 지원되는 키보드가 있어야 합니다.

>[!IMPORTANT]
>UI 흐름(UI flows)를 녹화, 테스트 또는 실행하기 위해서는 각 컴포넌트가 최신 버전이어야 합니다.

## UI 흐름 및 Power Automate Desktop (preview) 장치에 설치하기

인스톨러는 여러분이 자동화를 위해 녹화, 편집 및 테스트에 필요한 모든 컴포넌트를 갖추고 있습니다.

아래 단계를 따라 UI 흐름 앱을 설치해주세요:

1. [UI 흐름 인스톨러 내려받기](https://go.microsoft.com/fwlink/?linkid=2102613).
1. **Setup.Microsoft.PowerAutomate.UIflow.exe** 파일 열기. 

   위 단계에 따라 다운로드 받으시면 **다운로드(Downloads)** 폴더에 저장되어 있을 수 있습니다.

1. **UI flows setup** 인스톨러에 있는 지시에 따라 설치를 완료해주세요.
1. 인스톨러를 실행하실 때 UI 흐름 과 Power Automate Desktop (preview) 가운데 선택해서 설치하시거나 둘 다 설치하실 수 있습니다. 
1. 각 요소들을 잘 선택해서 설치를 완료하시면 됩니다. 

>[!IMPORTANT]
>UI 흐름 패키지는 웹드라이버 컴포넌트와 UI 흐름 브라우저 확장 프로그램을 설치합니다. 데스크톱용 UI 흐름을 녹화, 테스트 및 실행하기 위해서는 둘 다 설치하셔야 합니다..
>Power Automate Desktop (preview) 패키지는 Power Automate Desktop 앱, 제3자 제공 컴포넌트(third-party components) 및 브라우저 확장 프로그램을 설치합니다.

![Installation options image](https://user-images.githubusercontent.com/48315710/92633908-c546e380-f2d3-11ea-8976-6a7609eb70f8.png)

### 데이터 수집 옵션 설정

마이크로소프트에 사용 데이터를 보내는 것을 원하지 않는다면, 설치하는 동안 기본으로 체크되어 있는 **(Microsoft에서 사용 데이터를 수집하여 UI 흐름을 개선할 수 있도록 허용합니다(Allow Microsoft to collect usage data to improve UI flows)** 부분을 체크 해제하시면 됩니다.

## UI 흐름 및 Power Automate Desktop (preview) 브라우저 확장 프로그램 

설치가 완료되면, UI 흐름 및 Power Automate Desktop (preview) 브라우저용 확장 프로그램들을 사용하시는 브라우저에서 활성화(Active) 해주셔야 합니다.

![Installation success image](https://user-images.githubusercontent.com/48315710/92635143-a5b0ba80-f2d5-11ea-96ec-4672d84d13b3.png)

1. 인스톨러에 표시된 링크 가운데 하나를 선택해주세요. 예를 들어, Microsoft Edge에 UI 흐름을 설치하고 싶으시면 **Microsoft Edge** 링크를 누르시면 됩니다..

   브라우저용 스토어가 확장 프로그램용 공개 페이지를 직접 접속하실 수 있습니다.

1. 확장 프로그램이 설치되었는 지 확인하세요. 만일 설치가 되어 있지 않으면 다음 과정을 따라하시기 바랍니다:

#### Microsoft Edge: 
- **다운로드(Get)**을 선택하시고 알림창이 열리면 **확장 추가(Add extension)** 를 누르세요. 
- 만일 *이 확장 프로그래은 Microsoft Edge에서 꺼져있습니다* 라는 메세지를 페이지 상단에서 보시게 되면 **확장프로그램 켜기(Turn on extension)** 를 선택해주세요.

#### Google Chrome: 
- **Chrome에 추가(Add to Chrome)** 를 선택하시고 알림창에서 **확장프로그램 추가(Enable extension)** 를 선택해주세요. 
- 만일 *이 항목은 크롬에서 비활성화 되어 있습니다* 라는 메세지를 페이지 상단에서 보시게 되면  **사용(Enable this item)** 을 선택해주세요.

> [!TIP]
> 만일 브라우저에서 확장프로그램들을 활성화하지 못할 경우 아래 사항을 확인해부세요:
> - [Microsoft Edge](https://www.microsoft.com/edge/) (80 또는 나중 버전) 또는 Google Chrome을 사용하고 계신지 확인 해주세요. Firefox는 Power Automate Desktop 확장 프로그램만 지원이 됩니다.
> - 확장 프로그램이 보이지 않으면, [UI 흐름 인스톨러](https://go.microsoft.com/fwlink/?linkid=2102613) 로 재설치 하실 수 있습니다.


## UI 흐름으로 웹 애플리케이션 자동화를 위해 Selenium IDE 설치하기

Selenium IDE는 웹사이트에서 사람이 보이는 상호작용을 녹화 및 재생을 도와주는 오픈소스 도구입니다.

UI 흐름에서 Selenium IDE 스크립트를 Power Automate를 통해 실행하고 안전하게 (적절한 IT 거버넌스를 통해) Common Data Service에 저장하실 수 있습니다

다음과같이 Selenium IDE를 설치하세요:

1. [Microsoft Edge](https://www.microsoft.com/edge/) (80 또는 나중 버전) 또는 Google Chrome 사용자를 위한 Selenium IDE [내려받기 및 설치하기](https://go.microsoft.com/fwlink/?linkid=2107665).

1. [Microsoft Edge](https://www.microsoft.com/edge/) (80 또는 나중 버전) 에서 **다른 스토어에서 확장프로그램 설치** 을 선택하고 **Chrome에 추가(Add to Chrome)**.

## 온 프레미스 데이터 게이트웨이 설치하기

원격 장치에서 [이벤트, 스케줄, 또는 버튼 흐름](../getting-started.md#types-of-flows)으로 UI 흐름에 트리거를 걸기 위해 게이트웨이가 필요합니다.

>[!TIP]
>사용중인 장치에서 흐름을 생성, 편집 및 테스트 할 목적이라면 게이트웨이는 필요하지 않습니다.

필요시 [온 프레미스 데이터 게이트웨이 설치하기](https://docs.microsoft.com/data-integration/gateway/service-gateway-install)

>[!IMPORTANT]
>게이트웨이를 설치할 경우, Power Automate 를 사용하는 지역을 기본으로 합니다.


## UI 흐름 커넥션과 기기 암호 설정하기

1. [Power Automate](https://powerautomate.microsoft.com) 로그인.
1. 화면 왼편에 있는 **데이터(Data)** 확장.
1. **연결(Connections)** 선택.

   ![A screenshot of the connections tab](../media/ui-flows-setup/connections-tab.png)

1. 새 연결 선택.

   ![A screenshot of a connection](../media/ui-flows-setup/new-connection.png)

1. *UI flows*를 찾아 **UI flows** 선택.

   ![A screenshot of the search box](../media/ui-flows-setup/search-ui-flow.png)

1. 게이트웨이 정보와 장치 보안내역(Domain and username 과 Password) 입력: 

    - **Domain and Username**: 장치 계정을 입력하세요. 사용자 이름을 사용하는 로컬 계정을 활용하거나(예를 들어, “MACHINENAME\\User” 또는 “local\\User”) 또는 “DOMAIN\\User”와 같은 Active Directory 게정을 사용하실 수 있습니다..
    - **Password**: 해당 계정 패스워드를 사용하세요.
    - **게이트웨이 선택(Choose a gateway)**: 사용하시려는 게이트웨이를 선택하세요.

      ![A screenshot that shows where to enter the credentials for the connection](../media/ui-flows-setup/credentials-screen.png)

1. **만들기(Create)** 선택.

## 게이트웨이 누락 해결(Troubleshoot missing gateway)

아래와 같은 이유로 커넥션을 만들 때 리스트에서 게이트웨이를 찾지 못할 수도 있습니다:

- Power Automate 리전(region)이 아닌 다른 리전(region)에 게이트웨이가 설치. 이 문제는 장치에서 게이트웨이를 지우고(unistall) [올바른 Power Automate 리전](../regions-overview.md#region-mappings-for-power-automate-and-gateways)을 선택해서 다시 설치해서 해결 가능.
- 해당 게이트웨이가 소유자에 의해 삭제.

## 지원되는 키보드 레이아웃

- US keyboard – English (United States)
- US keyboard – English (Australia)
- US keyboard – English (Canada)
- Microsoft Pinyin – Chinese (Simplified Han, China)
- German keyboard – German (Germany)
- Microsoft IME – Japanese (Japan)
- United Kingdom keyboard – English (United Kingdom)
- French keyboard – French (France)
- Russian keyboard – Russian (Russia)
- Portuguese (Brazilian ABNT) keyboard – Portuguese (Brazil)
- Portuguese (Brazilian ABNT2) keyboard – Portuguese (Brazil)
- **Microsoft IME – Korean (South Korea)**
- Spanish keyboard – Spanish (Spain)
- Italian keyboard – Italian (Italy)
- Latin American keyboard – Spanish (Mexico)
- Polish (Programmers) keyboard – Polish (Poland)
- United States-International keyboard – Dutch (Netherlands)
- Turkish Q keyboard – Turkish (Turkey)
- India keyboard – English (India)

## 지원 언어

영어 이외에 UI 흐름이 지원하는 언어목록:

|||||
----|-----|-----|--------
Basque	| French	| Latvian	| Slovak
Bulgarian	|	Galician	|	Lithuanian	|	Slovenian
Catalan	|	German		|Malay	|	Spanish
Chinese (Simplified)	|	Greek	|	Norwegian	|	Swedish
Chinese (Traditional)	|	Hindi	|	Polish	|	Thai
Croatian	|	Hungarian	|	Portuguese (Brazil)	|	Turkish
Czech	|	Indonesian	|	Portuguese (Portugal)		|Ukrainian
Danish	|	Italian	|	Romanian	|	Vietnamese
Dutch		|Japanese	|	Russian	
Estonian 	|Kazakh	|	Serbian (Cyrillic, Serbia)	
Finnish		|Korean		|Serbian (Latin, Serbia)

>[!NOTE]
>Power Automate Desktop (preview)은 영어, 프랑스어, 독일어, 일어, 스페인어만 지원이 가능합니다. Preview(미리보기) 기능은 상용이 아니라는 뜻이며 기능상의 제한이 있을 수 있습니다.


## UI 흐름 제거하기

1. **시작(start)** 메뉴 > **설정(Settings)** > **앱 및 기능(Apps)**.
1. **UI flows** 를 검색 후 선택.
1. **제거(Uninstall)** 선택.

## 한계점

아래 사항들은 지원되지 않습니다:
- Windows 10 홈(Home) 설치는 지원 안됨.

-   데스크톱 UI 흐름

    -   다중 모니터.
    -   더블 클릭, 마우스 호버, 터치/펜 입력.
    -   윈도우 상호작용(파일 검색기, 시작메뉴, 작업표시줄 등)

-   웹 UI 흐름

    -   마우스 오른쪽 클릭.
    -   재생되는 동안 사용자 세션정보(가령: 쿠키 등)은 재사용 할 수 없으며 해당 사이트에서 요구할 경우 로그인 정보를 스크립트로 편집해야 함.

- Power Automate Desktop (preview)

   - 터치/펜 입력

각 기능 들에 관해서는 설명서를 통해 각 기능별 제한사항을 확인하실 수 있습니다.

## 더 학습하기

- 지난 배포에서 [UI 흐름 업그레이드 하기](upgrade.md).
- [데스크톱 UI 흐름 생성](create-desktop.md) 학습하기.
- [웹 UI 흐름 생성](create-web.md) 학습하기.
- [UI 흐름 실행](run-ui-flow.md) 학습하기.
- [UI 흐름 관리](manage.md) 학습하기.
- [온 프레미스 게이트웨이(on-premises gateway)](../gateway-reference.md#use-a-gateway)더 학습하기.
