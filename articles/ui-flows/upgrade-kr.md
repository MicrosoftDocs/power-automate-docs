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

### How do I upgrade?

1.  Download the [latest UI flows app](https://go.microsoft.com/fwlink/?linkid=2102613&clcid=0x409) and install it on your device(s).

1.  For each device on which you have installed the UI flows app:

    1. Sign into [Power Automate](https://powerautomate.microsoft.com).
    1. Expand **Data** on the left side of the screen.
    1. Select **Connections**.
    1. Edit the UI flows connection(s) that target your device.
    1. Enter your credentials for the connection, and then save it.

    >[!IMPORTANT]
    >Be sure you use the right credentials as outlined in [Setup UI flows connections and machine credentials](setup.md#setup-ui-flows-connections-and-machine-credentials). Using the correct credentials ensures that your connection updates and uses the code paths for the generally available UI flows.

## Next steps

- Learn how to [set up UI flows](setup.md). 
- Learn more about the [different types of flows](..\getting-started.md#types-of-flows) you can use to automate your workflows.


