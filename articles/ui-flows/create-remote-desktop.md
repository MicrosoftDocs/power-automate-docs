---
title: Create and test Remote Desktop UI flows| Microsoft Docs
description: Create and test Remote Desktop UI flows
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/29/2020
ms.author: Deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create and test Remote Desktop UI flows

TODO: Addt this content to the edit a desktop ui flow and link to it from within this doc.





Note: Proposed location for “Add a recording of a remote computer using image recognition” is part of the Edit Desktop UI flows page:

<https://docs.microsoft.com/power-automate/ui-flows/edit-desktop>

## Add a recording of a remote computer using image recognition

*{{Placeholder for disclaimer – this functionality is in preview and subject to
change.}}*

 

What is image recognition?
--------------------------

Currently, desktop UI flows are primarily recorded using accessibility APIs (UI
Automation and WinAppDriver) to detect the controls in the Windows UI tree.​ The
UI tree is not always available, such as with web-based or Java apps, and may be
unreliable, such as when the IDs of a control change frequently or between
sessions. With image recognition, click locations and other details are visually
matched during playback, greatly expanding the range of applications that can be
automated. Image recognition in UI flows is a preview feature and currently
available when recording a remote computer through the Remote Desktop Connection
(RDC) app.

### To record a remote computer using image recognition: 

 
1. In a new or existing UI flow, go to the Inputs tab and create two new **sensitive text** inputs for the username and password that will be used to log in to the remote device. Sensitive text inputs allow you to pass in the values dynamically when testing or calling the UI flow from another flow, without them being stored in or logged by the UI flow itself.

![](../media/create-remote-desktop/IR-Sensitivetext.png)

1.  Follow the steps in **Add a recording** to launch the recorder control for a new or existing UI flow

1.  Connect to the remote computer using the Remote Desktop Connection (RDC) app, and expand the window to full screen.

1.  Select **Record** from the recorder control and click on "Got it" in the popup

![](../media/create-remote-desktop/IR-Popup.png)

1.  Perform the steps on the remote computer, and then select **Done** on the recorder control.

1.  Locate the Launch Remote Desktop action within your recording.

1.  Add the sensitive text inputs for the username and password.

![](../media/create-remote-desktop/IR-Launch_Remote_Desktop_session.png)


1.  Select **Save**, and then test your UI flow.

1. When calling this UI flow from an automated flow, it is recommended to use a key management solution such as [Azure Key Vault](https://azure.microsoft.com/services/key-vault/) to retrieve the username and password and pass them to the sensitive text inputs of the UI flow dynamically, rather than storing them in the flow itself. 

1. Additionally, enable Secure Inputs in the Settings menu for the "Run a UI flow for desktop" action in the flow that is calling the UI flow to ensure that the the inputs are not stored in the run history.

### To retrieve an output from a remote computer, use the Extract Text from Image action while recording: 


1.  While recording, navigate to the location of the text that you wish to
    capture.

1.  Select Outputs -\> Extract Text from Image from the recorder control

1.  Follow the prompts to select an **anchor area** (a section of the screen
    that is not expected to change, such as the label next to a field)

    ![](../media/create-remote-desktop/IR-Anchor.png)

1.  Select the **target area** (the area from which text will be extracted using OCR)

    ![](../media/create-remote-desktop/IR-Target.png)

1.  Enter a name for the output

1.  Select **Done** on the recorder control

1.  Select **Save**, and then test your UI flow.

### Known issues and limitations

1.  Ensure that all required inputs (computer name, username, and password) are
    filled in and saved before recording further steps in the same UI flow.

1.  To attach to an existing remote desktop session, the session must have been
    launched earlier in the same UI flow

1.  The recommend way to launch the Remote Desktop Connection (RDC) when recording is from the Remote Desktop Connection app (mstc.exe) in the Start menu. If Windows Security actions are recorded in addition to the Launch Remote Desktop action, they should be removed in the designer so that playback is not interrupted (this can happen when the Remote Desktop session is launched from a shortcut)

1.  Playback can fail if the UI flow was recorded on a screen with screen
    scaling (Windows Settings -\> Display -\> Screen Scaling) set to a value
    other than 100%. As a workaround, ensure that screen scaling is set to 100%
    prior to recording.

## Unfinished/unneeded sections 


Create a Remote Desktop UI flow
-------------------------------

-   Select Desktop app:

>    

![](../media/create-remote-desktop/b4b959e179c67b55c36f20d09d1cf67a.png)

>    

>    

-   Create 2 inputs in the first step of the wizard: these inputs will be used
    to connect to your Remote Desktop during the playback.

![](../media/create-remote-desktop/IR-Sensitivetext.png)

>    

>    

-   The sample values will be the **credentials** of the **remote machine** you
    want to connect.

-   **Computer name**: the name of the PC you want to connect (you can use the
    hostname or your IP address)

-   **Username **:

![](../media/create-remote-desktop/ca69a1a9a4e5f0a02aac7a1f7e0c271f.png)

>    

>    

-   Launch the recorder

-   You can record on an already open Remote Desktop session (recommended):

    -   Launch the RDP session before starting recording and start record
        actions on a session that is already open.

-   Alternatively, you can start your Remote Desktop session during the
    recording:

    -   Open the Remote Desktop connection (mstc) and sign in to launch your
        remote desktop session and continue to use the same recording to record
        clicks and inputs within the remote desktop session.

>   **For safety reasons, all the login steps of RDP are not saved in the script
>   and won't be displayed in the designer.**

>   **To allow the connection to the remote desktop during the playback, users
>   need to bind the created inputs with credential fields in the Login Remote
>   Desktop action**

How to define variable with Image Recognition
---------------------------------------------

### Inputs

TBC

### Outputs

We introduce two new types of outputs for Image recognition: Extract text from
image and Get text from Clipboard.

-   Define an output with clipboard:

    -   During the recording, copy a string value

![](../media/create-remote-desktop/4a6ca33f0f7317cbe2afcb06f67debd7.png)

>    

-   Select Get output with clipboard

![](../media/create-remote-desktop/43781fcf437a14310e3017049c23ea48.png)

>    

-   The value is displayed, define a name and description for this output

![](../media/create-remote-desktop/3635b53931d15fec30206975bc5dcc01.png)

>    

-   You can use this output as an input of a next step

-   Define an output with OCR

    -   Select « Extract text from image » in the list of Output options

![](../media/create-remote-desktop/0c225de2d9cd09b23ea4f7914ad80082.png)

>    

-   Define the anchor (the invariant area close to the text you want to select)

![](../media/create-remote-desktop/d04d840195beac3ca58883459787c75d.png)

>    

-   Define the area where the text is contained (target)

    -   Ex: if you want to select the ID of a table. The anchor is “ID”, the
        target is “1001”

![](../media/create-remote-desktop/27c4e036ea475e1413ddf89706ba9f28.png)

>    

>    

-   Ensure the value has been correctly captured. If not retry the process.

![](../media/create-remote-desktop/c6ea56b03000973b0db512eca38b3313.png)

>    

-   Stop the recording and go back to the wizard
