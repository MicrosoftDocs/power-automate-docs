---
title: Learn to how to create UI flows with Desktop Automation | Microsoft Docs
description: Learn to how to create UI flows with Desktop Automation.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/19/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Get started with Desktop Automation

Before you can use your device to create and playback automation scripts with Desktop Automation, you’ll need to ensure your machine meets the requirements for [UI flows](https://docs.microsoft.com/power-automate/ui-flows/setup#prerequisites).

>[!TIP]
>Automation scripts in Desktop Automation are called **processes**.

>[!NOTE]
>Before you create a new Desktop Automation process, check the [list of connectors](https://flow.microsoft.com/connectors/) to see if the application you want to automate already has a connector. If it does, consider creating a flow instead of a UI flow. You might also [build your own connector](https://docs.microsoft.com/connectors/custom-connectors/). In general API-based connectors provide a better overall experience than UI automation in terms of scalability, reliability, and lower cost.

>[!TIP]
>To run Desktop Automation automation scripts on your machine from Power Automate, initiate the playback of the scripts from UI flows.

## Prerequisites 

To run Desktop Automation as part of Power Automate, you will need to install UI flows, install and configure the on-premises data gateway on the machine. More information is available [here](https://docs.microsoft.com/power-automate/ui-flows/setup).

## Limitations 

You must have the latest version of each component to record, test or run UI automation.

## Install Desktop Automation

Once UI flows has been installed on your machine, you can continue with installation of Desktop Automation. The Desktop Automation installer contains all the components needed to record, edit, and test automation scripts for desktop.

Follow these steps to install the Desktop Automation application:

1.  Download the Desktop Automation installer.

1.  Open the **Desktop AutomationSetup.exe** file. This file is likely in your **Downloads** folder after you downloaded it in the previous step.

1.  Follow the instructions in the Desktop Automation installer to complete the installation. During installation, ensure the **License Type** is set to **Microsoft Power Automate**.

## Sign-in to Desktop Automation 

Once the installation is completed, you can start Desktop Automation from “%programfiles%\\ \\Desktop Application”. On launch, the application will prompt you to login or start a 30-day trial. If you already have a “Per user plan with
attended RPA” license for Power Automate, you can enter the user credentials you use for the Power Automate service (<https://flow.microsoft.com>). To learn more about this license or to get a trial license, you can go [here](https://flow.microsoft.com/pricing/).

Once signed in, you will see the Desktop Automation Console with a few example processes. For further information on how to get started, you can **Options** \> **Help** to launch the help manual and open the “**Getting Started**” section of Help to go through a few examples of creating simple Processes. In addition, several getting started tutorials are available [here](https://www.winautomation.com/support/tutorials/).

Run Desktop Automation processes from Power Automate

Once you have defined your automation script in Desktop Automation, you can run it from a flow in Power Automate using UI flows’ support for launching applications like the command prompt. To learn more about creating and testing
UI flows, you can go [here](https://docs.microsoft.com/power-automate/ui-flows/create-desktop).

## Running Desktop Automation processes 

To run a Desktop Automation Process without the Console environment, you can use the Desktop AutomationController.EXE command. This process in located in the Desktop Automation installation folder and can be launched from the **Command
Prompt** in Windows. While it has many useful parameters, to launch the automation, you will use the ‘/start’ flag which will start the specified Process. An example of the command would be:

**Desktop AutomationController /start processPath**

*processPath* is the path in the Desktop Automation Console for the Process, from a base directory of My Processes in the Folders Pane on the left side. So, if your Process is in the My Processes directory, the name of the Process is
sufficient. If you have put the Process in a subfolder, you will need to include that information in the processPath. Note that if processPath contains spaces, it should be enclosed in double quotes (e.g. Desktop AutomationController /start "/My Robots/../../process").

## Launching Desktop Automation processes from UI flows

Once you have successfully identified the command to run Desktop Automation processes above, you can now invoke this command directly from UI flows. To do this:

1.  Launch the **Command Prompt** app in Windows.

1.  Add a new step in UI flow recording experience by clicking **Launch Recorder** if you have a blank UI flow. If you already have pre-defined steps in UI flow, you can click **New Step** and then **Record app** to launch the recorder. More information about the recording experience is available [here](https://docs.microsoft.com/power-automate/ui-flows/create-desktop).

1.  Click **Record** in the launched recorder.

1.  Click on the Command line process.

1.  Type in the Desktop AutomationController command you authored above (e.g. Desktop AutomationController /start "/My Robots/../../process").

1.  Click **Done** in the recorder.

You will notice that recorder has added new steps to your UI flow that now includes launching the Desktop AutomationController.


>[!TIP]
>UI flows can run in both attended and unattended automation modes. You can run Desktop AutomationController in both cases as well. If you’re executing UI flows on an unattended cluster, ensure that the Desktop AutomationController
command specified above will run on all machines in the cluster. For more information on attended and unattended UI flows, click [here](https://docs.microsoft.com/power-automate/ui-flows/run-ui-flow).


>[!TIP]
>Desktop AutomationController.exe runs processes in the background. If you’d like to have UI flows wait for Desktop Automation Process automation to complete, you can raise an informational message box at the end of the Desktop Automation Process using the “Display Message” command, and wait in UI flows to click on that message box button.

## Uninstall Desktop Automation

1.  Open the **start** menu \> **Settings** \> **Apps**.

1.  Search for **Desktop Automation**, and then select it.

1.  Select **Uninstall**.

Learn More

-   Learn to [create desktop UI flows](https://docs.microsoft.com/power-automate/ui-flows/create-desktop).

-   Learn how to [run UI flows](https://docs.microsoft.com/power-automate/ui-flows/run-ui-flow).

-   Learn to [manage UI flows.](https://docs.microsoft.com/power-automate/ui-flows/manage)

-   Learn more about the [on-premises gateway](https://docs.microsoft.com/power-automate/gateway-reference#use-a-gateway).


## Product and roadmap questions

**Will Radcliffe’s products and services be supported with MSFT products/services?**

Radcliffe technology will eventually be available as part of Power Automate. As a first step, customers with the *Per user plan with attended RPA* will be able to use Radcliffe’s *Desktop Automation* for authoring and running UI automation. We look forward to sharing more information regarding how our solutions will evolve as a result of this acquisition.

**Will there be any changes to Radcliffe’s products and services after the acquisition?**

Existing Radcliffe customers will not be affected by this announcement. They can continue to use their Radcliffe software under the same terms as they did before the aquisition. Radcliffe customers will continue to receive support from Radcliffe. For new customers looking to use Desktop Automation, it is now available to use as part of the attended [RPA offering in Power Automate](https://aka.ms/rpaDesktopGetStarted).

**How can I get started with Radcliffe?**

Starting today, all existing Power Automate customers can immediately use *Desktop Automation\*[link to download]* to automate legacy tasks in the cloud or on their desktops. Existing UI flows attended users get all the
functionality in Desktop Automation at no additional cost and can now take automation one step further with a rich desktop-based authoring experience. Learn more about [getting started with Desktop Automation](https://docs.microsoft.com/power-automate/ui-flows/overview). Additionally, new users can get started with the [end-to-end automation platform](https://flow.microsoft.com/) that Microsoft is building.  

**How does the technology work?**

Radcliffe uses a variety of techniques for helping customers automate applications on their machines. The experiences include a rich development environment, scripting support, recorders for both browsers and Windows, centralized controls and an image repository, and thousands of other features.

**Should I use Radcliffe’s RPA offering or Microsoft’s RPA offering? How do I choose?**

Customers have a variety of automation needs, and Power Automate provides a rich portfolio of integrated automation tools including, AI, API and UI – that help customers meet these diverse needs. With \*Desktop Automation, customers now have additional choices for creating their workflows in Power Automate, they can build flows with the existing browser-based authoring app, or through the new desktop app with *Desktop Automation\** that *Radcliffe* provides.
