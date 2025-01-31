---
title: Optimize Power Automate triggers
description: Learn how to optimize Power Automate triggers
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/30/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Optimize Power Automate triggers

## Set trigger conditions

Many Power Automate users encounter the issue of their flows running every time a new row is added or an existing row is modified in the data source. However, there are often scenarios where you only want the flow to execute when a specific condition is met. To achieve this behavior, you need to configure your triggers correctly. By setting up the right conditions for your triggers, you can ensure that your flow runs only when necessary, improving efficiency and reducing unnecessary executions.

Consider a scenario where any user who submits an expense more than $5,000 needs to get approal from their manager. If the trigger conditions are not specified, the flow will run for every expense that is submitted and the flow author will have to specify additional conditions to filter the expense greater than $5,000. With trigger conditions, the flow only triggers when the expense is more than $5,000.

This screenshot shows a flow that triggers when a row is added, modified, or deleted. A condition checks if the amount is greater than 100 and starts the approval if the condition is met. This flow is started every time data in the table is added, modified, or deleted.

:::image type="content" source="media/no-trigger-condition.png" alt-text="A screenshot of a flow using a condition instead of a trigger condition":::

This screenshot shows a flow with a trigger condition on the "When a row is added, modified, or deleted" action that checks if the amount is greater than 100 and then starts the approval. This flow only starts when the value in the amount field is greater than 100. 

:::image type="content" source="media/trigger-condition.png" alt-text="A screenshot of a flow using a condition instead of a trigger condition":::

> [!NOTE]
> The OData filter property in Power Automate is a powerful feature that allows you to define precise conditions for when a flow should be triggered based on changes in Dataverse data - you can specificy a condition and the names of the columns on which the flow can trigger. This helps in optimizing flow performance and ensuring that flows run only when necessary.

## Configure concurrency control

In some scenarios, your flow might interact with data sources that have limited throughput. In such cases, configuring the trigger’s concurrency control can help manage the flow's execution more effectively. By default, a cloud flow trigger executes as many runs as possible simultaneously when its conditions are met. However, you can change this behavior by adjusting the *Concurrency Control* settings, allowing you to limit the number of concurrent runs from a minimum of 1 up to 100. Any other runs are queued automatically.

To use concurrency control:

- **Limited throughput resources**: If your automation depends on an on-premises resource that doesn't support parallel executions, configuring concurrency control can prevent overloading the resource.

- **Preventing race conditions**: Limiting concurrency ensures that only one instance of the flow runs at a time and avoids race conditions where a dirty-read might occur due to parallel executions.

To configure concurrency control:

- **Accessing concurrency control settings**: In the Power Automate portal, open the flow you want to configure. Go to the trigger settings by selecting the trigger card. Expand the **Settings** section to find the **Concurrency Control** option.

- **Setting the concurrency limit**: Enable the **Concurrency Control** option. Specify the maximum number of concurrent runs you want to allow. You can set this number between 1 and 100.

- **Applying the settings**: Save the changes to apply the concurrency control settings to your flow.

:::image type="content" source="media/trigger-concurrency-control.png" alt-text="A screenshot of a setting the trigger concurrency control":::

### Important considerations

- **Irreversible action**: Once applied, concurrency control settings can't be undone. To remove concurrency control, you need to create a new flow. Therefore, proceed with caution.
- **Best practices**: It's best to leave the concurrency control at its default setting. If you need to apply concurrency control, consider doing so on a flow with the least number of actions. For example, you might organize actions that require such control into a dedicated child flow, applying the control only to the child flow.

## Flow turn-off behavior

A trigger is an event that initiates a cloud flow in Power Automate. For example, if you want to receive a notification in Microsoft Teams whenever someone sends you an email, the event of receiving an email acts as the trigger that starts this flow.

### How Do triggers work?

There are two main types of triggers in Power Automate. Once you create a flow, the trigger registers itself to either poll the service it connects to or listen for events from the service. Here’s how it works:

1. **Polling triggers**: 
    - These triggers periodically check (or *poll*) a service to see if a specific event has occurred. For instance, a SQL trigger might poll a SQL server at regular intervals to check for new or updated records.
    - If you set up a SQL trigger, it polls the SQL server at defined intervals to check for changes that meet your specified conditions.
    - When the flow is turned on again, all unprocessed or pending events are processed. If you don't want to process pending items when you turn your flow back on, delete and then recreate your flow.
2. **Webhook triggers**: 
    - These triggers listen for specific events in real-time. When the event occurs, the service sends a notification to Power Automate to start the flow. For example, an Outlook trigger listens for incoming emails and triggers the flow as soon as a new email arrives.
    - If you set up an Outlook trigger, it listens to the Outlook service and trigger the flow immediately when a new email is received.
    - When the flow is turned on again, it processes new events that are generated after the flow is turned on.

### Polling triggers

Once a polling trigger is registered, it periodically checks the service every X minutes to retrieve details of any new or modified records/events based on the filters applied to the trigger. The frequency of these checks depends on the user's license.

- **Timestamp tracking**:  The trigger tracks the timestamp of its last poll. Every X minutes, it polls the service again based on this timestamp.

**Example scenario**: 
  - If the trigger is set to activate when a new SQL record is created, it polls the SQL service every minute (or the specified interval). It retrieves information on any records created since the last poll.
   - If new records are found, the flow is triggered. If no new records are found, the run is skipped.
   - You can view these polling checks in the run history page under the checks section.
   
- **Handling flow stops**:
   - When a flow is stopped (for example, on September 13 at 12:30 PM), the trigger notes this timestamp.
   - When the flow is restarted (for example, on September 14 at 1:30 PM PT), it polls the service for all events created between the last poll time (September 13 at 12:30 PM) and the current time (that is, September 14 at 1:30 PM).
   - This behavior ensures no data is missed, even if the flow is stopped temporarily due to errors or throttling.
   
**Important considerations**:
   - Turning off the flow doesn't deregister the trigger; it only pauses the polling. This design ensures that data isn't missed when the flow is restarted.
   - To completely reset the polling behavior, you need to create a new copy of the flow. This re-registers the trigger when the flow is turned on for the first time, and you should delete the existing flow to avoid conflicts.

### Webhook triggers

Webhook triggers operate differently from polling triggers. Instead of periodically checking a service, webhook triggers register with the service to receive notifications when specific events occur.

- **Registration**: When a webhook trigger is created, it registers with the service to indicate that it wants to receive notifications for certain events.
- **Event notifications**: Webhooks are simple HTTP callbacks used to provide event notifications. When the specified event occurs, the service sends an event notification to the webhook trigger with all the details of that event.
- **Flow activation**: Power Automate allows you to use webhooks as triggers. When the webhook trigger receives the event notification, it activates the flow, which then performs the specified actions.

Learn more: [My trigger is firing for old events](/power-automate/triggers-troubleshoot?tabs=classic-designer#my-trigger-is-firing-for-old-events)
