<properties
    pageTitle="Manage flows from your phone | Microsoft Flow"
    description=""
    services=""
    suite="flow"
    documentationCenter="na"
    authors="AFTOwen"
    manager="erikre"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="06/11/2016"
   ms.author="anneta"/>

# Manage flows in Microsoft Flow from your phone #
Show a list of all flows that you created and, for each flow, show its events and actions, enable or disable it, and show its run history.

**Prerequisites**
- Install the mobile app for Flow.
- If you don't already have a flow, create one. For easier testing, use one that you can trigger yourself instead of waiting for an external event.

The flow in this tutorial runs when you receive mail from a specific address:

![Trigger flow on receipt of mail from specific address](./media/mobile-manage-flows/create-trigger.png)

You could configure such a flow with your personal email address for testing and a different address (for example, your manager's) when the flow is ready for real use.

When the flow runs, it sends a message in Slack:

![Send message to Slack](./media/mobile-manage-flows/create-event.png)

## Manage a flow ##
1. Open the mobile app, and then tap **My flows** at the bottom of the screen to list all your flows.

	Each entry shows the name of the flow, icons for its events and actions, and the time when it ran most recently, and an icon that indicates whether the most recent run succeeded.

	![List of flows](./media/mobile-manage-flows/flow-list.png)

1. Tap a flow to show options for managing it.

	![Options to manage a flow](./media/mobile-manage-flows/flow-details.png)

1. Tap the **Enable flow** toggle to enable or disable the flow.

1. Tap **See flow** to show the events and actions for that flow, tap each event or an action to expand it, and then tap **Back**.

	![Events and actions for a flow](./media/mobile-manage-flows/flow-event-action.png)

1. Tap **Run history** to show the flow's successes, failures, or both.

	![List of runs](./media/mobile-manage-flows/history-mixed.png)

1. Tap a run to show whether each event and action succeeded and, if so, how much time (in seconds) it took.

	![Run details](./media/mobile-manage-flows/flow-run.png)

1. If you want to create a flow, tap **Back** three times, and then tap the plus icon in the upper-right corner.

	The website for Microsoft Flow opens in your browser, where you can select a template and create a flow from it.
