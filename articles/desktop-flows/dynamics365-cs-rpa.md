---
title: Use RPA with Dynamics 365 Customer Service | Microsoft Docs
description: Use RPA with Dynamics 365 Customer Service.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: KVivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: desktop-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/27/2021
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---


# Use RPA with Dynamics 365 Customer Service

Automate common activities on Dynamics 365 Customer Service with Robotic Process Automation using Power Automate.

[Dynamics 365](https://dynamics.microsoft.com/) empowers your organization to deliver operational excellence, bringing delight to every customer. To make your use of Dynamics 365 even more productive, we are releasing the preview of free automation solutions that Dynamics 365 customers can use to automate common tasks.

This article outlines the steps needed for you to automate customer validation in [Dynamics 365 Customer Service](https://dynamics.microsoft.com/customer-service/overview/) and focus on higher-priority activities that require your unique creativity.

## Prerequisites

Here's what you need to prepare your environment.

### Software

Install the following:

- Dynamics 365 for Customer Service.

- Power Automate for desktop. Power Automate for desktop will carry out the steps in Dynamics 365 as if a human were doing it in front of their computer.

- The Contoso CRM app from Microsoft. This app showcases how RPA works. You can use it as an example to build your own RPA action.

>[!IMPORTANT]
>Be sure to [get the appropriate security roles](https://go.microsoft.com/fwlink/p/?linkid=2127645) for the account that runs your automation. This account can be a dedicated one that your admin in Azure Active Directory creates or an employee's account.

Use these recommended security roles.

| **Application**                              | **Security role**                                                                                                                | **Link to documentation**                                                                                                                                                    |
|----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Power Platform                               | Option 1: Environment admin <br>Option 2: Environment maker (if the environment already has Dataverse and unattended license needed) |                                                                                                                                                                              |
| Dynamics 365 for Customer Service | D365 Customer Service administrator                                                                                              | [Enable users for Customer Service and assign roles](/dynamics365/customer-service/add-users-assign-roles) |

### Licenses

1. Get a trial license for Power Automate if you don't have a paid license.The Power Automate license you need depends on the mode in which your automations run. 

   Here are the two modes to automate processes.

   - **Attended mode**: someone is sits at computer and watches the process run as if they were doing it themselves manually. For attended mode, users must have **the Power Automate per-user license with RPA**.

   - **Unattended mode**: the process is runs in the background without any human interaction and it's not visible on the device. For attended mode, users must have two licenses.

      - **The Power Automate per-user license with RPA**
      - **The Power Automate unattended add-on**.


   Follow these steps to get a *Power Automate per-user license with RPA* to run processes in attended mode.

   1. From Power Automate, select **My Flows** > **Desktop flows**.

   1. Select **Start free trial now**.


   To add a trial license for *Power Automate unattended add-on** to run processes in unattended mode, you must ask a tenant admin to get an *RPA unattended add-on* and assign it to your environment [Power Automate sign-up Q&A in your organization](../organization-q-and-a.md).

1. Get a trial license for the Dynamics 365 Customer Service app.

1. To get started with [Dynamics 365 for Customer Service](https://dynamics.microsoft.com/get-started/free-trial/?appname=customerservice) and automate the customer validation process.

## Set up your device

Now that prerequisites are set, we are on our way to get these free solutions that automate the processes.

### Get the latest updates for your environment

1. Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com), select the environment in which you are interested, and then select **Dynamics 365 apps** at the right side.

   ![Screenshot ot the Dynamics 365 apps option in the Power Platform admin center.](./media/dynamics365-cs-rpa/adb71331d43b4af8d2020a7f8d8351b9.png)

1. Confirm that the **Agent Productivity Tools** and **App profile manager** are updated.

   ![Screenshot of the Agent Productivity Tools and App profile manager options.](./media/dynamics365-cs-rpa/8a7f19a752d1ab82678579a46c10da5c.png)

1. If you see **Update available** for **Agent Productivity Tools** and **App profile manager**, select **Update available**.

### Install and configure Power Automate

1. Download [Power Automate for desktop](https://go.microsoft.com/fwlink/?linkid=2102613) onto the machine that will run the automation then follow the installation wizard.

1. Follow the steps in the [detailed guide to install Power Automate for desktop](install.md#install-power-automate) onto your device.

1. Change the machine settings from Power Automate to the environment to which  you will install the solution.

    ![Screenshot of the Power Automate for desktop settings pane.](./media/dynamics365-cs-rpa/6471971efe1166ab36bcee9a86e77877.png)

1. Log in and confirm you can create a test cloud flow with a manual trigger.

    ![Screenshot of the option to create a new cloud flow.](./media/dynamics365-cs-rpa/07e8395e96421fad5c15c3634fe5ec6b.png)

    ![Screenshot of the Build an instant cloud flow dialog.](./media/dynamics365-cs-rpa/869698e49b4dbbe35e2e9f568ac454f4.png)

1. Add a desktop flow connector.

    ![Screenshot of the Run a flow built with Power Automate Desktop action.](./media/dynamics365-cs-rpa/cd51a32dc52d3ef5751d570d762ba8ce.png)

1. Select [**Directly to machine**](https://flow.microsoft.com/blog/connect-directly-to-machines-and-new-machine-management-for-desktop-flows/) from the list.

1. Select the machine onto which you installed Power Automate, and then enter the machine login credentials (the username and password that you used to log into this machine). 

    ![Screenshot of the option in the desktop flow connector.](./media/dynamics365-cs-rpa/6913b7d24177ed1b786a5bd39e381a27.png)

## Install and configure Contoso CRM app

1. Download and install [contoso_crm.exe](https://aka.ms/ContosoCRMApp) to the machine where the automation runs.

   This Contoso app is used to show you how the end-to-end automation scenario works so that you can follow the example to create your own automation.

   >[!NOTE]
   >Select **More info** > **Run anyway** on the **Windows protected you PC** screen that appears during the installation.

   ![Screenshot of the Windows protected your PC dialog.](./media/dynamics365-cs-rpa/more-info.png)

   ![Screenshot of the Run anyway option in the Windows protected your PC dialog.](./media/dynamics365-cs-rpa/run-anyway.png)

   After the installation completes, you can run the Contoso CRM app from the Start menu.

   ![Screenshot of the Contoso application.](./media/dynamics365-cs-rpa/a41b848b7eaf4662e0a7f896e5ee9237.png)


## Install the Dynamics 365 RPA solution

1. [Download the automation solution](https://aka.ms/D365CustomerValidationRPASolution) and save it on your machine.

1. Import the Dynamics 365 automation solution into the environment of your choice.

    1. Sign into [Power Automate](https://powerautomate.microsoft.com), and then log in using your work account.

    2. Select the environment that you will use from the environment picker.

    3. In the vertical menu on the left of your screen, select **Solutions**.

    4. In the horizontal menu, above the **Solutions** title, select **Import** >  **Browse**.

    5. Run the solution file you downloaded.

    6. Select **Next.**

1. Configure the connections needed to be used by the solution in the environment

    1. For each connector that the solution uses, either select an existing connection or create a new one using the Microsoft account or credentials of your choice. You will be taken to a different tab, make sure to not close the one you came from.

    2. For the **Desktop connection** domain/username and password, be sure to use the machine's Windows login credentials.

   ![Screenshot of the connections that need to be configured to be used by the solution.](./media/dynamics365-cs-rpa/73b59acc2f814ac19730b649c6bd536b.png)

1. On the tab from which you initiated the previous step, select **Refresh**.

   ![Screenshot of the Refresh option.](./media/dynamics365-cs-rpa/apply-changes.png)

1. Select **Import.** 
   The solution explorer shows you a message that lets you know the solution is being imported. It takes a few minutes.

2. Open **Case entity session – default template** (or your current case entity session template), open **Agent scripts** tab, and then add **Case agent script with automation**.

    ![Screenshot of the Case agent script with automation option.](./media/dynamics365-cs-rpa/case-entity-session.png)

    Learn more about [session templates](/dynamics365/app-profile-manager/session-templates).

3. From the Dynamics 365 Customer Service app, login to Power Automate.

    1. From the case you are working on, select the **…** menu > **Flow**.

      ![Screenshot of the Flow option in the Dynamics 365 Customer Service app.](./media/dynamics365-cs-rpa/32a1301df4867df9c9a9ad325b4b9d64.png)

1. Select **Login to Flow**.

2. Authenticate using your Dynamics 365 account.

3. Now open one of your cases using **Shift + Left Click** to launch the productivity tools panel.

   ![Screenshot of the productivity tools panel.](./media/dynamics365-cs-rpa/15b322dcf54aa0b6469a7b472800ae40.png)

1. From the **Agent Script** session in the productivity panel, you will see several agent script steps. The first step is **Run Automation to validate Customer**. Select the **Run** button and confirm it runs.

   ![Screenshot of the Run Automation to validate Customer button. ](./media/dynamics365-cs-rpa/run-validation.png)

1. The automation starts on the machine where you have installed Power Automate. You can watch how the automation uses the case data, opens the Contoso CRM app, and then finishes the look up automatically. After the automation runs, refresh the timeline to view the logs regarding the run result. Here's a demo on how it runs.

   ![Screenshot of a demo showing the automation.](./media/dynamics365-cs-rpa/bf728be4c965a04f9d199266accb06bd.gif)

## Customize the automation solution

1. Now you can start customizing the automation to meet your unique requirements. To do this, open Power Automate and then select **Edit** on the **Legacy Contoso App Contact Lookup** desktop flow.

   ![Screenshot of the edit button in the Power Automate for desktop console.](./media/dynamics365-cs-rpa/a93f6fd5dd7cf00398816add4711c557.png)

1. You can save a copy to work on your customizations or work on the template directly.

1. Notice that there are multiple child flows. Each child flow uses the keyboard or the mouse to interact with the Contoso CRM app. You need to update the steps to interact with your legacy app.

1. After you test the desktop flow, you can save it. Now open the cloud flow in `https://powerautomate.microsoft.com/manage/solutions` from within the solution tab -\> Customer Service RPA solution

    ![Screenshot of the Solution tab in the Power Automate portal.](./media/dynamics365-cs-rpa/4f66650ddfd5e345f0de2499c1f14ede.png)

1. Open the cloud flow named “Automation to validate customer info”. Expand each action to review. In the Desktop flow action, you can switch to use any desktop flow you want and use any the input/output parameter that you want to use. To learn more, read [here](link-pad-flow-portal.md) on how to use desktop flow in cloud flow.

1. Now you can save the cloud flow. Go back to D365 portal and trigger the agent script action to test. You will see your customization  automation start to run.

1. Once you finished testing, you can share the cloud flow with everyone in the organization with run-only mode (click [here](run-pad-flow.md#unattended-mode) to learn more) and switch it to run unattended way (click [here](run-pad-flow.md#unattended-mode) to learn more). So that every agent will be able to reuse the same automation. License wise, the cloud flow should be put under a per flow plan (click [here](/power-platform-release-plan/2019wave2/power-automate/new-licensing-options-power-automate-standalone-paid-plans#allocating-the-per-flow-plan-in-the-admin-center) to learn more)

## Troubleshooting and known issues

| Known issue                                                                                            | Workaround                                                                                                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Did not see the productivity tools panel from D365 customer service                                    | Productivity tools don’t show on home session. You need create a new session (Shift-click on case link) to see it. Producitivity tools runtime initialization is async. Please wait 1 – 2 seconds on home session before create new sessions. |
| Agent can’t see the flow                                                                               | Every agent needs to login flow from D365 widget for the first time                                                                                                                                                                                                                                             |
| During install, you will be prompted multiple times for the same confirmation to install.              | Confirm with “yes I am sure to install” every time prompted                                                                                                                                                                                                                                                     |
| The agent script isn’t added to current session template automatically after import the demo solution. | Manually add the agent script to case session template.                                                                                                                                                                                                                                                         |
|                                                                                                        |                                                                                                                                                                                                                                                                                                                 |
