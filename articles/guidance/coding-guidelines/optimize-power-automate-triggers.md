---
title: Optimize Power Automate triggers
description: Learn how to optimize Power Automate triggers
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Optimize Power Automate triggers

## Set trigger conditions

A common issue for many users who work with Power Automate is that their flow runs whenever a new row or an existing row is modified in the data source. However, we only need the flow to execute when a specific condition is satisfied. Setting triggers correctly can enable your flow to run only when necessary.

Consider a scenario where any user who submits an expense more than $5,000 need to get approved by their management. If the trigger conditions are not specified, the flow will run for every expense that is submitted and flow author will have to specify additional conditions to filter the expense greater than $5,000. With trigger conditions, the flow only triggers when the expense is more than $5,000.

Here is the flow for above scenario without trigger conditions:

![A screenshot of a computer  Description automatically generated](media/image17.png)

Here is the flow with trigger conditions:

![A screenshot of a computer  Description automatically generated](media/image18.png)

> [!NOTE]
> In Dataverse triggers, OData filter property also allows the trigger to fire only when the filter conditions are met. You can also specify the names of the columns on which the flow can trigger.

In some rare scenarios where your flow might work with data sources with limited through-put, you might consider configuring the trigger’s concurrency control. By default, the Cloud Flow trigger executes as many runs as possible at the same time when its conditions are met. We can change this behavior by changing its Concurrency Control, with the ability to limit from a minimum of 1 up to 100 runs at the same time. Any more runs are queued automatically.

For example, we might perform an automation that has a dependency on an on-premises resource that doesn't support parallel executions, or to prevent race-conditions where a dirty-read is possible when there are parallel executions.

Once applied, this action can't be undone. To remove the concurrency control, you need to create a new flow. Therefore, you proceed with caution. The best practice is to leave it as default, but in the event where this is required, do this on a flow that has the least number of actions – for example you might organize your actions that work with data sources that requires such control to be in a dedicated child flow so you can apply this control only in the child flow.

:::image type="content" source="media/image19.png" alt-text="Graphical user interface, text, application Description automatically generated" border="true":::

:::image type="content" source="media/image20.png" alt-text="Application, table Description automatically generated" border="true":::

## Flow turn-off behavior

A trigger is an event that starts a cloud flow. For example, if you want to get a notification in Microsoft Teams when someone sends you an email, in this case, you receive an email is the trigger that starts this flow.

### How do trigger work?

There are two types of triggers:

- Polling triggers
- Webhook triggers

Once the flow is created, the trigger registers itself to either poll the service it's trying to connect to or listen to the service. By service we mean that if its a SQL trigger it polls or listens to the SQL server it's trying to connect. If it's an Outlook trigger, it listens to te Outlook service.

| **Trigger type** | **Description** |
|---|---|
| Polling, such as the recurrence trigger | When the flow is turned on again, all unprocessed or pending events are processed. If you don't want to process pending items when you turn your flow back on, delete and then recreate your flow. |
| Webhook | When the flow is turned on again, it processes new events that are generated after the flow is turned on. |

### Polling triggers

Once the polling trigger is registered it polls the service every X min to get the details of any records/events that are created based on the filters that are applied to a trigger, depending on the license that the user owns. To poll the service, in the backend the trigger tracks the timestamp, when it last polled the service and every X minutes based on that time stamp it polls again.

So, say if the trigger is when a SQL record is created, then the trigger polls the SQL Service say every 1 min and gets information on any records that are created in the minutes since it last polled. If there are records that are created it triggers the flow. If there are no records created, then the run is skipped. You can see this poll in checks section in run history page.

Now when the flow is stopped, for example, it stopped on Sept 13th, 12:30 PM. It notes this timestamp as when it last polled the service, when the flow is turned on back it says on Sept 14th 1:30 PM PT, the flow polls the service to get all the events that are created between its last poll time and current time (meaning, it polls for all records between Sept 13th 12:30 PM – Sept 14th 1:30 PM). This is because turning off the flow doesn’t deregister the trigger. It only stops the polling clock. This is by design as sometimes, the flow is stopped erroneously or due to throttling, but we don’t want to miss any data to trigger.

The only way to get around this behavior is to create a new copy of the flow as it re-registers the trigger again when you turn on the flow for the first time and delete the existing one.

### Webhook triggers

Webhook triggers on the other hand, don't poll the service. Once created they register with the service to let, it knows that they want to get any notification when a certain event happens on that service. Webhooks are simple HTTP callbacks used to provide event notifications. Power Automate allow you to use webhooks as triggers. A flow listens for this trigger and performs an action whenever the trigger fires.

The idea is that when an event happens, the service sends an event notification to the trigger with all the details of that particular event and then the flow is triggered. this means that the flow doesn't have to poll the service and reduces many interactions.

Learn more: [My trigger is firing for old events](/power-automate/triggers-troubleshoot?tabs=classic-designer#my-trigger-is-firing-for-old-events)
