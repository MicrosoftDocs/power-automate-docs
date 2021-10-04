---
title: Create orders on Dynamics 365 Supply Chain Management | Microsoft Docs
description: Automate quality order creation on Dynamics 365 Supply Chain Management with Robotic Process Automation using Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: desktop-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/26/2021
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create orders on Dynamics 365 Supply Chain Management 

[Dynamics 365](https://dynamics.microsoft.com/) empowers your organization to deliver operational excellence and delight every customer. In order to make your use of Dynamics 365 even more productive and save users time and errors, we are releasing the preview for free automation solutions that will let customers of Dynamics 365 customers automate common tasks.  

In this documentation, we outline the steps needed for administrators to allow users to automate quality order creation for Dynamics 365 [Supply Chain Management](https://dynamics.microsoft.com/supply-chain-management/overview/) and focus on higher-priority activities that require their unique creativity.  

## Prerequisites 

Before starting, we need to prepare your environment with the adequate licenses and software set-up. This section provides a step-by-step for how to get the grounds ready.   

### Software 

You will need to: 
- install the Power Automate for desktop application. Power Automate will carry out the steps in Dynamics 365 as if a human were doing it in front of their computer.  
- Log out of the Dynamics 365 app you wish to automate 
- Get the appropriate security role for the automation to run 

### Log out of the Dynamics 365 app you wish to automate 

In order to do the full automation, please sign out of the application before you run the automation for the first time. You will need to do this if you switch between automation and your account.  

### Get the appropriate security role set up for the account running the automation 

You will need to decide which work account will be running the automation. It can be a dedicated account created by your admin in Azure Active Directory or the account of an existing employee. For the account you end up choosing, you need to check that it has the appropriate security roles so that it can access the surfaces you are automating.  

We recommend the following security roles: 

|Application|Security role|Link to documentation|
|----|----|----|
|Power Platform|Environment admin or environment maker (if the environment already has Dataverse and unattended license needed)||
|Dynamic 365 Supply Chain Management||

### Licenses 

If you already use Power Automate, PowerApps and Dynamics 365 applications on a day-to-day basis, you can skip this section and jump to Installing the Dynamics 365 RPA solutions.  

Otherwise, you will need at least a trial license for these 3 products. This section shows you how to acquire these trial licenses.  

#### Get a trial license for Power Automate  
Power Automate can automate processes by doing what a human would do on a keyboard and screen.  

There are two ways to automate processes: 
1. Attended mode: someone is sitting in front of their computer and watching the process run as if they were doing it themselves manually 
1. Unattended mode: the process is running in the background on distant machines that users don’t see.  

To run attended, users need to acquire **the Power Automate per-user license with RPA**.  
To run unattended, users need to have acquire two licenses: **Power Automate per-user license with RPA and the Power Automate unattended add-on**. 

*Get a trial license for Power Automate per-user license with RPA to run processes in attended mode*

1. From the Power Automate portal, navigate to My Flows then on Desktop Flows 
1. Click the fine print **Start free trial now**

An alternative consists in logging in to Power Automate for desktop and clicking on the **Start free trial** button 

*Add a trial license for Power Automate unattended add-on to run processes in unattended mode*

As an admin, you can get an RPA unattended add-on and assign it to your environment [Power Automate sign-up Q&A in your organization - Power Automate | Microsoft Docs](../organization-q-and-a.md)  

#### Get a trial license for Power Apps 

Please follow the instructions in this PowerApps guide before moving on to the last step! [https://docs.microsoft.com/en-us/powerapps/maker/signup-for-powerapps#get-a-license-from-scratch](https://docs.microsoft.com/powerapps/maker/signup-for-powerapps) 

#### Get a trial license for the Dynamics 365 applications you wish to automate 

To get started with Dynamics 365 Supply Chain Management and automate the quality order creation process, navigate [here](https://dynamics.microsoft.com/en-us/get-started/free-trial/?appname=SCM). 

### Setup steps 

Now that prerequisites are set, we are on our way to get these free solutions that automate the processes. 

#### Install Power Automate for desktop  

1. Click on [this link](https://go.microsoft.com/fwlink/?linkid=2102613.) to install the Power Automate for desktop on the machine that will run the automation then follow the installation wizard. Here is the detailed guide with step-by-step to install Power Automate : [Set up Power Automate for desktop on your device - Power Automate | Microsoft Docs](install.md#install-power-automate) 

1. Make sure you switch the machine setting from PAD to the correct environment that you will install the solution to  

    ![Image1.](./media/dynamics365-RPA/image001.png)

1. Log in https://powerautomate.microsoft.com/manage/flows to create a test cloud flow with manual trigger 

    ![Image2.](./media/dynamics365-RPA/image003.png)
    ![Image3.](./media/dynamics365-RPA/image005.png)

1. Add a desktop flow connector. 
    ![Image4.](./media/dynamics365-RPA/image007.png)
 
Select the Directly to machine connection from that dropdown. then select the machine name where you have installed Power Automate, enter the machine login credential (the username and password that you used to log into this machine.  (View here to learn more about direct machine connectivity). Note this step will not be needed at a later date.
    ![Image5.](./media/dynamics365-RPA/image009.png)
 
## Install the Dynamics 365 RPA solution 

Now that prerequisites are set, we are on our way to get these free solutions that automate the processes.  

1. Download the Dynamics 365 automation solution and save it on your machine [https://aka.ms/D365SCMQualityOrderRPASolution](https://aka.ms/D365SCMQualityOrderRPASolution)

1. Import the Dynamics 365 automation solution in the environment of your choice 

    a. Go to [https://powerautomate.microsoft.com](https://powerautomate.microsoft.com) and log in using your work account 
    b. Select the environment in which you wish to work using the environment picker 
    c. In the vertical menu on the left of your screen, click on **Solutions** 
    d. In the horizontal menu, above the Solutions title, click on **Import** then click on **Browse**
    e. Navigate to the solution file you previously downloaded and double click on it in your file system 
    f. Click **Next**. 

 

1. Configure the connections needed to be used by the solution in the environment 

    a. For each connector that the solution uses, either select an existing connection or create a new one using the Microsoft account or credentials of your choice.  

   ![Image6.](./media/dynamics365-RPA/image011.png)
      
    b. Come back to the tab from which you initiate the above step and click **Refresh** 

    ![Image7.](./media/dynamics365-RPA/image013.png)

    c. Click on Import. The solution explorer shows you a message letting you know the solution is being imported. It takes a few minutes.  

1. Enter the parameters that the solution should use to run the process 

    a. From the Solutions explorer, click on the solution to open it 
    b. You will find there are rows with the Type column that reads Environment Variable. We need to add values for each of these.  

    c. Click on each of the environment variable below and under **Current Value**, click on **Add New Value** to put in your parameter. 

    |Environment variable name|Description|
    |----|----|
    |QOrder Parameter - SCM Portal URL|URL for the SCM environment including parameters for company and form for the InventQualityOrderTable *Example: https://hxoshmyfoodus9o1mf.sandbox.operations.int.dynamics.com/?cmp=USMF&mi=InventQualityOrderTable*|
    |SCM SignIn User|user account to sign into Dynamics 365 SCM *example: helloworld@contoso.com*|
    |QOrder Parameter – Site|Name of the site to use for filling in the quality order creation form.|
    |QOrder Parameter – Test Group|Configure the Testgroup for the quality order creation|
    |QOrder Parameter - Warehouse|Configure the Warehouse for the quality order creation| 

    ![Image8.](./media/dynamics365-RPA/image015.png)

1. Turn on the cloud flow in the solution 

    a. In the solution, click the … menu for the **QOrder - CloudFlow** cloud flow 
    b. Click on **Turn On**

1. Put in the encrypted credentials to be used by the solution to log in to Dynamics 365 

    a. From the solution explorer, click on the line item called **QOrder – Desktop Flow**
    b. Click on **Edit** then **Launch App**
    c. This will open the Power Automate for desktop  
    d. Under the **Subflows** dropdown, double click on **LoginSCM**
    e. In the **LoginSCM** subflow, double click on action 8 
    f. Fill in the **Text** textbox with the password of the account to use during automation 
    
    ![Image9.](./media/dynamics365-RPA/image017.png)
 
1. Share each component of the solution (app, connection, flow, desktop flow) to other users in your company as run only user.  

1. Have the user launch the “QOrder-Application" Power App from their phone and start using it. Watch this video for the scenario demo 

    ![Image10.](./media/dynamics365-RPA/image019.png)

 

## Troubleshooting or Known issues 

|Known issue |Workaround|
|----|----|
|if you acquire the adequate licenses for Power Automate and Power Apps after you install the solution, the flow or app will be turned off.|After you acquire the licenses, go back to the Solution explorer, click on the … menu for the app or flow then click on “Turn On”.| 