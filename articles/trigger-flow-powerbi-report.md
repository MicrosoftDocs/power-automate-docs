---
title: Trigger a cloud flow from any Power BI report | Microsoft Docs
description: Learn how to create a create and trigger an instant flow from any Power BI report
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/12/2021
ms.author: hamenon
---

# Trigger a cloud flow from any message in Power BI

Empower your end-users to go from insight to action. With the Power Automate visual, end-users can run an automated flow all within a Power BI report. Furthermore, the executed flow can be data contextual, meaning that the inputs to the flow can be dynamic, based on the filters that the user sets. This article describes how to add visual into a Power BI report that lets you manually trigger a flow directly from the Power BI report

![Power Automate Visual in Power BI on the main screen](media/power-bi-flow/power-bi-main.png)

## Add Power Automate visual to a Power BI report
To get started, [download the visual from AppSource](https://go.microsoft.com/fwlink/?linkid=2160902) and then import it to your Power BI report. After it's imported, you’ll see the Power Automate icon in the **Visualization** pane. When you select this new visual, it's automatically added to your current report page.

![Power Automate visual instructions](media/power-bi-flow/powerbi-default-state.png)

The initial state of the widget shows you the getting started instructions for using flows in Power BI. Once you’ve reviewed the instructions, you can resize the button and place it where you’d like it on the report.

![Power Automate Visual in Power BI](media/power-bi-flow/power-bi-report.png)

## Using the Power Automate visual in Power BI

Follow these steps to trigger a flow from within a Power BI report.

### Add the data fields that need to be passed to the flow

1. In the **Visualization** pane, add any fields from the report that you want to pass into the flow when it runs. 

   These fields can be used at flow design time as well to specify how you want to use the Power BI data.

   ![Add data to the Power Automate visual](media/power-bi-flow/Powerbi-add-data.png)

### Add an existing cloud flow to the Power BI report

1. Select **Edit** from the **More options** menu of the visual. 

1. Select an existing flow to apply to the button.

   Your existing cloud flow is now added to the Power BI report. 

   ![Power Automate visual More options](media/power-bi-flow/power-bi-more-options.png)

### Create a new flow

To create a flow, use **Instant from blank** or start with one of the built-in templates. The following steps detail how to create a flow from scratch for use within a Power BI report.

When you select the **Instant from blank** option, Power Automate automatically adds the Power BI button clicked trigger.

![Power BI trigger](media/power-bi-flow/power-bi-trigger.png)

### Apply the flow to the Power BI report

1. Add the relevant actions into your flow. 

1. **Save**, and then select the back arrow to take you back to the details page. 

   ![Create a flow](media/power-bi-flow/power-bi-create-flow.png)

1. Select the **Apply** button to attach the flow to your Power BI report button.

   ![Apply flow](media/power-bi-flow/power-bi-apply.png)

Once you have applied a flow to the button, you should test the flow before you share it. 

>[!IMPORTANT]
>You can only run these Power BI flows in the context of a Power BI report. You cannot run these flows in Power Automate or elsewhere. 

If your flow is data contextual, test how the filters selections in the report impact the outcome of the flow. To test the flow in edit mode of the report, select Back to report, and then press Ctrl + click on the button to run the Flow in the context of the report.

You can navigate to the edit mode or to Power Automate to view the run history of the flow to ensure its running successfully.

### Share the flow in run only mode

In order for other viewers of your Power BI report to run the flow, you must explicitly share the flow with those users/Azure Active Directory groups. You can do so from the details page of your flow.

![Edit run only permissions](media/power-bi-flow/powerbI-run-only1.png)

To share, select edit next to the **Run only users** tile and then specify the users or groups that you want to have access.

![Add run only users ](media/power-bi-flow/powerbi-run-only2.png)

### Format the button on the Power BI report
Optionally, if you want to change the button text, font color, font size, or fill color of the button, you can find these options along with other settings in the **Format** pane. 

![Screenshot of Format pane in Power BI](media/power-bi-flow/power-bi-flow-format.png)

## Known limitations 

* The user running the flow within the Power BI report needs to have permissions to run the flow. Grant these permissions through direct sharing by the user or by sharing to an Azure Active Directory group.
* The PowerBI visual only functions with flows in a tenant's default environment. Any flow created with the visual is created in the users default environment.
* Additional manual inputs to the button are not supported at this time.
* The visual is not supported for PaaS embedded scenarios nor in Sovereign Cloud scenarios.
* Create flows that you will use with the Power BI button trigger directly within the Power BI report. Do not go directly to Power automate to create these flows as the trigger will not have access to the data fields necessary for creating the flow.
* Power BI data will be sent to and processed in a geography where the flow is deployed.






