---
title: How to build custom actions in Power Automate for desktop  | Microsoft Docs
description: Building custom actions in Power Automate for desktop 
author: jpad5
ms.topic: conceptual
ms.date: 11/20/2023
ms.subservice: guidance
ms.author: jaypadimiti
ms.reviewer: tapanm-MSFT
contributors: 
  - jpad5
search.audienceType: 
  - flowmaker
  - enduser

---
# How to build custom actions in Power Automate for desktop

Enhance Productivity, Reusability, and Extensibility with custom actions in Power Automate for desktop.

This article discusses how [custom actions in Power Automate for desktop](../../../desktop-flows/custom-actions.md) can help makers create their own reusable actions that can be used across multiple flows. Makers can create custom actions by composing a sequence of steps or functions into a new action. Custom actions can be created using the Power Automate for desktop Actions SDK, which provides a set of APIs that allow makers to create custom actions using .NET language C#. Custom actions can also be shared with other users through the custom actions section in Power Automate portal. The article covers detailed walkthroughs of how to create, build, deploy, use, and update custom actions.

## Overview

Custom actions capability in Power Automate for desktop allows you to create your own reusable actions that can be used across multiple desktop flows. Custom actions can save you time and effort by allowing you to reuse complex or frequently used actions without having to recreate them each time you build a new flow. Makers can apply their existing skills and knowledge to create custom actions that integrate with other systems and services. Additionally, pro-developers can wrap the existing functions or code libraries to make a new custom action that results in increased reusability of organizational assets.

You create custom actions by composing a sequence of methods or functions into a new action.  Once you create a custom action, you can use it in any desktop flow by dragging and dropping it onto the Power Automate desktop designer canvas.
Custom actions can also be shared with other users through the custom actions section in Power Automate portal, which provides a central repository for sharing and discovering custom actions. This means that users can benefit from the expertise and knowledge of others in the organization and can easily find and use custom actions created by other makers.

Overall, custom actions in Power Automate for desktop provide a powerful way to extend the functionality of the product, streamline the flow-building process, and foster collaboration and innovation within the organization.

### What is covered in this article

1. Create your own custom action
2. Build the package and deploy your custom action
3. Use your custom action activity in desktop flow using Power Automate for desktop
4. Update the activity and redeploy the custom action to reflect the updated capability.

### What you need to get started

- Latest version of Power Automate for desktop – [Install Power Automate – Power Automate | Microsoft Learn](../../../desktop-flows/install.md#install-power-automate-using-the-msi-installer)
- C# Authoring Tool such as [Visual Studio Community/Professional/Enterprise 2022](https://visualstudio.microsoft.com/vs/) with the .NET desktop development workload
- Custom Actions SDK – [NuGet Gallery | Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK](https://www.nuget.org/packages/Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK/)
- Digital certificate
  - Generate a self-signed certificate – [Generate Self-Signed Certificates Overview – .NET | Microsoft Learn](/dotnet/core/additional-tools/self-signed-certificates-guide#with-powershell)
  - Enterprise deployment – Your organization’s trusted certificate from certificate authority – [Digital signatures and certificates – Office Support (microsoft.com)](https://support.microsoft.com/office/digital-signatures-and-certificates-8186cd15-e7ac-4a16-8597-22bd163e8e96)
- SignTool
  - [Using SignTool to Sign a File – Win32 apps | Microsoft Learn](/windows/win32/seccrypto/using-signtool-to-sign-a-file)
  - [SignTool | Microsoft Learn](/windows-hardware/drivers/devtest/signtool)
- Windows PowerShell Script (.ps1) – [Create custom actions – Power Automate | Microsoft Learn](../../../desktop-flows/create-custom-actions.md#packaging-everything-in-a-cabinet-file)
  
## Create your own custom action

**Step 1**: Open Visual Studio to create a new project using template of Class Library (.NET Framework).

:::image type="content" source="media/padca-1.png" alt-text="Screenshot of Create C# project dialog box." lightbox="media/padca-1.png" border="true":::

**Step 2**: Configure your new project with project name and location and set the Framework as .NET Framework 4.7.2.

Note: Make sure to follow the naming conventions as described in the documentation – [Create custom actions](../../../desktop-flows/create-custom-actions.md)

:::image type="content" source="media/padca-2.png" alt-text="Screenshot of Create C# class library details." lightbox="media/padca-2.png" border="true":::

**Step 3**: Open Visual Studio’s NuGet Package Manager console

:::image type="content" source="media/padca-3.png" alt-text="Screenshot of .NET Package Manager." lightbox="media/padca-3.png" border="true":::

**Step 4**: Install NuGet package PowerAutomate.Desktop.Actions.SDK using command.

```powershell
Find-Package Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK
NuGet\Install-Package Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK
```

:::image type="content" source="media/padca-4-0.png" alt-text="Screenshot of Command to install Actions SDK" lightbox="media/padca-4-0.png" border="true":::

**Step 5**: Follow the steps laid out in the documentation [Create custom actions](../../../desktop-flows/create-custom-actions.md) to create the Class file for your custom action.
Use the information as reference for your action.

Reference solution archive: [.NET Module Solution](https://github.com/jpad5/pad-customaction-logevent/blob/main/ModulesLogEvent.zip)

**Action**: Write a message to a local file.

**Input parameters**: File name, message to write to the file.

**Output parameters**: Status code – true if successful and false if not successful.

**Class Definition**:

```csharp
using System;
using System.IO;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;

namespace ModulesLogEvent
{
    [Action(Id = "LogEventToFile" , Order = 1, Category = "Logging")]
    [Throws("LogEventError")]
    public class LogEventToFile : ActionBase
    { 
        [InputArgument]
        public string LogFileName { get; set; }

        [InputArgument]
        public string LogMessage { get; set; }

        [OutputArgument]
        public bool StatusCode { get; set; }
    
        public override void Execute(ActionContext context)
        {
            try
            {           
                    // To append all of the text to the file
                    File.AppendAllText(LogFileName, LogMessage);
                    StatusCode = true;  
            }
            catch (Exception e)
            {
                if (e is ActionException) throw;

                throw new ActionException("LogEventError", e.Message, e.InnerException);
            }
        }
    }
}
```

**Resources**:
:::image type="content" source="media/padca-6.png" alt-text="Screenshot of Resources.resx file for a custom module" lightbox="media/padca-6.png" border="true":::

## Build the package and deploy your custom action

In this part, we'll create the package and deploy it to the Power Automate Portal.

**Step 1**: Acquire the digital certificate so the custom action DLL file can be signed.

> [!NOTE]
> Self-signed certificates are only for TEST purposes and are not recommended for production use. For organizational deployment of custom actions in your environment, it is strongly recommended to use a trusted digital certificate as per your organizational > guidelines.

> [!TIP]
> To streamline the process of developing and using custom actions for Power Automate for desktop across your organization, you can bundle a trusted digital certificate with the Power Automate for desktop installer that is distributed through SCCM/Appstore. > This will enable the certificate to be installed automatically on both makers and unattended runtime machines that require Power Automate for desktop, without any need for additional actions.

For illustrative purposes, we'll use a self-signed certificate.

**Refer**: Sample reference script – [CreateAndImportCertToStore.ps1](https://github.com/jpad5/pad-customaction-logevent/blob/main/CreateAndImportCertToStore.ps1)

a. Create a self-signed certificate

:::image type="content" source="media/padca-8.png" alt-text="Screenshot of Steps to create self-signed certificate" lightbox="media/padca-8.png" border="true":::

b. Import the certificate into Certificate store

:::image type="content" source="media/padca-8-1.png" alt-text="Screenshot of importing self-signed certificate" lightbox="media/padca-8-1.png" border="true":::

c. Validate that the imported certificate appears under *Trusted Root Certification Authorities > Certificates* in CertManager tool.

:::image type="content" source="media/padca-8-2-new.png" alt-text="Screenshot of validating certificate in Certificate Manager" lightbox="media/padca-8-2-new.png" border="true":::

**Step 2**: Finalize the custom module created by signing the DLL file using a trusted certificate.

Use Visual Studio’s developer command prompt to use the Signtool for this activity.

```powershell
Signtool sign /f "C:/PADActions/PADCustomActionCert.pfx" /p <YOURCERTPASSWORD> /fd SHA256 "C:/PADActions/PADCustomActionEventLog/Modules.LogEvent.dll"
```

**Step 3**: To deploy the custom action, we need to build the package the contents into a cabinet file (.cab) by using a PowerShell script.

```powershell
.\BuildCAB.ps1 "C:/PADActions/PADCustomActionEventLog" "C:/PADActions/PADCustomActionEventLog" PADCustomActionEventLog.cab
```

Sample script file – [BuildCAB.ps1](https://github.com/jpad5/pad-customaction-logevent/blob/main/BuildCAB.ps1)

**Step 4**: Next, we sign the generated cabinet file using Signtool.

```powershell
Signtool sign /f "C:/PADActions/PADCustomActionCert.pfx" /p <YOURCERTPASSWORD> /fd SHA256 "C:/PADActions/PADCustomActionEventLog/PADCustomActionEventLog.cab"
```

**Step 5**: Navigate to the Power Automate portal’s custom action section to upload the custom action that we created. Provide the name, description and cabinet file and select Upload.

:::image type="content" source="media/padca-12-1-new.png" alt-text="Screenshot of importing custom action package (CAB file) in Power Automate portal" lightbox="media/padca-12-1-new.png" border="true":::

You will receive a notification when the action is successfully uploaded.

So far we packaged the custom action module into a cabinet file and signed it with a trusted certificate. Additionally, we uploaded the custom action cabinet file to the custom action library in the Power Automate portal.

**Refer**: [Upload custom actions](../../../desktop-flows/upload-custom-actions.md)

## Use your custom action activity in desktop flow using Power Automate for desktop

**Step 1**: Create a new desktop flow and select the Asset library icon in the designer. (Alternatively, select *Tools> Asset Library*)

:::image type="content" source="media/padca-14-new.png" alt-text="Screenshot of Navigate to Asset Library in Power Automate for desktop" lightbox="media/padca-14-new.png" border="true":::

**Step 2**: Inspect the custom action available in the Assets Library. We should see the action that we have previously created and uploaded to the custom actions section of Power Automate portal.

Select **Add** to add this custom action to the Actions section of the designer.

:::image type="content" source="media/padca-15-new.png" alt-text="Screenshot of Add custom action from Asset Library" lightbox="media/padca-15-new.png" border="true":::

**Step 3**: Validate that custom action is added successfully, search for it in the Actions search bar in Power Automate for desktop's designer.

:::image type="content" source="media/padca-16-1.png" alt-text="Screenshot of Search for custom action in Power Automate for desktop" lightbox="media/padca-16-1.png" border="true":::

**Step 4**: Drag the custom action or double click it to add to the desktop flow.

**Step 5**: Provide the input parameters and additional steps to test the custom action.

:::image type="content" source="media/padca-19.png" alt-text="Screenshot of Input parameters for custom action" lightbox="media/padca-19.png" border="true":::

Sample desktop flow using the custom action –

:::image type="content" source="media/padca-18.png" alt-text="Screenshot of Using custom action in Desktop flow" lightbox="media/padca-18.png" border="true":::

**Step 6**: Test the flow to see the custom action working in real time.

![Test custom action in Desktop flow](media/PADCustomActionDesktopflowDemo-gif.gif)

> [!NOTE]
> Import the certificate used to sign the Cabinet file to the machine used to build desktop flows with custom actions and to each of the runtime machines that will run the desktop flows.

We successfully created a custom action, packaged the custom action module into a cabinet file, signed it with a trusted certificate, uploaded the custom action cabinet file to the custom action library in the Power Automate portal, created a desktop flow to use the custom action and tested it for a successful run.

## Update and redeploy the custom action to reflect the updated capability

In this part, we'll update the functionality of the custom action by following the previous steps in order.

**Step 1**: Update the class file in Visual Studio solution with new action functionality.

Refer the updated solution archive file for more details – [Updated .NET Module solution](https://github.com/jpad5/pad-customaction-logevent/blob/main/ModulesLogEvent-v2-updated.zip)

Modified the signature of the class file to take in a third input parameter as shown.

```csharp
using System;
using System.IO;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;

namespace ModulesLogEvent
{
    [Action(Id = "LogEventToFile" , Order = 1, Category = "Logging")]
    [Throws("LogEventError")]
    public class LogEventToFile : ActionBase
    { 
        [InputArgument]
        public string LogFileName { get; set; }

        [InputArgument]
        public string LogMessage { get; set; }

        [InputArgument]
        public string LogLevel { get; set; }

        [OutputArgument]
        public bool StatusCode { get; set; }
    
        public override void Execute(ActionContext context)
        {
            try
            {
                    // To append all of the text to the file
                    File.AppendAllText(LogFileName, LogLevel + ": " + LogMessage);
                    StatusCode = true;
            }
            catch (Exception e)
            {
                if (e is ActionException) throw;

                throw new ActionException("LogEventError", e.Message, e.InnerException);
            }
        }
    }
}
```

**Step 2**: Sign the DLL file

**Step 3**: Create the Cabinet file

**Step 4**: Sign the Cabinet file

**Step 5**: Upload the Cabinet file to custom actions section on Power Automate portal.

> [!NOTE]
> Before uploading the updated custom action cabinet file, make sure to analyze the impact of this change as desktop flows with this action will be updated with new capabilities.

:::image type="content" source="media/padca-20-new.png" alt-text="Screenshot of updating the custom action in Power Automate Portal" lightbox="media/padca-20-new.png" border="true":::

**Step 6**: Update the desktop flow as required

To validate the update capability, we added a third input parameter to the custom action. Notice that custom action activity is marked as Error in the designer, and it needs to be updated with new input parameter.

:::image type="content" source="media/padca-24.png" alt-text="Screenshot of refactoring the desktop flow" lightbox="media/padca-24.png" border="true":::

:::image type="content" source="media/padca-25-new.png" alt-text="Screenshot of updated custom action with additional input parameters" lightbox="media/padca-25-new.png" border="true":::

**Step 7**: Test the flow to see the updated custom action working in real time.

![Retest the updated custom action in Desktop flow](media/padcustomaction-update-gif.gif)

In this section, we have successfully updated the underlying functionality of the custom action, built the package, deployed to Power Automate portal, refactored the desktop flow, and validated the functionality by running the desktop flow with updated capabilities of the custom action in Power Automate for desktop.

### Conclusion

[Custom actions in Power Automate for desktop](../../../desktop-flows/custom-actions.md) provides a powerful mechanism for creating actions that meet the specific needs of your organization, while maximizing the reusability of existing assets. By doing so, they help streamline the process of building Power Automate solutions, ultimately improving the efficiency of your organization’s automation efforts.

**Disclaimer**: While the essential features utilized in creating custom actions are supported, the provided solutions, assets and sample scripts serve as an example implementation of these features and doesn't include any support.
