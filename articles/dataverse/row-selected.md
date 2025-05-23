---
title: Trigger flows for selected rows
description: Learn how to create Power Automate flows for selected rows in model-driven Power Apps and Dynamics 365 apps.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
ms.author: Matow
ms.reviewer: angieandrews
editor: ''
tags: ''

ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/10/2025
search.audienceType: 
  - maker
---

# Trigger flows for selected rows

With the **When a row is selected** trigger in the Dataverse connector, you can enable users to run flows for one or more selected rows in a [model-driven app view](/power-apps/maker/model-driven-apps/create-edit-views). This trigger can also be used to [run flows as steps](/power-automate/create-instant-flows) in business process flows.

:::image type="content" source="media/row-selected/selected-rows.png" alt-text="A screenshot of the When a row is selected trigger in the Power Automate cloud flow designer.":::

To use it, follow these steps:

1. Create a cloud flow with the **When a row is selected** trigger, either from Power Automate or from the Flow menu in a model-driven app.

   :::image type="content" source="media/row-selected/model-driven-app-example.png" alt-text="A screenshot of the flow menu in the command bar of a view in a model-driven app.":::

1. In the trigger, select the table that users trigger the flow from, and optionally add any additional inputs that should be provided when running the flow. 
1. Add at least one action and save the flow. The outputs of the trigger are available to other actions as dynamic content, including each column of the selected row in Dataverse, and the details of the user who triggered the flow.
1. Go to the flow's detail page by clicking the back button in the flow designer or locating the flow through My flows. 
1. Select **Edit** in the **Run only users** tile and share the flow with the users or groups of users that should have access to run the flow. All co-owners and run-only users can see the flow in the Flow menu in model-driven app views for the related table.

## Migration from the Microsoft Dataverse (legacy) connector

* The migration assistant, which currently supports other Dataverse connector actions, doesn't yet support the **When a row is selected** trigger.
* You can manually update flows using the **When a row is selected** trigger from the Microsoft Dataverse (legacy) connector by deleting the trigger and replacing it with the current **When a row is selected** trigger.

## Limitations

* When running flows from the flow menu, users see a confirmation if the flow has been successfully started, but not the progress or results of the flow run. To notify a user of completion or failures, use an email, Teams, or other notification action within the flow.
* Run-only users can't view the run history of the flow.
* Selecting more than 40 rows may result in an error when running the flow.
* The **When a row is selected** trigger can only be used with **Split on** enabled, which is on by default in the trigger's settings. With this setting, each selected row results in an individual flow run.