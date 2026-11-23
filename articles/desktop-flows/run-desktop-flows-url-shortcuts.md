---
title: Run desktop flows via URL or desktop shortcuts
description: See how to run desktop flows via URL or desktop shortcuts.
author: kewaiss
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 11/23/2026
ms.author: nimoutzo
ms.reviewer: smurkute
contributors: yiannismavridis
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flows via URL or desktop shortcuts

In addition to triggering flows through the console, flow designer, and cloud flows, Power Automate enables you to run desktop flows using run URLs and desktop shortcuts.

You can use URLs to trigger desktop flows through many different sources, such as browsers, the Windows Run application, the [command prompt](#use-a-run-url-in-the-command-prompt), and the [Windows Task Scheduler](#trigger-flows-automatically-with-task-scheduler). Alternatively, you can [create desktop shortcuts](#create-a-desktop-shortcut) and run your desktop flows directly through them.

If a triggered flow requires input variables, the console prompts you to enter the appropriate values.

By default, Power Automate always prompts you to confirm the triggering of a desktop flow via URL or desktop shortcut. To disable this functionality, go to the console settings and disable **Display confirmation dialog when invoking flows externally** or modify the [appropriate Windows registry entry](governance.md#configure-power-automate-for-desktop-confirmation-dialog-when-invoking-flows-using-a-url-or-desktop-shortcut).

> [!WARNING]
> Disabling the confirmation dialog poses security threats because you could run without notice a questionable flow shared by a malicious actor.

:::image type="content" source="media/run-flow-url/console-run-url-console-settings.png" alt-text="Screenshot of the Display confirmation dialog when invoking flows externally option in the console settings.":::

> [!NOTE]
> Only one flow can run in local attended mode at a time.

## Prerequisites

- Power Automate for desktop needs to be installed on the machine.
- You must be signed in.

## Create a desktop shortcut

To create a shortcut for a desktop flow, right-click its name in the console and select **Create desktop shortcut**. The console automatically creates all shortcuts in your desktop folder, but you can move them to any folder on your machine.

:::image type="content" source="media/run-flow-url/console-create-desktop-shortcut.png" alt-text="Screenshot of the Create desktop shortcut option.":::

## Create a run URL

> [!Important]
> If a flow is already running, it doesn't run again when you invoke the URL.

To generate a URL that triggers a desktop flow, use one of the following formats:

```
"ms-powerautomate:/console/flow/run?workflowName=[workflowName]"
```

```
"ms-powerautomate:/console/flow/run?workflowId=[workflowId]"
```

```
"ms-powerautomate:/console/flow/run?environmentId=[environmentId]&workflowId=[workflowId]"
```

```
"ms-powerautomate:/console/flow/run?environmentId=[environmentId]&workflowName=[workflowIName]"
```

> [!NOTE]
> You can find an automatically created run URL that consists of the environment and flow IDs in the properties section of the desktop flow. For more information about flow properties, see [Desktop flow properties](console.md#desktop-flow-properties).

The first two formats don't define a specific environment, so Power Automate automatically uses the currently selected console environment. The command is neglected if you don't specify either the flow ID or flow name.

If you set the console to another environment than the one specified in the URL, the console environment automatically changes.

### Find environment and desktop flow IDs

To find the ID of an environment, go to the [Power Automate portal](https://make.powerautomate.com) and select the environment you want. Then, go to the **My flows** tab and copy the environment ID from the address line.

:::image type="content" source="media/run-flow-url/find-environment-id.png" alt-text="Screenshot of the environment ID in the address line.":::

To find the ID of a desktop flow, launch the Power Automate console, select or right-click the appropriate flow, and select **Properties**.

:::image type="content" source="media/console/desktop-flow-details-properties.png" alt-text="Screenshot of the details of a desktop flow.":::

## Add optional parameters to a run URL

Besides the mandatory input parameters, you can add optional parameters to a run URL.

### Add flow input variables to a run URL

Add the `inputArguments` parameter to a run URL to configure the flow's inputs.

If the `inputArguments` parameter includes all the input variables for the flow, the Power Automate console doesn't request user input during the flow run.

A URL with the `inputArguments` parameter should follow this structure. You can add the parameter to any of the previously mentioned URLs.

> [!IMPORTANT]
> Escape all special characters in the JSON string. For example, escape all double quotes with a backslash.

```
"ms-powerautomate:/console/flow/run?workflowId=[workflowId]&inputArguments={\"[External name 1]\": [Value 1],\"[External name 2]\": [Value 2]}"
```

For example, the following run URL starts a desktop flow with text, numeric, and boolean inputs:

```
"ms-powerautomate:/console/flow/run?&workflowid=dfd0c814-2c30-4cd8-849d-a4b2d2f4f33b&inputArguments={\"NewInput\": \"Hello\", \"NewInput2\": 123, \"NewInput3\": true}"
```

> [!NOTE]
>
> - Only Text, Numeric, and Boolean data types are supported.
> - The Boolean values are case sensitive, and the value can be either **true** or **false**.
> - If there are extra flow inputs that you don't include in the `inputArguments` parameter, the Power Automate console asks for user input during the flow run.
> - The source that starts the run URL might limit the maximum number of allowed characters. If you go over this limit, the flow fails.

> [!IMPORTANT]
>
> - To trigger the run URL through a web browser, unescape the `inputArguments` parameter's JSON string value and use **URL encoding** to convert the characters into a valid ASCII format.
> - To unescape the double quote characters, remove the backslashes. For example, *inputArguments={"NewInput": "Hello", "NewInput2": 123, "NewInput3": true}*

### Sign in silently with the current Windows account

Add the `autologin` parameter to a run URL to sign in to Power Automate without any user interaction, by using the current Windows signed-in user.  

As prerequisites, the user must be signed out and Power Automate must not be running on the machine.

> [!IMPORTANT]
>
> If the user explicitly signs out of Power Automate through the UI, Power Automate respects the user's preference and doesn't autologin.  

A URL containing the `autologin` parameter should have the following structure. You can add the parameter to any of the previously mentioned URLs.  

```
"ms-powerautomate:/console/flow/run?workflowId=[workflowId]&autologin=true"
```

### Save logs for desktop flows run via URL

Add the `runId` parameter to a run URL to define a unique GUID for the desktop flow logs.

Power Automate uses this GUID to create a folder and store the logs inside it. The logs are stored in: **C:\Users\\[Username]\AppData\Local\Microsoft\Power Automate Desktop\Console\Scripts\\[Flow ID]\Runs\\[Run ID]**

> [!NOTE]
> A GUID is a 128-bit value consisting of one group of 8 hexadecimal digits, three groups of 4 digits each, and one group of 12 digits. For example: *e6f82a20-47f7-4dd8-a97f-63df36797d0f*.  

A URL containing the `runId` input parameter should have the following structure. You can add the parameter to any of the previously mentioned URLs.

```
"ms-powerautomate:/console/flow/run?workflowId=[workflowId]&runId=[GUID]"
```

## Use a run URL in the command prompt

To trigger a flow by using the command prompt, use a command with the following syntax (applies to MSI installations):

```
"C:\Program Files (x86)\Power Automate Desktop\dotnet\PAD.Console.Host.exe" "ms-powerautomate:/console/flow/run?workflowName=[workflowName]"
```

> [!NOTE]
> Replace the second part of the command with any of the previously presented URL formats.

## Trigger flows automatically with Task Scheduler

To trigger a flow by using the Task Scheduler application in Windows:

1. Create a new task, go to the **Actions** tab in the **Create Task** dialog, and add a new action.

1. Enter the following value in the **Program/script** field.
   
   - For MSI installations:
    ```
    C:\Program Files (x86)\Power Automate Desktop\dotnet\PAD.Console.Host.exe
    ```

   - For Microsoft Store installations:
    ```
    C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe
    ```

1. Enter the following value in the **Add arguments** field.

   - For MSI installations:
    ```
    ms-powerautomate:/console/flow/run?workflowName=[workflowName]
    ```
    - For Microsoft Store installations:
    ```
    -Command "Start-Process \"ms-powerautomate:/console/flow/run?workflowName=[workflowName]""
    ```

    >[!NOTE]
    > Replace the given argument with any of the previously presented URL formats.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
