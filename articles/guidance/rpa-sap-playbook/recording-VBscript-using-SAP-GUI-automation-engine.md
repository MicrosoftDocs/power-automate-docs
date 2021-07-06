---
title: Record VBScript with the SAP GUI automation engine | Microsoft Docs
description: Use the proprietary SAP GUI automation engine to generate VBScript output from recorded user interactions.
suite: flow
documentationcenter: na
author: kathyos
manager: kvivek
editor: ''
ms.custom: guidance
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/25/2021
ms.author: kathyos
ms.reviewer: deonhe
---

# Record VBScript with the SAP GUI automation engine

1.  Confirm that all [SAP GUI scripting configurations](./prerequisites.md#sap-gui-scripting-configuration) are done.

1.  Open **SAP Logon**, and then select the SAP system to which you want to sign in.

   ![Screenshot of SAP Login 760 ](media/SAP-login-760.png)

1.  Select **Customize Local Layout (Alt F12) **, and then select **Script Recording and Playback…**.

   ![Screenshot of the SAP Easy Access system ](media/SAP-easy-access-system.png)

1.  Select **More.**

1.  Under **Save To**, provide the file path and name where the captured user interactions should be stored.

   ![Screenshot of saving the recording file in the Record and Playback dialog box ](media/saving-recording-file.png)

1.  Select the **Record Script** button to start the screen capturing process. 
   Every interaction you do in SAP is captured as repeatable VBScript commands. If you previously recorded steps and saved to this file, you’ll receive a prompt that asks if you’d like to overwrite the file. .

1.  Follow the sample steps outlined in [Four sample scenario](./sample-sap-scenario.md) to produce a recording.

1.  Select the **Record and Playback** dialog box, select **Stop Recording**, and then close the dialog box.

1.  Close all SAP windows now if you wish.

SAP's scripting engine records each click as VBScript commands and has saves it to the output file you provide. Open the file in your code editor of choice to examine its contents.
