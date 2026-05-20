---
title: Governance in Power Automate for desktop
description: Learn how to configure Power Automate for desktop using Windows registry keys.
author: NikosMoutzourakis
ms.topic: article
ms.date: 05/14/2026
ms.update-cycle: 180-days
ms.author: nimoutzo
ms.reviewer: ellenwehrle
ms.collection: bap-ai-copilot
contributors:
- jpapadimitriou
- Yiannismavridis
- PetrosFeleskouras
- DanaMartens
- cochamos
search.audienceType: 
  - flowmaker
  - enduser
no-loc: DWORD, String, Multi-String Value
---
# Governance in Power Automate for desktop

Use the Windows registry to control user permissions in Power Automate for desktop.

> [!CAUTION]
> Incorrectly modifying Windows registry settings can cause serious problems that might prevent your computer from booting properly. Microsoft can't guarantee that any problems resulting from the configuration of registry settings can be solved. Modify these settings at your own risk. [Back up your Windows registry](https://support.microsoft.com/topic/how-to-back-up-and-restore-the-registry-in-windows-855140ad-e318-2a13-2829-d428a2ab0692) before proceeding.

> [!NOTE]
> If a registry key doesn't exist in the Windows registry, first create the key and then add the registry value.

## Prevent users from manually updating Power Automate for desktop

Use the following registry entry to prevent users from manually updating Power Automate for desktop and receiving update notifications.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `DisableOptionalUpdates` | DWORD |

***Value***

- **1**: Users can't manually update Power Automate for desktop.

## Prevent users from manually configuring Power Automate for desktop to start automatically

Use the following registry entry to prevent users from manually configuring Power Automate for desktop to start automatically. This key only applies to installer (MSI) versions.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_CURRENT_USER` | `SOFTWARE\Microsoft\Power Automate Desktop` | `DisableAutoStartConfiguration` | DWORD |

***Value***

- **1**: Users can't manually select to automatically start Power Automate for desktop.

## Prevent user access to Power Automate for desktop with specific types of accounts

> [!NOTE]
> Setting any value other than 1, or not setting a value at all, in the following registry keys allows users to sign in to Power Automate for desktop. If all the following registry keys are set to 1, users can't sign in to Power Automate for desktop using any type of account.

### Prevent user access to Power Automate for desktop using Microsoft accounts

Use the following registry entry to keep users from signing in to Power Automate for desktop using a Microsoft account.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `RestrictMSAAccountsSignIns` | DWORD |

***Value***

- **1**: Users can't sign in to Power Automate using their Microsoft account.

### Prevent user access to Power Automate for desktop using work or school accounts

Use the following registry entry to prevent users from signing in to Power Automate for desktop by using their work or school account without a per-user plan with attended RPA license.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `RestrictNoLicenseOrgIDAccountsSignIns` | DWORD |

***Value***

- **1**: Users can't sign in to Power Automate by using their work or school account without a per-user plan with attended RPA license.

### Prevent user access to Power Automate for desktop using work or school accounts or organization premium accounts

Use the following registry entry to prevent users from signing in to Power Automate for desktop by using their work or school accounts or organization premium accounts.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `RestrictOrgIDAccountsSignIns` | DWORD |

***Value***

- **1**: Users can't sign in to Power Automate by using their work or school account or organization premium account.

## Restrict access to Power Automate for desktop

To restrict access to Power Automate for desktop on a workstation with Windows 10 or Windows 11, use [App locker](/windows/security/threat-protection/windows-defender-application-control/applocker/applocker-overview).

## Configure Power Automate for desktop to use the Web Account Manager (WAM) as a fallback sign-in method

By default, Power Automate for desktop uses the Web Account Manager (WAM) for user authentication. If any sign in errors occur, it uses an Internet Explorer client as a fallback method.

Use the following registry entry to set Power Automate for desktop to sign in by using the Windows Web Account Manager (WAM) as a fallback sign-in method.

> [!NOTE]
> For older versions of Power Automate for desktop prior to version 2.41, this registry entry configures Power Automate for desktop to sign in by using the Web Account Manager (WAM) as the primary sign-in method.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `UseMsalWindowsBroker` | DWORD |

***Values***

- **1**: Power Automate for desktop authenticates users by using the WAM functionality as a fallback sign-in method.

## Configure Power Automate for desktop to check for revoked certificates

Certificates ensure the security of your connections to online data sources. Use the following registry entry to configure the level of certificate check, based on the certificates' revocation information status.

> [!NOTE]
> The default configuration when you don't set a registry entry is **Basic check**.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `CertificateRevocationCheck` | DWORD |

***Values***

- **0**: No check - Power Automate for desktop doesn't check the revocation information. All valid certificates are allowed through.
- **1**: Basic check (default) - Power Automate for desktop rejects only certificates that are revoked. Certificates without revocation information are allowed through. This check is important for some organizations with corporate proxy services.
- **2**: Comprehensive check – Power Automate for desktop rejects both certificates that are revoked and certificates without revocation information.

## Allow users to select an organization in Power Automate for desktop

Use the following registry entry to allow users to select the organization they prefer in Power Automate for desktop.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `EnableOrganizationPicker` | String |

***Values***

- **"isEnabled":1**: Signed-in users can select the organization they prefer through the **Switch organization** option in the Power Automate for desktop console.

- **"isEnabled":0**: Signed-in users can't select the organization they prefer and the **Switch organization** option is disabled.

- **"organizationList":[OrgID(s)]** (for example, `organizationList:["10z677m8-l4v6-9cm5-c6n6-r1747rp5338k","86d487j7-y1t2-9gk7-k7n2-x5079jq4619r"]`): The organizations with the specified IDs are available to connect during sign-in.

- **"selectOrganizationFromListIsEnabled":1**: Power Automate for desktop tries to connect to each of the organizations specified in the **organizationList** value, in order, during sign-in.

- **"selectOrganizationFromListIsEnabled":0**: The specified list in the **organizationList** value isn't taken into consideration during sign-in.

> [!NOTE]
> The "isEnabled" values aren't related to the **organizationList** and **selectOrganizationFromListIsEnabled** values. The **isEnabled** values define whether the **Switch organization** option is available to signed-in users, whereas the **organizationList** and **selectOrganizationFromListIsEnabled** values define the organizations that Power Automate for desktop tries to connect to automatically during sign-in.

## Configure Power Automate for desktop to connect to a region

Use the following registry entry to set the default region for user sign-in.

> [!NOTE]
> Values **0** and **1** apply to older versions of Power Automate for desktop, prior to version 2.41.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `Cloud` | DWORD |

***Value***

- **0**: The user can select the region to connect to through another option in the sign-in screen.
- **1**: The user is automatically connected to the first available region they're registered to.
- **2**: The user connects to the global public region.
- **3**: The user connects to the US Government GCC region.
- **4**: The user connects to the US Government GCC High region.
- **5**: The user connects to the US Government DoD region.
- **6**: The user connects to the China (operated by 21Vianet) region.

## Configure Power Automate for desktop to interact with a corporate proxy server

IT administrators can set the following registry key to configure how Power Automate interacts with a corporate proxy server.

> [!IMPORTANT]
> Starting with Power Automate for desktop version 2.45, you can configure all proxy settings through the Power Automate proxy configuration files. For more information, see [Configure Power Automate for desktop proxy settings](./how-to/proxy-settings.md).

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyServer` | String |

***Value***

- **ProxyAddress:Port** (for example, `https://myproxy.com:3128`): The proxy server and port configured override the proxy server and port configured in Windows.

## Configure Power Automate for desktop to bypass a corporate proxy server

IT administrators can set the following registry key to configure Power Automate's bypassing of a corporate proxy server.

> [!IMPORTANT]
> Starting with Power Automate for desktop version 2.45, you can configure all proxy settings through the Power Automate proxy configuration files. For more information, see [Configure Power Automate for desktop proxy settings](./how-to/proxy-settings.md).

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `DisableWindowsProxy` | DWORD |

***Value***

- **1**: Power Automate for desktop doesn't honor the Windows Proxy settings and the proxy server is bypassed for Power Automate's traffic.

## Configure Power Automate for desktop to authenticate to a corporate proxy server by using the current user's credentials

IT administrators can set the following registry key to configure how Power Automate authenticates with a corporate proxy server.

> [!IMPORTANT]
> Starting with Power Automate for desktop version 2.45, you can configure all proxy settings through the Power Automate proxy configuration files. For more information, see [Configure Power Automate for desktop proxy settings](./how-to/proxy-settings.md).

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `UseDefaultProxyCredentials` | DWORD |

***Value***

- **1**: Power Automate for desktop authenticates to the corporate proxy server by using the current user's credentials.

## Configure Power Automate for desktop to authenticate to a corporate proxy server by using Windows credentials

IT administrators can set the following registry key to configure Power Automate to use a generic credential from Windows Credential Manager to authenticate to a corporate proxy server. 

> [!NOTE]
> To use this registry key, first configure the proxy server's address and port through the `ProxyServer` registry key.  

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyNetworkCredentialsKey` | String |

***Value***

- **Internet or network address**: The **Internet or network address** value of the generic Windows credential's entry.

## Configure Power Automate for desktop to bypass a set of addresses while interacting with a corporate proxy server

IT administrators can set the following registry key to configure a list of IP addresses that are bypassed while Power Automate interacts with a corporate proxy server. 

> [!NOTE]
> To use this registry key, first configure the proxy server's address and port through the `ProxyServer` registry key. 

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyBypassList` | String |

***Value***

- **Address1,Address2** (for example, `192.168.1.1, 10.10.10.*`): The list of addresses to bypass.

## Configure optional diagnostic usage data collection in Power Automate for desktop

Use the following registry entry to enable or disable the collection of optional diagnostic usage data in Power Automate for desktop.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\LogShipper` | `AllowOptionalDataCollection` | DWORD |

***Value***

- **0**: Power Automate for desktop doesn't collect optional diagnostic usage data.
- **1**: Power Automate for desktop collects optional diagnostic usage data.

## Prevent Power Automate for desktop from taking screenshots for action logs upon error

Use the following registry entry to prevent Power Automate for desktop from taking a screenshot for the action logs when an error occurs during a flow run.

|Hive|Key|Name|Type|
|---|---|---|---|
|`HKEY_LOCAL_MACHINE`|`SOFTWARE\Microsoft\Power Automate Desktop\Global`|`DisableScreenshotCaptureOnError`|DWORD|

***Value***

- **1**: Power Automate for desktop doesn't take a screenshot for the action logs when an error occurs during a flow run.

## Prevent Power Automate for desktop from uploading action logs after a desktop flow execution

Use the following registry entry to prevent Power Automate for desktop from uploading detailed logs per action for the respective run of the flow's run history, after a desktop flow execution.

|Hive|Key|Name|Type|
|---|---|---|---|
|`HKEY_LOCAL_MACHINE`|`SOFTWARE\Microsoft\Power Automate Desktop\Global`|`DisableFlowExecutionActionLogging`|DWORD|

***Value***

- **1**: Power Automate for desktop doesn't upload detailed action logs for the respective run of the flow's run history.

## Configure or disable desktop flow action logs per environment (preview)

See [Desktop flow action logs configuration (preview)](configure-desktop-flow-logs.md).

## Configure the generation of desktop flow action logs on the local machine for designer-based runs

Use the following registry entry to configure whether local Power Automate Desktop Designer runs store their action logs on the local machine. This option can be useful for debugging and troubleshooting scenarios, so you can examine the logs without checking each action's input and output individually.

> [!NOTE]
> This feature doesn't automatically clean up the logs generated during designer runs. Make sure you have sufficient local disk space to store the logs or manually clean up older run data.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `EnableDesignerExecutionLogs` | DWORD |

***Value***

- **1**: Enables persistence of Power Automate for desktop execution logs on the local file system, without uploading them to Dataverse. After a flow execution from Power Automate Desktop Designer is completed, you can find the execution logs at the following path:

    ```%LOCALAPPDATA%\Microsoft\Power Automate Desktop\Designer\Scripts\<scriptId>\Runs\<runId>\Actions.log```

## Configure Power Automate for desktop notification settings

You can use the following registry entry to configure how Power Automate for desktop displays notifications and monitoring information.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_CURRENT_USER` | `SOFTWARE\Microsoft\Power Automate Desktop` | `NotificationsType` | DWORD |

***Value***

- **1**: Power Automate for desktop displays notifications through the flow monitoring window.
- **2**: Power Automate for desktop uses the integrated Windows notifications.
- **3**: Power Automate for desktop doesn't display notifications.

## Configure Power Automate for desktop confirmation dialog when invoking flows using a URL or desktop shortcut

You can use the following registry entry to configure the behavior of the confirmation dialog when invoking flows using a URL or desktop shortcut.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_CURRENT_USER` | `SOFTWARE\Microsoft\Power Automate Desktop` | `EnableAskBeforeRunningAFlowExternally` | DWORD |

***Value***

- **0**: Power Automate for desktop doesn't display a confirmation dialog when invoking flows using a URL or desktop shortcut. The user can change this option through the console settings.

## Configure Power Automate for desktop to invoke flows using a URL or desktop shortcut

You can use the following registry entry to enforce the confirmation dialog or disable invoking flows using a URL or desktop shortcut.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ConfigureExternalRuns` | DWORD |

***Value***

- **1**: Power Automate for desktop always displays a confirmation dialog when invoking flows using a URL or desktop shortcut. Users aren't allowed to change this option through the console settings.
- **2**: Users aren't allowed to invoke flows using a URL or desktop shortcut.

## Configure Power Automate for desktop to disable the security check to run shared flows if the author is not trusted

A security check does not allow users to run shared flows if they have not trusted the author. You can use the following registry entry to disable this security check.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_CURRENT_USER` | `SOFTWARE\Microsoft\Power Automate Desktop` | `DisableAskBeforeRunningASharedFlow` | DWORD |

***Value***

- **1**: Power Automate for desktop doesn't display a dialog to confirm running a shared flow, when the author is not trusted.

## Configure Power Automate for desktop to keep the flow run details

You can use the following registry entry to configure Power Automate for desktop to keep the flow run detail logs in a local folder.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `KeepRunDefinitionFilesCopy` | DWORD |

***Value***

- **1**: Power Automate for desktop creates a copy of the `RunDefinition.json` file, preventing the local flow run details from getting cleaned up.

## Configure Power Automate for desktop to prevent cleanup of flow run action details

You can use the following registry entry to configure the cleanup of local flow run action detail logs.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `DisableRunFilesCleanup` | DWORD |

***Value***

- **1**: Flow run action details stored in the `Actions.log` file aren't deleted from the local disk after the run is completed.

## Prevent Power Automate for desktop from running flows containing cloud connectors

You can use the following registry entry to disable the execution of flows containing cloud connectors.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `DisableCloudConnectors` | DWORD |

***Value***

- **1**: The machine can't run desktop flows containing cloud connectors. An error message informs users about the limitation.

## Configure Power Automate for desktop to hide specific or all example categories

Use the following registry entry to govern which example categories are visible, addressing the security concern of examples not being governed by data loss prevention (DLP) rules.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `DisableExamples` | Multi-String Value |

***Value***

- **All**: Disables all examples and hides the Examples tab completely.
- **Excel Automation, Web Automation, Desktop Automation, Datetime Handling, PDF Automation, Text Manipulation, Scripting, Flow Control**: Hides specific categories.

Multiple values can be set to hide multiple categories.

## Improve troubleshooting of the Power Automate troubleshooter

You can use the following registry entry to permit the use of the verbose logging functionality in the troubleshooter.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `AllowVerboseLogging` | DWORD |

***Value***

- **1**: The verbose logging feature is available to use via the troubleshooter of Power Automate for desktop.

## Turn on verbose logging state in Power Automate for desktop

You can use the following registry entry to turn on the verbose logging state for Power Automate for desktop.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_CURRENT_USER` | `SOFTWARE\Microsoft\Power Automate Desktop` | `UseVerboseLogging` | DWORD |

***Value***

- **1**: The verbose logging state is turned on for Power Automate for desktop.

## Allow users to register their machine to a different tenant in Power Automate machine-runtime app

> [!NOTE]
> This registry entry applies to Power Automate desktop version 2.24 and later.

You can use the following registry entry to allow machine registrations to tenants that are different from the machine joined Microsoft Entra tenant.

| Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Registration` | `AllowedRegistrationTenants` | String |

***Value***

- **AllowedRegistrationTenants:** (for example, `3EF1D993-CBD4-4DEA-A50E-939AEDB23F21,5B19777D-814C-43F3-9317-CDBAD0846ED8`): The tenants with the specified IDs can be used during machine registration.

## Allow users to register their machine to any tenant in Power Automate machine-runtime app

> [!NOTE]
> This registry entry applies to Power Automate desktop version 2.24 and later.

You can use the following registry entry to allow machine registrations to any tenant.

 | Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Registration` | `AllowRegisteringOutsideOfAADJoinedTenant` | DWORD |

***Value***

- **1**: Machines can register to any tenant.

## Allow users to switch registration of their machine to a different tenant in Power Automate machine-runtime app

> [!NOTE]
> This registry entry applies to Power Automate desktop version 2.24 and later.

You can use the following registry entry to allow switching machine registration to a different tenant.

 | Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Registration` | `AllowTenantSwitching` | DWORD |

***Value***

- **1**: Machine registration can switch to another tenant.

## Configuring Power Automate for Desktop to disable UNC paths in action inputs

> [!NOTE]
> This registry entry applies to Power Automate desktop version 2.55 and later.

IT admins can enhance security by setting the following registry key to disable universal naming convention (UNC) paths in module actions.

This configuration causes any action that contains a UNC path to result in a runtime error.

 | Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `DisableUNCPaths` | DWORD |

***Value***

- **1**: Disables the support of UNC paths in Power Automate for desktop.

## Prevent users from using the copilot's generative answers capability

To prevent your users from using the copilot's generative answers capability, Power Platform administrators turn off the **Copilot help assistance in Power Automate via Bing** setting in the Power Platform admin center.

## Prevent users from sending copilot related feedback

As a Power Platform admin you can prevent users from sending feedback to Microsoft by disabling the `disableSurveyFeedback` tenant setting. Find more information about viewing and setting tenant settings here:

- [List tenant settings (preview)](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)
- [Set TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)

## Prevent your users from using any copilot capability

To prevent your users from using any copilot capability contact Microsoft Customer Support to disable all copilot functionality in your tenant. More information: [Get Help + Support](/power-platform/admin/get-help-support)


## Video logs

> [!NOTE]
> The video logs registry entries apply to Power Automate desktop version 2.66 and later.

### Enable / disable video logs generation

 | Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `VideoLoggerModeOverride` | DWORD |

***Value***

- **0**: Disable video logs generation
- **1**: Enable video logs generation

### Enable / disable subtitles generation

 | Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `VideoLoggerDisableSubtitles`  | DWORD |

***Value***

- **0**: Disable video subtitles
- **1**: Enable video subtitles

### Configure video duration

 | Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `VideoLogDurationInSeconds`   | DWORD |

***Value***

- **Default**: 60 seconds
- **Dword**: Custom video duration in seconds

### Configure video output path

 | Hive | Key | Name | Type |
|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop\Global` | `VideoLogOutputPath` | String |

***Value***

- **String**: Custom path where videos and subtitles will be saved


## Enable UI Access

> [!NOTE]
> This registry entry applies to Power Automate desktop version 2.68 and later.

To enable UI Access, set the following value in the Windows registry of the machine that needs to automate applications that need
elevated rights:

| Hive | Key | Name | Type |
|---|---|---|---|
| HKEY_LOCAL_MACHINE | SOFTWARE\Wow6432Node\Microsoft\Power Automate Desktop\Global | UseUIAccessAutomationServer | DWORD |

***Value***

- **0**: UI Access is disabled for Power Automate for destkop.
- **1**: UI Access is enabled for Power Automate for destkop.

## Related information

- [Create Power Automate desktop flows](create-flow.md).
- [Run desktop flows](run-desktop-flow.md).
- [Manage desktop flows](manage.md).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
