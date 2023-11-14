---
title: Setup of the business approvals kit
description: Setup of the business approvals kit and templates.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 9/29/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Business approvals kit manual setup

The business approvals kit and guidance is targeted towards the person or department responsible for setting up approval system in your organization. Key sections walk you through the prerequisites, setup instructions, and individual components of the Approvals Kit.

## Overview

The business approvals kit is a collection of components that are designed to help you get started with digitalizing your organization's approval processes using Microsoft Power Platform. More information about individual components can be found in the business approvals kit.

> [!NOTE:
> ]The Approvals Kit can only be used currently in Dataverse environments, and setting up in Dataverse for Teams environments and default environments are not supported.*

## Prerequisites

- Microsoft Dataverse environment (Default Environment can't be used)

- Required licenses:

  - Power Apps per user or per app license for users who will:

    - Configure approvals

    - Approve requests AND need to check progress between each approval step

    - Create approval requests AND need to check progress between each approval step

    - Administer approval processes

  - Power Automate Process license for:
  
    - Approve requests but DO NOT need to check progress between each approval step using the template

    - Create approval requests but DO NOT need to check progress between each approval step using the template

  - Power Apps and Power Automate pay as you go plans offer alternatives to monthly user, application or flow licenses. More information: [Licensing overview for Microsoft Power Platform](/power-platform/admin/pricing-billing-skus#power-appspower-automate-for-microsoft-365)
  
  - Data Loss Prevention Policy categorized to be usable for the following connectors:

    - [Approvals](/connectors/approvals/)

    - [Microsoft Dataverse](/connectors/commondataserviceforapps/)

    - [Microsoft Teams](/connectors/teams/)

    - [Office 365 Groups](/connectors/office365groups/)

    - [Office 365 Outlook](/connectors/office365/)

    - [Office 365 Users](/connectors/office365users/)

    - Approvals Kit custom connector

    - More information: [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention)

  - Power Automate approvals connector capability enabled (see section on enabling Power Automate approvals capability for steps)

## Setup a new environment to install (optional)

1. Create an environment in which to set up the Approvals Kit

    a.  Go to the Power Platform admin center

    b.  Select **Environments**, then **+ New** and enter a name, type, and purpose.

    c.  Select **Yes** to create the database, and then choose**Next**.

    d.  Ensure **Sample apps and data set** is set to **No**.

    e.  Select **Save**.

1. Go to [your new environment](https://make.powerapps.com) to import the Approvals Kit solution for a manual install.

## Enable Power Automate approvals capability

The approvals kit relies on out of the box approvals functionality from Power Automate. If you're using the approvals function for the first time, you must enable the function first either by using the Power Platform Command Line interface or manually by running a cloud flow that includes an approval

### Command Line Setup

Use Power Platform Command Line to install the flow approvals solution into the environment. In the environment allocated for the Approvals Kit, use the following PowerShell commands as a starter script:

```pwsh
$envs = (pac admin list --json | ConvertFrom-Json) | Where-Object { $_.DisplayName -eq "Your Environment Name"  }
pac application install --environment $envs[0].EnvironmentId --application-name "msdyn_FlowApprovals"
```

### Manual Set up

In new environments, use the Power Platform Admin Center to install the Power Automate Approvals feature:

1. Open the [Power Platform Admin center](https://aka.ms/ppac)

1. In the left nagivation, select **Resources**.

1. Select **Dynamics 365 apps**.

1. From the list, select **Microsoft Flow Approvals**.

1. Select the **...** menu for Microsoft Flow Approvals.

1. Select **Install**.

1. Select the environment that the Approvals Kit will be installed in.

1. Review the terms of service.

1. Agree to the terms of service and select **Install**.

> [!NOTE]
> It can take up to 10 minutes to install.

## Install the core components

We recommend that you set up a designated Approvals Kit environment for all users within your organization who need to access the Business Approvals process. Further information on environments is available in [environments overview](/power-platform/admin/environments-overview). If you're a business user, you'll typically need a person with administrative access to Power Platform to create an environment for you. Reach out to your IT department to ask for assistance on environment setup.

> [!NOTE]
>
> - The Approvals Kit uses [solution management capabilities](/power-apps/developer/data-platform/introduction-solutions) of Dataverse to package up all assets. 
> - To ensure consistency and same experience for every customer, the template is provided as [managed solutions](/power-platform/alm/solution-concepts-alm). 
> - If you would like to extend the template, you will need to use a separate [unmanaged solution](/power-platform/alm/solution-concepts-alm) because you can't directly modify this template.

### Enable the Power Apps component framework

Once Microsoft Flow Approvals has been set up for the environment, enable the Power Apps component framework using these steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select an environment where you want to enable this feature.

    You need to do this for **main** and all **satellite** environments.

1. On the top pane, select **Settings**.

1. Select **Product**, then choose **Features**.

1. Turn on **Allow publishing of canvas apps with code components**.

1. Select **Save**.

### Import the Creator Kit

Next, install the creator kit using one of the options in [Install the Creator Kit](/power-platform/guidance/creator-kit/setup).

### Import the solution

Open [https://make.powerapps.com](https://make.powerapps.com). Go to the environment you either created or been allocated, in which the Approvals Kit should be hosted.

The first step of the installation process is to install the solution. This step is required for every other component in the Approvals Kit to work. You'll either need to create a environment or to import into the existing environment (excluding the Default environment).

1. From the expanded section **Assets** for the latest release, download the Approvals Kit file **BusinessApprovalsKit_*_managed.zip**.

1. Go to <https://make.powerapps.com>

1. On the left pane, select **Solutions**.

1. Select **Import**, then choose **Browse**

1. Select the Approvals Kit core components solution from File Explorer.

1. Once the compressed (.zip) value is available, select **Next**

1. Review the information, and then select **Next**.

1. Establish connections to activate your solution. If the connections don't exist, create new connections to proceed with import. 
    > [!NOTE]
    > If you create a new connection, you must select **Refresh**.

    :::image type="content" source="media/import-solution.png" alt-text="A screenshot of the Import a solution options.":::

1. Select **Import**.

Once import is complete, you should see Business Approvals Kit in the list of solutions

> [!NOTE]
> The import can take up to 10 minutes to complete.

### After import steps

Once the approvals kit solution is imported to an environment successfully, you must update the  Approvals kit custom connector to point to the target tenant Identity provider and turn on cloud flows.

#### Update Custom Connector

You must have an app registered to interact with Dataverse table and Custom API.

##### App Registration

Follow these steps to perform the app registration.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com/).

1. Select **App Registration** from the Application section under **Identity**.

1. Select New registration and provide a name, then select **Register**.

1. Under **API permission**, select **Add a permission** and choose **Dynamic CRM**.
    
    :::image type="content" source="media/app-registration-dynamics-crm.png" alt-text="A screenshot fo the Request API permissions options within the Approvals kit App.":::

1. Choose **Delegated permission** and select user_impersonation. 
1. Select **Add Permissions**.

![App Registration adding API permissions for Dynamics CRM with delegated user_impersonation](./media/app-registration-dynamics-crm-delegated-permissions.png)

1. Create a secret by moving to **Certificates and Secrets** section and select **New client secret**.

1. Add a description and select an appropriate expiry date. Select **Add**.

> [!IMPORTANT]
> 
> - Copy the secret value and save it. You'll use the copied value when configuring custom connector in the next section.
> - You'll also need the Client ID from Overview section.

#### Update the Approvals kit with a custom connector

Now you'll edit the **Approvals kit** custom connector present inside Business Approval solution.

1. Under the **Security** tab, modify the following:

    - Select Authentication type as **OAuth 2.0**.
    - Enter the Client ID, Secret noted in previous section.
    - Specify the environment URL under Resource URL section.

1. Select **Update connector**.

1. Under the **Test** tab, create a **New connection**.

    - Specify the account details for the connection and allow access if prompted.
    - Edit the **Custom connector** again and test the **GetPublishedWorkflow** operation.

The operation should run successfully with status as 200.

#### Activate the core cloud flows

The template includes multiple core components that are used to manage the approval experience. To use the template, you must turn on the cloud flows that came with the template.

1. Go to [make.powerapps.com](https://make.powerapps.com/).
1. Select **Solutions**, and open open the **Business Approvals Kit** solution to view the flows. 
1. Activate cloud flows using in the list to ensure no errors occur as there are dependencies across the flows. Some cloud flows can be enabled when importing the solution in the previous steps.

    a.  Turn on: BACore \| Approval Time-out

    b.  Turn on: BACore \| Approver OOF

    c.  Turn on: BACore \| Cascade Process Status

    d.  Turn on: BACore \| Cascade Publishing Activation

    e.  Turn on: BACore \| Child \| Get Dynamic Approver

    f.  Turn on: BACore \| Child \| Get Dynamic Data Instance

    g.  Turn on: BACore \| Child \| Get Default Settings

    h.  Turn on: BACore \| Child \| Log Runs

    i.  Turn on: BACore \| Child \| Evaluate Rule

    j.  Turn on: BACore \| Daily \| Calculate Approval Timeouts

    k.  Turn on: BACore \| Publish Process

    l.  Turn on: BACore \| Runtime \-\- Start Approval

    m.  Turn on: BACore \| Runtime \-\- Start Node

    n.  Turn on: BACore \| Runtime \-\- Start Stage

    o.  Turn on: BACore \| Runtime \-\- Start Workflow

    p.  Turn on: BACore \| Runtime \-\- Update Approval

    q.  Turn on: BACore \| Runtime \-\- Update Node Instance

    r.  Turn on: BACore \| Runtime \-\- Update Stage Instance

    s.  Turn on: BACore \| Sync Approver OOF

Once installation is complete for the core components, your next step is to set up the approval processes in How to use Approvals Kit section.
