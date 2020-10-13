---
title:  Update UI flows app and connections from previous releases | Microsoft Docs
description:  Update UI flows app and connections from previous releases.
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
ms.date: 03/03/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# UI 흐름 앱 및 연결(Connections) 기존 배포에서 업그레이드 하기

지난 2월(2020년) 배포에서 기본 컴포넌트 몇 개를 수정하고 무인 지원(unattended support) 관련 새로운 기능을 추가하였습니다. 로컬 UI 흐름 앱과 게이트웨이 연결을 업데이트 하여 무인 지원(unattended support)를 포함한 이러한 새로운 기능들을 사용하실 수 있습니다

### 기존 UI 흐름에 어떤 의미를 가지나?

UI 흐름 앱 또는 게이트웨이 연결 가운데 하나를 업데이트 할 때까지는 어떤 것도 요구되지 않습니다. 한 번에 둘 다를 업데이트 해야 합니다.

### 어떻게 업그레이드 하나?

1.  [최신 UI 흐름 앱](https://go.microsoft.com/fwlink/?linkid=2102613&clcid=0x409)을 내려받은 후 사용하려는 장치(들)에 설치하세요.

1.  UI 흐름 앱을 설치한 각 장치별로:

    1. [Power Automate](https://powerautomate.microsoft.com)에 로그인 하세요.
    1. 화면 왼편 메뉴에서 **데이터(Data)** 를 확장해주세요.
    1. **Connections** 을 선택하세요.
    1. 장치에 맞춰 UI 흐름 연결을 편집하세요.
    1. 연결을 위해 보안(ID, 패스워등 등) 설정을 마친후 저장하세요 .

    >[!IMPORTANT]
    >[UI 흐름 커넥션과 기기 보안 설정하기](setup-kr.md#ui-흐름-커넥션과-기기-보안-설정하기)에서 제시한대로 올바르게 암호 설정을 했는 지 확인하세요. 보안 설정을 올바로 해야 연결(connections) 업데이트가 보장되고 UI 흐름에서 코드 경로도 일반적으로 활용할 수 있습니다.

## Next steps

- [UI 흐름 설정](setup-kr.md) 학습하기.
- 업무 흐름을 자동화 할 수 있는 [다양한 형태의 흐름들](..\getting-started.md#types-of-flows)에 관해 더 학습하기.


