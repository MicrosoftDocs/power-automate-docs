---
제목: 데스크톱 UI flows 생성 학습 | Microsoft Docs
내용: 윈도우용 애플리케이션을 위한 데스크톱 UI flows 생성하는 법을 배웁니다.
서비스: ''
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
ms.date: 03/28/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# 데스크톱 UI flows 생성 및 테스트하기

아래 단계를 통해 계산기 앱으로 두 숫자를 합하고 나중에 사용하기 위해 결과를 저장하는 방법을 시연하겠습니다.

## 데스크톱 UI flow 생성하기

> [!TIP]
> 아래와 같이 유사한 패턴을 따라하면서 다른 윈도우 데스크톱 앱들을 자동화 하실 수 있습니다.

1. UI flows를 생성하기 위해 [사전준비](setup.md#prerequisites)가 잘 되었는 지 확인 해주세요.

1. [Microsoft Edge (80 또는 나중 버전)](https://www.microsoftedgeinsider.com) 또는 Google Chrome을 사용해 [Power Automate](https://flow.microsoft.com) 페이지를 열고 사용하시는 장치로 직장 또는 학교 계정으로 로그인(또는 Sign In) 해주세요.

1. **내 흐름(My flows)** > **UI 흐름(UI flows)** > **새로 만들기(New)**.

   ![새 UI 흐름(New UI flow)](../media/create-windows-ui-flow/create-new.png "Create new UI flow")

1. **데스크톱 앱(Desktop app)** 을 선택하고 **다음(Next)** 선택.

   ![Select desktop](../media/create-windows-ui-flow/select-desktop.png "Select desktop") 

1. **흐름 명(Flow name)** 필드에 만드려는 UI 흐름 이름을 입력 후 **다음(Next)** 선택.

   ![Select desktop](../media/create-windows-ui-flow/give-a-name.png "Select desktop") 

1. Select **Next** at the bottom to skip the optional **Set up inputs** screen since we aren't using inputs in this walkthrough.

1.	Select **Download package**.
1.	Open the **Setup.Microsoft.PowerAutomate.UIflow.exe** file. This file is likely in your **Downloads** folder after you downloaded it in the previous step.
1.	Follow the instructions in the UI flows setup installer to complete the installation.

    Once the UI flows installer completes, you'll receive a prompt from your browser to activate the extension.

1. On Microsoft Edge (Version 80 or later), select each warning icon in the top right of the browser, and then select **Enable extension**.
1. On Google Chrome, select **Enable extension** when prompted.

   > [!TIP]
   > If you did not see the prompt in your browser, check the following:
   > - You must use the Microsoft Edge (Version 80 or later) or Google Chrome browser.
   > - You may have to update the extension for [Microsoft Edge (Version 80 or later)](https://www.microsoft.com/store/collections/edgeextensions/pc) or [Google Chrome](https://chrome.google.com/webstore/category/extensions).

   Continue after you've installed the extension.

1. Select the **Record app** card to expand it.

   ![Select record app](../media/create-windows-ui-flow/select-record-app.png "Select record app")

1. Select **Launch recorder**.

   ![Select launch recorder](../media/create-windows-ui-flow/select-launch-recorder.png "Select launch recorder")

   The recorder control displays at the top of your screen.

   ![The recorder control](../media/create-windows-ui-flow/recorder-control.png "The recorder control")

1. Start the calculator app.

     >[!TIP]
     >As your mouse hovers over controls in the app, you'll notice that a blue outline highlights each control. Always wait for the blue highlight before you select a control.
     >
     >If the blue highlight doesn't display around the element, it might not be recorded properly.

1. Select **Record** from the recorder control.
1. Select the first number, select **+**, select the second number, and then select **=**.

    ![The calculator app](../media/create-windows-ui-flow/app-to-record.png "The calculator app")

     > [!TIP]
     > You will improve automation reliability by:
     > - Opening and maximizing the apps you want to record before *before* you start recording
     > - Starting your recording with a click the app title bar to bring it in focus.

1. Select **Done** on the recorder control after you complete the actions you want to record.

1. Close the app that you recorded.

1. Select the card that starts with "Run <app name> script" to view screenshots of the recorded steps.

     >[!TIP]
     >Select **...** > **Delete** to remove any duplicate steps.

    ![Show recorded steps](../media/create-windows-ui-flow/show-recorded-steps.png "Show recorded steps")

1. Select **Next**. 

1. Select **Next** to skip the optional **Set up outputs** step since we aren't using outputs in this walkthrough.

1. Test your UI flow by selecting the **Test now** button, and then watch your UI flow run.
    
 >[!IMPORTANT]
 >For best results, do not interact with your device for the duration of playback.

1. Select **Save and exit** to save your UI flow.

## Known issues and solutions

- Screenshots are currently lost after saving. We are working on a fix.

- You may want to add a [**Close** action](edit-desktop.md#add-a-manual-action) at the end of your UI flow because UI flows launches a new instance of the applications with each test or run.

- Select **...** > **Delete** on the recorded actions card to remove any unnecessary/duplicate actions.

- Right clicks may not play back correctly. In such case, while recording, click left to focus UI flows on the target user interface element, and then right click.

- If UI flows no longer records or plays back Windows applications after installing a new version, confirm you have the [latest version](https://go.microsoft.com/fwlink/?linkid=2102613&clcid=0x409).


### Unsupported application types

- Interactions on Windows (File explorer, startup menu, task bar, etc.).

- Web browsers (Chrome, IE, Microsoft Edge, Firefox, Mozilla, etc.).
    Please instead refer to [Create a Web UI flow](create-web.md) to
    automate websites.

- Java applications.

- Click once applications.

- Applications with a Web view such as Electron applications.

- Microsoft Office 2016 and earlier. 

- Microsoft Office online.

### Unsupported configurations

- Multi-screen.

- Recording through a virtual machine client (Remote Desktop, Citrix, etc.).

- Multiple instances of an application where the main window titles are identical.

- Application windows with identical titles, for example, Microsoft Outlook with multiple **Untitled – Message (HTML)** new mail windows active at the same time.

- Concurrent recording sessions on a given device.

- Concurrent playback sessions on a given device. In case of simultaneous UI flow runs, the first one takes precedence and the subsequent ones fail until the first one completes.

- Playback on a device with a different keyboard layout than the device on which it was recorded.

- Recording on a device or Windows session while the browser with Power Automate is on a different device or Windows session.

### Unsupported action types and behaviors

The following actions will not be recorded:

- Double click.

- Mouse move.

- Mouse hover.

- Click and drag.

- Touch or pen input.

- Open app before recording.


## Unreliable behaviors and workarounds for Microsoft Office (desktop)

- Pin the ribbon before you begin playback to avoid issues that may occur if the ribbon is set to auto-hide during playback.
- Do not select items by clicking and dragging. For example, don't use shift-click to select cells in Microsoft Excel and don't select text in Microsoft Word or Microsoft PowerPoint by dragging the mouse.
- Some elements may not work correctly in UI flows for Microsoft Word and Microsoft PowerPoint Desktop applications. For instance, options on the **File** menu such as starting from blank, or right clicking controls like adding a paragraph in Microsoft Word or changing the layout of slides in Microsoft PowerPoint may not work.

## Next steps

- Learn how to [trigger the UI flow](run-ui-flow.md) you just created.

- If you want to do more with UI flows, you can also create UI flows with [input and output](inputs-outputs-web.md) parameters.
