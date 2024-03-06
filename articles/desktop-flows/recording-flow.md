---
title: Record desktop flows
description: Record desktop flows
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 09/27/2022
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras 
search.audienceType: 
  - flowmaker
  - enduser
---
# Record desktop flows

Power Automate enables you to design desktop flows automatically by replicating the tasks you wish to automate.

## Record desktop and web flows

To record a flow that automates desktop and/or web applications:

1. Create a new desktop flow, and select **Recorder** in the toolbar of the flow designer.

    ![Screenshot of the recorder button.](./media/recording-flow/recorder-button.png "Screenshot of the recorder button.")

1. Select **Record** in the recorder window, and start performing the desired actions in the appropriate application or web page.

    ![Screenshot of the Record button.](./media/recording-flow/record-button.png "Screenshot of the Record button.")

    The recorder keeps track of mouse and keyboard activity in relation to UI elements, and it records each action separately. During each recording session, the recorder can generate both UI and browser automation actions.

    > [!NOTE]
    > When you perform a left or right click on a UI element during the recording, the highlighter displays a **Wait for action** message, instructing you to wait for the recorder to record and insert the action.

    ![Screenshot of some recorded steps.](./media/recording-flow/recorded-steps.png "Screenshot of some recorded steps.")

    To see the available actions for a specific element, right-click on it to open its context menu. The available options depend on the nature of the selected element.

    ![Screenshot of recording context menu.](./media/recording-flow/recording-context-menu.png "Screenshot of recording context menu.")  

1. When the recording process is completed, select **Done** to convert the recorded steps to desktop flow actions. All the UI elements used in the generated UI and web automation actions are added automatically to the UI elements pane. You can find more information regarding UI elements in [Automate using UI elements](ui-elements.md).

    ![Screenshot of the generated actions of the recorded flow.](./media/recording-flow/recorded-flow.png "Screenshot of the generated actions of the recorded flow.")

To pause the recording process temporarily, select **Pause**. To add a comment to the recorded actions, select **Add a comment**.

![Screenshot of the comment button.](./media/recording-flow/comment-button.png "Screenshot of the comment button.")

### Replicate drag and drop steps

The recorder supports steps related to dragging and dropping the mouse pointer; therefore, the recorder can generate actions like the **Resize window** and **Move window**. Currently, however, the **Drag and drop UI element of a window** action isn't supported.

### Handle drop-down lists

While automating desktop and web applications using the recorder, you may need to handle drop-down lists.

The Power Automate recorder displays a custom screen every time you select a drop-down list, and it helps you choose the desired values. This custom screen allows you to choose one or more values depending on whether the drop-down list is multi-select.

During runtime, Power Automate automatically chooses the defined values and selects the **OK** button.

![Screenshot of a custom screen for a drop-down list.](./media/recording-flow/drop-down-list-custom-screen.png "Screenshot of a custom screen for a drop-down list.")

### Launch a web browser

To launch a web browser instance while recording web flows, you can use three different approaches based on the automation scenario.

The first method is to select the dots icon on the right side of the recorder dialog and then **Launch new web browser**. You can choose between Microsoft Edge, Google Chrome, Mozilla Firefox, and Microsoft Internet Explorer.

After you've selected the proper browser, the recorder will detect the loaded web page automatically and configure the launching browsing step accordingly.

![Screenshot of the Launch new web browser option.](./media/recording-flow/launch-new-web-browser-option.png "Screenshot of the Launch new web browser option.")

An alternative way to launch a browser is to start recording in an already open web browser. The recorder will automatically detect the loaded page and will create a launching browser action.

The last method to launch a browser is to manually launch it through its shortcut on the desktop, the start menu, the taskbar, or a folder. If you implement this approach, the recorder will generate UI automation actions that click the browser shortcut and launch it.

### Handle date and color pickers on web pages

Like drop-down lists, the Power Automate recorder displays custom screens to help you handle date and color pickers on web pages.

When you interact with a date picker, the recorder opens a text field where you can insert the desired date in the specified format.

The custom screen appears for the following HTML input types:

- date
- datetime-local
- month
- time
- week

![Screenshot of the date picker custom screen.](./media/recording-flow/date-picker-custom-screen.png "Screenshot of the date picker custom screen.")

Similarly, when you interact with a color picker, the recorder opens a text field where you can populate the desired color hex code.

![Screenshot of the color picker custom screen.](./media/recording-flow/color-picker-custom-screen.png "Screenshot of the color picker custom screen.")

### Add text using Input Method Editors (IMEs)

Input Method Editors (IMEs) are software components that enable users to input text in languages that can't be represented easily on a standard QWERTY keyboard. Users can type combinations of keys, and IMEs will generate a character or a list of candidate characters that match the set of keystrokes.

Power Automate for desktop supports the use of IMEs during the flow recording procedure. To populate a text field using an IME:

1. Right-click on the text field, and select **Populate text field** on the displayed menu.

    ![Screenshot of the Populate text field menu option.](./media/recording-flow/add-text-with-ime-option.png "Screenshot of the Populate text field menu option.")

1. Populate the popup dialog with the desired text using an IME.

    ![Screenshot of the Add text with IME dialog.](./media/recording-flow/add-text-with-ime-dialog.png "Screenshot of the Add text with IME dialog.")

1. Select **Add text** to generate the respective step in the **Recorder** window.

    ![Screenshot of the generated text from an IME in the desktop recorder.](./media/recording-flow/ime-text-desktop-recorder.png "Screenshot of the generated text from an IME in the desktop recorder.")

## Image-based recording

In some cases, the recorder may not record actions in specific applications that don't meet the appropriate technical requirements. These applications may not expose their accessibility API or have other technical limitations that block the recording process.

As an alternative way to record flows, Power Automate for desktop provides image-based recording. The image-based recording uses image recognition and OCR to locate specific elements on the screen and extract text.

To record flows using images:

1. Create a new desktop flow and select **Recorder** in the toolbar of the flow designer.

    ![Screenshot of the recorder button.](./media/recording-flow/recorder-button.png "Screenshot of the recorder button.")

1. Select the dots icon on the right side of the recorder dialog, and then enable **Image recording**. After enabling this option, select **Record** to start recording actions using image recognition.

    ![Screenshot of the Image recording button.](./media/recording-flow/image-recording-button.png "Screenshot of the Image recording button.")

     Upon clicking on an element, an image is captured automatically and saved with a default editable name. To preview the captured image, hover, or select the **preview icon**.

    ![Screenshot of the preview image button.](./media/recording-flow/preview-image-button.png "Screenshot of the preview image button.")

### Extract text with image-based recording

To extract a text value while using image recording:

1. Perform a **right-click** on the screen, and select **Extract text from image**.

    ![Screenshot of the Extract text from image option.](./media/recording-flow/extract-text-from-image-option.png "Screenshot of the Extract text from image option.")

1. Wait for a popup message that will prompt you to select a text area.

    ![Screenshot of the message that prompts user to select a text area.](./media/recording-flow/text-area-message.png "Screenshot of the message that prompts user to select a text area.")

1. Select the **text area** from which text will be extracted using the Tesseract OCR engine.

    ![Screenshot of a selected text area.](./media/recording-flow/text-area.png "Screenshot of a selected text area.")

1. Wait for a popup message that will prompt you to select an anchor area.

    ![Screenshot of the message that prompts user to select an anchor area.](./media/recording-flow/anchor-area-message.png "Screenshot of the message that prompts user to select an anchor area.")

1. Select an **anchor area** that isn't expected to change, such as the label next to a field.

    ![Screenshot of an anchor text area.](./media/recording-flow/anchor-area.png "Screenshot of an anchor text area.")

## Recording vs building a desktop flow

You can edit manually any actions created through the recorder once the recording is finished. Use the recorder in a desktop flow that's already under development to add the recorded steps to it.

> [!NOTE]
> Use the recorder to create the backbone of your flow. Certain simple tasks may require no further editing; however, most recorded tasks should be modified to achieve optimal results. Certain types of actions, like conditionals and loops, can't be recorded. Also, there may be redundant actions in a recording that should be removed.

## Known issues and limitations

- **Issue**: The recorder may not record all steps from the Windows Start menu or system tray.

  **Workarounds**: None

- **Issue**: While running a flow created through image-based recording, the click may be sent to the wrong place.

  **Workarounds**: Edit the auto-generated action **Move mouse to image** through the flow designer and decrease the tolerance parameter in the advanced settings.

- **Issue**: The **Extract text from image** popup that appears after sending a right-click using the recorder may hide behind the popup of the application.

  **Workarounds**: Send the right-click to another place on the screen.

- **Issue**: Any keystrokes sent to a maximized RDP window through an image-based recording aren't recorded.

  **Workarounds**: Resize the RDP window so that it doesn't cover the full screen.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
