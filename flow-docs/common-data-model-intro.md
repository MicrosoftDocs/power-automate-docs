---
title: Common Data Service | Microsoft Docs
description: Create a flow to import data, export data, or build approvals with the Common Data Service.
services: ''
suite: flow
documentationcenter: na
author: stepsic-microsoft-com
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/22/2016
ms.author: stepsic
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create a flow that uses the Common Data Service
[!INCLUDE [view-pending-approvals](includes/cc-rebrand.md)]
Improve operational efficiency with a unified view of business data by creating flow that uses the [Common Data Service](https://powerapps.microsoft.com/tutorials/data-platform-intro/). Deploy this secure business database that comprises well-formed standard business entities (such as Sales, Purchase, Customer Service, and Productivity) in your organization. Store organizational data in one or more [custom entities](https://powerapps.microsoft.com/tutorials/data-platform-create-entity/), which offer several benefits over external data sources such as Microsoft Excel and Salesforce.

For example, leverage the Common Data Service within Microsoft Flow in these key ways:

* Create a flow to import data, export data, or take action on top of data (such as sending a notification). Note that this approach isn't a full synchronization service; it simply allows you to move data in or out on a per-entity basis.
  
    For detailed steps, see the procedures later in this topic.
* Instead of [creating an approval loop through email](wait-for-approvals.md), create a flow that stores approval state in an entity, and build a custom app in which users can approve or reject items.
  
    For detailed steps, see [Build an approval loop with the Common Data Service](common-data-model-approve.md).

**Prerequisites**

* Sign up for [Power Automate](https://flow.microsoft.com) and [PowerApps](https://web.powerapps.com).
  
    If you have trouble, verify whether [Power Automate](sign-up-sign-in.md) and [PowerApps](https://powerapps.microsoft.com/tutorials/signup-for-powerapps/) supports the type of account that you have and your organization hasn't blocked signup.
* If you haven't used the Common Data Service before, open the **Entities** tab of [powerapps.com](https://web.powerapps.com/#/entities), and then click or tap **Create my database**.

## Sign in to your Environment
1. Open the [Microsoft Flow portal](https://flow.microsoft.com), and then click or tap **Sign in** in the upper-right corner.
   
    **Note**: you might need to open the top-left menu to show the **Sign in** button.
   
    ![Sign in](./media/common-data-model-intro/signin-flow.png)
2. In the top right menu you select the environment that you created the database in powerapps.com.
   
    **Note**: if you do not select the same environment then you will not see your entities.
   
    ![Select environment](./media/common-data-model-intro/select-environment.png)

## Open a template
1. In the **Search templates** box at the top of the screen, type or paste **common**, and then press Enter.
   
    ![Search for templates](./media/common-data-model-intro/template-search.png)
2. In the list of templates, click or tap the template that imports data from the source you want into the entity (or *object*) that you want.
   
    For example, click or tap the template that copies contact information from Dynamics 365 into the Common Data Service.
   
    ![Choose a template](./media/common-data-model-intro/choose-template.png)
3. Click or tap **Use this template**.
   
    ![Use template](./media/common-data-model-intro/use-template.png)
4. If you haven't already created a connection from Microsoft Flow to Dynamics 365, click or tap **Sign in**, and then provide your credentials if prompted.
   
    ![Sign in to Dynamics 365](./media/common-data-model-intro/dynamics-signin.png)
5. Click or tap **Continue**.
   
    ![Confirm accounts](./media/common-data-model-intro/confirm-accounts.png)

## Build your flow
1. In the first card, specify the event that will trigger the flow.
   
    For example, you're building a flow that will copy new contacts from an instance of Dynamics 365 to the Common Data Service. Under **When a record is created**, specify the instance by clicking or tapping the down arrow and then clicking or tapping an option in the list that appears.
   
    ![Specify instance of Dynamics 365](./media/common-data-model-intro/specify-instance.png)
2. (optional) Near the top of the screen, specify a different name for the flow that you're creating.
   
    **Note**: If your browser window isn't maximized, the UI might look slightly different.
   
    ![Name flow](./media/common-data-model-intro/name-flow.png)
3. Click or tap **Create flow**.
   
    **Note**: If your browser window isn't maximized, only the checkmark may appear.
   
    ![Create flow](./media/common-data-model-intro/create-flow.png)

Now, whenever that object is created in the source system, it will be imported into the Common Data Service. If you can't find a template that does what you need, you can [build a flow from scratch](get-started-logic-flow.md) that operates on top of the Common Data Service.

You can take actions on changes in the database. For example, you can send notification mail whenever data changes.

