---
title: Run the Power Automate Desktop troubleshooter in unattended mode
description: Learn how to run the Power Automate Desktop troubleshooter from a desktop flow when an unattended run fails; capture a screenshot of the troubleshooter output for diagnostics.
author: iomimtso
reviewer: EllenWehrle
ms.author: iomimtso
ms.contributors:
  - iopanag
  - nimoutzo
ms.reviewer: ellenwehrle
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 2025-11-28
search.audienceType: 
  - flowmaker
  - enduser
---

# Run the Power Automate Desktop troubleshooter in unattended mode

Use this method when an unattended desktop flow fails and you can't retrieve troubleshooter logs (for example, on hosted machines). Run the troubleshooter from the flow and capture a screenshot of its output. The screenshot helps you identify what went wrong during the unattended run.

## When to use this method

- Use this method when an action (for example, `Launch Edge`) fails on an unattended machine.
- Use this method when you can't access standard troubleshooter logs from the device.

## Example flow script

The following example shows how to run the troubleshooter when `Launch Edge` fails. The script launches the troubleshooter executable, focuses its window, sends keystrokes to start diagnostics, and exits the flow with an error so the flow's screenshot-on-error captures the troubleshooter output.

```text
WebAutomation.LaunchEdge.LaunchEdge Url: $'''www.microsoft.com''' WindowState: WebAutomation.BrowserWindowState.Normal ClearCache: False ClearCookies: False WaitForPageToLoadTimeout: 60 Timeout: 60 PiPUserDataFolderMode: WebAutomation.PiPUserDataFolderModeEnum.AutomaticProfile TargetDesktop: $'''{"DisplayName":"Local computer","Route":{"ServerType":"Local","ServerAddress":""},"DesktopType":"local"}''' BrowserInstance=> Browser
ON ERROR
    SET LaunchFailed TO $'''true'''
END
IF LaunchFailed = $'''true''' THEN
    System.RunApplication.RunApplicationAndWaitToLoad ApplicationPath: $'''C:\Program Files (x86)\Power Automate Desktop\dotnet\PAD.Troubleshooter.exe''' CommandLineArguments: $'''--diagnostic=UIAutomationDiagnosticGroup''' WindowStyle: System.ProcessWindowStyle.Normal Timeout: 120 ProcessId=> AppProcessId WindowHandle=> WindowHandle
    DISABLE WAIT 30
    UIAutomation.FocusWindow.FocusByInstanceOrHandle WindowInstance: WindowHandle
    MouseAndKeyboard.SendKeys.FocusAndSendKeys TextToSend: $'''{Tab}{Down}{Tab}{Return}''' DelayBetweenKeystrokes: 3000 SendTextAsHardwareKeys: False
    EXIT Code: 0 ErrorMessage: $'''Flow Failed. Please check screenshot for troubleshooter diagnostics'''
END
```

## Important notes

- Enable the flow option to capture a screenshot on error so you can review the troubleshooter output after the run.
- If you use the Microsoft Store version, the `PAD.Troubleshooter.exe` location might differ. Run the troubleshooter and use Task Manager to find the executable path.
