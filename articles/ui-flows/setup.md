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

## Activate the UI flows and Power Automate Desktop (preview) browser extension 

After the installation completes, confirm that the extensions for UI flows and Power Automate Desktop (preview) are active on the browser(s) you use.

![Installation success image](https://user-images.githubusercontent.com/48315710/92635143-a5b0ba80-f2d5-11ea-96ec-4672d84d13b3.png)

1. Select one of the links displayed in the installer. For example, if you want to use UI flows on Microsoft Edge, select the **Microsoft Edge** link.

   The store for your browser opens directly to the public page for the extension.

1. Confirm that the extension is installed. Follow these steps if it isn't installed:

#### Microsoft Edge: 
- Select **Get**, and then select **Add extension** when prompted. 
- If you see the message: *This extension has been turned off in Microsoft Edge*, at the top of the page, select **Turn on extension**.

#### Google Chrome: 
- Select **Add to Chrome**, and then select **Enable extension** when prompted. 
- If you see the message: *This item has been disabled in Chrome* on top of the page, select **Enable this item**.

> [!TIP]
> If you are not able to activate the extension(s) in your browser, check the following:
> - You must use [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later) or Google Chrome. Firefox is only supported with the Power Automate Desktop extension.
> - If the extension does not appear, you can reinstall it with the [UI flows installer](https://go.microsoft.com/fwlink/?linkid=2102613).


## Install Selenium IDE to automate Web applications with UI flows

The Selenium IDE is an open source tool that lets you record and playback human interactions on Websites.

With UI flows, you can run Selenium IDE scripts from Power Automate and keep them stored securely (with appropriate IT governance) in Common Data Service.

Follow these steps to install Selenium IDE:

1. [Download and install](https://go.microsoft.com/fwlink/?linkid=2107665) the Selenium IDE for [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later) or Google Chrome.

1. On Microsoft Edge (version 80 or later), select **Allow extensions from other stores**, and then select **Add to Chrome**.

## Install the on-premises data gateway

You will need the gateway to trigger your UI flow from an [event, schedule, or button flow.](../getting-started.md#types-of-flows) on a remote device.

>[!TIP]
>The gateway isn't required if you only want to create, edit, and test your flows on your device.

[Install the on-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-install), if you need it.


>[!IMPORTANT]
>When you install the gateway, it defaults to the region that Power Automate uses.


## Setup UI flows connections and machine credentials

1. Sign into [Power Automate](https://powerautomate.microsoft.com).
1. Expand **Data** on the left side of the screen.
1. Select **Connections**.

   ![A screenshot of the connections tab](../media/ui-flows-setup/connections-tab.png)

1. Select New connection.

   ![A screenshot of a connection](../media/ui-flows-setup/new-connection.png)

1. Search for *UI flow*, and then select **UI flows**.

   ![A screenshot of the search box](../media/ui-flows-setup/search-ui-flow.png)

1. Provide the gateway information and device credentials: 

    - **Domain and Username**: Provide your device account. You can use a local account by using the name of the user (for example, “MACHINENAME\\User” or “local\\User”), or an Active Directory account such as “DOMAIN\\User”.
    - **Password**: Your account’s password.
    - **Choose a gateway**: Select the gateway you want to use.

      ![A screenshot that shows where to enter the credentials for the connection](../media/ui-flows-setup/credentials-screen.png)

1. Select **Create**.

## Troubleshoot missing gateway

You might not find the gateway in the list while creating the connection for the following reasons:

- The gateway may be installed in a different region than your Power Automate region. To resolve this issue, uninstall the gateway from the device, and then reinstall it, selecting [the correct Power Automate region](../regions-overview.md#region-mappings-for-power-automate-and-gateways).
- The gateway was deleted by its owner.

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
- Microsoft IME – Korean (South Korea)
- Spanish keyboard – Spanish (Spain)
- Italian keyboard – Italian (Italy)
- Latin American keyboard – Spanish (Mexico)
- Polish (Programmers) keyboard – Polish (Poland)
- United States-International keyboard – Dutch (Netherlands)
- Turkish Q keyboard – Turkish (Turkey)
- India keyboard – English (India)

## Supported languages

Here are the languages that UI flows supports, in addition to English:

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
>Power Automate Desktop (preview) is available only in English, French, German, Japanese, Spanish. Preview features aren’t meant for production use and may have restricted functionality.


## Uninstall UI flows

1. Open the **start** menu > **Settings** > **Apps**.
1. Search for **UI flows**, and then select it.
1. Select **Uninstall**.

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
