---
title: How to use the automation CoE toolkit | Microsoft Docs
description: How to use the automation CoE toolkit.
suite: flow
documentationcenter: na
author: kathyos
manager: tapanm
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: kathyos
ms.reviewer: deonhe
---

# How to use the automation CoE toolkit

This article details how to use each component in the Automation CoE Toolkit. Each section will contains the functionality and the features.

## Automation Console app

### Functionality

The Automation Console app is used to launch Automation CoE-specific apps. You must update the information for the apps manually. [The setup process goes over configuring the Automation Console](./configure-automation-coe.md#console-configuration)

### Features

- The automation console is a console-like dashboard of all apps that can launched in one place.

- Documentation linked <!--todo: what's this for?-->

## Automation Project app

### Automation project functionality

The purpose of this app is to request and approve new automation projects. The automation approver receives a deep link to the project screen to view all automation project details.

### Automation project features

#### Project Dashboard (Home Screen)

Here's a listing of the experience you'll receive when you launch the app, based on your role.

| **Role**            | **What you see**                                          |
|---------------------|-----------------------------------------------------------|
| Project Admin       | See all automation project requests.                          |
| Project Contributor | Sees only automation project requests that you created.|
| Project Viewer      | Sees all automation projects in view mode.       |

Some features include:

- Command bar - Use the command bar to filter automation projects by status. Select **"+"** to open the **New Project** screen.
- Details side bar - This side bar gives an overview of all the automation projects you can access, based on your role.
- Automation project details card - Provides an overview of the requested project details.

   ![This screenshot displays the automation project screen sample.](media/c6a01458255512efdbc923e6ba999b65.png)
   <!--todo: this screenshot should not have steps. it's just showing the options.-->

#### New Project screen

On this screen, you can perform the following tasks.

- Create a new automation project.
- Edit an existing automation project.
- View project details.

1. Project information section - Fill out the information as it relates to the automation project.
1. Business owner field - This is the approver for the request. If no business owner is selected, the fallback is used.
1. ROI information section - Provide this information as it relates to ROI for the automation project.
1. Command bar - Use for new, save, edit, and submit tasks on the form. This submit button is available after the automation project has is saved.

   ![This screenshot displays a view of the automation project screen.](media/389a1560bd0d71eb34101247a678f2be.png)

Some fields are required to save the form. This is because when you submit a request, a flow (**Calculate ROI saving potential for automation project**) runs. This flow calculates the complexity score and then populates this information when you select the save button.

## Automation Center app

### Functionality of the automation center app

CoE admins use the Automation Center app to maintain the configuration and map automation projects to environments. You can also access flow sessions and metered artifacts in the automation center app.

### Features of the automation center app

#### Create / maintain configuration data

Learn more about how to create and maintain the configuration data in [setting up the Automation CoE Toolkit](./configure-automation-coe.md).

#### Map automation projects to environments

CoE admins will map automation projects to environments after the request is approved.

1. Select **Automation Projects** tab.
1. Select the record you want to map.
1. Select the **Related** tab > **Environments**.

   ![This screenshot displays the steps to map a project to a an environment.](media/af754212087c3a3530a7482a5ac2a810.png)

1. Select **Add Existing Environments**.
1. Select the environment you want to use, or create a new one.
1. Select **Add** > **"Save & Close"**.

![This screenshot displays the steps to save the mapping.](media/74cb8d1d0475c2006e750aee1428749f.png)
<!--todo: steps seems missing or screens needs to be updated-->

## Automation Solution Manager app

### Functionality of the solution manager app

The Automation Solution Manager app is used by **System Admins (System Administrator)** to enable the metering of solutions and their artifacts. Once a solution and artifact has been metered, data syncs between the environment and main in near realtime.

### Features  of the solution manager app

#### Turn on metering for a solution

After you create a solution in an environment, it shows up in the list. The **+** icon displays when metering is turned off for a solution.

![This screenshot displays the plus icon that indicates that metering is turned off for the solution.](media/ea263020f2637ad732cbe0bdac828036.png)

1. Select the **"+"** on the solution you want to meter.
1. In the new screen, select your automation project from the list. If it's not listed, select the **Refresh** button until it shows up.
1. Select **Submit**, and then select **Yes** on the confirmation screen that appears.

   ![This screenshot displays the steps to turn on metering on a solution](media/f9ec18f8d7d6d717066862f7c3aa693f.png)

#### Rename a cloud flow to match convention

Follow these steps to rename a cloud flow to match the [naming convention](./use-automation-coe-toolkit.md#rename-a-cloud-flow-to-match-convention) from the Automation Solution Manager app home screen.

1. Select **...**  for the solution that interests you.
1. Select the cloud flow that you want to rename.
1. Select the pencil icon that appears.
   The pencil icon only appears for unmanaged flows only.

   ![This screenshot displays the steps in the automation solution manager](media/98135b82b001c28bc777f7c1269619fb.png)

   The [naming convention](./use-automation-coe-toolkit.md#rename-a-cloud-flow-to-match-convention) should apply automatically.

1. Select the **Save** icon.

   ![This screenshot displays the save icon.](media/2d78588c3463c5fc980b6d9f3d6a722d.png)

>[!NOTE]
The last 3 digits will default to 001. If you have multiple solutions for a single project, you could increase that number by 1 for each additional solution if you wish to distinguish them. Read more about the [naming convention](./use-automation-coe-toolkit.md#rename-a-cloud-flow-to-match-convention).

#### Meter solution artifacts

<!--todo: I don't understand this. please clarify.-->
This is where we meter the artifacts for the Flow Sessions to show up in our main environment. We can get to the solution screen from the Home screen by clicking the 3 dots. **". . ."**

1. Under the **Is metered** column, select the **"+"** icon to add to it metering. If this option is grayed out, then the cloud flow does not follow the [naming schema](./use-automation-coe-toolkit.md#rename-a-cloud-flow-to-match-convention), if needed.

   ![This screenshot displays the plus icon in the Is metered column.](media/7f4b832d4624313a30f6c95f37220c87.png)

1. After you select the **+** icon, the meter icon appears.

   Now data will be **flowing** to main (flow sessions).

   ![This screenshot displays the meter icon to indicate that metering is turned on.](media/5c2fb7dbc19bec6e4708466c2afa890b.png)

#### Bypass Flow naming convention

There is an option to bypass the naming convention.

To bypass the naming convention, click on the ‘i’ icon and acknowledge the warning.

![This screenshot displays the icon to use to bypass the naming convention.](media/c54e6b83595a28a9c739a7cefd76c1cd.png)

Now you can meter the flow.

![This screenshot displays that a flow can be metered after the naming convention is disabled.](media/e597c1f3e56077de8037e890db688c02.png)