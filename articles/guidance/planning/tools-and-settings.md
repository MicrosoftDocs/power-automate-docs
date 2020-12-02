---
title: Planning a Power Automate project - Tools and settings to test your automations | Microsoft Docs
description: This article introduces you to different tools you can use to check your flows and to detect errors that occur when the automations run.
author: taiki-yoshida
ms.service: flow
ms.topic: conceptual
ms.custom: guidance
ms.date: 12/05/2020
ms.author: tayoshi
ms.reviewer: kathyos

---

# Tools and settings to test your automations

There are tools you can use to check your flows for basic errors and to detect
errors that occur when the automations run.

### Flow Checker

This tool checks for any issues and errors that exist within the automation you
have created. Once you feel that you have completed setting it up, look at the
Flow Checker to see if you have made any mistakes.

For more information on Flow Checker can be found
[here](https://docs.microsoft.com/en-us/power-automate/error-checker).

### Repair tips

If your automation fails, repair tips are automatically sent to whoever created
or owns the automation. This is useful as it contains actionable information
about the failure.

[More information on Repair
tips](https://docs.microsoft.com/en-us/power-automate/fix-flow-failures).

### Custom error notifications

If repair tips do not fulfil your needs for error notifications – for example in
case where you have automations for which you need to inform more than just the
flow owner about any failures –, you can set up custom error notifications by
setting an action that runs only when the prior step has failed.

The example below shows when “Get manager (V2)” action has failed to run, the
“Send an email notification (V3)” action is executed.

![Setting up action to run after previous step has failed](media/custom-error-notifications.png "Setting up action to run after previous step has failed")