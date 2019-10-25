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

   ![](../media/create-web-ui-flow/888bfc6a030fcb07ee4c25015118d244.png)

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


## Next steps

<!--Todo: fix links-->
- To trigger the UI Flow you just created you can learn how to [run UI
flows](#run-ui-flows).

- If you want to do more with UI flows, you can also try out UI flows with
[input](#define-inputs-for-a-web-ui-flow) and
[output](#define-outputs-for-a-web-ui-flow) parameters.

