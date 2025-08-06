---
title: Get started with an organization premium account
description: Get started with Power Automate desktop flows using an organization premium account.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: get-started
ms.date: 02/17/2023
ms.collection: get-started
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType:
  - flowmaker
  - enduser
---

# Get started with an organization premium account

Power Automate enables regular and power users to create flows that automate routine repetitive tasks. For example, build flows from premade actions, or [record windows and web browser activity in real time](recording-flow.md).

Unlock the full spectrum of RPA features such as premium cloud connectors, the ability to [run your flows automatically](trigger-desktop-flows.md), [detailed monitoring](monitor-desktop-flow-runs.md), and many more.

Power Automate gives you the option to [share your flows](manage.md#share-desktop-flows) among your colleagues so that you can improve automations and build on top of them.

Access your flows from anywhere, harnessing the power of the cloud to establish a robust and flexible RPA system. Take full advantage of multiple environments to organize and manage users’ flows.

If you currently use Power Automate with a work or school account or your license doesn't include attended RPA, you can still use Power Automate for your desktop automation needs. Start a trial to preview all the features by selecting **Go premium** on the Power Automate console.

## Creating a flow

1. Begin by signing in to the [Power Automate portal](https://make.powerautomate.com). Then, navigate to **Create** > **Power Automate for desktop**.

1. After you assign a name to the flow, you'll be prompted to launch Power Automate for desktop. Select **Open** to do so.

1. In the flow designer, start building the flow by double-clicking on actions, or dragging them from the actions pane on the left into the central workspace pane.

1. Expand the **Datetime** category, and select the **Get current date and time** action. Configure it to only retrieve the date.

    ![Screenshot of the Get current date action.](media\getting-started-org\get-current-date.png)

1. Next, expand the **Text** category, and configure the **Convert datetime to text** actions as follows. This step will ensure that the current date is displayed in a filename-friendly format.

    ![Screenshot of the Convert datetime to text action.](media\getting-started-org\convert-datetime-to-text.png)

1. Use the **Get special folder** action to retrieve the path of the documents folder.

    ![Screenshot of the Get special folder action.](media\getting-started-org\get-special-folder.png)

1. Add the **If file exists** action from the **Conditionals** category, and configure it to check whether the file **report.xlsx** is present in the documents folder.

    ![Screenshot of the If file exists action.](media\getting-started-org\if-report-exists.png)

1. Finally, add the current date to the file's name by using the **Rename file(s)** action from the **File** category.

    ![Screenshot of the Rename file action.](media\getting-started-org\rename-report.png)

1. The resulting flow should look like the following figure:

    ![Screenshot of the final flow.](media\getting-started-org\finished-flow.png)

Following this example, it's possible to imagine a wide range of scenarios where Power Automate can be used to automate tasks. The abundance of actions, combined with cloud management capabilities, affords endless possibilities to individual users and organizations.

## Next Steps

- Learn how to [set up Power Automate](setup.md).

- Begin your journey in Power Automate by [creating a Power Automate desktop flow](create-flow.md).

- Get familiar with the [console](console.md) and the [flow designer](flow-designer.md).

- Find the list of actions in the [Actions reference](actions-reference.md).

- Learn how to [apply unattended RPA licenses to your flows](../organization-q-and-a.md).
