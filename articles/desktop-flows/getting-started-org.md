---
title: Getting started with an organization premium account  | Microsoft Docs
description: Getting started with an Organization premium account
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: marleon
ms.reviewer: marleon
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Getting started with an Organization premium account

Power Automate Desktop enables regular and power users alike to create flows that automate routine repetitive tasks. Build flows from pre-made actions, or record windows and web browser activity in real time.

Unlock the full spectrum of RPA features such as premium cloud connectors, the ability to run your flows automatically, detailed monitoring and many more. 

Power Automate Desktop gives you the option to share your flows among your colleagues so that you can improve automations and build on top of them.

Access your flows from anywhere, harnessing the power of the cloud to establish a robust and flexible RPA system. Take full advantage of multiple environments to organize and manage users’ flows. 

If you currently use Power Automate with a work or school account or your license does not include attended RPA, you can still use Power Automate Desktop for your desktop automation needs. Start a trial to preview all the features by selecting **Go Premium** on the Power Automate Desktop console.

## Creating a flow

1. Begin by visiting [https://flow.microsoft.com/](https://flow.microsoft.com/) and entering your credentials; then, navigate to **My flows**, and create a new **Desktop flow**:

    ![create a new desktop flow.](media\getting-started-org\create-new-desktop-flow.png)

1. After you assign a name to the flow, you will be prompted to launch Power Automate Desktop; select **Open** to do so.

1. In the flow designer, start building the flow by double-clicking on actions, or dragging them from the actions pane on the left, to the central workspace pane.

1. Expand the **Datetime** category, and select the **Get current date and time** action. Configure it to only retrieve the date:

    ![get the current date.](media\getting-started-org\get-current-date.png)

1. Next, expand the **Text** category, and configure the **Convert datetime to text** actions as follows:

    ![convert datetime to text.](media\getting-started-org\convert-datetime-to-text.png)

    This will ensure that the current date is displayed in a filename-friendly format.

1. Use the **Get special folder** action to retrieve the path of the **Documents** folder:

    ![get special folder.](media\getting-started-org\get-special-folder.png)

1. Add the **If file exists** action from the **Conditionals** category, and configure it to check whether the file "report.xlsx" is present in the Documents folder:

    ![if report exists.](media\getting-started-org\if-report-exists.png)

1. Finally, add the current date to the file's name by using the **Rename file(s)** action from the **File** category:

    ![rename the report.](media\getting-started-org\rename-report.png)

1. The resulting flow should look like this:

    ![the finished flow.](media\getting-started-org\finished-flow.png)

Following this example, it is possible to imagine a wide range of scenarios where Power Automate Desktop can be used to automate tasks. The abundance of actions, combined with cloud management capabilities, affords endless possibilities to individual users and organizations.

## Next Steps

- Learn how to [set up Power Automate Desktop](setup.md).

- Begin your journey in Power Automate Desktop by [creating a Power Automate Desktop flow](create-flow.md). 

- Get familiar with the [console](console.md) and the [flow designer](flow-designer.md), which are part of Power Automate Desktop. 

- You'll find the list of actions available in the [Actions reference](actions-reference.md).

- Learn how to [apply unattended RPA licenses to your flows](../organization-q-and-a.md#power-automate-rpa-license).