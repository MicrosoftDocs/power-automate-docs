---
title: Troubleshoot desktop flows runtime
description: Learn how to resolve common Power Automate desktop flows runtime problems effectively.
author: PetrosFeleskouras
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: troubleshooting-general
ms.date: 07/21/2025
ms.author: pefelesk
ms.reviewer: tapanm
contributors:
  - PetrosFeleskouras
  - johndund
  - DanaMartens
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:01/14/2025
  - sfi-image-nochange
---

# Troubleshoot desktop flows runtime

To open the Power Automate troubleshoot tab:

1. Launch **Power Automate machine runtime**
1. Select **Troubleshoot**
1. Select **Launch Troubleshoot tool**  

>[!NOTE]
>You need to have admin privileges to open the troubleshoot tool from Power Automate machine runtime.

## Diagnose runtime connectivity issues

>[!NOTE]
>You can access the diagnostic tool from Power Automate console as well. Select **help**. From the dropdown, select **troubleshooter** > **diagnose connectivity issues for cloud runtime**.

The diagnostic tool helps you identify connectivity issues between your computer and services required to run Power Automate. It can help debug both cloud runtime and machine registration issues you might experience. To run the tool, select **Launch diagnostic tool** in the troubleshoot tab in the machine runtime.

When you run the tool, Power Automate tries to connect to each required service. If a connection fails, the logs can help you understand the list of endpoints you must allow. For the cloud runtime to work, the Power Automate service (UIFlowService) running on your machine must have access to *.dynamics.com, *.servicebus.windows.net, *.gateway.prod.island.powerapps.com, and *.api.powerplatform.com.

The tool can check different items based on whether your machine is registered. If you experience problems registering your machine, read [registration troubleshooting documentation](/troubleshoot/power-platform/power-automate/desktop-flows/desktop-flow-machine-registration-troubleshooting) before running the tool. The following table lists the endpoints the tool checks and the actions to take depending on your machine state.

| Required services | What it checks | What to do if it fails |
| --------|  ---------| ---- |
| Azure Relay (*.servicebus.windows.net) | If the machine is registered, it checks the specific endpoints used for machine-cloud communication that are established upon registration. If your computer isn't registered, it checks a static relay endpoint. | If your machine isn't registered, ensure *.servicebus.windows.net has connectivity. If your machine is registered, you can either allow *.servicebus.windows.net or specifically the endpoints in the logs. |
| Dataverse (*.dynamics.com) | If the machine is registered, it contacts your specific Dataverse environment. If the machine isn't registered, it doesn't do a check. | Allow connectivity to *.dynamics.com or your team’s Dataverse URL. |
| Desktop flow service (*.gateway.prod.island.powerapps.com and *.api.powerplatform.com) | If the machine is registered, it checks that the endpoint is reachable for desktop flow runtime. | The logs should tell you what failed. Up to version 2.51, *.gateway.prod.island.powerapps.com must be reachable. Starting with version 2.52, *.api.powerplatform.com must also be reachable. |

Remember that the Power Automate service (UIFlowService) running on your machine is making the call to required services. On-premises proxy servers might have rules that require calls to come from a specific user. Consider [changing the on-premises service account](#change-the-on-premises-service-account) to fix these errors if a specific endpoint works in a user session but not via the Power Automate service.

You can review the list of all [services required for desktop flow runtime](../ip-address-configuration.md).

## Resolve failed connection between Power Automate components

See ["Communication error" and the connection between Power Automate components fails](/troubleshoot/power-platform/power-automate/desktop-flows/failed-connection-between-power-automate-components)

## Change the on-premises Service account

The Power Automate service (**UIFlowService**) communicates with Power Automate cloud services for machine registration and running desktop flows.

By default, it runs as a virtual account created by the Power Automate installer called **NT SERVICE\UIFlowService**.

Most on-premises environments don't require changing the default configuration. However, you may run into errors registering machines or running flows for the following reasons:

- Your network doesn't allow requests made by the **NT SERVICE\UIFlowService** virtual account to reach Power Automate cloud services.
- Your machine or group policy disallows the **Log on as a service** privilege for the **NT SERVICE\UIFlowService** account.

In either of these cases, you can ask your domain or network administrator to grant **NT SERVICE\UIFlowService** the appropriate privileges. Alternatively, you can replicate the following steps to change the account with which the Power Automate service runs:

1. Launch the Machine runtime application and select the **Troubleshoot** tab.
1. Select **Change account**.
1. Select **This account**.
1. Provide the new account, for example: **DOMAIN\AlexJohnson**.
1. Provide the password of this account and select **Configure**.

:::image type="content" source="media/troubleshoot/power-automate-troubleshoot-dialog.png" alt-text="Screenshot of the Power Automate troubleshoot dialog.":::

Changing the service account can also be accomplished by using a command line tool that ships with Power Automate called "**TroubleshootingTool.Console.exe**". This tool is useful when scripting the upgrade of Power Automate to a more recent version, as upgrading will reset the UIFlowService to run against the default virtual account.

You can find TroubleshootingTool.Console.exe in the directory where you installed Power Automate, typically "%programfiles(x86)%\Power Automate Desktop". To change the service account, do the following:

1. Open a command prompt as an administrator and navigate to the tool.
1. Create a temporary file with the account password as the only content inside (e.g. temp.txt)
1. Type the following: TroubleshootingTool.Console.exe ChangeUIFlowServiceAccount \<accountname> < \<pathToTemporaryFile>
1. Delete the temporary file

Example:

`TroubleshootingTool.Console.exe ChangeUIFlowServiceAccount mydomain\myuser < tempfilethatcontainspassword.txt`

The tool also provides other functionality such as getting the name of the account that the service is currently running as, resetting it to run as the default virtual account, or simply restarting the service. For more information on all supported commands, simply run the TroubleshootingTool.Console.exe with no arguments.

>[!NOTE]
>Changing the service account is not supported for [Hosted Machines](hosted-machines.md).

## Troubleshoot desktop flow runs

If your desktop flow run fails, go to [Errors when running attended or unattended desktop flows](/troubleshoot/power-platform/power-automate/desktop-flows/troubleshoot-errors-running-attended-or-unattended-desktop-flows) and find mitigation steps for different error codes.

If you encounter errors related to the desktop flow run queue, go to [Troubleshoot desktop flow run queue errors](/troubleshoot/power-platform/power-automate/desktop-flows/troubleshoot-desktop-flow-run-queue-errors).

## Collect machine logs

There are several logs you can collect for the machine’s configuration and service logs. To do so, select **Exports logs** link in the Troubleshoot tool.

:::image type="content" source="media/troubleshoot/power-automate-machine-logs.png" alt-text="Screenshot of the Machine logs.":::

This file is saved to the desktop as a zip file.

## Resolve Power Automate agent for virtual desktops issues

If you encounter errors while launching the Power Automate agent for virtual desktops, perform the following steps:

1. Close the RDP or Citrix session.
1. Ensure you've installed the correct version of Power Automate for desktop.
1. Connect again to the RDP or Citrix virtual desktop.
1. Restart the Power Automate agent for virtual desktops.

If the agent for virtual desktops can't communicate with Power Automate for desktop, the agent will be closed. If you're sure that a correct Power Automate for desktop version is installed, one that supports UI automation in virtual desktops, try the following remediation steps:

1. Open PowerShell
1. Navigate to the appropriate directory using the following command:

    ``` PowerShell
    cd "C:\Program Files (x86)\Power Automate Desktop\dotnet\RDP\DVCPlugin\x64"
    ```

1. Run the following two commands:

    ``` PowerShell
    regsvr32 /u .\Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin.dll
    ```

    ``` PowerShell
    regsvr32  .\Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin.dll
    ```

## Troubleshoot hosted machines

See [Troubleshoot hosted machines in Power Automate for desktop](/troubleshoot/power-platform/power-automate/desktop-flows/troubleshoot-hosted-machines-in-power-automate-for-desktop)

## Get self-help or ask help from support

If you need help, use our self-help options, or ask for help from support.

### Self help

1. Go to the [Power Automate support site](https://make.powerautomate.com/support/).
1. Go to the **Self Help** category, and select one of the available self-help options.

### Ask for help from support

1. Go to the [Power Automate support site](https://make.powerautomate.com/support/).
1. Select **Contact support** under the **Ask for help** category.
1. Enter **Desktop flows** in **Problem type**, and populate the other fields with information about your issue.
1. Select **See solutions**.

> [!IMPORTANT]
> The following statement is subject to change.
>
> We offer customer support for all Power Automate for Desktop versions released within a year of the latest public release. Security issues are addressed for product releases up to 6 months old.
> Bug fixes and product enhancements are always included in the latest version.
 

[!INCLUDE[footer-include](../includes/footer-banner.md)]

## Related information
[Power Automate Troubleshooting](/troubleshoot/power-platform/power-automate/welcome-power-automate)
