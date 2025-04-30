---
title: Run desktop flows via URL or desktop shortcuts
description: See how to run desktop flows via URL or desktop shortcuts.
author: HeatherOrt
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 11/28/2023
ms.author: nimoutzo
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flows via URL or desktop shortcuts

Power Automate, apart from triggering flows through the console, flow designer, and cloud flows, enables you to run desktop flows using run URLs and desktop shortcuts.

You can use URLs to trigger desktop flows through many different sources, such as browsers, the Windows Run application, the [command prompt](#use-a-run-url-in-the-command-prompt), and the [Windows Task Scheduler](#trigger-flows-automatically-with-task-scheduler). Alternatively, you can [create desktop shortcuts](#create-a-desktop-shortcut) and run your desktop flows directly through them.

If a triggered flow requires input variables, the console will ask you to enter the appropriate values.

By default, Power Automate always prompts you to confirm the triggering of a desktop flow via URL or desktop shortcut. To disable this functionality, navigate to the console settings and disable **Display confirmation dialog when invoking flows externally** or modify the [appropriate Windows registry entry](governance.md#configure-power-automate-for-desktop-confirmation-dialog-when-invoking-flows-using-a-url-or-desktop-shortcut).

> [!WARNING]
> Disabling the confirmation dialog poses security threats because you could run without notice a questionable flow shared by a malicious actor.

:::image type="content" source="media/run-flow-url/console-run-url-console-settings.png" alt-text="Screenshot of the Display confirmation dialog when invoking flows externally option in the console settings.":::

## Prerequisites

- Power Automate for desktop needs to be installed on the machine.
- The user must be signed in.
- The user needs a Power Automate Premium plan or access to a pay-as-you-go environment.

## Create a desktop shortcut

To create a shortcut for a desktop flow, right-click its name in the console and select **Create desktop shortcut**. All shortcuts are automatically created in your desktop folder, but you can move them to any folder of your machine.

:::image type="content" source="media/run-flow-url/console-create-desktop-shortcut.png" alt-text="Screenshot of the Create desktop shortcut option.":::

## Create a run URL

> [!Important]
> If a flow is already running, it won't run again when the URL is invoked.

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
> You can find an automatically created run URL consisting of the environment and flow IDs on the properties section of the desktop flow. You can find more information about flow properties in [Desktop flow properties](console.md#desktop-flow-properties).

The first two formats don't define a specific environment, so Power Automate automatically uses the currently selected console environment. The command will be neglected if either flow ID or flow name isn’t specified.

If the console is set to another environment than the one specified in the URL, the console environment will automatically change.

### Find environment and desktop flow IDs

To find the ID of an environment, navigate to the [Power Automate portal](https://make.powerautomate.com) and select the desired environment. Then, navigate to the **My flows** tab and copy the environment ID from the address line.

:::image type="content" source="media/run-flow-url/find-environment-id.png" alt-text="Screenshot of the environment ID in the address line.":::

To find the ID of a desktop flow, launch the Power Automate console, select or right-click the appropriate flow, and select **Properties**.

:::image type="content" source="media/console/desktop-flow-details-properties.png" alt-text="Screenshot of the details of a desktop flow.":::

## Add optional parameters to a run URL

Apart from the mandatory input parameters, you can add optional parameters to a run URL.

### Add flow input variables to a run URL

Add the `inputArguments` parameter to a run URL to configure the flow's inputs.

If the `inputArguments` parameter contains all the input variables of the flow, then Power Automate console doesn't ask for user input during the flow run.

A URL containing the `inputArguments` parameter should have the following structure. The parameter can be added to any of the previously mentioned URLs.

> [!IMPORTANT]
> All special characters in the JSON string must be escaped. For example, all double quotes must be backslash-escaped.

```
"ms-powerautomate:/console/flow/run?workflowId=[workflowId]&inputArguments={\"[External name 1]\": [Value 1],\"[External name 2]\": [Value 2]}"
```

For example, the below run URL invokes a desktop flow with text, numeric and boolean inputs:

```
"ms-powerautomate:/console/flow/run?&workflowid=dfd0c814-2c30-4cd8-849d-a4b2d2f4f33b&inputArguments={\"NewInput\": \"Hello\", \"NewInput2\": 123, \"NewInput3\": true}"
```

> [!NOTE]
>
> - Only Text, Numeric and Boolean data types are supported.
> - The Boolean values are case sensitive, and the value can be either **true** or **false**.
> - If there are additional flow inputs that aren't included in the `inputArguments` parameter, then during the flow run the Power Automate console asks for user input.
> - The source that invokes the run URL may have a limit of maximum allowed characters, which will cause the flow to fail if that limit is exceeded.

> [!IMPORTANT]
>
> - To trigger the run URL through a web browser, unescape the `inputArguments` parameter's JSON string value and use **URL encoding** to convert the characters into a valid ASCII format.
> - To unescape the double quote characters, remove the backslashes. For example, *inputArguments={"NewInput": "Hello", "NewInput2": 123, "NewInput3": true}*

### Sign in silently with the current Windows account

Add the `autologin` parameter to a run URL to sign in to Power Automate without any user interaction, with the current Windows logged in user.

As prerequisites, the user must be signed out and Power Automate must not be running on the machine.

> [!IMPORTANT]
>
> If the user has explicitly signed out of Power Automate through the UI, then Power Automate respects user’s preferences and does not perform auto-login.

A URL containing the `autologin` parameter should have the following structure. The parameter can be added to any of the previously mentioned URLs.

```
"ms-powerautomate:/console/flow/run?workflowId=[workflowId]&autologin=true"
```

### Save logs for desktop flows run via URL

Add the `runId` parameter to a run URL to define a unique GUID for the desktop flow logs.

Power Automate uses this GUID to create a folder and store the logs inside it. The logs are stored in: **C:\Users\\[Username]\AppData\Local\Microsoft\Power Automate Desktop\Console\Scripts\\[Flow ID]\Runs\\[Run ID]**

> [!NOTE]
> A GUID is a 128-bit value consisting of one group of 8 hexadecimal digits, three groups of 4 digits each, and one group of 12 digits, for example: *e6f82a20-47f7-4dd8-a97f-63df36797d0f*.

A URL containing the `runId` input parameter should have the following structure. The parameter can be added to any of the previously mentioned URLs.

```
"ms-powerautomate:/console/flow/run?workflowId=[workflowId]&runId=[GUID]"
```

## Use a run URL in the command prompt

To trigger a flow using the command prompt, use a command with the following syntax (applies to MSI installations):

```
"C:\Program Files (x86)\Power Automate Desktop\PAD.Console.Host.exe" "ms-powerautomate:/console/flow/run?workflowName=[workflowName]"
```

> [!NOTE]
> You can replace the second part of the command with any of the previously presented URL formats.

## Trigger flows automatically with Task Scheduler

To trigger a flow using the Task Scheduler application of Windows:

1. Create a new task, navigate to the **Actions** tab of the **Create Task** dialog, and add a new action.

1. Populate the following value in the **Program/script** field.
   
   - For MSI installations:
    ```
    C:\Program Files (x86)\Power Automate Desktop\PAD.Console.Host.exe
    ```

   - For Microsoft Store installations:
    ```
    C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe
    ```

1. Populate the following value in the **Add arguments** field.

   - For MSI installations:
    ```
    ms-powerautomate:/console/flow/run?workflowName=[workflowName]
    ```
    - For Microsoft Store installations:
    ```
    -Command "Start-Process \"ms-powerautomate:/console/flow/run?workflowName=[workflowName]""
    ```

    >[!NOTE]
    > You can replace the given argument with any of the previously presented URL formats.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
