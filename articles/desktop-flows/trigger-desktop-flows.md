---
title: Trigger desktop flows from cloud flows
description: See how to trigger Power Automate desktop flows from cloud flows.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/15/2022
ms.author: pefelesk
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Trigger desktop flows from cloud flows

## Prerequisites

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for the China region. Switch to our machine-management capabilities. [Learn more about the switch from gateways to direct connectivity.](manage-machines.md#switch-from-gateways-to-direct-connectivity)

- A registered [machine](manage-machines.md) or [machine group](manage-machine-groups.md) that will run the triggered desktop flows. Machines are the physical or virtual devices you use to automate desktop processes. Machine groups allow you to handle multiple machines as one entity and distribute your automation workload.

- A work or school account.

   >[!IMPORTANT]
   >You must use the same work or school account to sign in to Power Automate and to log in to your Windows device.

- A configured [desktop flow connection](desktop-flow-connections.md).

- To run the triggered desktop flows in attended mode, you need an active Windows user session that matches the user's name of your desktop flow connection. In addition, the session must be unlocked. When an attended desktop flow starts on the target machine, avoid interacting with your device until the run completes.

## Trigger a desktop flow from a cloud flow

To trigger a desktop flow from a cloud flow:

1. Go to [Power Automate](https://make.powerautomate.com) and sign in with your credentials.

1. Create a new cloud flow that you'll later use to trigger your desktop flow. This flow can be an instant or an automated cloud flow.

    :::image type="content" source="media/trigger-desktop-flows/create-flow.png" alt-text="Screenshot of the option to create a new cloud flow.":::

1. The following example displays the creation of a manually triggered cloud flow. This step may differ depending on the type of cloud flow you want to create.

    :::image type="content" source="media/trigger-desktop-flows/manually-trigger-flow.png" alt-text="Screenshot of the Build an instant cloud flow dialog.":::

1. In the cloud flow designer, select **+ New Step**.

    :::image type="content" source="media/trigger-desktop-flows/new-step.png" alt-text="Screenshot of the New step option.":::

1. In the **Choose an action** dialog, search for **Power Automate for desktop**. Under **Actions**, select **Run a flow built with Power Automate for desktop**.

    :::image type="content" source="media/trigger-desktop-flows/action-search.png" alt-text="Screenshot of the Run a flow built with Power Automate for desktop action.":::

1. If you haven't already created a desktop flow connection, the action will prompt you to create a new one. You can find more information regarding desktop flow connections in [Create desktop flow connections](desktop-flow-connections.md).

    :::image type="content" source="media/trigger-desktop-flows/desktop-flow-connection.png" alt-text="Screenshot of a dialog to create a new desktop flow connection.":::

1. Set the desired run mode (attended or [unattended](run-unattended-desktop-flows.md)) for your desktop flow and select **Create a new desktop flow** in **Desktop flow**. If you want to trigger an existing desktop flow, select its name instead.

    :::image type="content" source="media/trigger-desktop-flows/run-desktop-flow-v2-action-properties.png" alt-text="Screenshot of the option in the Run a flow built with Power Automate Desktop action.":::

1. Enter a name for the new desktop flow and select **Launch app**.

   :::image type="content" source="media/trigger-desktop-flows/build-desktop-flow-dialog.png" alt-text="Screenshot of the Build a desktop flow dialog":::

1. A message from the browser may appear, asking whether to allow the page to open Power Automate. Select **Open**.

    :::image type="content" source="media/trigger-desktop-flows/browser-open-application.png" alt-text="Screenshot of a browser message asking whether to launch Power Automate.":::

1. At this step,  Power Automate should have created a new desktop flow and opened it in the flow designer.

    :::image type="content" source="media/trigger-desktop-flows/flow-designer-blank.png" alt-text="Screenshot of the flow designer.":::

1. Desktop flows can contain input and output variables to pass data between desktop and cloud flows.

    Input variables enable you to pass data from cloud to desktop flow, while output variables allow you to pass data from desktop to cloud flows. To see more information about input and output variables, go to [Input and output variables](manage-variables.md#input-and-output-variables).

1. Back in the Power Automate portal, any input variables appear as fields in the **Run a flow built with Power Automate for desktop** action.

   > [!NOTE]
   >
   > - If an input variable contains sensitive data, you may want to obfuscate or omit it from the logs. To find more information regarding sensitive text inputs, go to [Manage sensitive input like passwords](../how-tos-use-sensitive-input.md).
   > - The limit of the input size for a desktop flow is 2MB (1MB for Chinese regions)

    :::image type="content" source="media/trigger-desktop-flows/run-desktop-flow-v2-action-properties-2.png" alt-text="Screenshot of the input variables in the Run a flow built with Power Automate for desktop action.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
