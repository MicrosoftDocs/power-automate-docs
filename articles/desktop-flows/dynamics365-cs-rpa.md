---
title: Use RPA with Dynamics 365 Customer Service | Microsoft Docs
description: Use RPA with Dynamics 365 Customer Service.
services: ''
suite: flow
documentationcenter: na
author: MSFTMan
manager: KVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/17/2021
ms.author: Deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---


# Use RPA with Dynamics 365 Customer Service

Automate common activities on Dynamics 365 Customer Service with Robotic Process Automation using Power Automate Desktop.

[Dynamics 365](https://dynamics.microsoft.com/) empowers your organization to deliver operational excellence, bringing delight to every customer. To make your use of Dynamics 365 even more productive, we are releasing the preview of free automation solutions that Dynamics 365 customers can use to automate common tasks.

This article outlines the steps needed for you to automate customer validation in [Dynamics 365 Customer Service](https://dynamics.microsoft.com/customer-service/overview/) and focus on higher-priority activities that require your unique creativity.

## Prerequisites

Here's what you need to prepare your environment.

### Software

Install the following:

- Dynamics 365 Omnichannel for Customer Service.

- Power Automate Desktop. Power Automate Desktop will carry out the steps in Dynamics 365 as if a human were doing it in front of their computer.

- The Contoso CRM app from Microsoft. This app showcases how RPA works. You can use it as an example to build your own RPA action.

>[!IMPORTANT]
>Be sure to [get the appropriate security roles](https://go.microsoft.com/fwlink/p/?linkid=2127645) for the account that runs your automation. This account can be a dedicated one that your admin in Azure Active Directory creates or an employee's account.

Use these recommended security roles.

| **Application**                              | **Security role**                                                                                                                | **Link to documentation**                                                                                                                                                    |
|----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Power Platform                               | Option 1: Environment admin Option 2: Environment maker (if the environment already has Dataverse and unattended license needed) |                                                                                                                                                                              |
| Dynamic 365 Omnichannel for Customer Service | D365 Customer Service administrator                                                                                              | [Enable users for Omnichannel for Customer Service and assign roles \| Microsoft Docs](https://docs.microsoft.com/dynamics365/customer-service/add-users-assign-roles) |

### Licenses

1. Get a trial license for Power Automate Desktop if you don't have a paid license.The Power Automate Desktop license you need depends on the mode in which your automations run. 

   Here are the two modes to automate processes.

   - **Attended mode**: someone is sits at computer and watches the process run as if they were doing it themselves manually. For attended mode, users must have **the Power Automate per-user license with RPA**.

   - **Unattended mode**: the process is runs in the background without any human interaction and it's not visible on the device. For attended mode, users must have two licenses.

      - **The Power Automate per-user license with RPA**
      - **The Power Automate unattended add-on**.


   Follow these steps to get a *Power Automate per-user license with RPA* to run processes in attended mode.

   1. From Power Automate, select **My Flows** > **Desktop flows**.

   1. Select **Start free trial now**.


   To add a trial license for *Power Automate unattended add-on** to run processes in unattended mode, you must ask a tenant admin to get an *RPA unattended add-on* and assign it to your environment [Power Automate sign-up Q&A in your organization](https://docs.microsoft.com/power-automate/organization-q-and-a).

1. Get a trial license for the Dynamics 365 Customer Service app.

1. To get started with [Dynamics 365 Omnichannel for Customer Service](https://dynamics.microsoft.com/get-started/free-trial/?appname=customerservice) and automate the customer validation process.

## Set up your device

Now that prerequisites are set, we are on our way to get these free solutions that automate the processes.

### Install OmniChannel

1. Install [OmniChannel](https://docs.microsoft.com/dynamics365/customer-service/omnichannel-provision-license) in your environment.

### Get the latest updates for your environment

1. Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com), select the environment in which you are interested, and then select **Dynamics 365 apps** at the right side.

   ![](./media/dynamics365-cs-rpa/adb71331d43b4af8d2020a7f8d8351b9.png)

1. Confirm that the **Agent Productivity Tools** and **App profile manager** are updated.

   ![](./media/dynamics365-cs-rpa/8a7f19a752d1ab82678579a46c10da5c.png)

1. If you see **Update available** for **Agent Productivity Tools** and **App profile manager**, select **Update available**.

### Install and configure Power Automate Desktop

Click on [this link](https://go.microsoft.com/fwlink/?linkid=2102613.) to install the Power Automate Desktop app on the machine that will run the automation then follow the installation wizard.

Here is the detailed guide with step-by-step to install Power Automate Desktop:
[Set up Power Automate Desktop on your device](https://docs.microsoft.com/power-automate/desktop-flows/setup#install-power-automate-desktop-on-your-device)

1.  Make sure you switch the machine setting from Power Automate Desktop to the correct environment that you will install the solution to

    ![](./media/dynamics365-cs-rpa/6471971efe1166ab36bcee9a86e77877.png)

2.  Log in <http://powerautomate.microsoft.com/manage/flows> to create a test cloud flow with manual trigger

    ![](./media/dynamics365-cs-rpa/07e8395e96421fad5c15c3634fe5ec6b.png)

    ![Graphical user interface Description automatically generated](./media/dynamics365-cs-rpa/869698e49b4dbbe35e2e9f568ac454f4.png)

3. Add a desktop flow connector.

    ![](./media/dynamics365-cs-rpa/cd51a32dc52d3ef5751d570d762ba8ce.png)

4. Select the **Directly to machine(preview)** connection from that dropdown. then select the machine name where you have installed Power Automate Desktop, enter the machine login credential (the username and password that you used to log into this machine. (View [here](https://flow.microsoft.com/blog/connect-directly-to-machines-and-new-machine-management-for-desktop-flows/) to learn more about direct machine connectivity) (Note this step will not be needed at a later date)

    ![](./media/dynamics365-cs-rpa/6913b7d24177ed1b786a5bd39e381a27.png)

### Install and configure Contoso CRM app

Install contoso_crm.exe to the machine where the automation will be running.
Install location is <https://aka.ms/ContosoCRMApp> (this Contoso app will be used to show you how the end-to-end automation scenario works so you can follow the example to create your own automation)

Note: while downloading and installing this Contoso app, please select “Run anyway”

![](./media/dynamics365-cs-rpa/0f12ae4f564d4b3eaf1591cf8450a350.png)

![](./media/dynamics365-cs-rpa/0a0b22406de3461a9bfe6833bca23dd1.png)

After installing, you can launch the Contoso CRM app from start menu

![](./media/dynamics365-cs-rpa/a41b848b7eaf4662e0a7f896e5ee9237.png)

>   Graphical user interface Description automatically generated

1.  Installing the Dynamics 365 RPA solution

2.  Download the automation solution and save it on your machine by clicking on this link: <https://aka.ms/D365CustomerValidationRPASolution>

3.  Import the Dynamics 365 automation solution in the environment of your choice

    1.  Go to <https://powerautomate.microsoft.com> and log in using your work account

    2.  Select the environment in which you wish to work using the environment picker

    3.  In the vertical menu on the left of your screen, click on **Solutions**

    4.  In the horizontal menu, above the Solutions title, click on **Import** then click on **Browse**

    5.  Navigate to the solution file you previously downloaded and double click on it in your file system

    6.  Click **Next.**

4.  Configure the connections needed to be used by the solution in the environment

    1.  For each connector that the solution uses, either select an existing connection or create a new one using the Microsoft account or
        credentials of your choice. You will be taken to a different tab, make sure to not close the one you came from.

    2.  For the “Desktop connection” domain/user name and password, please make sure you use the machine Windows login credentials.

![](./media/dynamics365-cs-rpa/73b59acc2f814ac19730b649c6bd536b.png)

1.  Come back to the tab from which you initiated the above step and click **Refresh**

![](./media/dynamics365-cs-rpa/e6e2fd827029506a0dbeea9ea1ec494d.png)

1.  Click on **Import.** The solution explorer shows you a message letting you know the solution is being imported. It takes a few minutes.

2.  [Known issue workaround] Open “Case entity session – default template” (or your current case entity session template), open Agent scripts tab, and add “Case agent script with automation”.

    ![](./media/dynamics365-cs-rpa/06e4c682ab470f4e7ac463b6708e8cec.png)

    More info on session template:
    <https://docs.microsoft.com/dynamics365/app-profile-manager/session-templates>

3.  From Dynamics 365 Customer Service app, login to Power Automate

    1.  From the case you are working on, click on the **…** menu then click on **Flow**

![Graphical user interface, text, application Description automatically generated](./media/dynamics365-cs-rpa/32a1301df4867df9c9a9ad325b4b9d64.png)

1.  Click on **Login to Flow**

2.  Authenticate using your Dynamics 365 account

3.  Now open one of your cases using “Shift + Left Click” to launch the productivity tools panel.

![](./media/dynamics365-cs-rpa/15b322dcf54aa0b6469a7b472800ae40.png)

1.  From the Agent Script session in the productivity panel, you will see several agent script step. First one is “Run Automation to validate
    Customer”. Click the Run button and confirm running.

![](./media/dynamics365-cs-rpa/4c5e69e628f7b983ccc5a87b2f7fb514.png)

1.  The automation will soon be kicked-off on the machine where you have installed Power Automate Desktop. You can watch how the automation use the case data, open the Contoso CRM app, finish the look up automatically. After automation run, please refresh the timeline and you will see the logs written back by Automation regarding the run result. See the demo below on how it will be run

    ![A picture containing text, monitor, indoor, screenshot Description automatically generated](./media/dynamics365-cs-rpa/bf728be4c965a04f9d199266accb06bd.gif)

## Customize the Automation Solution for your own need

1.  Now you can start customizing the automation to meet your own unique requirements. To do this, open Power Automate Desktop and find the desktop flow name “Legacy Contoso App Contact Lookup”. Click Edit it.

    ![](./media/dynamics365-cs-rpa/a93f6fd5dd7cf00398816add4711c557.png)

2.  You can save a copy to work on your customizations or work on the template directly.

3.  You will notice there are multiple sub-flows. Each of them are using keyboard or mouse to interact with the Contoso CRM app. You need to update the steps to interact with your legacy app. To learn more, watch PAD tutorials here.

4.  After you test the desktop flow, you can save it. Now open the cloud flow in <https://powerautomate.microsoft.com/manage/solutions> from within the solution tab -\> Customer Service RPA solution

    ![Graphical user interface, text, application Description automatically generated](./media/dynamics365-cs-rpa/4f66650ddfd5e345f0de2499c1f14ede.png)

5.  Open the cloud flow named “Automation to validate customer info”. Expand each action to review. In the Desktop flow action, you can switch to use any desktop flow you want and use any the input/output parameter that you want to use. To learn more, read [here](https://docs.microsoft.com/power-automate/desktop-flows/link-pad-flow-portal) on how to use desktop flow in cloud flow.

6.  Now you can save the cloud flow. Go back to D365 portal and trigger the agent script action to test. You will see your customization  automation start to run.

7.  Once you finished testing, you can share the cloud flow with everyone in the organization with run-only mode (click [here](https://docs.microsoft.com/power-automate/desktop-flows/run-pad-flow#unattended-mode) to learn more) and switch it to run unattended way (click [here](https://docs.microsoft.com/power-automate/desktop-flows/run-pad-flow#unattended-mode) to learn more). So that every agent will be able to reuse the same automation. License wise, the cloud flow should be put under a per flow plan (click [here](https://docs.microsoft.com/power-platform-release-plan/2019wave2/power-automate/new-licensing-options-power-automate-standalone-paid-plans#allocating-the-per-flow-plan-in-the-admin-center) to learn more)

## Troubleshooting and known issues

| Known issue                                                                                            | Workaround                                                                                                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Did not see the productivity tools panel from D365 customer service                                    | Before xxx? You need to install Omni Channel to your environment. Productivity tools don’t show on home session. You need create a new session (Shift-click on case link) to see it. Producitivity tools runtime initialization is async. Please wait 1 – 2 seconds on home session before create new sessions. |
| Agent can’t see the flow                                                                               | Every agent needs to login flow from D365 widget for the first time                                                                                                                                                                                                                                             |
| During install, you will be prompted multiple times for the same confirmation to install.              | Confirm with “yes I am sure to install” every time prompted                                                                                                                                                                                                                                                     |
| The agent script isn’t added to current session template automatically after import the demo solution. | Manually add the agent script to case session template.                                                                                                                                                                                                                                                         |
|                                                                                                        |                                                                                                                                                                                                                                                                                                                 |
