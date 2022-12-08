---
title: Troubleshoot desktop flows
description: See how to troubleshoot common issues of Power Automate desktop flows.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/29/2022
ms.author: gtrantzas
ms.reviewer: marleon
contributors:
- PetrosFeleskouras
search.app: 
  - Flow 
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

## Resolve sign in and sign out issues

Power Automate uses a file named **msalcache.bin3** to acquire tokens and authenticate users.

If you encounter errors while signing in or signing out, try to erase all the stored tokens by deleting this file. To delete the file, navigate to **C:\Users\Username\AppData\Local\Microsoft\Power Automate Desktop\Cache**.

> [!NOTE]
> If the **AppData** folder isn't visible in your user folder, try to [display hidden files](https://support.microsoft.com/windows/show-hidden-files-0320fe58-0117-fd59-6851-9b7f9840fdb2).

If you have Power Automate installed in another drive, replace **C** with the letter of the respective drive. Also, replace **Username** with the name of your user folder.

After deleting the **msalcache.bin3** file, restart the Power Automate service and sign in to your account.

:::image type="content" source="media/troubleshoot/msal-file.png" alt-text="Screenshot of the msalcache.bin3 file in the file explorer.":::

### Sign in using Web Account Manager (WAM)

By default, Power Automate for desktop uses an Internet Explorer client to facilitate user authentication. If you encounter errors while signing in, try setting it to authenticate users through Web Account Manager (WAM).

WAM allows signing in using accounts already registered to Windows without requiring passwords. You can find more information regarding WAM in [this article](/azure/active-directory/develop/scenario-desktop-acquire-token-wam).

To enable the WAM functionality in Power Automate for desktop, modify the [appropriate registry entry](governance.md#allow-users-to-sign-in-to-power-automate-for-desktop-using-web-account-manager-wam).

## Resolve failed connection between Power Automate components

In some cases, Power Automate may display an error indicating that the connection between its components couldn't be established.

The cause of this error can be another process running a named pipes server in the same machine. This process probably runs with elevated rights using the localhost endpoint. As a result, it blocks other applications from using the endpoint.

To identify whether another process is indeed the issue:

- Close Power Automate and use Windows Task Manager to ensure that its process isn't still running.

- Download the [Sysinternals Suite](/sysinternals/downloads/sysinternals-suite).

- Extract the zip file to a folder on your desktop.

- Run a command prompt session as administrator.

- Navigate to the folder in which you've extracted Sysinternals.

- Run the following command:

  ``` CMD
  handle net.pipe
  ```

  Running this command should display a list of processes that use named pipes and the address they listen to.

  :::image type="content" source="media/troubleshoot/command-prompt.png" alt-text="Screenshot of the results of the handle net.pipe command.":::

- Identify whether a process displaying the string **EbmV0LnBpcGU6Ly8rLw==** exists.

- If such a process exists, stop the process identified in the previous step, and try again to launch Power Automate.

As a permanent fix, you can stop the process causing the issue from running. Alternatively,  if it's an internal process, you can change it to use a more specific endpoint, such as **net.pipe://localhost/something**.

If none of the above is possible, specify Power Automate executables to run as administrator. However, this solution may not solve the issue in all cases, and it will cause a UAC prompt to appear each time.

## Change the on-premises Service account

The UIFlowService uses the virtual account **NT SERVICE\UIFlowService**. This account needs the ability to "Log on as a service" in order to successfully start.

Most environments don't require to change the default configuration. If your company has some restrictions in place, you can either ask your domain administrator to grant **NT SERVICE\UIFlowService** the right to **Log on as a service** or change the account here with an allowed one.

1. Select **Change account**
1. Select **This account**
1. Provide the new account, for example: **DOMAIN\AlexJohnson**
1. Provide the password of this account and select **Configure**

:::image type="content" source="media/troubleshoot/power-automate-troubleshoot-dialog.png" alt-text="Screenshot of the Power Automate troubleshoot dialog.":::

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
    regsvr32  .\Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin.dll"
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

- [Errors related to VM Image](https://go.microsoft.com/fwlink/?linkid=2210382) used in hosted machine
- [Errors related to network connection](https://go.microsoft.com/fwlink/?linkid=2210382) used in hosted machine

Hosted machine provisioning erros:

| ErrorCode                                         | Short Summary                                                                                                                                                                                                                                                                                                             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Learn more                                                                                                        |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| joinDomainFailed                                  | Check and update AD domain credentials for your on-premises network connection and then retry.                                                                                                                                                                                                                            | Joining the (%AdDomainName%) domain failed.   <br>   During %brandName% provisioning, an Active Directory domain join is triggered for the %AdDomainName% domain.   <br>This action has failed. Possible causes for this may include:  <br>Incorrect domain join credentials. <br>Insufficient access to the domain/domain controller using the defined vNet. <br>Internal DNS related issues. <br>Make sure that the AD domain join will be successful and retry provisioning.  | [https://go.microsoft.com/fwlink/?linkid=2156509](https://go.microsoft.com/fwlink/?linkid=2156509%E2%80%AF%C2%A0) |
| domainJoin\_AccountQuotaExceeded                  | This domain account has exceeded the maximum number of computer accounts allowed to create in this domain.                                                                                                                                                                                                                | Domain join account maximum exceeded.<br>The user %DomainJoinUser% has exceeded the maximum number of computer accounts allowed to join this domain. Please raise the limit, or provide a different domain join user account and retry provisioning.                                                                                                                                                                                                                                       | [https://go.microsoft.com/fwlink/?linkid=2169038](https://go.microsoft.com/fwlink/?linkid=2169038)                |
| domainJoin\_AccountLockedOut                      | This domain account is currently locked out and can't be used to join domain.                                                                                                                                                                                                                                             | Domain join account is locked. <br>The user %DomainJoinUser% is currently locked out. Ensure the user is not locked out and retry provisioning.                                                                                                                                                                                                                                                                                                                                            | [https://go.microsoft.com/fwlink/?linkid=2168942](https://go.microsoft.com/fwlink/?linkid=2168942)                |
| domainJoin\_AccountNameOrPasswordIncorrect        | This domain account name or password is incorrect.                                                                                                                                                                                                                                                                        | Domain join account incorrect password.<br>The provided password for %DomainJoinUser% is incorrect. Please update the password in the associated on-premises network connection and retry provisioning.                                                                                                                                                                                                                                                                                    | [https://go.microsoft.com/fwlink/?linkid=2168943](https://go.microsoft.com/fwlink/?linkid=2168943)                |
| domainJoin\_DomainNotExistOrCouldNotBeContacted   | The specified domain either does not exist or could not be contacted.                                                                                                                                                                                                                                                     | The specified domain does not exist or could not be contacted.<br>The %domainName% domain could not be contacted during domain join. Ensure the domain name provided is correct, and available for domain join on the vNet supplied on your on-premises network connection.                                                                                                                                                                                                      | [https://go.microsoft.com/fwlink/?linkid=2175231](https://go.microsoft.com/fwlink/?linkid=2175231)                |
| domainJoin\_AlreadyCloudDomainJoined              | The custom image provided is already domain joined.                                                                                                                                                                                                                                                                       | The custom image provided is already domain joined.<br>The custom image provided may not have been sysprepped correctly, as it appears to be a member of a domain already. Ensure the custom image is removed from the domain and sysprepped successfully before uploading to Windows 365.                                                                                                                                                                                       | [https://go.microsoft.com/fwlink/?linkid=2184378](https://go.microsoft.com/fwlink/?linkid=2184378)                |
| domainJoin\_AccountDisabled                       | This domin account is currently disabled and can't be used to join domain                                                                                                                                                                                                                                                 | Domain join account is disabled.<br>The user account %DomainJoinUser% is disabled. Please enable the account in Active Directory and retry provisioning.                                                                                                                                                                                                                                                                                                                                   |                                                                                                                   |
| domainJoin\_NetworkConnectivityIssue              | The domain network location cannot be reached.                                                                                                                                                                                                                                                                            | The domain network location you are trying cannot be reached. Ensure your Cloud PC's can use your on-premises DNS servers to resolve Azure or Hybrid Azure AD domain join types and that your connectivity is not restricted to these domain join types.                                                                                                                                                                                                                         | [https://go.microsoft.com/fwlink/?linkid=2195207](https://go.microsoft.com/fwlink/?linkid=2195207)                |
| intuneEnrollFailed                                | We can’t complete MEM enrollment of this Cloud PC. Check MEM policy settings and retry. If that doesn’t work, contact Customer support.                                                                                                                                                                                   | Intune MDM enrollment has failed.   <br>During %brandName% provisioning, an Intune MDM enrollment occurs. This action has failed. Possible causes for this may include:  <br>Windows enrollment is blocked in Intune. <br>The Intune endpoints can’t be reached on your vNet.  <br>Your Intune tenant isn’t in a healthy state. <br>Make sure that the Intune MDM enrollment will be successful and retry provisioning.                                                          | https://go.microsoft.com/fwlink/?linkid=2157558                                                                   |
| intuneEnroll\_BlockedByEnrollmentRestriction      | An Intune enrollment restriction exists for this user/tenant that is causing MDM enrollment to fail. Ensure Windows enrollment is allowed in your Intune tenant.                                                                                                                                                          | Intune enrollment restriction blocking enrollment. <br>An Intune enrollment restriction exists for this user/tenant that is causing MDM enrollment to fail. Ensure Windows enrollment is allowed in your Intune tenant.                                                                                                                                                                                                                                                          | https://go.microsoft.com/fwlink/?linkid=2169223                                                                   |
| intuneEnroll\_BlockedByGroupPolicyOrConfigMgr     | A group policy or ConfigMgr is blocking Intune enrollment. This could be caused by the ConfigMgr client installing on the Cloud PC before provisioning is complete. Ensure the device can successfully perform an MDM enrollment into Intune, by delaying the ConfigMgr client installation until provisioning completes. | Intune enrollment has been blocked. <br>A group policy or ConfigMgr is blocking Intune enrollment. This could be caused by the ConfigMgr client installing on the %brandName% before provisioning is complete. Ensure the device can successfully perform an MDM enrollment into Intune, by delaying the ConfigMgr client installation until provisioning completes.                                                                                                             | https://go.microsoft.com/fwlink/?linkid=2169071                                                                   |
| intuneEnroll\_InvalidIntuneSubscriptionOrLicense  | Enrollment failed due to the user/device being unlicensed or using an expired license. Ensure the Intune tenant is healthy and the subscription and licenses are valid.                                                                                                                                                   | Intune enrollment failed due to Intune licensing error <br>Enrollment failed due to the user/device being unlicensed or using an expired license. Ensure the Intune tenant is healthy and the subscription and licenses are valid.                                                                                                                                                                                                                                               | [https://go.microsoft.com/fwlink/?linkid=2168981](https://go.microsoft.com/fwlink/?linkid=2168981)                |
| intuneEnroll\_NetworkConnectivityIssue            | Intune enrollment failed due to DNS or network connectivity issues.                                                                                                                                                                                                                                                       | Intune enrollment failed due to DNS or network connectivity failures.<br>The Intune enrollment endpoints could not be resolved correctly, causing enrollment to fail. Ensure your Cloud PC's can use your on-premises DNS servers to resolve Intune domain names, and that connectivity is not restricted to these endpoints.                                                                                                                                                    | [https://go.microsoft.com/fwlink/?linkid=2172128](https://go.microsoft.com/fwlink/?linkid=2172128)                |
| intuneEnroll\_MdmDiscoveryUrlMisconfigured        | Intune enrollment is required for Cloud PC provisioning. Ensure the MDM discovery URL’s are configured correctly.                                                                                                                                                                                                         | Intune enrollment failed due to incorrect MDM discovery URL <br>Intune enrollment is required for %brandName% provisioning. Ensure the MDM discovery URL’s are configured correctly.                                                                                                                                                                                                                                                                                             | [https://go.microsoft.com/fwlink/?linkid=2169071](https://go.microsoft.com/fwlink/?linkid=2169071)                |
| intuneEnroll\_DelayedEffectivenessOfIntuneLicense | Intune license is not available                                                                                                                                                                                                                                                                                           | Intune enrollment failed as the license is not available<br>A valid Intune license is required for MDM enrollment. Ensure the license is assigned correctly, available for Intune enrollment and retry provisioning.                                                                                                                                                                                                                                                                       | [https://go.microsoft.com/fwlink/?linkid=2181951](https://go.microsoft.com/fwlink/?linkid=2181951)                |
| intuneEnroll\_TenantUnderAccountMove              | Intune tenant maintenance                                                                                                                                                                                                                                                                                                 | Intune tenant maintenance<br>Your Intune tenant is being moved between scale units. Provisioning cannot occur until the maintenance is complete. Contact support for more information.                                                                                                                                                                                                                                                                                                     |                                                                                                                   |
| noEnoughIpAddress                                 | The specified Subnet doesn’t have adequate IP addresses available. Update or adjust the network settings and retry.                                                                                                                                                                                                       | The specified subnet doesn’t have adequate IP addresses available. <br>An IP address couldn’t be allocated during %brandName% provisioning. <br>Make sure that the selected subnet has sufficient available IP addresses and retry provisioning.                                                                                                                                                                                                                                 | https://go.microsoft.com/fwlink/?linkid=2156419                                                                   |
| userNotFound                                      | The user doesn’t exist. We can’t provision this cloud PC.                                                                                                                                                                                                                                                                 | The user %userName% doesn’t exist.  <br>  The user account %userName% didn’t exist at the time of provisioning. This was likely caused by deleting the user. <br>Make sure that the user exists and is assigned a valid provisioning policy and retry.                                                                                                                                                                                                                           | [https://go.microsoft.com/fwlink/?linkid=2157473](https://go.microsoft.com/fwlink/?linkid=2157473)                |
| licenseNotFound                                   | The user no longer has the required license for Deschutes. Contact your licensing Administrator and retry after a license has been assigned.                                                                                                                                                                              | The user %userName% doesn’t have a valid license. <br> Make sure that the user has a valid %brandName% license assigned and retry provisioning.                                                                                                                                                                                                                                                                                                                                  | https://go.microsoft.com/fwlink/?linkid=2157560                                                                   |
| requestDisallowedByPolicy                         | Workspace creation was not allowed by a policy.                                                                                                                                                                                                                                                                           | Azure policy has blocked provisioning. <br>An Azure policy has blocked %brandName% from provisioning into your Azure subscription. <br>Make sure that there is no Azure policy blocking %brandName% from creating resources in the subscription/resource group defined.                                                                                                                                                                                                          | https://go.microsoft.com/fwlink/?linkid=2157257                                                                   |
| canaryCheckUnpass                                 | Canary check didn’t pass. Check canary validation status, and make sure that all settings match provision criteria.                                                                                                                                                                                                       | The on-premises network connection isn't healthy. <br>The on-premises network connection associated with the provisioning policy isn’t healthy. <br>Browse to the on-premises network connection tab, resolve the failed check, and retry provisioning.                                                                                                                                                                                                                          | https://go.microsoft.com/fwlink/?linkid=2157561                                                                   |
| imageDiskSizeOverMatch                            | Selected image size is larger than the cloud PC disk size being provisioned.                                                                                                                                                                                                                                              | The selected image size is larger than the %brandName% disk being provisioned.  <br>The custom image provided must be the same size or smaller than the disk size being provisioned. Users may have more than one size %brandName% assigned, so be sure the uploaded custom image is small enough to be used for all %brandName%'s being provisioned using this provisioning policy.                                                                                             | [https://go.microsoft.com/fwlink/?linkid=2166375](https://go.microsoft.com/fwlink/?linkid=2166375)                |
| internalError                                     | We encountered a service error. Contact Customer support for a resolution.                                                                                                                                                                                                                                                | An unknown error occurred.   <br>We encountered a service error. Please retry provisioning, and contact support if the problem persists. Contact support                                                                                                                                                                                                                                                                                                                                   | [https://go.microsoft.com/fwlink/?linkid=2156691](https://go.microsoft.com/fwlink/?linkid=2156691%E2%80%AF%C2%A0) |
| userNotAvailableInLocalAD                         | The user does not exist in on-premise Active Directory. We cannot provision this Cloud PC                                                                                                                                                                                                                                 | Cloud PC assigned user does not exist in on-premises Active Directory.<br>Ensure the user being assigned to the cloud PC has an on-premises Active Directory and cloud Azure AD user account, and the UPN's match.                                                                                                                                                                                                                                                               | [https://go.microsoft.com/fwlink/?linkid=2170773](https://go.microsoft.com/fwlink/?linkid=2170773)                |
| CpuOrRamNotFitImageOS                             | Cloud PC hardware specification does not meet the minimum Windows 11 requirements.                                                                                                                                                                                                                                        | The selected Cloud PC hardware specification does not meet the minimum requirements for Windows 11.<br>Assign a license with hardware that meets the Windows 11 requirements, or update the provisioning policy with a supported Windows 10 image.                                                                                                                                                                                                                               | [https://go.microsoft.com/fwlink/?linkid=2172506](https://go.microsoft.com/fwlink/?linkid=2172506)                |
| imageNotSupportTPM                                | The selected image is not ready to be used on UEFI enabled Cloud PC's                                                                                                                                                                                                                                                     | Custom images must be configured as Gen 2 images that are configured to support UEFI.<br>Please update your custom image and retry provisioning.                                                                                                                                                                                                                                                                                                                                 | [https://go.microsoft.com/fwlink/?linkid=2172507](https://go.microsoft.com/fwlink/?linkid=2172507)                |
| imageNotSupportedWarning                          | The selected image is out of Windows support lifecycle and may not receive updates.                                                                                                                                                                                                                                       | Windows image out of support<br>The selected Windows image is out of Windows support lifecycle. This may result in no Windows updates being provided. Provisioning for this image will complete, but in the future will be blocked. Please update your provisioning policy with a Windows image within its supported lifecycle.                                                                                                                                                  |                                                                                                                   |
| imageNotSupportedFail                             | The selected image is out of Windows support lifecycle and cannot be used                                                                                                                                                                                                                                                 | Windows image out of support<br>The selected Windows image is out of Windows support lifecycle, and cannot be used. Provisioning using this image will fail. Please update your provisioning policy with a Windows image within its supported lifecycle, and retry provisioning.                                                                                                                                                                                                 |                                                                                                                   |
| endpointCheckFailed                               | During provisioning, a required URL/s couldn't be contacted. Make sure that all of the required URL's are allowed through your firewalls and proxies.                                                                                                                                                                     | During provisioning a Windows 365 required URL/s couldn't be contacted.                                                                                                                       Make sure that all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URL, visit our docs.                                                                                                                                     | [https://go.microsoft.com/fwlink/?linkid=2195207](https://go.microsoft.com/fwlink/?linkid=2195207)                |
| scriptDownloadFailed                              | During provisioning, a required URL/s couldn't be contacted.                                                                                                                                                                                                                                                              | During provisioning, a required URL/s couldn't be contacted.<br>Make sure that all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URL, visit our docs.                                                                                                                                                                                                                                                                   | https://go.microsoft.com/fwlink/?linkid=2195207                                                                   |
| cmdAgentMSIDownloadFailed                         | During provisioning, a required URL/s couldn't be contacted.                                                                                                                                                                                                                                                              | During provisioning, a required URL/s couldn't be contacted.<br>Make sure that all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URL, visit our docs.                                                                                                                                                                                                                                                                   | https://go.microsoft.com/fwlink/?linkid=2195207                                                                   |
| rdAgentPackageDownloadFailed                      | During provisioning, a required WVD URL/s couldn't be contacted.                                                                                                                                                                                                                                                          | During provisioning, a required WVD URL/s couldn't be contacted.<br>Make sure that all of the required URLs are allowed through your firewalls and proxies. For a definitive list of required URL, visit our docs.                                                                                                                                                                                                                                                               | https://go.microsoft.com/fwlink/?linkid=2195207                                                                   |
| AzureADUser\_ResourceNotFound                     | Azure AD user account not found.                                                                                                                                                                                                                                                                                          | The user %userName% doesn’t exist in Azure AD. <br>The user account %userName% didn’t exist at the time of provisioning. This was likely caused by deleting the user.<br>Make sure that the user exists and is assigned a valid provisioning policy and retry.                                                                                                                                                                                                                   | [https://go.microsoft.com/fwlink/?linkid=2157473](https://go.microsoft.com/fwlink/?linkid=2157473)                |
| CreateNic\_ReadOnlyDisabledSubscription           | The Azure subscription provided is disabled.                                                                                                                                                                                                                                                                              | The Azure subscription provided is disabled.<br>Make sure that the Azure subscription is enabled and available for provisioning.                                                                                                                                                                                                                                                                                                                                                 | [https://go.microsoft.com/fwlink/?linkid=2156420](https://go.microsoft.com/fwlink/?linkid=2156420)                |
| CreateNic\_ResourceGroupNotFound                  | The selected Azure resource group is invalid or not found.                                                                                                                                                                                                                                                                | The selected Azure resource group is invalid or not found.<br>Make sure the selected Azure resource group is available to provision resources. Alternatively, update the Azure network connection with another resource group.                                                                                                                                                                                                                                                   | [https://go.microsoft.com/fwlink/?linkid=2156421](https://go.microsoft.com/fwlink/?linkid=2156421)                |
| CreateNic\_ArmAuthorizationFailed                 | Windows 365 does not have sufficient Azure permissions.                                                                                                                                                                                                                                                                   | <br>Windows 365 does not have sufficient Azure permissions.<br>The Windows 365 service does not have authorization to perform action on the Azure subscription.                                                                                                                                                                                                                                                                                                                  | [https://go.microsoft.com/fwlink/?linkid=2156209](https://go.microsoft.com/fwlink/?linkid=2156209)                |

### Flow run failures

- Network Level Authentication (NLA) not disabled

    Network Level Authentication (NLA) must be disabled for unattended runs. You may see the following error details if an unattended flow run is triggered against a machine with NLA enabled:

    **Could not create unattended session with these credentials. Please make sure you have Network Level Authentication (NLA) disabled in your remote settings if you’re using AAD credentials.**

- Active session exists

    When reuse session is disabled, no active user session should be running on the target machine. You may see the following error details when an unattended flow run is triggered against a machine with an active user session:

    **No machine able to run the desktop flow has been found. Aborting execution. Error encountered when connecting to machines: There is a user session on the target machine. Cannot execute unattended desktop flow.**

    To resolve this issue, open the Task Manager and go to the **Users** tab. There, terminate all other user sessions except for the current session, and then log-off from the machine.

    :::image type="content" source="media/troubleshoot/task-manager-sessions.png" alt-text="Screenshot of the Users tab in Task Manager.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
