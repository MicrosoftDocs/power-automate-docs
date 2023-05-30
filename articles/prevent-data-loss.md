---
title: Data loss prevention policies
description: Learn about data loss prevention policies for Power Automate.
services: ''
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 05/30/2023
ms.author: cgarty
ms.reviewer: angieandrews
---

# Data loss prevention policies

Data loss prevention (DLP) policies help protect your organizational data from being shared with a list of connectors that you define.

An organization's data is critical to its success. Its data needs to be readily available for decision-making, but it needs to be protected so that it isn't shared with audiences that shouldn't have access to it. To protect this data, Power Automate provides you with the ability to create and enforce policies that define which connectors can access and share business data. The policies that define how data can be shared are referred to as data loss prevention (DLP) policies.

Administrators control DLP policies. If a DLP policy is blocking your flows from running, contact your administrator.

To learn more about protecting your data, go to [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention) in the Microsoft Power Platform admin guide.

## Data loss prevention for desktop flows

Power Automate allows you to create and enforce DLP policies that classify desktop flows modules (or individual module actions) as **business**, **non-business**, or **blocked** categories. This categorization prevents makers from combining modules and actions from different categories into a desktop flow, or between a cloud flow and the desktop flows it uses.

>[!IMPORTANT]
> - Enforcement of DLP policies will be available for [managed environments](/power-platform/admin/managed-environment-overview) only. Effective September 2023, only desktop flows that are located in Managed Environments will be evaluated by DLP policies. 
> - DLP for desktop flows is available for versions of Power Automate for desktop 2.14.173.21294 or later. If you're using an earlier version, uninstall and update to the latest version.

### View desktop flows actions groups in Power Platform admin center

By default, desktop flow action groups don't appear when creating a new DLP policy. As an admin, you need to turn on the **Desktop flows actions in DLP** setting from the Tenant settings.

> [!NOTE]
> The **Desktop flow actions in DLP** setting is already enabled and can't be changed if you've opted for the public preview.

1. Select **Settings** from the header.
2. Select **Power Platform settings**.
3. In the Tenant settings, select **Desktop flows actions in DLP**.
4. Turn on the toggle **Show desktop flow action in DLP policies**, and select **Save**.

    :::image type="content" source="media/prevent-data-loss/dlp-desktop-flows.png" alt-text="Screenshot of DLP for desktop flows setting.":::

You can now create a new policy from Data Policies and you'll be able to classify desktop flows action groups.

### Create a DLP policy with desktop flows restrictions in the Power Platform admin center

When admins edit or create a policy, desktop flow action groups are added to the default group, and the policy is applied once it's saved.

Policy is suspended if the default group is set to **Blocked** and the desktop flows are running in the target environments.

Admins can create data loss prevention policies from [Power Platform admin center](https://admin.powerplatform.microsoft.com). They can manage a data loss prevention policy for desktop flows in the same way they manage cloud flow connectors and actions. Desktop flows modules are groups of similar actions as displayed in the Power Automate for desktop flows user interface. A module is similar to connectors that are used in cloud flows. You can define a data loss prevention policy that manages both desktop flows modules and cloud flows connectors. There are also basic modules such as **Variables**, which aren't manageable in the scope of data loss prevention policy because almost all desktop flows need to use those modules. You can learn more about the fundamentals of DLP policies and how to create them in the [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention) section.

When your tenant is opted into the user experience in the Power Platform, your administrators automatically see the new desktop flow modules in the default data group of the DLP policy they're creating or updating.

:::image type="content" source="media\prevent-dlp\prevent-dlp.png" alt-text="Screenshot of DLP Prevention.":::

> [!WARNING]
> When desktop flow modules are added to DLP policies, your tenant’s existing desktop flows will be evaluated against those DLP policies, and they will become suspended if they're non-compliant. Therefore, if your administrator creates or updates the DLP policy without taking notice of the new modules, desktop flows can become unexpectedly suspended.

### Govern desktop flows outside of DLP

Granular control over desktop flow usage on all machines (described on the above sections) will be only for Managed Environments.

There are other options to govern desktop flow:

1. **Ability to govern desktop flow orchestration**: the desktop flow connector can still be governed in your policies like any other connector in all environments.

1. **Ability to govern usage of Power Automate for desktop**: you can govern Power Automate for desktop flows through GPO. This governance allows you to turn on or off the usage of Power Automate for desktop flows for actions such as to restrict to a set of environments or regions, limit use of account types, restrict manual update. You can [learn more about Governance in Power Automate](/power-automate/desktop-flows/governance).

### Desktop flow modules in DLP

If your users don't have the latest Power Automate for desktop flows, they'll experience limited data loss prevention policy enforcements. The users won't see the design time error messages when they're trying to run, debug from Power Automate for desktop flows, or save desktop flows that violate DLP policies. Background jobs will periodically scan desktop flows in the environment, and automatically suspend those desktop flows that violate data loss prevention policies. Users won't be able to run desktop flows from a cloud flow if the desktop flow violates any data loss prevention policy.

The following list contains the desktop flow modules that are currently available in DLP.

- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.ActiveDirectory ActiveDirectory
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.AWS		AWS 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Azure		Azure
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.WebAutomation	Browser Automation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Cmd		CMD session 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Clipboard		Clipboard 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Compression		Compression 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Cryptography		Cryptography 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.CyberArk		CyberArk 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Database		Database 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Email		Email 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Excel		Excel 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Exchange		Exchange 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.FTP			FTP 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.File			File 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Folder		Folder 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.GoogleCognitive	Google cognitive 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Web		HTTP 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.IBMCognitive		IBM cognitive 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Display		Message boxes 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.MicrosoftCognitive	Microsoft cognitive 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.MouseAndKeyboard	Mouse and keyboard 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.OCR			OCR 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Outlook		Outlook 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Pdf			PDF 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Runflow		Run flow 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Scripting		Scripting 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.System		System 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.TerminalEmulation	Terminal emulation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.UIAutomation		UI automation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Services		Windows Services 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Workstation		Workstation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.XML		XML 

### PowerShell support for desktop flow modules

If you don't want to turn on the feature from Power Platform admin center, you can still use the following PowerShell script to add all desktop flow modules to the ‘blocked’ group of a DLP policy.
If you already turned on the feature, you don't need to use this script.

```PowerShell
# Step #1: Retrieve a DLP policy named ‘My DLP Policy’ 
  $dlpPolicies = Get-DlpPolicy  
  $dlpPolicy = $dlpPolicies.value | where {$_.displayName -eq 'My DLP Policy'}  

# Step #2: Get all Power Automate for desktop flow modules 
  $desktopFlowModules = Get-DesktopFlowModules  

# Step #3: Convert the list of Power Automate for desktop flow modules to a format that can be added to the policy 
  $desktopFlowModulesToAddToPolicy = @()  
        foreach ($modules in $desktopFlowModules) {  
          $desktopFlowModulesToAddToPolicy += [pscustomobject]@{  
          id=$modules.id  
          name=$modules.Properties.displayName  
          type=$modules.type  
      }  
  }  

# Step #4: Add all desktop flow modules to the ‘blocked’ category of ‘My DLP Policy’ 
    Add-ConnectorsToPolicy -Connectors $desktopFlowModulesToAddToPolicy -PolicyName $dlpPolicy.name -classification Blocked -Verbose 
```
 
Below is a PowerShell script that you can use to add two specific desktop flow modules to the default data group of a DLP policy. 

```PowerShell
# Step #1: Retrieve a DLP policy named ‘My DLP Policy’ 
  $dlpPolicies = Get-DlpPolicy  
  $dlpPolicy = $dlpPolicies.value | where {$_.displayName -eq 'My DLP Policy'}  

# Step #2: Get all Power Automate for desktop flow modules 
  $desktopFlowModules = Get-DesktopFlowModules  

# Step #3: Create a list with the ‘Active Directory’ and ‘Workstation’ modules 
  $desktopFlowModulesToAddToPolicy = @()  
  $activeDirectoryModule = $desktopFlowModules | where {$_.properties.displayName -eq "Active Directory"}  
  $desktopFlowModulesToAddToPolicy += [pscustomobject]@{  
    id=$activeDirectoryModule.id  
    name=$activeDirectoryModule.Properties.displayName  
    type=$activeDirectoryModule.type  
  }
  $clipboardModule = $desktopFlowModules | where {$_.properties.displayName -eq "Workstation"}  
  $desktopFlowModulesToAddToPolicy += [pscustomobject]@{  
    id=$clipboardModule.id  
    name=$clipboardModule.Properties.displayName  
    type=$clipboardModule.type  
  }  

# Step #4: Add both modules to the default data group of ‘My DLP Policy’ 
  Add-ConnectorsToPolicy -Connectors $desktopFlowModulesToAddToPolicy -PolicyName $dlpPolicy.name -Classification $dlpPolicy.defaultConnectorsClassification -Verbose 
```

### PowerShell script to opt out the feature

If you don't want to use DLP for desktop flows feature, you can opt out with the following PowerShell script.

```PowerShell
# Step #1: Retrieve the DLP policy named ‘My DLP Policy’

$policies = Get-DlpPolicy
$dlpPolicy = $policies.value | Where-Object { $_.displayName -eq "My DLP Policy" }

# Step #2: Get all Power Automate for desktop flow modules

$desktopFlowModules = Get-DesktopFlowModules
 
# Step #3: Remove Desktop Flow modules from all 3 connector groups of the policy

foreach ($connectorGroup in $dlpPolicy.connectorGroups) {
   $connectorGroup.connectors = $connectorGroup.connectors | Where-Object { $desktopFlowModules.id -notcontains $_.id }
}

# Step #4: Save the updated policy

Set-DlpPolicy -PolicyName $dlpPolicy.name -UpdatedPolicy $dlpPolicy
```

## After the policy is enabled

If your users don't have the latest Power Automate for desktop, they'll experience limited DLP enforcements. The users won't see the design time error messages when they're trying to run, debug from Power Automate for desktop, or save desktop flows that violate data loss prevention policies. You'll have background jobs that will periodically scan desktop flows in the environment, and automatically suspend those desktop flows that violate DLP policies. Users won't be able to run desktop flows from a cloud flow if the desktop flow violates any DLP policy.

Makers with the latest Power Automate for desktop won't be able to debug, run, or save desktop flows that have data loss prevention policy violations. They also won't be able to select a desktop flow that's in violation of a DLP policy from a cloud flow step.

### DLP enforcement and suspension

When you create or edit a flow, Power Automate evaluates it against the current set of DLP policies. If needed, the enforcement is asynchronous and occurs within 24 hours. When you create or change a DLP policy, a background job scans all active flows in the environment, evaluates them, and then suspends the flows that violate the policy. The enforcement is asynchronous and occurs within 24 hours. If a DLP policy change occurs when the previous DLP policy is being evaluated, then the evaluation restarts to ensure the latest policies are enforced. 

Weekly, a background job does a consistency check of all active flows in the environment against the DLP policies to confirm that a DLP policy check wasn't missed.

### DLP reactivation

If the DLP enforcement background job finds a desktop flow that no longer violates any DLP policy, then the background job automatically unsuspends it. However, the DLP enforcement background job won't automatically unsuspend cloud flows.

## DLP enforcement change process

Periodically, DLP enforcement changes are needed. These changes can be due to new DLP capabilities, an enforcement gap being filled, or a bug fix.

When changes can impact existing flows, the following staged DLP enforcement change management process is used.

1. **Investigating**: Confirm the need for a DLP enforcement change and investigate the specifics of the change.

1. **Learning**: Implement the change and gather data about the breadth of the effects of the change. DLP enforcement changes are documented to explain the scope of the change. If the data suggests that customers will be greatly affected, then communication may be sent to those customers, letting them know that a change is coming. If the change has a broad impact on existing flows, then at a later stage in the learning phase when the background DLP enforcement job finds a violation in an existing flow, Power Automate notifies the flow owners that the flow will be suspended, so that they have additional time to respond. 

1. **Notify only**: Turn on email notifications only for DLP violations so owners of existing flows get notified about the upcoming DLP enforcement change. When the background DLP enforcement job finds a violation in an existing flow, notify the flow owners that the flow will be suspended in the future. This mechanism runs weekly.

1. **Design-time enforcement**: Turn on design-time enforcement of DLP violations so that owners of existing flows get notified about the upcoming DLP enforcement change, but any flows that are changed get a full DLP policy evaluation at design time. This is also known as *soft enforcement*.
    
    1. **Design-time**: When a flow is updated and saved, use the updated DLP enforcement and suspend the flow if needed so the maker is immediately aware of the enforcement. 
    
    1. **Background process**: When the background DLP enforcement job finds a violation in an existing flow, notify the flow owners that the flow will be suspended in the future. This mechanism includes creation or changes to DLP policy and consistency checks.

1. **Full enforcement**: Turn on full enforcement of DLP violations, so DLP policies are fully enforced on all existing and new flows. The DLP policies will be fully enforced when flows are saved during DLP enforcement background job evaluation. This is also known as *hard enforcement*.

## DLP enforcement change list

The following is a list of DLP enforcement changes and the date the changes were effective. 

| Date | Description | Reason for change | Stage | Design-time enforcement availablility* | Full enforcement availability*
|----|----|----|----|----|----|
|May 2022 | Delegated authorization background job enforcement | DLP policies enforced are enforced on flows that use delegated authorization while the flow is being saved, but not during background job evaluation. | Full |June 2, 2022|July 21, 2022|
|May 2022 | Request apiConnection trigger enforcement | DLP policies weren't enforced correctly for some triggers. The affected triggers have **type=Request** and **kind=apiConnection**. Many of the affected triggers are instant triggers, which are used in instant (manually triggered) flows. The affected triggers include the following. <br>- [Power BI](/connectors/powerbi/) - Power BI button clicked  <br>- [Teams](/connectors/teams/) - From the compose box (V2)<br>- [OneDrive for Business](/connectors/onedriveforbusiness/) - For a selected file  <br>- [Dataverse](/connectors/commondataserviceforapps/) - When a flow step is run from a business process flow <br>- [Dataverse (legacy)](/connectors/commondataservice/) - When a record is selected <br>- [Excel Online (Business)](/connectors/excelonlinebusiness/) - For a selected row <br>- [SharePoint](/connectors/sharepointonline/) - For a selected item <br>- [Power Virtual Agents](/connectors/powervirtualagents/) - When Power Virtual Agents calls a flow (V2) | Full |June 2, 2022|August 25, 2022|
|July 2022 | Enforce DLP policies on child flows | Enable the enforcement of DLP policies to include child flows. If a violation is found anywhere in the flow tree, the parent flow is suspended. After the child flow is edited and saved to remove the violation, the parent flows can be resaved or reactivated to run the DLP policy evaluation again. A change to no longer block child flows when the HTTP connector is blocked will roll out along with full enforcement of DLP policies on child flows. Once full enforcement is available, the enforcement will include child desktop flows. | Full |February 14, 2023|March 2023|
|January 2023 | Enforce DLP policies on child desktop flows | Enable the enforcement of DLP policies to include child desktop flows. If a violation is found anywhere in the flow tree, the desktop parent flow is suspended. After the child desktop flow is edited and saved to remove the violation, the parent desktop flows are automatically reactivated. | Full | - |March 2023|

*Availability schedule might change and depends on the rollout.

## Flow suspension for DLP violation

Suspended flows show as suspended in the Power Automate maker portal and the Power Platform admin center. When a flow is returned through an API, PowerShell, or the [Power Automate Management connector list flows as admin action](/connectors/flowmanagement/#list-flows-as-admin), the flow will be **State=Suspended**, **FlowSuspensionReason=CompanyDlpViolation**, and will have a **FlowSuspensionTime** value indicating when the flow was suspended.

## Known limitations

[Learn about DLP known issues](/power-platform/admin/dlp-known-issues)

### See also

- [Learn more about environments](environments-overview-admin.md)
- [Learn more about Power Automate](getting-started.md)
- [Learn more about the admin center](admin-center-introduction.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
