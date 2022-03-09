---
title: Design flows with Microsoft Visio | Microsoft Docs
description: Leverage your organization's Visio expertise to build common models as a starting point to create flows.
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/25/2019
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---


# Design flows in Microsoft Visio


The Power Automate designer is a rich tool in which you can configure every detail of your logic. However, sometimes you may want to just sketch your flow logic before you start building your flow. To do this, use Microsoft Visio directly from within Power Automate.

>[!TIP]
> Many processes share a common model but have minor variations throughout an organization. You can save time within your organization by using Visio to create a master workflow model that others will then adjust with specialized parameters.

## Prerequisites

- A Power Automate account.
- The Microsoft Visio desktop app (English version).
- Expertise in using Microsoft Visio.

## Design a workflow in Visio

1. Sign into [Power Automate](https://flow.microsoft.com).
1. Select **Templates** from the left side panel.

     ![Select templates from the left panel.](./media/visio-flows/templates-from-left-panel.png)

1. Select **Visio** from the list.

     ![Filter to Visio templates.](./media/visio-flows/select-visio.png) 

1. Select the **Basic Flow BPMN Diagram** template from the list of **Visio** templates that displays.

     ![Select a Visio Template.](./media/visio-flows/visio-templates.png) 

     >[!IMPORTANT]
     >Visio warns you that files from the Internet could harm your device. If you are comfortable, select **YES** on the warning message.

     ![Note warning about files from the Internet.](./media/visio-flows/visio-warning.png)

1. The Visio designer launches.

     ![View of the Visio designer.](./media/visio-flows/visio-designer.png)


1. Use the BPMN basic shapes to [design your workflow](https://support.office.com/article/design-a-microsoft-flow-in-visio-35f0c9a9-912b-486d-88f7-4fc68013ad1a).

   ![BPMN basic shapes.](./media/visio-flows/bpmn-basic-shapes.png)

## Prepare to export your workflow to Power Automate

Follow these steps to prepare your workflow so that you can export it to Power Automate.

1. Select the **Process** tab.
1. Select **Prepare to Export** from the **Power Automate** group of icons.

   ![Select the prepare to export icon.](./media/visio-flows/prepare-export-icon.png)
   
   The **Prepare to Export** group opens.

   ![Prepare export group.](./media/visio-flows/prepare-export-group.png)

1. On the **Flow Mapping** tab of the **Prepare to Export** group, map your BPMN diagram to Power Automate controls. 

1. On the **Triggers and Actions** tab of the **Prepare to Export** group, map your BPMN diagram to Power Automate triggers and actions by selecting each shape and then selecting either a trigger or action to represent that shape in Power Automate.

Your workflow is ready to be exported when there are no issues remaining on the **Prepare to Export** control.

![No issues.](./media/visio-flows/prepare-export-no-issues.png) 

## Export your workflow
1. Select the **Export to Flow** button to export your workflow diagram to Power Automate.
1. Name your flow and then select the **Create flow** button.
   
   ![Create the flow.](./media/visio-flows/export-create-flow.png)

1. You should see a success report similar to this one.

    ![Success.](./media/visio-flows/export-create-flow-success.png)

You can now run or make edits to your flow from the Power Automate designer, just like any other flow.

>[!TIP]
> Use Visio’s sharing and commenting capabilities to collaborate with multiple stakeholders and create a complete workflow quickly.

## Learn more

- [Get started with Power Automate](getting-started.md) 
- [Build multi-step flows](multi-step-logic-flow.md)
- [Design a cloud flow with Microsoft Visio](https://support.office.com/article/design-a-microsoft-flow-in-visio-35f0c9a9-912b-486d-88f7-4fc68013ad1a)

     


[!INCLUDE[footer-include](includes/footer-banner.md)]