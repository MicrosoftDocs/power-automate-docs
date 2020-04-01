---
title: Use inputs and outputs in desktop UI flows | Microsoft Docs
description: Use inputs and outputs in desktop UI flows.
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
ms.date: 03/24/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Use inputs and outputs in desktop UI flows


Inputs let you pass information from an external source such as a database or any supported connector to the legacy software that UI flows automates.

For example, you can use customer information from a SharePoint list as a source for input into your legacy accounting software.

## Define inputs in the UI flows wizard

1. Select **New input**

   ![](../media/inputs-outputs-desktop/select-new.png)

1. Add a name, a sample data and a description to your input.

    - Sample data is used during the recording or test.

    - The description will be helpful to differentiate the inputs that you have created.

   ![](../media/inputs-outputs-desktop/input-fields.png)

1.  Once your inputs are created, you can click on next to use them in a recording.

>[!TIP]
>You can use the **CRTL+ALT+L** key combination to insert text that you can pass to or from the application being used in the UI flow. This key combination works for sensitive, static, output, and input text. 

## Use inputs to pass information to the application

1. While recording, you can use an input in an app by selecting **Use input**.

1. In the list, you can choose between three options:

    - Select one of the inputs that you defined in the **Set up input fields** step.

    - Use a previously defined output (see Outputs section). This is useful to pass information between different applications within the same UI flow.

    - Create a new input as you are recording. You will find it back in the **Set up input fields** step.

   ![](../media/inputs-outputs-desktop/select-input-type.png)

1. Select the location where you want to use the input. The sample value you defined is automatically used. In the below example “Hello world” is the sample value for the input name “My input” and is added to the page within Microsoft Word.  
    
    ![](../media/inputs-outputs-desktop/select-location-for-input.png)

1. In Power Automate **Record and edit steps**, expand actions that use inputs to view which one is selected.

   ![](../media/inputs-outputs-desktop/expand-actions.png)

1. When triggering your UI flow, you can change the input value at will. See Use inputs & outputs for more information. <!-- todo link and ampersand-->

## Use outputs to extract information from the app

Outputs let you pass information from the legacy software that UI flows automates to an external destination such as a database or any [supported
connector](https://flow.microsoft.com/connectors/).

For example, you can extract customer information your legacy accounting software and add it to a SharePoint list.

Outputs can only be created as you record your UI flow.

1. During a recording, select **Get output**.

   ![](../media/inputs-outputs-desktop/get-output.png)

1. Select **Select text**.

   ![](../media/inputs-outputs-desktop/select-text.png)

1. Select a user interface element to get its text for the output. The text value will be automatically captured.

   ![](../media/inputs-outputs-desktop/get-element-output.png)

   ![](../media/inputs-outputs-desktop/af55a0bf39d805b154a783eff3de131b.png)

1. Provide a name and a description for the output.

   ![](../media/inputs-outputs-desktop/name-description.png)

1. Select **Save.** 

Your output is now available in the dedicated area of the wizard.

   ![](../media/inputs-outputs-desktop/output-available.png)

Each output has:

-  An output name as defined during the recording.
-  A description: This field can be very useful when you define many outputs during a recording and want to easily identify them later.
-  An action name: the action in which the output is defined in your UI flow.

## Delete an output from a UI flow

If you do not need an output anymore, delete it by going to the associated action and removing the Output name in the dynamic value.

## Test your UI flow

Testing UI flows lets you validate your changes and the appropriate playback behavior.

1. (Optional) Enter new value in the input field. 
    
    ![](../media/inputs-outputs-desktop/new-test-value.png)

1. Click **Test now** to see the legacy software being automated. You will see UI flow automation playing back the steps you recorded. **Please do not interact with your device for the duration of playback.**

1. Once playback completes, you see the run status of your UI flow:

    - For each action, a status indicating that the test worked well and the associated inputs.

    - The value of the outputs obtained for this test.

    - If an error occurs, you'll see which step caused the problem with a screenshot of the moment the error occurred.

   ![](../media/inputs-outputs-desktop/successful-run.png)

## Learn more

- Learn how to [trigger UI flows](run-ui-flow.md).



