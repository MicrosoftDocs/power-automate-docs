---
title: Use SAP GUI automation engine to record VBScript | Microsoft Docs
description: Use the proprietary SAP GUI automation engine to generate VBScript output from recorded user interactions.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/25/2021
ms.author: kathyos
ms.reviewer: angieandrews
---

# Use SAP GUI automation engine to record VBScript

1. Confirm that all [SAP GUI scripting configurations](./prerequisites.md#sap-gui-scripting-configuration) are done.

1. Open **SAP Logon**, and then select the SAP system to which you want to sign in.

   ![Screenshot of SAP Login 760.](media/SAP-login-760.png)

1. Select **Customize Local Layout (Alt F12)**, and then select **Script Recording and Playback**.

   ![Screenshot of the SAP Easy Access system.](media/SAP-easy-access-system.png)

1. Select **More.**

1. Under **Save To**, provide the path and file name where you want to store the captured user interactions.

   ![Screenshot of saving the recording file in the Record and Playback dialog.](media/saving-recording-file.png)

1. Select **Record Script** to start the screen capturing process.  
    Every interaction you do in SAP will be captured as repeatable VBScript commands.

1. Follow the steps outlined in [Sample SAP GUI automation for this tutorial](sample-sap-scenario.md) to produce a recording.

1. Select the **Record and Playback** dialog, select **Stop Recording**, and then close the dialog.

1. Close all SAP windows now, if you wish.

SAP's scripting engine records each click as VBScript commands and saves it to the output file you provide. Open the file in your code editor of choice to examine its contents.

> [!div class="nextstepaction"]
> [Next step: Review the generated code](reviewing-generated-code.md)
