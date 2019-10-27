---
title: List of known issues is the Preview release of Web UI flows | Microsoft Docs
description: List of known issues is the Preview release of Web UI flows.
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
# List of known issues is the Preview release of Web UI flows

[This topic is pre-release documentation and is subject to change.]

Limitations and known issues for Web UI flows
---------------------------------------------

**Passwords in Selenium IDE are stored in plain text**  


**UI flows no longer records or playbacks Windows applications after installing a new version.**

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
- To trigger the UI Flow you just created you can learn how to [run UI flows](run-ui-flow.md).

- If you want to do more with UI flows, you can also try out UI flows with [input and output](inputs-outputs-web.md) parameters.

