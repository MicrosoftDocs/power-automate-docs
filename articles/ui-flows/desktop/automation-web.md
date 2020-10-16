---
title: 웹에서 자동화 | Microsoft Docs
description: 웹에서 자동화
author: rokontol
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: rokontol
ms.reviewer: rokontol
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# 웹에서 자동화

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

흐름디자이너는 **Web automation** 카테고리 아래에 사용자와 웹 브라우저 사이의 상호작용에 관한 각각의 다양한 액션들을 포함하고 있습니다.

현재 다음 4종류의 웹 브라우저를 지원합니다.

* Internet Explorer
* Edge
* Firefox
* Chrome

웹 자동화는 앞서 언급 한 브라우저 중 하나를 시작하거나 연결하여 웹 자동화를 수행할 수 있습니다. 개발은 수동 또는 웹 레코더를 사용하여 수행 할 수 있습니다.

## 웹 자동화 흐름 만들기

웹 자동화 흐름을 시작하려면, 웹 브라우저 실행하기 액션(**Launch new Internet Explorer**, **Launch new Edge**, **Launch new Firefox**, 또는 **Launch new Chrome**)으로 새로운 브라우저 세션을 시작하거나 이미 시작된 세션에 연결해야 합니다:

![웹 브라우저 실행하기](.\media\web-automation\launch-web-browser-action.png)

> [NOTE!]
> 어떤 브라우저들은 파워 오토메이션 데스크톱을 실행하기 전에 구성(Configuration)을 맞출 필요가 있습니다. 자세한 사항은 관련 글을 참조해주시기 바랍니다.

브라워저 세션이 변수에 저장하고 나면, 브라우저 콘텐츠와 상호작용하는 웹 자동화 작업을 추가하실 수 있습니다. 흐름에서 **Web form filling** 작업 그룹은 웹 페이지에 입력을 제공하는 데 촛점을 맞춘 반면 **Web data extraction** 작업 등은 웹 페이지에서 데이터를 추출하는 데 사용하실 수 있습니다.

대부분의 웹 자동화 작업에는 상호작용할 웹 요소(element) 뿐만아니라 입력 작업을 위한 브라우저 인스턴스가 필요합니다:

![웹 입력 작업](.\media\web-automation\web-action-inputs.png)

기존의 웹 요소(element)는 저장소(repository)에서 추가가 가능한 반면 새로 생성할 경우에는 작업 속성에서 직접 추가할 수도 있습니다:

![웹 작업으로 새 요소(element) 추가하기](.\media\web-automation\adding-new-elements-through-a-web-action.png)

새 요소(element)를 추가하려면 강조표시한 후 **컨트롤(Ctrl) + 마우스 왼족 클릭** 을 눌러주세요:

![Capturing new elements](.\media\web-automation\capturing-new-elements.png)

모든 필요한 요소(element)를 추가한 다음에는 **완료(Done)** 버튼을 누른 후 저장소(repository)에 저장해 주시면 됩니다.

## 웹에서 데이터 채워넣기

웹 페이지에 입력을 하려면 해당 브라우저 인스턴스를 특정한 후 상호작용하려는 요소의 속성에 따라 적절한 **Web form filling** 작업을 선택하세요:

![웹 페이지 드롭다운 리스트에서 값 설정 작업](.\media\web-automation\set-drop-down-list-value-on-web-page-action.png)

![웹 페이지 텍스트 필드를 채워넣기 작업](.\media\web-automation\populate-text-field-on-web-page-action.png)

## 웹 데이터 추출

웹 페이지에서 데이터를 추출하려면 문제되는 데이터가 전체 웹 페이지에 관한 것인지 그 안에 있는 요소(element)에 관한 것인지에 따라 적절한 작업을 사용하세요:

![웹 페이지 상세 가져오기 작업](.\media\web-automation\get-details-of-web-page-action.png)

![웹 페이지 요소의 상세 가져오기 작업](.\media\web-automation\get-details-of-element-on-web-page-action.png)

더 많은 데이터를 추출하려면 **Extract data from web page** 작업을 선택 후 웹 페이지에서 필요한 데이터 위에 마우스 오른쪼 클릭을 해 가능한 옵션을 볼 수 있습니다:

![웹 페이지에서 데이터 추출하기(Extract data from web page)](.\media\web-automation\extracting-data-from-web-page.png)

모든 데이터 목록(list)와 테이블은 추출할 그 요소들 가운데 둘이 지정되면 자동으로 식별되는 점을 주의하세요
:

![웹페이지에서 데이터 데이블 추출하기(Extracting data table from web page)](.\media\web-automation\extracting-data-table-from-web-page.png)
