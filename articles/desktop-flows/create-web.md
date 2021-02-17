---
title: Learn to create Selenium IDE flows for Websites | Microsoft Docs
description: Learn to automate Web apps with Selenium IDE flows.
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
ms.date: 12/09/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create and test Selenium IDE flows

Follow these steps to create a simple Selenium flow.

## Create a Selenium IDE flow

1. Open the [Microsoft
   Edge (version 80 or later)](https://www.microsoft.com/edge) or Google Chrome, and then navigate to [Power Automate](https://flow.microsoft.com/).

1. Sign in with your work or school account if needed.

1. Select **My flows** > **Desktop flows** > **New**.

   ![Create new Selenium IDE flow](../media/create-windows-desktop-flow/create-new-windowsrecorder.png "Create new Selenium IDE flow")

1. Click **Additional desktop flow options**.
    
   ![Additional desktop flow options](../media/create-windows-desktop-flow/click-Additional-desktop-flow-options.png "Additional desktop flow options")

1. Select Selenium IDE, and then select **Next**.
    
   ![Select Web app](../media/create-web-desktop-flow/select-seleniumIDE-flow.png "Select Web app")

1. Enter a name for your Selenium IDE flow into the **Flow name** field.

1. Enter the URL for the Website you want to automate into the **Base URL** field, and then select **Launch recorder**.

   ![Give a name and a URL](../media/create-web-desktop-flow/give-a-selenium-flow-name.png "Give a name and a URL") 

   The Selenium IDE launches.

   >[!TIP] 
   >Tip: You can record actions across multiple HTTP or HTTPS websites within
    the same tab.  

1. In Selenium IDE, select the red **REC** button in the top right side of the screen to launch the recorder.

   The URL you chose in the previous step opens.

   ![Select Rec](../media/create-web-desktop-flow/select-rec.png "Select Rec")

1.  Perform the actions that you want to record on the website. 
    
    >[!TIP]
    >At the bottom right, you can see the recording status.

    ![Recording status](../media/create-web-desktop-flow/recording-status.png "Recording status")

1.  When you are finished recording, select on the red **Stop** button in the top right corner of the Selenium IDE.

    ![Stop button](../media/create-web-desktop-flow/stop-button.png "Stop button" )

1. Select the **Run current test** button from the top left side of the screen to see the Selenium IDE flow you just created run.

    ![Run current test](../media/create-web-desktop-flow/run-test.png "Run current test")

   >[!TIP]
   >You can set the wait time between steps to slow the local playback for testing. This setting is for testing purposes only and has no impact when your Selenium IDE flow is deployed.  
  
1. Select the **Save project** button in the top right of the Selenium IDE. This closes, and then uploads the project.

Now that you've created a Selenium IDE flow, use it in your other flows.

## Limitations and known issues for Selenium IDE flows

>[!WARNING]
>**Passwords in Selenium IDE are stored in plain text.**  

**Temporary user profile for playback**

Selenium IDE recordings are done with the current user's profile, but playback is done using a temporary user profile. This means that websites that need authentication may not ask for credentials during a recording session, but the authentication steps will be needed during playback. 

To address this, the user needs to manually edit the script to insert the commands needed for the login process.

**Other limitations**

-   Recording desktop applications during a Web recording session. If you need to automate both Web and Desktop applications, you can create a separate desktop flows for each type and then combine them in a cloud flow.

- Multi-Factor Authentication (MFA) is not supported, use a tenant that doesn't require MFA.

- These Selenium IDE commands are not supported: Run, AnswerOnNextPrompt, ChooseCancelOnNextConfirmation, ChooseCancelOnNextPrompt, ChooseOkOnNextConfirmation, Debugger, ClickAt, DoubleClickAt, Echo, MouseOut, MouseUpAt, and MouseDownAt.

- Selenium IDE actions or steps cannot exceed one minute to run.  Use [Power Automate Desktop](introduction.md) instead.

- Right click is not supported. 

-   Additional Selenium IDE flow input is generated when you use Foreach commands. To work around this issue, input any value into the extra fields. It doesn't impact the playback.

- If the .side file contains multiple test projects, only the first one that was created runs. 
   
   >[!TIP]
   >Note that the Selenium IDE orders the tests by name, not by creation date, so the first test created may not be the first one in the list.

-   Playback directly in the Selenium IDE might not behave as intended. However, playback at runtime behaves correctly.

## Next steps

- Learn how to [run desktop flows](run-desktop-flow.md).

- Learn how to use [input and output](inputs-outputs-web.md) parameters with Selenium IDE.

 


[!INCLUDE[footer-include](../includes/footer-banner.md)]