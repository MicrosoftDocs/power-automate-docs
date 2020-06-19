---
title: Common Data Service | Microsoft Docs
description: Create a flow to import data, export data, or build approvals with Common Data Service.
services: ''
suite: flow
documentationcenter: na
author: stepsic-microsoft-com
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/17/2020
ms.author: stepsic
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create a flow that uses Common Data Service

Improve operational efficiency with a unified view of business data by creating a flow that uses [Common Data Service](https://powerapps.microsoft.com/tutorials/data-platform-intro/). 

Deploy this secure business database that comprises of well-formed standard business entities (such as sales, purchase, customer service, and productivity) in your organization. Store organizational data in one or more [custom entities](https://powerapps.microsoft.com/tutorials/data-platform-create-entity/), which offer several benefits over external data sources such as Microsoft Excel and Salesforce.

For example, you can leverage Common Data Service within Power Automate in these key ways:

* Create a flow to import data, export data, or take action when data (such as sending a notification) changes. Note that this approach isn't a full synchronization service; it simply allows you to move data in or out on a per-entity basis. For detailed steps, see the procedures later in this topic.
* Instead of [creating an approval loop through email](wait-for-approvals.md), create a flow that stores approval state in an entity, and build a custom app in which users can approve or reject items. For detailed steps, see [Build an approval loop with Common Data Service](common-data-model-approve.md).

## Prerequisites

* Sign up for [Power Automate](https://flow.microsoft.com) and [Power Apps](https://make.powerapps.com).
  
    If you have trouble, verify whether [Power Automate](sign-up-sign-in.md) and [Power Apps](https://powerapps.microsoft.com/tutorials/signup-for-powerapps/) supports the type of account that you have and your organization hasn't blocked signup.
* If you haven't used Common Data Service before, open the **Entities** tab of [Power Apps](https://web.powerapps.com/#/entities), and then select **Create my database**.

## Sign in to your environment

1. Browse to [Power Automate](https://flow.microsoft.com), and then select **Sign in** in the upper-right corner.
   
    ![Sign in](./media/common-data-model-intro/signin-flow.png)
1. In the top right menu you select the environment in which you created the database in powerapps.com.
   
    >[!IMPORTANT]
    >If you don't select the same environment, you won't see your entities.
   
    ![Select environment](./media/common-data-model-intro/select-environment.png)

## Use a template

1. In the **Search for a template by app, task, or industry** box at the top of the screen, enter **common**, and then press **enter**.

   You will see a list of templates with the word "common" in their names, including those templates that use Common Data Model.
   
    ![Search for templates](./media/common-data-model-intro/template-search.png)

1. In the list of templates, select the template that performs that tasks that you want to be performed.
   
    For example, select the template that copies notes from Lead to Opportunity in Common Data Service, as shown in the steps that follow.
   
    ![Choose a template](./media/common-data-model-intro/select-template.png)
   
1. If you haven't already created a connection, select **Sign in**, and then provide your credentials as needed.
   
1. Select **Continue**.

   You'll now see the template and its connections. In the following steps, you will customize this template.

## Customize your flow template

1. On the **When an Opportunity is created** card, select the **Environment**, **Entity Name**, and **Scope** that you want to use.
   
    ![Specify the details for the entity](./media/common-data-model-intro/specify-instance.png)

1. Complete the **Get Opportunity Record** card, per your requirements.
   
    ![Get Opportunity Record](./media/common-data-model-intro/get-opportunity-record.png)

1. Confirm the **Originate from a Lead** card. 
   
    ![Originate from a Lead](./media/common-data-model-intro/originate-from-lead.png)

1. Complete the ****Get Lead** and the **List Notes for the Lead** cards on the **If yes** side of the decision branch. 

   ![Complete decision branch](./media/common-data-model-intro/get-lead-list-notes.png)

1. ddfdf

   ![todo](./media/common-data-model-intro/apply-to-each.png)
 

Now, whenever that object is created in the source system, it will be imported into Common Data Service. If you can't find a template that does what you need, you can [build a flow from scratch](get-started-logic-flow.md) that operates on top of Common Data Service.

You can take actions on changes in the database. For example, you can send notification mail whenever data changes.

