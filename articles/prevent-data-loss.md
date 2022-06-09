---
title: Introduction to data loss prevention (DLP) policies. | Microsoft Docs
description: Introduction to data loss prevention policies for Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/09/2022
ms.author: deonhe
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - admin
---
# Data loss prevention (DLP) policies


This document introduces you to data loss prevention policies, which help protect your organizational data from being shared with a list of connectors that you define.

## What's a data loss prevention policy?

An organization's data is critical to its success. Its data needs to be readily available for decision-making, but it needs to be protected so that it isn't shared with audiences that shouldn't have access to it. To protect this data, Power Automate provides you with the ability to create and enforce policies that define which connectors can access and share business data. The policies that define how data can be shared are referred to as data loss prevention (DLP) policies.

To learn more about protecting your data, see [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention) in the Microsoft Power Platform admin guide.

>[!IMPORTANT]
>Administrators control data loss prevention policies. Contact your administrator if a data loss prevention policy is blocking your flows from running.

## Data loss prevention (DLP) for desktop flows (preview)

>[!IMPORTANT]
>Data loss prevention for desktop flows is a preview feature at no cost. When this feature becomes generally available in 2022, it will be available for environments with premium accounts only.

Power Automate provides the ability to create and enforce DLP policies that classify desktop flows modules (or individual module actions) as **business**, **non-business**, or **blocked** categories. This categorization prevents makers from combining modules and actions from different categories into a desktop flow, or between a cloud flow and the desktop flows it uses.

>[!IMPORTANT]
>Data loss prevention for desktop flows is available for versions of Power Automate Desktop 2.14.173.21294 or newer. If you are using an older version, uninstall and update to the latest version.

### Availability 

Data loss prevention (DLP) for desktop flows is now available to all customers in Public Preview at no cost. Administrators can configure their DLP policies and enforce them on desktop flows with PowerShell. 

>[!WARNING]
>- Your administrators can also classify the new desktop flow modules in their DLP policies directly in the Power Platform admin center, but they must opt-in by creating a support ticket. 
>- Your tenant might already have access to the new desktop flow modules in the DLP experience. 

### PowerShell support 

Below is a PowerShell script that you can use to add all desktop flow modules to the ‘blocked’ group of a DLP policy. 

```PowerShell
# Step #1: Retrieve a DLP policy named ‘My DLP Policy’ 
  $dlpPolicies = Get-DlpPolicy  
  $dlpPolicy = $dlpPolicies.value | where {$_.displayName -eq 'My DLP Policy'}  

# Step #2: Get all desktop flow modules 
  $desktopFlowModules = Get-DesktopFlowModules  

# Step #3: Convert the list of Desktop Flow modules to a format that can be added to the policy 
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

# Step #2: Get all desktop flow modules 
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
### Below is the list of desktop flow modules that are currently available in DLP: 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.AWS		AWS 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Azure		Azure 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Clipboard		Clipboard 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Cmd		CMD session 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Compression		Compression 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Cryptography		Cryptography 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.CyberArk		CyberArk 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Database		Database 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Display		Message boxes 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Email		Email 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Excel		Excel 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Exchange		Exchange 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.File			File 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Folder		Folder 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.FTP			FTP 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.GoogleCognitive	Google cognitive 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.IBMCognitive		IBM cognitive 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.MicrosoftCognitive	Microsoft cognitive 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.MouseAndKeyboard	Mouse and keyboard 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.OCR			OCR 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Outlook		Outlook 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Pdf			PDF 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Runflow		Run flow 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Scripting		Scripting 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Services		Windows Services 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.System		System 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.TerminalEmulation	Terminal emulation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.UIAutomation		UI automation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Web		HTTP 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.WebAutomation	Browser Automation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.Workstation		Workstation 
- providers/Microsoft.ProcessSimple/operationGroups/DesktopFlow.XML		XML 


>[!Note]
>If your users don't have the latest Power Automate Desktop, they will experience limited data loss prevention policy enforcements. The users will not see the design time error messages when they are trying to run, debug from Power Automate Desktop, or save desktop flows that violate data loss prevention policies. We will have background jobs that will periodically scan desktop flows in the environment, and automatically suspend those desktop flows that violate data loss prevention policies. Users won't be able to run desktop flows from a cloud flow if the desktop flow violates any data loss prevention policy. 

### Creating a data loss prevention (DLP) policy with desktop flows restrictions in the Power Platform admin center


>[!IMPORTANT]
> When admins edit or create a policy, new Desktop flow connectors will be added to the default group and the policy will be applied once it is saved. If the default group is set to "Blocked" and have Desktop flows running in the target environment(s), these will get suspended.


Admins can create data loss prevention policies from https://admin.powerplatform.microsoft.com. They can manage a data loss prevention policy for desktop flows in the same way they manage cloud flow connectors and actions. Desktop flows modules are groups of similar actions as displayed in the Power Automate Desktop user interface. A module is similar to connectors that are used in cloud flows. You can define a data loss prevention policy that manages both desktop flows modules and cloud flows connectors. There are also basic modules such as “Variables” which aren't manageable in the scope of data loss prevention policy because almost all desktop flows need to use those modules. You can learn more about the fundamentals of DLP policies and how to create them in the [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention) section.

When your tenant is opted into the user experience in the Power Platform, your administrators will automatically see the new desktop flow modules in the default data group of the DLP policy they are creating or updating. 

![Screenshot of DLP Prevention.](media\prevent-dlp\prevent-dlp.png)

> [!WARNING]
> When desktop flow modules are added to DLP policies, your tenant’s existing desktop flows will be evaluated against those DLP policies, and they will become suspended if they are non-compliant. Therefore, if your administrator creates or updates the DLP policy without taking notice of the new modules, desktop flows can become unexpectedly suspended.

### After the policy is enabled
-	Makers with the latest Power Automate Desktop will not be able to debug, run, or save desktop flows that have data loss prevention policy violations.
- Makers will not be able to select a desktop flow that is in violation of a data loss prevention policy from a cloud flow step.

> [!NOTE]
>  If your users don't have the latest Power Automate Desktop, they will experience limited data loss prevention policy enforcements. The users will not see the design time error messages when they are trying to run, debug from Power Automate Desktop, or save desktop flows that violate data loss prevention policies. We will have background jobs that will periodically scan desktop flows in the environment, and automatically suspend those desktop flows that violate data loss prevention policies. Users won't be able to run desktop flows from a cloud flow if the desktop flow violates any data loss prevention policy.
 
## DLP enforcement background jobs
- Enforcement and suspension - Every time a data loss prevention policy changes in your environment, a background job scans all existing flows in the environment, evaluates them, and then suspends the flows that violate the updated policy.
- Reactivation - If the DLP enforcement background job finds a desktop flow that no longer violates any DLP, then the background job automatically turns it on. However,  the DLP enforcement background job won't automatically turn on cloud flows.

## DLP enforcement change process
Periodically, DLP enforcement changes are needed. These changes can be a due to new DLP capabilities, an enforcement gap being filled, or a bug fix.
When changes can impact existing flows, the following staged DLP enforcement change management process is used.

1. Investigating - Confirm the need for a DLP enforcement change and investigate the specifics of the change.
1. Learning - Implement the change and gather data about the breadth of the effects of the change. DLP enforcement changes are documented to explain the scope of the change. If the data suggests that some customers will be greatly affected, then communication is sent to those customers letting them know that a change is coming.
1. Soft enforcement - Turn on soft enforcement of DLP violations so owners of existing flows get notified about the change.
    1. When a flow is updated and saved, use the updated DLP enforcement and suspend the flow if needed.
    1. When the background DLP enforcement job finds a violation in an existing flow, notify the flow owners that the flow will be suspended.
1. Hard enforcement - Turn on hard enforcement of DLP violations, so DLP policies are fully enforced on all existing and new flows. The DLP policies will be fully enforced when flows are saved during DLP enforcement background job evaluation.

## DLP enforcement change list
Following is a list of DLP enforcement changes and the date the changes were effective. 

| Date | Description | Reason for change | Stage | Soft Enforcement ETA* | Hard Enforcement ETA*
|-|-|-|-|-|-| 
|May 2022 | Delegated authorization background job enforcement | Flows that use delegated authorization have DLP policies enforced while the flow is being saved, but not during background job evaluation | Learning |June 2, 2022|July 28, 2022|
|May 2022 | Request apiConnection trigger enforcement | DLP policies weren't enforced correctly for some triggers. The affected triggers have type=Request and kind=apiConnection. Many of the affected triggers are instant triggers which are used in instant (manually triggered) flows. The affected triggers include the following. <br> [Power BI](/connectors/powerbi/) - Power BI button clicked  <br> [Teams](/connectors/teams/) - From the compose box  <br> [OneDrive for Business](/connectors/onedriveforbusiness/) - For a selected file  <br> [Dataverse](/connectors/commondataserviceforapps/) - When a flow step runs  <br> [Dataverse (legacy)](/connectors/commondataservice/) - When a record is selected <br> [Excel Online (Business)](/connectors/excelonlinebusiness/) - For a selected row <br> [SharePoint](/connectors/sharepointonline/) - For a selected item <br> [Power Virtual Agents](/connectors/powervirtualagents/) - When Power Virtual agents calls a flow | Learning |June 2, 2022|July 28, 2022|
* *ETA is subject to change and depends on the release schedule. ETA is for the start of the release to production. Release to preview station 1 is approximately 5 days later and release to NAM/US station 5 is approximately 3 weeks later.

## Known limitations
[Learn about DLP known issues](/power-platform/admin/dlp-known-issues)

## Next steps

* [Learn more about environments](environments-overview-admin.md)
* [Learn more about Power Automate](getting-started.md)
* [Learn more about the admin center](admin-center-introduction.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
