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

To record a desktop flow:

1. Create a new desktop flow and select **Desktop recorder** in the toolbar of the flow designer.

    ![The desktop recorder button](./media/recording-flow/desktop-recorder-button.png)

1. Select **Record** in the desktop recorder window and start performing the desired actions.

    ![The start recording button](./media/recording-flow/start-recording-button.png)

    The desktop recorder keeps track of mouse and keyboard activity in relation to UI elements, and records each action separately.

    ![Recording a desktop flow](./media/recording-flow/recording-flow.png)

1. When the recording process is completed, select **Finish** to convert the recorded steps to Power Automate Desktop actions.

    ![The actions of the recorded flow](./media/recording-flow/recorded-flow.png)

To pause the recording process temporarily, select **Pause**.
 
![The pause recording button](./media/recording-flow/pause-recording-button.png)
 
 If you want to add a comment to the recorded actions, select **+ Comment**.

![The comment button](./media/recording-flow/comment-button.png)

## Image-based recording

In some cases, the desktop recorder may not record actions in specific applications that don't meet the appropriate technical requirements. These applications may not expose their accessibility API or have other technical limitations that block the recording process.

As an alternative way to record flows, Power Automate Desktop provides image-based recording. The image-based recording uses image matching and OCR to locate specific elements on the screen and extract text.

To record desktop flows using images:

1. Create a new desktop flow and select **Desktop recorder** in the toolbar of the flow designer.

    ![The desktop recorder button](./media/recording-flow/desktop-recorder-button.png)

1. Select **Image recording** and then **Record** to start recording actions using image matching.

    ![The Image recording button](./media/recording-flow/image-recording-button.png)

     Upon clicking on an element, an image is captured automatically and saved with a default editable name. To preview the captured image, hover or select the **preview icon**. 

    ![The preview image button](./media/recording-flow/preview-image-button.png)

### Extract text with image-based recording

To extract a text value while using image recording:

1. Perform a **right-click** on the text and select **Extract text from image**.

    ![The Extract text from image option](./media/recording-flow/extract-text-from-image-option.png)

1. Wait for a popup message that will prompt you to select a text area.

    ![The message that prompts user to select a text area](./media/recording-flow/text-area-message.png)

1. Select the **text area** from which text will be extracted using the Tesseract OCR engine.

    ![A selected text area](./media/recording-flow/text-area.png)

1. Wait for a popup message that will prompt you to select an anchor area.

    ![The message that prompts user to select a anchor area](./media/recording-flow/anchor-area-message.png)

1. Select an **anchor area** that isn't expected to change, such as the label next to a field.

    ![A anchor text area](./media/recording-flow/anchor-area.png)

### Known issues and limitations

- **Issue**: When adding elements or capturing images, the console and the flow designer might get in the way of the user, as they are not hidden as they should during these procedures.

- **Workarounds**: None.

- **Issue**: The Desktop recorder may not record all steps from the Start Menu or system tray.

- **Workarounds**: None.

 ## Web recorder

 To record a flow that automates web applications:

1. Create a new desktop flow and select **Web recorder** in the toolbar of the flow designer.

    ![The web recorder button](./media/recording-flow/web-recorder-button.png)

1. Select a web browser on which you'll record your activity. Optionally, you can attach to an already open browser instance.

    ![Select browser for recording](./media/recording-flow/select-browser-for-recording.png)

The web recorder keeps track of your activity within the web browser, generating a series of web actions.

![Recording a web flow](./media/recording-flow/recording-web-flow.png)

Like the desktop recorder, you can add comments through the **+ Comment** button, while you can pause, resume, and reset the recording using the buttons on the top section of the web recorder.

### Known issues and limitations

- **Issue**: When adding elements or capturing images, the console and the designer are visible, and they might obstruct the user.


- **Workarounds**: None.

 ## Recording vs building a desktop flow

You can edit manually any actions created through the recorder once the recording is finished. Use the recorder in a desktop flow that is already under development to add the recorded steps to it.

> [!NOTE]
> Use the recorder to create the backbone of your flow. Certain simple tasks may require no further editing, however most recorded tasks should be modified to achieve optimal results. Certain types of actions, like conditionals or loops, cannot be recorded. Also, there may be redundant actions in a recording that should be removed.

[!INCLUDE[footer-include](../includes/footer-banner.md)]