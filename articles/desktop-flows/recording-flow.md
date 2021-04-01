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

Power Automate Desktop enables you to design flows automatically by replicating the task you wish to automate. 

## Desktop recorder

To automate a desktop application:

1. Launch Power Automate Desktop and select **Desktop recorder** in the toolbar of the flow designer.

    ![The desktop recorder button](./media/recording-flow/desktop-recorder-button.png)

1. Select **Record** in the desktop recorder window and start performing the desired actions.

    ![The start recording button](./media/recording-flow/start-recording-button.png)

The desktop recorder keeps track of mouse and keyboard activity in relation to UI elements, and records each action separately.

![Recording a desktop flow](./media/recording-flow/recording-flow.png)

To suspend the recording process, select **Pause**.
 
![The pause recording button](./media/recording-flow/pause-recording-button.png)
 
 If you want to add a comment to the recorded actions, select the **plus button** (**+**).

![The comment button](./media/recording-flow/comment-button.png)

### Image-based recording

The desktop recorder may be unable to record actions in specific applications that don't expose their accessibility API.

To automate tasks in these applications, Power Automate Desktop provides image-based recording. The image-based recording uses the Τesseract OCR engine to locate and handle specific elements on the screen. 

To automate a desktop application using image-based recording:

1. Launch Power Automate Desktop and select **Desktop recorder** in the toolbar of the flow designer.

    ![The desktop recorder button](./media/recording-flow/desktop-recorder-button.png)

1. Select **Image recording** and then select **Record** to start recording the desired action using OCR.

    ![The Image recording button](./media/recording-flow/image-recording-button.png)


1. Upon clicking on an element, an image is captured automatically and saved with a default editable name. To preview the captured image, hover the **preview icon**. 

    ![The preview image button](./media/recording-flow/preview-image-button.png)

1. To extract a text value:

    1. Perform a **right-click** on the text and select **Extract text from image**.

        ![The Extract text from image option](./media/recording-flow/extract-text-from-image-option.png)

    1. Select the **text area** from which text will be extracted using OCR.

        ![A selected text area](./media/recording-flow/text-area.png)

    1. Select an **anchor area** that isn't expected to change, such as the label next to a field.

        ![A anchor text area](./media/recording-flow/anchor-area.png)

### Known issues and limitations

- **Issue**: When adding elements or capturing images, the console and the flow designer might get in the way of the user, as they are not hidden as they should during these procedures.

- **Workarounds**: None.

- **Issue**: The Desktop recorder may not record all steps from the Start Menu or system tray.

- **Workarounds**: None.

 ## Web recorder

 To automate a web application:

1. Launch Power Automate Desktop and select **Web recorder** in the toolbar of the flow designer.

    ![The web recorder button](./media/recording-flow/web-recorder-button.png)

1. Select a web browser on which you'll record your activity. Optionally, you can attach to an already open browser instance.

    ![Select browser for recording](./media/recording-flow/select-browser-for-recording.png)

The web recorder keeps track of your activity within the web browser, generating a series of web actions.

![Recording a web flow](./media/recording-flow/recording-web-flow.png)

Like the desktop recorder, you can add comments through the **plus button** (**+**), while you can pause, resume, and reset the recording using the buttons at the top right-hand side.

### Known issues and limitations

- **Issue**: When adding elements or capturing images, the console and the designer are visible, and they might obstruct the user.


- **Workarounds**: None.

 ## Recording vs building a desktop flow

You can edit manually any actions created through the recorder once the recording is finished. Use the recorder in a desktop flow that is already under development to add the recorded steps to it.

> [!NOTE]
> Use the recorder to create the backbone of your flow. Certain simple tasks may require no further editing, however most recorded tasks should be modified to achieve optimal results. Certain types of actions, like conditionals or loops, cannot be recorded. Also, there may be redundant actions in a recording that should be removed.

[!INCLUDE[footer-include](../includes/footer-banner.md)]