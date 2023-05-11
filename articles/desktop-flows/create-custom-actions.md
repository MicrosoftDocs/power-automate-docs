---
title: Create custom actions
description: Learn about how to create custom actions in Power Automate for desktop
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 05/15/2023
ms.author: dipapa
ms.reviewer: tapanm-msft
contributors: 
  - jpapadimitriou
  - tapanm-msft
search.audienceType: 
  - flowmaker
  - enduser
---

# Create Power Automate for desktop actions using the Actions SDK (preview)

[!INCLUDE[cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

You can extend Power Automate for desktop through the Actions SDK (preview). Through the SDK, **custom modules** can be created and then utilized through desktop flows.

> [!NOTE]
> - The term **modules** is equivalent to the term **custom actions group** (preview) and is used to describe custom actions groups (preview) from a pro-dev perspective in this article.
> - The [Actions SDK (preview)](https://go.microsoft.com/fwlink/?linkid=2234545) and [Power Automate Desktop - Visual Studio templates (preview)](https://go.microsoft.com/fwlink/?linkid=2234762) are available as pre-release.

## Prerequisites

To create custom actions in Power Automate for desktop, you need:

- .NET Framework 4.7.2 SDK or later.
- An IDE (Integrated Development Environment such as Visual Studio 2022).
- Power Automate for desktop v2.32 or later.
- The Actions SDK.

This article uses Visual Studio 2022.

## Using Power Automate Desktop Actions - Visual Studio templates (preview)

> [!NOTE]
> Power Automate Desktop Actions - Visual Studio templates (preview) are only supported on Visual Studio 2022 or later when using Visual Studio as the IDE.

You have two options to install  the Power Automate Desktop Actions - Visual Studio templates (preview).

**Option 1**

- Download the NuGet package containing the templates, at [nuget.org](https://go.microsoft.com/fwlink/?linkid=2234762).
- Run the following command in Visual Studio's Package Manager with the appropriate path.

    ```
    dotnet new -i <path_to_Templates_nuget_package>
    ``` 

**Option 2**

Run the following command in Visual Studio's Package Manager.

```
dotnet new -i Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.Templates
``` 

Here's a summary of the steps involved in creating custom actions in Power Automate for desktop:

1. Create a new project using Power Automate Desktop Actions - Visual Studio templates (preview).
1. Build your project.
1. Sign the generated .dll file with a trusted certificate.
1. Pack the generated .dll file along with all its dependencies in a .cab file.
1. Sign the .cab file.

> [!NOTE]
> - Ensure the .dll files describing Custom actions (preview), their dependency .dll files, and the .cab files are properly signed with a digital certificate trusted by your organization. The certificate should also be installed on the device under the trusted root certificate authority where the desktop flow with custom action dependencies is executing.
> - Every project (.dll file) referencing the SDK is a module (custom actions group).
> - Actions of the module are represented by classes inside that project.

After installing the Power Automate Desktop Actions templates for Visual Studio (preview), open Visual Studio and select one of the following options:

:::image type="content" source="media/custom-actions/create-custom-actions/VS-options.png" alt-text="Screenshot of Power Automate Visual Studio templates" border="true":::

| Project Template                      | Description |
| :------------------------------------ | :--------------------------------------------------------------------------------------- |
| Power Automate Empty Module           | Creates an empty project with the references required to create a custom Power Automate module. |
| Power Automate Sample Module          | Creates a sample project containing an action with the references required to create a custom Power Automate module. |

>[!NOTE]
> The following examples uses Power Automate Sample Module Project (a project including a simple action (Action1.cs)).

The following shows how the Action1.cs looks like after creating a Power Automate Sample Module:

```csharp
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;
using System;

namespace Modules.CustomModule
{
    [Action(Id = "Action1", Order = 1)]
    [Throws("ActionError")] // TODO: change error name (or delete if not needed)
    public class Action1 : ActionBase
    {
        #region Properties

        // NOTE: You can find sample description and friendly name entries in Resources

        [InputArgument]
        public string InputArgument1 { get; set; }

        [OutputArgument]
        public string OutputArgument1 { get; set; }

        #endregion

        #region Methods Overrides

        public override void Execute(ActionContext context)
        {
            try
            {
                OutputArgument1 = $"Hello World ${InputArgument1}";
            }
            catch (Exception e)
            {
                if (e is ActionException) throw;

                throw new ActionException("ActionError", e.Message, e.InnerException);
            }
        }

        #endregion
    }
}
```

Actions can have parameters (Input or Output).
Input and Output parameters are represented by C# properties.

Each property should have an appropriate C# attribute, ```[InputArgument]``` or ```[OutputArgument]``` to dictate its type and how they're presented in Power Automate for desktop.
Actions can also be organized in categories by setting the Category property of the Action attribute.

You can prepopulate the parameters by setting a default value C# attribute.

For example, the default value of the InputArgument, is "Developer". In this example, modifying the **Execute** method to return an output, the custom action should look as follows:

```csharp
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;
using System;
using System.ComponentModel;

namespace Modules.CustomModule
{
    [Action(Id = "Action1", Order = 1, Category = "TestCategory")]
    [Throws("ActionError")] // TODO: change error name (or delete if not needed)
    public class Action1 : ActionBase
    {
        #region Properties

        // NOTE: You can find sample description and friendly name entries in Resources

        [InputArgument, DefaultValue("Developer")]
        public string InputArgument1 { get; set; }

        [OutputArgument]
        public string OutputArgument1 { get; set; }

        #endregion

        #region Methods Overrides

        public override void Execute(ActionContext context)
        {
            try
            {
                OutputArgument1 = $"Hello, {InputArgument1}";
            }
            catch (Exception e)
            {
                if (e is ActionException) throw;

                throw new ActionException("ActionError", e.Message, e.InnerException);
            }
        }

        #endregion
    }
}
```

## Custom module name conventions

For the custom modules to be readable through Power Automate for desktop, the AssemblyName must have a filename that follows the below pattern:

```
?*.Modules.?*
Modules.?*
```

For example, **Modules**.ContosoActions.dll

The AssemblyTitle in the project settings specifies the module ID. It can only have alphanumeric characters and underscores and must begin with a letter.

## Adding descriptions to custom actions (preview)

It's recommended to provide a description and a friendly name for the module and its respective actions so that Power Automate for desktop users know how to best utilize them.

Friendly names and descriptions are displayed in the Power Automate for desktop's designer.

Modify the "Resources.resx" file under the Project "Properties" to add a description.

The format of the descriptions for modules and actions should be as follows:

"Module_Description" or "Action_Description" and "Module_FriendlyName" or "Action_FriendlyName" respectively in the name field. The description in the value field.

It's also recommended to provide descriptions and friendly names for parameters. Their format should be as follows: "Action_Parameter_Description", "Action_Parameter_FriendlyName".

These can also be set with the FriendlyName and Description properties of the `[InputArgument]`, `[OutputArgument]` and `[Action]` attributes.

Here's an example of a **Resources.resx** file for a custom module.

:::image type="content" source="media/custom-actions/create-custom-actions/example-resources.png" alt-text="Screenshot of Resources" border="true":::

> [!TIP]
> Consider adding comments in the **Comment** field (such as a Module, or an Action).

Another way to quickly add friendly names and descriptions to actions and parameters is with the FriendlyName and Description properties in the **[Action]**, **[InputArguement]** and **[OutputArguement]** attributes.

> [!NOTE]
> To add a friendly name and description to a module, you must modify the respective .resx file.

## Resources localization

The default language for modules in Power Automate for desktop is assumed to be English.

The **Resources.resx** file should be in English.

Any other languages can be added with extra Resources.{locale}.resx files for localization. For example, **Resources.fr.resx**.

## Creating actions without using the Power Automate Desktop Visual Studio templates (preview)

Begin by creating a new Class Library (.NET Framework) project. Select .NET framework version 4.7.2.

Add the Actions SDK (preview) to your project.

To form an action in the custom module created:

- Delete the autogenerated Class1.cs file. 
- Create a new class inside your project to represent the custom action give it a distinct name. 
- Include the Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK and Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes namespaces.
- All classes representing actions should have an [Action] attribute above your class. 
- The class should have public access and inherit from ActionBase class.

```csharp
using System;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;

namespace Modules.MyCustomModule
{
    [Action(Id = "CustomAction")]
    public class CustomAction : ActionBase
    {
        public override void Execute(ActionContext context)
        {
            throw new NotImplementedException();
        }
    }
}
```

Most actions have parameters (Input or Output). Input and Output parameters are represented by classic C# properties.
Each property should have an appropriate C# attribute, either `[InputArgument]` or `[OutputArgument]` to dictate its type and how they're presented in Power Automate for desktop.
Input arguments can also have default values.

```csharp
using System.ComponentModel;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;

namespace Modules.MyCustomModule
{
    [Action(Id = "CustomAction")]
    public class CustomAction : ActionBase
    {
        [InputArgument, DefaultValue("Developer")]
        public string InputName { get; set; }

        [OutputArgument]
        public string DisplayedMessage { get; set; }

        public override void Execute(ActionContext context)
        {
            DisplayedMessage = $"Hello, {InputName}";
        }
    }
}
```

## Adding descriptions to custom actions (preview) created from scratch

Add a description and a friendly name for the modules and actions so that RPA developers know how to best utilize them.

Power Automate for desktop designer shows friendly names and descriptions.

You can create a "Resources.resx" file inside the Properties folder of the module project. The new ".resx" file should be named "Resources.resx".

The format of the descriptions for Modules and Actions should be as follows:

"Module_Description" or "Action_Description" and "Module_FriendlyName" or "Action_FriendlyName" respectively in the name field. The description in the value field.

It's also recommended to provide descriptions and friendly names for parameters. Their format should be as follows: "Action_Parameter_Description", "Action_Parameter_FriendlyName".

:::image type="content" source="media/custom-actions/create-custom-actions/resources-siimple-actions.png" alt-text="Screenshot of Resources for a simple action" border="true":::

>[!NOTE] 
> It is recommended to denote what it is you are describing in the comment field (e.g. Module, Action etc.)

## Custom module categories

Modules can include categories and subcategories for better action organization.

In order to separate custom actions in categories, subcategories, modify the **[Action]** attribute that precedes the class that represents the custom action in the following manner:

```csharp
[Action(Category = "category.subcategory")]
```

> [!NOTE] 
> A Module can have multiple categories. Similarly, categories can be comprised by subcategories. This structure can be indefinite.

The Order property dictates the order by which actions are previewed in the designer.

Action1 belongs in the category "TestCategory" and it's the first action of the module (this way you explain Order and category with an example).

```csharp
[Action(Id = "Action1", Order = 1, Category = "TestCategory")]
```

## Conditional actions

Conditional actions are actions that return either "True" or "False". 'If file exists' Power Automate for desktop action of the standard library is a good example of a conditional action.

Conditional action example:

```csharp
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;
using System;
using System.ComponentModel;

namespace Modules.CustomModule
{
    [ConditionAction(Id = "ConditionalAction1", ResultPropertyName = nameof(Result))]
    [Throws("ActionError")] // TODO: change error name (or delete if not needed)
    public class ConditionalAction1 : ActionBase
    {
        #region Properties

        public bool Result { get; private set; }

        [InputArgument]
        public string InputArgument1 { get; set; }

        #endregion

        #region Methods Overrides

        public override void Execute(ActionContext context)
        {
            try
            {
                //TODO: add action execution code here
            }
            catch (Exception e)
            {
                if (e is ActionException) throw;

                throw new ActionException("ActionError", e.Message, e.InnerException);
            }
        }

        #endregion
    }
}
```

Notice the **Result** boolean variable.

The **If file exists** action doesn't have an output argument. What it returns is either true or false, depending on what the boolean variable **Result** holds.

## Custom action selectors

There are particular cases, in which a custom action might be required to have more than one variation.

An example is the "Launch Excel" action, from the standard library of actions.

Using the "with a blank document" selector, the flow launches a blank Excel document, whereas using the "and open the following document" selection requires the file path of the file to open.

:::image type="content" source="media/custom-actions/create-custom-actions/img3.png" alt-text="Screenshot of Launch Excel action selectors" border="true":::

The two actions mentioned above are two selectors of the "Launch Excel" base action.

When creating custom actions, you don't have to rewrite functionality.

You can create a single "base" Action, setting its input and output parameters and then choose what would be visible in each flavor by utilizing action selectors.

Through action selectors a level of abstraction can be added over a single action, allowing for the retrieval of specific functionality from the single "base" action without having to rewrite code to form a new variation of the same action every time.

Think of selectors as choices, filtering a single action and presenting only the information required according to the respective selectors.

:::image type="content" source="media/custom-actions/create-custom-actions/img4.png" alt-text="Screenshot of action selectors diagram" border="true":::

To form a new action selector, first create a base action to be utilized by the selectors.

The central action requires either a boolean or an enum property as an input C# argument.

The value of this property determines which selector is utilized.

The most common way is using an enum. Especially when more than two selectors are needed, enums is the only option.

For two selector cases, booleans can be used.

This property, also known as a constraint argument, must have a default value.

The central action is declared as a classic action.

Notice the first property (input argument) is an enum. Based on that property's value, the appropriate selector becomes active.

>[!NOTE]
> To have the arguments ordered in your desired manner, you set the Order value next to the InputArgument attribute.

```csharp
using System.ComponentModel;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Desktop.Actions.SDK.Attributes;

namespace Modules.CustomModule
{
    [Action(Id = "CentralCustomAction")]
    public  class CentralCustomAction : ActionBase
    {
        #region Properties

        [InputArgument, DefaultValue(SelectorChoice.Selector1)]
        public SelectorChoice Selector { get; set; }

        [InputArgument(Order = 1)]
        public string FirstName { get; set; }

        [InputArgument(Order = 2)]
        public string LastName { get; set; }

        [InputArgument(Order = 3)]
        public int Age { get; set; }

        [OutputArgument]
        public string DisplayedMessage { get; set; }

        #endregion

        #region Methods Overrides

        public override void Execute(ActionContext context)
        {
            if (Selector == SelectorChoice.Selector1)
            {
                DisplayedMessage = $"Hello, {FirstName}!";
            }
            else if (Selector == SelectorChoice.Selector2)
            {
                DisplayedMessage = $"Hello, {FirstName} {LastName}!";
            }
            else // The 3rd Selector was chosen 
            {
                DisplayedMessage = $"Hello, {FirstName} {LastName}!\nYour age is: {Age}";
            }
        }

        #endregion
    } // you can see below how to implement an action selector
}
```

## Custom action selectors using enums

In this example, you create three selectors. A simple enum dictates the appropriate selector each time:

```csharp
public enum SelectorChoice
{
    Selector1,
    Selector2,
    Selector3
}
```

Selectors are represented by classes.

Those classes must inherit the ```ActionSelector<TBaseActionClass>``` class.

>[!NOTE]
>**TBaseActionClass** is the base action class name.

In the **UseName()** method, the name of the action selector is declared. This is used as a name of the action to resolve the resources.

```csharp
public class Selector1 : ActionSelector<CentralCustomAction>
{
    public Selector1()
    {
        UseName("DisplayOnlyFirstName");
        Prop(p => p.Selector).ShouldBe(SelectorChoice.Selector1);
        ShowAll();
        Hide(p => p.LastName);
        Hide(p => p.Age);
        // or 
        // Show(p => p.FirstName); 
        // Show(p => p.DisplayedMessage);
    }
}
```

>[!NOTE]
>The **Selector** classes should not be declared as actions. The only action is the central one. Selectors act as filters.

In this specific example we want to display only one of the arguments, thus the others are filtered out. Similarly for **Selector2**:

```csharp
public class Selector2 : ActionSelector<CentralCustomAction>
{
    public Selector2()
    {
        UseName("DisplayFullName");
        Prop(p => p.Selector).ShouldBe(SelectorChoice.Selector2);
        ShowAll();
        Hide(p => p.Age);
    }
}
```

And **Selector3** classes:

```csharp
public class Selector3 : ActionSelector<CentralCustomAction>
{
    public Selector3()
    {
        UseName("DisplayFullDetails");
        Prop(p => p.Selector).ShouldBe(SelectorChoice.Selector3);
        ShowAll();
    }
}
```

The final execution is achieved through the **Execute(ActionContext context)** method that resides in the central action. Based on the selector, the respective values filtered are displayed.

```csharp
public override void Execute(ActionContext context)
{
    if (Selector == SelectorChoice.Selector1)
    {
        DisplayedMessage = $"Hello, {FirstName}!";
    }
    else if (Selector == SelectorChoice.Selector2)
    {
        DisplayedMessage = $"Hello, {FirstName} {LastName}!";
    }
    else // The 3rd Selector was chosen 
    {
        DisplayedMessage = $"Hello, {FirstName} {LastName}!\nYour age is: {Age}";
    }
}
```

## Custom action selectors using boolean

The following is an example utilizing Boolean instead of enums.

```csharp
using System.ComponentModel;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.ActionSelectors;
using Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.Attributes;

namespace Modules.CustomModule
{
    [Action]
    public class CentralCustomActionWithBoolean : ActionBase
    {
        #region Properties

        [InputArgument, DefaultValue(true)]
        public bool TimeExpired { get; set; }

        [InputArgument]
        public string ElapsedTime { get; set; }

        [InputArgument]
        public string RemainingTime { get; set; }

        [OutputArgument]
        public string DisplayedMessage { get; set; }

        #endregion

        #region Methods Overrides

        public override void Execute(ActionContext context)
        {
            DisplayedMessage = TimeExpired ? $"The timer has expired. Elapsed time: {ElapsedTime}" : $"Remaining time: {RemainingTime}";
        }

        #endregion
    }

    public class NoTime : ActionSelector<CentralCustomActionWithBoolean>
    {
        public NoTime()
        {
            UseName("TimeHasExpired");
            Prop(p => p.TimeExpired).ShouldBe(true);
            ShowAll();
            Hide(p => p.RemainingTime);
        }
    }

    public class ThereIsTime : ActionSelector<CentralCustomActionWithBoolean>
    {
        public ThereIsTime()
        {
            UseName("TimeHasNotExpired");
            Prop(p => p.TimeExpired).ShouldBe(false);
            ShowAll();
            Hide(p => p.RemainingTime);
        }
    }
}
```

## Setting descriptions for custom action selectors

To create a description and a summary for selectors, use the following format in the .resx file of your custom module.

```
SelectorName_Description
SelectorName_Summary
```

This can also be done in the selector with the WithDescription and WithSummary methods.

> [!IMPORTANT]
> .dll files describing the custom actions, their .dll dependencies and the .cab file containing everything should be properly signed with a digital certificate trusted by your organization. The certificate should also be installed on each machine on which a desktop flow with custom action dependencies is executed, present under the Trusted Root Certification Authorities.

## Creating and importing a self-signed certificate

To create a self-signed certificate with exportable private key and code sign capabilities:

1. Open Windows PowerShell.
1. Copy and paste the following commands, replacing names as appropriate.

    ```PowerShell
    $certname = "{Your cert name}"
    $cert = New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert  -Subject "CN=$certname" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
    $mypwd = ConvertTo-SecureString -String "{your password}" -Force -AsPlainText
    Export-PfxCertificate -Cert $cert -FilePath "{enter full path of preferred exported 
    location}\{preferred certificate name}.pfx" -Password $mypwd
    ```
1. After the certificate has been created and exported, import it to your trust root.
1. Double-click on the exported certificate.
1. Select Current user.

    :::image type="content" source="media/custom-actions/create-custom-actions/img5.png" alt-text="Screenshot of Certificate Import Wizard" border="true":::

1. In the **Private key protection** screen, use the password provided during the creation of the certificate and also mark the key as exportable and include all extended properties
  
    :::image type="content" source="media/custom-actions/create-custom-actions/img6.png" alt-text="Screenshot of Private key protection screen" border="false":::

1. dd the certificate to the Trusted Root Certification Authorities

    :::image type="content" source="media/custom-actions/create-custom-actions/img7.png" alt-text="Screenshot of Trusted Root Certificate Authorities" border="false":::

## Signing a custom module

To finalize the creation of the custom module, the generated .dll file ([Assembly Name].dll) is required. The file can be found under the bin/release or bin/Debug folder of the project.

Sign the .dll file using a trusted certificate by running the following command in a Developer Command Prompt for Visual Studio:

```
Signtool sign /f {your certificate name}.pfx /p {your password for exporting the certificate} /fd 
SHA256 {path to the .dll you want to sign}.dll
```

> [!NOTE]
> The digital certificate must have an exportable private key and code sign capabilities

## Packaging everything in a cabinet file

The .dll containing the custom actions (preview) and all its dependencies (.dll files) must be packaged in a cabinet file (.cab). 

Create a Windows PowerShell Script (.ps1) containing the following lines: 
```PowerShell
param(

    [ValidateScript({Test-Path $_ -PathType Container})]
	[string]
	$sourceDir,
	
	[ValidateScript({Test-Path $_ -PathType Container})]
    [string]
    $cabOutputDir,

    [string]
    $cabFilename
)

$ddf = ".OPTION EXPLICIT
.Set CabinetName1=$cabFilename
.Set DiskDirectory1=$cabOutputDir
.Set CompressionType=LZX
.Set Cabinet=on
.Set Compress=on
.Set CabinetFileCountThreshold=0
.Set FolderFileCountThreshold=0
.Set FolderSizeThreshold=0
.Set MaxCabinetSize=0
.Set MaxDiskFileCount=0
.Set MaxDiskSize=0
"
$ddfpath = ($env:TEMP + "\customModule.ddf")
$sourceDirLength = $sourceDir.Length;
$ddf += (Get-ChildItem $sourceDir -Filter "*.dll" | Where-Object { (!$_.PSIsContainer) -and ($_.Name -ne "Microsoft.PowerPlatform.PowerAutomate.Desktop.Actions.SDK.dll") } | Select-Object -ExpandProperty FullName | ForEach-Object { '"' + $_ + '" "' + ($_.Substring($sourceDirLength)) + '"' }) -join "`r`n"
$ddf | Out-File -Encoding UTF8 $ddfpath
makecab.exe /F $ddfpath
Remove-Item $ddfpath
```

This Windows PowerShell Script can then be used for creating the .cab file by invoking it in Windows PowerShell and providing:
 
- The directory to the .dll files to be compressed.
- The target directory to place the generated .cab file.

Example:

```PowerShell
.\makeCabFromDirectory.ps1 "{source dir to compress dlls}" "{target dir to save cab}" {cabName}.cab
```

> [!NOTE]
> The .cab file must also be signed. Unsigned .cab files and/or unsigned .dlls contained in them will not be usable in desktop flows and will result in error during inclusion.

## Next steps

[Upload custom actions](upload-custom-actions.md)

### See also

- [Assets library (preview)](assets-library.md)
- [Create custom actions](create-custom-actions.md)
- [Use custom actions](use-custom-actions.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]