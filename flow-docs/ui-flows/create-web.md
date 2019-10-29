---
title: Learn to create UI flows for Websites | Microsoft Docs
description: Learn to automate Web apps with UI flows.
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
ms.date: 10/23/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create your first Web UI flow

[This topic is pre-release documentation and is subject to change.]

Follow these steps to create a simple Web UI flow: 

1.  Open the [next version of Microsoft
    Edge](https://www.microsoftedgeinsider.com/) or Google Chrome then navigate
    to [Microsoft Flow](https://flow.microsoft.com/).

1.  Sign in with your work or school account if needed.

1.  Navigate to **My flows** then **UI flows (preview)** and click **+ New**  
    

    ![](../media/create-web-ui-flow/c02652b754123b651f14cd09b1b36c29.png)

1.  Select **Web app**  > **Next**
    
    ![](../media/create-web-ui-flow/5bb2857f2b7400c26e0bd77a274e8a2d.png)

1. Enter a name for your UI flow into the **Flow name** field.
1. Enter the URL for the Website you want to automate into the **Base URL** field, and then select **Launch recorder**.

   The Selenium IDE launches.

   >[!TIP] 
   >Tip: You can record actions across multiple http or https websites within
    the same tab.  

   ![](../media/create-web-ui-flow/6746864a114406a90affc5c375f2b157.png)

1. In Selenium IDE, select the red **REC** button in the top right side of the screen to launch the recorder.

   The the URL you chose in the previous step opens.

   ![](../media/create-web-ui-flow/540a0010c4efbb3a72ec344b93dfbeb6.png)

1.  Perform the actions on the website so that they can be recordedL. 
    
    >[!TIP]
    >At the bottom right, you can see the recording status.

    ![](../media/create-web-ui-flow/93d672877fb317fe32ddfc820a3cba31.png)

1.  When you are finished recording, click on the red **Stop** button in the top right corner of the Selenium IDE.

    ![](../media/create-web-ui-flow/708937b622f4556989140e5d188571e6.png)

1. Select the **Run current test** button from the top left side of the screen to see the UI flow you just created run.

   >[!TIP]
   >You can set the wait time between steps to slow the local playback for testing. This setting is for testing purposes and has no impact when your UI flow is deployed.  
  
    ![](../media/create-web-ui-flow/a1843f8d0d39f35ca8999eeb92e4d800.png)

1. Select the **Save project** button in the top right of the Selenium IDE. This closes and uploads the project.


## Limitations and known issues for Web UI flows

**Passwords in Selenium IDE are stored in plain text**  


**UI flows no longer records or plays back Windows applications after installing a new version.**

You need to uninstall the previous version before installing a new one.

For that, open the Start menu, go to “Settings”, then “Apps & features”, search for “RPA” in the list of apps, select "Microsoft Flow RPA" and click "Uninstall". The uninstaller wizard will guide you through the uninstallation.

**Temporary user profile for playback**

Selenium IDE recording are with current User Profile but playback is done using a temporary User profile. This means that websites that need authentication may not ask for credentials during a recording session, but the authentication steps will be needed during playback. User needs to manual edit the script to insert the commands that drive the login process.

**Other limitations**

-   Recording Desktop applications during a Web recording session . If you need to automate both Web and Desktop applications, you can create two separate UI flows for each type and combine them in a Flow.

-   Multi-Factor Authentication (MFA) is not supported, please use a tenant that does not require Multi-FactorAuthentication (MFA).

-   The following Selenium IDE commands are unsupported: Run, AnswerOnNextPrompt, ChooseCancelOnNextConfirmation, ChooseCancelOnNextPrompt, ChooseOkOnNextConfirmation, Debugger, ClickAt, DoubleClickAt, Echo, MouseOut, MouseUpAt, MouseDownAt

-   No right click support

-   Some extra web UI Flow input will be generated if you use Foreach commands.
    It’s a bug in schema generation. You can simply input any value into the
    extra field. It doesn't impact the playback.

-   If the .side file contains multiple test projects then only first created is executed. Note that Selenium IDE orders the tests by name, not by creation date, so the first created may not be the first one in the list.

-   Playback on Selenium IDE directly might not behave as intended due to bugs in the open source component. However, playback at runtime through UI flow infrastructure will behave correctly.

## Next steps

<!--Todo: fix links-->
- To trigger the UI Flow you just created you can learn how to [run UI
flows](run-ui-flow.md).

- If you want to do more with UI flows, you can also try out UI flows with [input and output](inputs-outputs-web.md) parameters.

