---
title: Triggering approvals | Microsoft Docs
description: Triggering approvals.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 9/29/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Triggering approvals

The next step after [configuring your Approvals](./configuring-preset-approvals.md) is to link the Approvals Kit with some system. Some examples include Power Apps application, Microsoft Forms, SharePoint list, SQL Database to trigger the Approval request from.

## Choosing your ways to trigger approval requests

Power Automate cloud flows provides hundreds of options to choose from to cause a trigger. Approvals Kit is made in such way that it provides enough flexibility for you to choose where you would like to trigger from almost all triggers.

This docs section includes how-to steps for you to be able to trigger from most popular data sources and use it to link with Approvals Kit.

### Trigger Comparison

Review the table to compare relative advantages and disadvantages for each of data sources.

|                                   |Power Apps canvas app trigger|Dataverse|SharePoint lists|
|-----------------------------------|-----------------------------|---------|----------------|
|Creating a form                    |Need to create your own form and parts|Can use existing apps created that records data to Dataverse|Can use out of the box forms|
|Using attachments                  |Can't use attachments directly with canvas app trigger. Consider using a separate Data source trigger instead|Can use out of the box attachment|Can use out of the box attachment
|Granularity of data access control |App level control|Row/record level control|Site/list level control
|Power Automate [request limits](/power-platform/admin/api-request-limits-allocations#request-limits-based-on-user-licenses)|Request limit is spread across each user as Power Apps canvas app trigger runs on the context of the user using the canvas app.|Spread across each user submitting  as “Run as” can be defined explicitly in the trigger.|Request limits all count towards the user creating the cloud flow for the request triggering flow you create. In a large organization or organizations with many approval requests, this limit can easily be reached.

> *Note: Approvals Kit has been created in such way that all flows contained inside the template will be run on the context of the approval requestor to minimize the impact of Power Automate request limits. If you are facing request limits, make sure you have reviewed how you have set up your cloud flow. Details of the limits for each of type of license can be found in [requests limits and allocations](/power-platform/admin/api-request-limits-allocations#request-limits-based-on-user-licenses).*

### Triggering approvals from Microsoft Dataverse

Approvals Kit can be used with your existing Power Apps applications by
setting up a Power Automate cloud flow that triggers from Microsoft
Dataverse.

To set up the triggering approvals, follow these steps:

1. Go to [Power Automate](https://flow.microsoft.com) website

1. Select **Create**

1. Select **Automated cloud flow**

1. Enter a flow name

1. In the **Choose your flow's trigger**, type "Dataverse" and select **When a row is added, modified or deleted**

1. Select **Create**

1. Set **Change type** to **Added**

1. Set **Table name** to a table you want to trigger approvals with

1. Set **Scope** to **Organization**

1. Expand **Show advanced** **options**

1. Set **Run** **as** to **Row owner**

1. Select **+New step**

1. From list of connectors, select **Custom** then select **Approvals Kit**

1. Select **Start business approval process**

1. Sign in to create a connection

1. Select the Workflow Process you want to start

1. Set values for any application data (variables) required by the workflow

1. Set the name of the flow where the title is **Untitled**

1. Select **Save**

Completing these steps should complete your set-up of advanced approval flows triggering from Microsoft Dataverse.