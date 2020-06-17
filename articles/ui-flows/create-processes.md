---
title: Learn how to create UI flows with WinAutomation | Microsoft Docs
description: Learn how to create UI flows with WinAutomation.
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

# Use Softomotive's WinAutomation with UI flows
=============================================

(FYI internal readers only: This will be published and replace current contents
at <https://docs.microsoft.com/en-us/power-automate/ui-flows/create-processes>)

Here are some tips before you start,

1.  Your Power Automate Attended RPA license (paid or trial) now gives you full
    access to [WinAutomation](https://www.winautomation.com/). This document
    will guide you through getting WinAutomation Processes running with Power
    Automate.

2.  Automation scripts in WinAutomation are called **Processes**. In Power
    Automate, automation scripts are called *flows* or *UI flows*.

3.  Before you create a WinAutomation Process, check the [list of
    connectors](https://flow.microsoft.com/connectors/) to see if the
    application you want to automate already has a connector. If it does,
    consider creating a flow instead of a UI flow. You might also [build your
    own
    connector](https://docs.microsoft.com/en-us/connectors/custom-connectors/).
    In general API-based connectors provide a better overall experience than UI
    automation in terms of scalability, reliability, and lower cost.

4.  Existing WinAutomation licensed users can learn more at [Softomotive's
    support page](https://support.softomotive.com/support/home)

Prerequisites
-------------

To run WinAutomation as part of Power Automate, you will need to:

1.  Ensure your machine meets the [requirements for UI
    flows](https://docs.microsoft.com/en-us/power-automate/ui-flows/setup#prerequisites).

2.  Install the [UI
    flows](https://docs.microsoft.com/en-us/power-automate/ui-flows/setup) app,
    and then install and configure the on-premises data gateway.

3.  **Warning:** You must have the latest version of WinAutomation and UI flow
    to record, test, or run UI automation.

Licensing
---------

You need to have a Power Automate *Per user plan with attended RPA* to use UI
flows and WinAutomation. If you don't have a paid plan, you can start a trial by
going to Power Automate. See
[here](#how-to-get-output-from-winautomation-and-use-in-power-automate) for more
details.

 

Install WinAutomation
---------------------

1.  Download the [WinAutomation
    installer](https://aka.ms/rpaDesktopAutomationInstallPage).

2.  Open the **WinAutomationSetup.exe** file. This file is likely in
    your **Downloads** folder.

3.  Follow the instructions in the WinAutomation installer to complete the
    installation. During installation, ensure the **License Type** is set
    to **Microsoft Power Automate**.

Sign-in to WinAutomation
------------------------

1.  After the installation completes, start the WinAutomation Console from the
    Windows start menu.

2.  The application will start and prompt you to login. Enter the user
    credentials you use for [Power Automate](https://flow.microsoft.com/). If
    you don’t have a valid license, you will see this error message. You can
    also visit the [pricing page](https://flow.microsoft.com/pricing/) to learn
    more about this license or to get a trial license.

![License error](media/2d995d2d01844482458c06541d1c4b30.png)

1.  **Warning:** You will need your tenant administrator to grant consent to use
    your Power Automate Work or School account with WinAutomation. For that,
    your admin needs to install WinAutomation, sign in with their tenant
    administrator account, and then grant consent.

![Request for permissions](media/7e2c7feb5fa79f570599bffaff3e9887.png)

1.  When you asked to create a Master key during signing in, create one.

2.  Once signed in, you will see the WinAutomation console with a few example
    Processes. To get started, you can go
    to **Options** \> **Help** \> **Getting Started**, and then go through a few
    examples of creating simple Processes or check out information from
    [here](https://docs.winautomation.com/en/building-a-simple-process.html).
    You can learn more from [WinAutomation getting started
    tutorials](https://www.winautomation.com/support/tutorials/).

3.  You can now create your own WinAutomation Processes and test it locally.

Run WinAutomation Processes from Power Automate
-----------------------------------------------

Note: this is a short-term solution. The more integrated experience will be
coming later.

1.  Once you have created your automation Process in WinAutomation, you can run
    it from a flow in Power Automate through UI flows (desktop) attended or
    unattended. (**Note**: to learn more about creating and running UI flows,
    please
    go [here](https://docs.microsoft.com/en-us/power-automate/ui-flows/create-desktop).)

2.  Create a new UI flow (Desktop App type). Delete the default first step of
    “Record app”

![](media/8060b3deb4dc6c1adb3d2bf6623a5b05.png)

1.  Select “+ New step” and select the new **WinAutomation** connector and **Run
    WinAutomation (preview)** action.

![](media/067208afe7d9326a0b3b95d3581ffe6d.png)

1.  In the **Run WinAutomation (preview)** action card, fill in the Process Path
    and any optional command line arguments for the WinAutomation Process that
    you want to run.

![](media/cc73d6d455358810b1866df97e9a95e4.png)

*Note:* Currently WinAutomation Process can only be created and stored locally
only. In the upcoming future release, we will have the capability to store and
share your Process script in the cloud instead.

*Tip 1: Process Path* is the path in the WinAutomation Console for the Process,
from a base directory of My Processes in the Folders Pane on the left side. If
you have put the Process in a subfolder, you will need to include that
information in the ProcessPath. Note, please don’t put quotes around the Process
Path.

**Tip 2**: Please note that the path is case sensitive.

**Tip 3:** You can use UI flows inputs and Dynamic content in the target
WinAutomation Process path and arguments from Power Automate flow.

1.  You can now save and test your UI flow to see how it launches the
    WinAutomation Process

2.  You can then add the UI flow into a flow and connect to other Power Automate
    connectors and triggers.

3.  You can then select *attended* or *unattended* as the run type.

**Tip 4:** In your WinAutomation Process, you can use the *Get Command Line
Arguments* action to retrieve the command line arguments. The arguments are in
an array. Use their index to reference each argument.

**Tip 5**: Do not recommend passing sensitive text type of inputs through the
command line arguments.

**Tip 6:** If you’re executing UI flows on an unattended cluster, ensure that
the WinAutomation are installed on all machines the target Process is copied to
all machines in the cluster. For more information on attended and unattended UI
flows,
click [here](https://docs.microsoft.com/en-us/power-automate/ui-flows/run-ui-flow).

1.  You can save and run the Power Automate flow and see it launches the
    WinAutomation Process. The UI flow will return once the WinAutomation
    Process run completed and you can view the run results from Power Automate.
    If the Process failed, you will be able to see the error messages as well.

>   **Tip**: You might be seeing some general exceptions – \@David Reaburn Add a
>   description. Press tab when you are done.”. In that case, you may not have
>   the latest UI flow installed. Please install the latest UI flow from
>   [here](https://docs.microsoft.com/en-us/power-automate/ui-flows/upgrade).

1.  If you want WinAutomation to capture a screenshot when Process failed, do
    the following:

2.  From the WinAutomation Console, right click on a Process, select "Edit
    Process's Properties". Go to the "Error Handling" tab and choose "Override
    Default Options". Click "Add screenshot to logs" and save. Now if a Process
    fails, you can view the screenshot captured at runtime from the Power
    Automate UI flow run details.

>    

![](media/a43a1010ea3c9b203b8b2c2b1086b26e.png)

How to get Output from WinAutomation and use in Power Automate
--------------------------------------------------------------

Currently you have to use certain WinAutomation steps to write results and
outputs from the process into a file in the cloud share or email the results
out. Then you can use connectors from Power Automate to access and use those
results.

How to obtain an RPA trial license
----------------------------------

Log in to [Power Automate](https://flow.microsoft.com/) then selecting the **UI
flows** tab under **My flows**. You'll see the trial dialog from which you can
start the trial.

![Start a trial or buy a license](media/ceecb625d84ae49ef7dc711a21cc3b54.png)

If you already have a paid plan or you used a trial previously, you cannot start
a new trial. In this case, you will need to ask your administrator to buy or
start a trial of the Power Automate *Per user plan with attended RPA*. They can
make the purchase by going to **Billing** \> **Purchase services** in the
Microsoft 365 admin center, and then searching for the right plan.

![Per user plan with attended RPA](media/07d23b56dcd2b5bdd42655e146bf47cd.png)

Finally, once they have purchased a plan or gotten the free trial, they need to
assign that plan to a user.

** Note**

When you assign a plan to a user, it may take few minutes before the assignment
becomes effective.

Troubleshooting WinAutomation licensing issues
----------------------------------------------

If you are receiving licensing errors during the launch of WinAutomation, ensure
the user you’re logging in as has a valid Power Automate RPA license:

1.  Go to [Power Automate](https://flow.microsoft.com/) and sign in.

2.  Select My flows on the left navigation bar.

3.  Select UI flows on the page on the right. You should see you can create new
    UI flows there if you have the correct license

4.  You may need to start a trial or ask your administrator to do that

**Note**:

This license is cached when users launch WinAutomation while connected to the
Internet.

To reset the license information stored by WinAutomation, you can delete the
following file: %localappdata%\\Softomotive\\WinAutomation\\msalcache.bin3

Learn more
----------

-   Read about the [WinAutomation
    acquisition](https://flow.microsoft.com/blog/microsoft-acquires-softomotive-to-expand-low-code-robotic-process-automation-capabilities-in-microsoft-power-automate/)

-   Get support
    for [WinAutomation](https://support.softomotive.com/support/home).

-   Get a head start with [WinAutomation
    tutorials](https://www.winautomation.com/support/tutorials/).

-   Learn to [create desktop UI
    flows](https://docs.microsoft.com/en-us/power-automate/ui-flows/create-desktop).

-   Learn how to [run UI
    flows](https://docs.microsoft.com/en-us/power-automate/ui-flows/run-ui-flow).

-   Learn to [manage UI
    flows.](https://docs.microsoft.com/en-us/power-automate/ui-flows/manage)

-   Learn more about the [on-premises
    gateway](https://docs.microsoft.com/en-us/power-automate/gateway-reference#use-a-gateway).
