---
title: Triggering approvals | Microsoft Docs
description: Triggering approvals.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Triggering approvals

The next step after [configuring your approvals](./configure-preset-approvals.md) is to link the Approvals Kit with some system. Some examples include Power Apps application, Microsoft Forms, SharePoint list, SQL Database to trigger the Approval request from.

## Choosing your ways to trigger approval requests

Power Automate cloud flows provides hundreds of options to choose from to cause a trigger. Approvals Kit is made in such way that it provides enough flexibility for you to choose where you would like to trigger from almost all triggers.

This docs section includes how-to steps for you to be able to trigger from most popular data sources and use it to link with Approvals Kit.

### Trigger comparison

Review the table to compare relative advantages and disadvantages for each of data sources.

|Trigger                           |Power Apps canvas app trigger|Dataverse|SharePoint lists|
|-----------------------------------|-----------------------------|---------|----------------|
|Create a form                    |Need to create your own form and parts|Can use existing apps created that records data to Dataverse|Can use out of the box forms|
|Use attachments                  |Can't use attachments directly with canvas app trigger. Consider using a separate Data source trigger instead|Can use out of the box attachment|Can use out of the box attachment
|Granularity of data access control |App level control|Row/record level control|Site/list level control
|Power Automate [request limits](/power-platform/admin/api-request-limits-allocations#request-limits-based-on-user-licenses)|Request limit is spread across each user as Power Apps canvas app trigger runs on the context of the user using the canvas app.|Spread across each user submitting  as “Run as” can be defined explicitly in the trigger.|Request limits all count towards the user creating the cloud flow for the request triggering flow you create. In a large organization or organizations with many approval requests, this limit can easily be reached.

> [!NOTE]
> Approvals Kit has been created in such way that all flows contained inside the template will be run on the context of the approval requestor to minimize the impact of Power Automate request limits. If you are facing request limits, make sure you have reviewed how you have set up your cloud flow. Details of the limits for each of type of license can be found in [requests limits and allocations](/power-platform/admin/api-request-limits-allocations#request-limits-based-on-user-licenses).*

### Trigger approvals from Microsoft Dataverse

The Approvals Kit can be used with your existing Power Apps applications by setting up a Power Automate cloud flow that triggers from Microsoft Dataverse.

To set up the trigger approvals, follow these steps:

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. Select **Create** > **Automated cloud flow**.
1. Enter a flow name.
1. In the **Choose your flow's trigger** seardch field, type **dataverse**, and then select **When a row is added, modified or deleted**.
1. Select **Create**.
1. In the **Change Type** field, select **Added**.
1. In the **Table Name**, select a table you want to trigger approvals with.
1. In the **Scope** field, select **Organization**.
1. Expand **Show advanced options**.
1. In the **Run as** field, seleect **Row owner**.
1. Select **+New step**
1. From list of connectors, select **Custom**, and then select **Approvals Kit**.
1. Select **Start business approval process**.
1. Sign in to create a connection.
1. Select the Workflow Process you want to start.
1. Enter the email address that relates to the person who is requesting this approval.
1. Enter values for application data (variables) required by the workflow.
1. Enter the name of the flow where the title is **Untitled**, and rename it to summarize your cloud flow.
1. Select **Save**.

These steps should complete your setup of advanced approval flows triggering from Microsoft Dataverse.
