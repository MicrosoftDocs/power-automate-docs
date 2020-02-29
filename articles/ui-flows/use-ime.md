---
title: Use Input Method Editors (IMEs) in UI flows | Microsoft Docs
description: Lean to use Input Method Editors (IMEs) in UI flows.
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
ms.date: 02/25/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Use Input Method Editors (IMEs) in UI flows

You can use the **Add static text** feature to record text input, in any language, using IMEs or regular keyboards in your UI flows. Use **Add static text** if you want the automation to insert the same text each time your UI flow runs. 

>[!TIP] Use **Text input** if you intend to use dynamic text that changes each time your UI flow runs.

## Invoke IME

Follow these steps after you've started recording and you're ready to insert static text input:

1. Select the control into which you want to enter the static text.

   ![](../media/use-ime/1273826d281619515d6d6cdc3fa6cb48.png)

1. Select **Use Input** on the recorder, and then select **Add static text**.

   ![](../media/use-ime/329ba492cec0eff9db6bb56d492788aa.png)

   You'll see an input box into which you'll enter the static text. You can use IME, English, or any international keyboard.

   ![]../media/use-ime/9e9a94ee7d810370c8d81a7357571ceb.png)

1. Enter the text.

1. Select **Add to app** and then select the control into which you want to insert the text. You'll see the text 
inserted into the control. 

   This text is entered automatically at playback time, even if the playback machines do not have the same keyboard layouts or IME that was used in the recording.

   ![](../media/use-ime/9c84385f9b0bb414855df8fc23fd504a.png)

   >[!TIP]
   >In the Web designer, expand the **Insert text input** action to review or edit the text.

   ![](../media/use-ime/5713ff05a81db4d3030fb170ed925ff4.png)


## Use the replay keystroke action

If you recorded any text input without using the **Add static text** option, each keystroke is recorded and played back chronologically. This includes any special keys like CTRL, ALT, Windows, etc. in any English or international keyboard layouts.

In the designer, you can review and edit the recording information in the
[virtual-key](https://docs.microsoft.com/windows/win32/inputdev/virtual-key-codes) format under the **Replay keystroke** action. 

![](../media/use-ime/d3f8919757d3515a84e2c49b1c5159cf.png)


>[!NOTE]
>An older version of the UI flows recorder used the **SendKeys** and **PostElement** actions. These actions will be deprecated. We recommend that you upgrade to the latest version of the UI flows recorder and then re-record your scripts to take advantage of the new features.

## Troubleshooting tips

1. If you record keyboard actions with the **Replay keystroke** mode, you have to make sure the playback machine is using the same keyboard as the recording time, because under different keyboards, the same keystrokes replay sequences may input different values.

1. You can only apply **Use input** to controls that are text type. Currently **Use input** cannot enter text into other types of controls such as combo Box, dropdown, ListView, etc.

## Next steps

- Learn how to [set up UI flows](setup.md). 
- Learn more about the [different types of flows](..\getting-started.md#types-of-flows) you can use to automate your workflows.


