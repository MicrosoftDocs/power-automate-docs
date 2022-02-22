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
ms.date: 11/16/2021
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
>Data loss prevention for desktop flows is a preview feature and it's subject to change.

Power Automate provides the ability to create and enforce DLP policies that classify desktop flows modules (or individual module actions) as **business**, **non-business**, or **blocked** categories. This categorization prevents makers from combining modules and actions from different categories into a desktop flow, or between a cloud flow and the desktop flows it uses.

>[!IMPORTANT]
>Data loss prevention for desktop flows is available for versions of Power Automate Desktop 2.14.173.21294 or newer. If you are using an older version, uninstall and update to the latest version.

### Availability 

Data loss prevention (DLP) for desktop flows is now available to all customers in Public Preview at no cost. Administrators can configure their DLP policies and enforce them on desktop flows with PowerShell. 

>[!WARNING]
>- Your administrators can also classify the new desktop flow modules in their DLP policies directly in the Power Platform admin center, but they must opt-in by creating a support ticket. 
>- Your tenant might already have access to the new desktop flow modules in the Power Platform’s DLP experience. This is the case for all customers who were already given access to the feature per the [original release schedule](#original-release-schedule) and who have created or updated a DLP policy with desktop flow modules since. 

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
 
### Background jobs
- Every time a data loss prevention policy changes in your environment, a background job scans all existing flows in the environment, and then suspends the flows that violate the updated policy.
- After a data loss prevention policy changes, the background job automatically turns on all the desktop flows that no longer violate any policies. However, the background job will not automatically turn on cloud flows. Makers have to turn them on manually.

### Known limitations
1. There's no support for cross checking the categories between a cloud flow and the desktop flows it calls. That function is planned to be available during the first quarter of 2022.
1. There's no support for cross checking the modules that are used between a desktop flow and all its child desktop flows. This feature is planned for general availability.
1. There's no support for "Set default group" from admin center for future added new destkop flow modules that allows admin to specify a different default group for any future added new connectors. This support is planned for general availability.  

### Original release schedule

> [!NOTE]
> Below is the original release schedule that was first published on November 2nd, 2022. It is no longer applicable.

|Region|Date Available|
|---|---|
|Canada|2021/11/1|
|Switzerland, Brazil|2021/11/30|
|Asia, UK, Australia, Japan|2021/12/6|
|Europe|2022/02/17|
|US(NAM)|2022/02/17| 
|Government Community Cloud (GCC), Government Community Cloud - High (GCC High), Department of Defense (DoD), China regions|2022/2/17| 



## Next steps

* [Learn more about environments](environments-overview-admin.md)
* [Learn more about Power Automate](getting-started.md)
* [Learn more about the admin center](admin-center-introduction.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]