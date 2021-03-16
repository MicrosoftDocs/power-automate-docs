---
title: Recording in a desktop flow | Microsoft Docs
description: Recording in a desktop flow
author: mariosleon
ms.service: power-automate
ms.topic: article
ms.date: 09/22/2020
ms.author: marleon
ms.reviewer: 
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Record flows in Power Automate Desktop



It's possible to design flows simply by performing the task you wish to automate, using the desktop recorder.

## Desktop recorder
In the flow designer, select **Desktop recorder** in the toolbar to record desktop actions:

![The desktop recorder button](./media/recording-flow/desktop-recorder-button.png)

Select **Start recording** in the desktop recorder window to record actions.

![The start recording button](./media/recording-flow/start-recording-button.png)

The desktop recorder keeps track of mouse and keyboard activity in relation to UI elements, and records each action separately:

![Recording a desktop flow](./media/recording-flow/recording-flow.png)

 Select **Pause recording** to suspend the recording of actions:
 
![The pause recording button](./media/recording-flow/pause-recording-button.png)
 
 Select **+** to add a comment to the recorded actions:

![The comment button](./media/recording-flow/comment-button.png)

### Known issues and limitations

- **Issue**: When adding elements or capturing images, the console and the flow designer might get in the way of the user, as they are not hidden as they should during these procedures.

- **Workarounds**: None.

- **Issue**: The Desktop recorder may not record all steps from the Start Menu or system tray.

- **Workarounds**: None.

 ## Web recorder

In the flow designer, select **Web recorder** in the toolbar to record web-related actions:

![The web recorder button](./media/recording-flow/web-recorder-button.png)

Select a web browser to record your activity on; optionally, select an already open browser instance to attach to:

![Select browser for recording](./media/recording-flow/select-browser-for-recording.png)

The recorder keeps track of your activity within the web browser, generating a series of web actions:

![Recording a web flow](./media/recording-flow/recording-web-flow.png)

Similarly to the desktop recorder, comments may be added through the **+** button, while the recroding can be paused, resumed, and reset using the buttons at the top right-hand side.

### Known issues and limitations

- **Issue**: When adding elements or capturing images, the console and the designer are visible and they might obstruct the user.


- **Workarounds**: None.

 ## Recording vs building a desktop flow

Any actions created through the use of a recorder can be edited manually once the recording is finished. Use the recorder in a desktop flow that is already under development to add the recorded steps to it.

> [!NOTE]
> Use the recorder to create the backbone of your flow. Certain simple tasks may require no further editing, however most recorded tasks should be modified to achieve optimal results. Certain types of actions, like conditionals or loops, cannot be recorded. Also, there may be redundant actions in a recording that should be removed.

[!INCLUDE[footer-include](../includes/footer-banner.md)]