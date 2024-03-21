---
title: Troubleshoot desktop flows
description: See how to troubleshoot common issues of Power Automate desktop flows.
author: PetrosFeleskouras
ms.subservice: desktop-flow
ms.topic: troubleshooting
ms.date: 03/21/2024
ms.author: pefelesk
ms.reviewer: tapanm
contributors:
- PetrosFeleskouras
- johndund
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshoot desktop flows

To open the Power Automate troubleshoot tool:

1. Launch **Power Automate machine runtime**
1. Select **Troubleshoot**
1. Select **Launch Troubleshoot tool**  

>[!NOTE]
>You need to have admin privileges to open the troubleshoot tool from Power Automate machine runtime.

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

## Troubleshoot desktop flow runs

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for the China region. Switch to our machine-management capabilities. [Learn more about the switch from gateways to direct connectivity.](manage-machines.md#switch-from-gateways-to-direct-connectivity)

- If your unattended desktop flow fails with the **cannot create new session** message, perform the following steps to resolve the issue:

    1. On Windows 10 or Windows 11, confirm that you don't have an active user session locked or unlocked on your target machine.

    2. On Windows Server (2016, 2019, or 2022), confirm that you have yet to reach the maximum number of active user sessions configured for your device. Desktop flows can only run if they can create new sessions.

- If the **gateway status** is **offline**, confirm that the device is turned on and connected to the Internet. To find more information regarding gateway troubleshooting, go to [Troubleshoot the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot).

- If the **gateway status** is **online**, try the following actions:

   1. Confirm that the Power Automate for desktop app and services are running on your device.

   1. Restart the service on your device.

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
    cd "C:\Program Files (x86)\Power Automate Desktop\RDP\DVCPlugin\x64"
    ```

1. Run the following two commands:

    ``` PowerShell
    regsvr32 /u .\Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin.dll
    ```

    ``` PowerShell
    regsvr32  .\Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin.dll
    ```

## Troubleshoot missing on-premises data gateway

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for China region. Switch to our machine-management capabilities. To learn more, go to [Switch from gateways to direct connectivity](manage-machines.md#switch-from-gateways-to-direct-connectivity).

The following reasons might cause you to not find your on-premises data gateway in the displayed list on the Power Automate portal.

- The gateway may be installed in a different region than your Power Automate region. To resolve this issue, uninstall the gateway from the device, and then reinstall it, selecting [the correct Power Automate region](../regions-overview.md#region-mappings-for-power-automate-and-gateways).
- The gateway has been deleted by its owner.

## Troubleshoot hosted machines

This section provides suggestions for troubleshooting hosted machine issues.

### Hosted machine errors

- [Errors related to VM Image](/graph/api/resources/cloudpcdeviceimage?#cloudpcdeviceimagestatusdetails-values) used in hosted machine
- [Errors related to network connection](/graph/api/resources/cloudpconpremisesconnectionhealthcheck#cloudpconpremisesconnectionhealthcheckerrortype-values) used in hosted machine

Hosted machine provisioning errors:

| Error code | Short Summary | Description | Learn more |
| ----------| --------------|-------------|------------|
| intuneEnrollFailed | We can’t complete MEM enrollment of this Cloud PC. Check MEM policy settings and retry. If that doesn’t work, contact Customer support. | Intune MDM enrollment has failed. During %brandName% provisioning, an Intune MDM enrollment occurs. This action has failed. Possible causes for this issue include: Windows enrollment is blocked in Intune, the Intune endpoints can’t be reached on your vNet, or your Intune tenant isn’t in a healthy state. Ensure the Intune MDM enrollment will be successful and retry provisioning. | [Troubleshooting Windows enrollment errors](/troubleshoot/mem/intune/device-enrollment/troubleshoot-windows-enrollment-errors) |
| intuneEnroll_BlockedByEnrollmentRestriction | An Intune enrollment restriction exists for this user/tenant, causing MDM enrollment to fail. Ensure Windows enrollment is allowed in your Intune tenant. | Intune enrollment restriction blocking enrollment. An Intune enrollment restriction exists for this user/tenant, causing MDM enrollment to fail. Ensure Windows enrollment is allowed in your Intune tenant. | [Intune enrollment failed](/windows-365/enterprise/provisioning-errors#intune-enrollment-failed) |
| intuneEnroll_BlockedByGroupPolicyOrConfigMgr | A group policy or ConfigMgr is blocking Intune enrollment. This issue could be caused by the ConfigMgr client installing on the Cloud PC before provisioning is complete. Ensure the device can successfully perform an MDM enrollment into Intune by delaying the ConfigMgr client installation until provisioning completes. | Intune enrollment has been blocked. A group policy or ConfigMgr is blocking Intune enrollment. This issue could be caused by the ConfigMgr client installing on the %brandName% before provisioning is complete. Ensure the device can successfully perform an MDM enrollment into Intune by delaying the ConfigMgr client installation until provisioning completes. | [Configure automatic MDM enrollment](/mem/intune/enrollment/windows-enroll#configure-automatic-mdm-enrollment) |
| intuneEnroll_InvalidIntuneSubscriptionOrLicense | Enrollment failed due to the user/device being unlicensed or using an expired license. Ensure the Intune tenant is healthy and the subscription and licenses are valid. | Intune enrollment failed due to Intune licensing error. Enrollment failed due to the user/device being unlicensed or using an expired license. Ensure the Intune tenant is healthy and the subscription and licenses are valid. | [Microsoft Intune licensing](/mem/intune/fundamentals/licenses) |
| intuneEnroll_NetworkConnectivityIssue | Intune enrollment failed due to DNS or network connectivity issues. | Intune enrollment failed due to DNS or network connectivity failures. The Intune enrollment endpoints couldn't be resolved correctly, causing enrollment to fail. Ensure your Cloud PCs can use your on-premises DNS servers to resolve Intune domain names and that connectivity isn't restricted to these endpoints. | [Network requirements](/windows-365/enterprise/requirements-network) |
| intuneEnroll_MdmDiscoveryUrlMisconfigured | Intune enrollment is required for Cloud PC provisioning. Ensure the MDM discovery URLs are configured correctly. | Intune enrollment failed due to an incorrect MDM discovery URL. Intune enrollment is required for %brandName% provisioning. Ensure the MDM discovery URLs are configured correctly. | [Configure automatic MDM enrollment](/mem/intune/enrollment/windows-enroll#configure-automatic-mdm-enrollment) |
| intuneEnroll_DelayedEffectivenessOfIntuneLicense | Intune license isn't available | Intune enrollment failed as the license isn't available. A valid Intune license is required for MDM enrollment. Ensure the license is assigned correctly and available for Intune enrollment and retry provisioning. | [Assign licenses to users so they can enroll devices in Intune](/mem/intune/fundamentals/licenses-assign) |
| intuneEnroll_TenantUnderAccountMove | Intune tenant maintenance | Intune tenant maintenance. Your Intune tenant is being moved between scale units. Provisioning can't occur until the maintenance is complete. Contact support for more information. | |
| noEnoughIpAddress | The specified Subnet doesn’t have adequate IP addresses available. Update or adjust the network settings and retry. | The specified subnet doesn’t have adequate IP addresses available. An IP address couldn’t be allocated during %brandName% provisioning. Ensure the selected subnet has sufficient available IP addresses and retry provisioning. | [Add, change, or delete a virtual network subnet](/azure/virtual-network/virtual-network-manage-subnet) |
| userNotFound | The user doesn’t exist. We can’t provision this cloud PC. | The user %userName% doesn’t exist. The user account %userName% didn’t exist at the time of provisioning. This issue was likely caused by deleting the user. Ensure the user exists and is assigned a valid provisioning policy, then retry. | [Add or delete users using Microsoft Entra ID](/azure/active-directory/fundamentals/add-users-azure-active-directory)|
| licenseNotFound | The user no longer has the required license for Deschutes. Contact your licensing Administrator and retry after a license has been assigned. | The user %userName% doesn’t have a valid license. Ensure the user has a valid %brandName% license assigned and retry provisioning. | [Assign or remove licenses in the Microsoft Entra portal](/azure/active-directory/fundamentals/license-users-groups) |
| requestDisallowedByPolicy | Workspace creation wasn't allowed by a policy. | Azure policy has blocked provisioning. An Azure policy has blocked %brandName% from provisioning into your Azure subscription. Ensure that there's no Azure policy blocking %brandName% from creating resources in the subscription/resource group defined. | [What is Azure Policy?](/azure/governance/policy/overview) |
| canaryCheckUnpass | Canary check didn’t pass. Check the canary validation status, and ensure all settings match provision criteria. | The on-premises network connection isn't healthy. The on-premises network connection associated with the provisioning policy isn’t healthy. Browse to the on-premises network connection tab, resolve the failed check, and retry provisioning. | [Troubleshoot provisioning errors](/windows-365/enterprise/provisioning-errors) |
| imageDiskSizeOverMatch | The selected image size is larger than the cloud PC disk size being provisioned. | The selected image size is larger than the %brandName% disk being provisioned. The provided custom image must be the same size or smaller than the disk size being provisioned. Users may have more than one size %brandName% assigned, so be sure the uploaded custom image is small enough to be used for all %brandName%'s being provisioned using this provisioning policy. | [Device images overview](/windows-365/enterprise/device-images) |
| internalError | We encountered a service error. Contact Customer support for a resolution. | An unknown error occurred. We encountered a service error. Retry provisioning, and contact support if the problem persists. | [Access Help and support](/mem/get-support#access-help-and-support) |
| userNotAvailableInLocalAD | The user doesn't exist in the on-premises Active Directory. We can't provision this Cloud PC. | Cloud PC assigned user doesn't exist in the on-premises Active Directory. Ensure the user is assigned to the cloud PC, has an on-premises Active Directory and cloud Microsoft Entra user account, and the UPN matches. | [Microsoft Entra Connect sync: Understanding Users, Groups, and Contacts](/azure/active-directory/hybrid/concept-azure-ad-connect-sync-user-and-contacts) |
| CpuOrRamNotFitImageOS | Cloud PC hardware specification doesn't meet the minimum Windows 11 requirements. | The selected Cloud PC hardware specification doesn't meet the minimum requirements for Windows 11. Assign a license with hardware that meets the Windows 11 requirements, or update the provisioning policy with a supported Windows 10 image. | 
| imageNotSupportTPM | The selected image isn't ready to be used on UEFI-enabled Cloud PCs. | Custom images must be configured as Gen 2 images that are configured to support UEFI. Update your custom image and retry provisioning. | 
| imageNotSupportedWarning | The selected image is out of Windows support lifecycle and may not receive updates. | Windows image out of support. The selected Windows image is out of the Windows support lifecycle. This issue may result in no Windows updates being provided. Provisioning for this image will be complete, but in the future will be blocked. Update your provisioning policy with a Windows image within its supported lifecycle. | |
| imageNotSupportedFail | The selected image is out of Windows support lifecycle and can't be used. | Windows image out of support. The selected Windows image is out of the Windows support lifecycle and can't be used. Provisioning using this image will fail. Update your provisioning policy with a Windows image within its supported lifecycle, and retry provisioning. | |
| endpointCheckFailed | During provisioning, a required URL/s couldn't be contacted. Ensure all of the required URLs are allowed through your firewalls and proxies. | A Windows 365 required URL(s) couldn't be contacted during provisioning. Ensure all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URLs, refer to the appropriate documentation. | [Network requirements](/windows-365/enterprise/requirements-network) |
| scriptDownloadFailed | During provisioning, a required URL(s) couldn't be contacted. | A required URL/s couldn't be contacted during provisioning. Ensure all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URLs, refer to the appropriate documentation.| [Network requirements](/windows-365/enterprise/requirements-network) |
| cmdAgentMSIDownloadFailed | During provisioning, a required URL(s) couldn't be contacted. | A required URL/s couldn't be contacted during provisioning. Ensure all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URLs, refer to the appropriate documentation. | [Network requirements](/windows-365/enterprise/requirements-network) |
| rdAgentPackageDownloadFailed | During provisioning, a required WVD URL(s) couldn't be contacted. | A required WVD URL/s couldn't be contacted during provisioning. Ensure all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URLs, refer to the appropriate documentation. | [Network requirements](/windows-365/enterprise/requirements-network) |
| AzureADUser_ResourceNotFound | Microsoft Entra D user account not found. | The user %userName% doesn’t exist in Microsoft Entra ID. The user account %userName% didn’t exist at the time of provisioning. This issue was likely caused by deleting the user. Ensure the user exists and is assigned a valid provisioning policy and retry. | [Add or delete users using Microsoft Entra ID](/azure/active-directory/fundamentals/add-users-azure-active-directory) |
| CreateNic_ReadOnlyDisabledSubscription | The Azure subscription provided is disabled. | The provided Azure subscription is disabled. Ensure the Azure subscription is enabled and available for provisioning. | [Reactivate a disabled Azure subscription](/azure/cost-management-billing/manage/subscription-disabled) |
| CreateNic_ResourceGroupNotFound | The selected Azure resource group is invalid or not found. | The selected Azure resource group is invalid or not found. Ensure the selected Azure resource group is available to provision resources. Alternatively, update the Azure network connection with another resource group. | [Tutorial: Grant a user access to Azure resources using the Azure portal](/azure/role-based-access-control/quickstart-assign-role-user-portal) |
| CreateNic_ArmAuthorizationFailed | Windows 365 doesn't have sufficient Azure permissions. | Windows 365 doesn't have sufficient Azure permissions. The Windows 365 service isn't authorized to perform actions on the Azure subscription. | [Assign a user as an administrator of an Azure subscription](/azure/role-based-access-control/role-assignments-portal-subscription-admin) |

### Flow run failures

- Network Level Authentication (NLA) not disabled

    Network Level Authentication (NLA) must be disabled for unattended runs. You may see the following error details if an unattended flow run is triggered against a machine with NLA enabled:

    **Could not create unattended session with these credentials. Please make sure you have Network Level Authentication (NLA) disabled in your remote settings if you’re using Microsoft Entra credentials.**

- Active session exists

    When reuse session is disabled, no active user session should be running on the target machine. You may see the following error details when an unattended flow run is triggered against a machine with an active user session:

    **No machine able to run the desktop flow has been found. Aborting execution. Error encountered when connecting to machines: There is a user session on the target machine. Cannot execute unattended desktop flow.**

    To resolve this issue, open the Task Manager and go to the **Users** tab. There, terminate all other user sessions except for the current session, and then log-off from the machine.

    :::image type="content" source="media/troubleshoot/task-manager-sessions.png" alt-text="Screenshot of the Users tab in Task Manager.":::

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
> We offer full support for all Power Automate for desktop product versions released within a year from the latest public product release. For product releases prior to a year back from the latest release, only issues of severity level **Critical** and **Severity A** are supported. Product fixes are always added to the latest version.
>
>To find more information about severity levels, go to [Support overview](/power-platform/admin/support-overview#what-is-initial-response-time-and-how-quickly-can-i-expect-to-hear-back-from-someone-after-submitting-my-support-request). To see the currently supported releases, go to [Released versions for Power Automate for desktop](/power-platform/released-versions/power-automate-desktop).


[!INCLUDE[footer-include](../includes/footer-banner.md)]

### See also
[Power Automate Troubleshooting](/troubleshoot/power-platform/power-automate/welcome-power-automate)
