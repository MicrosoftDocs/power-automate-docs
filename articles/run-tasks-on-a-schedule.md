<properties
    pageTitle="Run flows on a schedule | Microsoft Flow"
    description="Automate recurring tasks by running flows on a schedule, such as every day or every hour."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="stepsic-microsoft-com"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="09/14/2017"
   ms.author="stepsic"/>

# Run flows on a schedule #
Create a flow that performs one or more tasks (such as sending a report in email):

- once a day, an hour, or a minute
- on a date that you specify
- after a number of days, hours, or minutes that you specify

## Create a recurring flow ##

1. Sign in to [Microsoft Flow](https://flow.microsoft.com), and then select **My flows** in the top navigation bar.

	![My flows option](./media/run-tasks-on-a-schedule/create-flow.png)

1. Select **Create from blank**.

	![Create a flow from blank](./media/run-tasks-on-a-schedule/create-from-blank.png)

1. Select **Search hundreds of connectors and triggers**.

1. In the **Search all connectors and triggers** box, type **Recurrence**, and then select **Schedule - Recurrence**.

	![Find recurrence trigger](./media/run-tasks-on-a-schedule/select-recurrence.png)

1. In the **Recurrence** dialog box, specify how often you want the flow to run.

	For example, specify **2** under **Interval** and **Weeks** under **Frequency** if you want the flow to run every two weeks.

	![Specify recurrence](./media/run-tasks-on-a-schedule/specify-recurrence.png)

1. Specify when you want the flow to run:

	1. Select **Show advanced options**.

	**Note**: These options change based on the values to which **Interval** and **Frequency** are set. If your screen doesn't match the graphic below, make sure that **Interval** and **Frequency** are set to the same values that the graphic shows.

	1. Select a **Time zone** to specify whether the **Start time** reflects a local time zone, Universal Coordinated Time (UTC), etc.
	1. Specify a **Start time** in this format:<br>YYYY-MM-DDTHH:MM:SSZ
	1. If you specified **Day** under **Frequency**, specify the time of day when the flow should run.
	1. If you specified **Week** under **Frequency**, specify the day or days of the week on which the flow should run and the time or times of day when the flow should run.

	For example, configure the options as shown to start a flow no sooner than noon (Pacific time) on Monday, January 1, 2018, and run it every two weeks on Tuesdays at 5:30p (Pacific time).

		![Specify advanced options](./media/run-tasks-on-a-schedule/advanced-options.png)

1. Add the action or actions that you want the flow to take, as [Create a flow from scratch](get-started-logic-flow.md) describes.

## Delay a flow ##

1. Sign in to [Microsoft Flow](https://flow.microsoft.com), and then select **My flows** in the top navigation bar.

	![Create a flow from blank](./media/run-tasks-on-a-schedule/create-flow.png)

1. Select **Create from blank**.

	![Create a flow from blank](./media/run-tasks-on-a-schedule/create-from-blank.png)

1. Select **Search hundreds of connectors and triggers**.

1. Specify an event as [Create a flow from scratch](get-started-logic-flow.md) describes.

1. Select **New step**, and then select **Add an action**.

	![Option to add an action to a flow](./media/run-tasks-on-a-schedule/add-action.png)

1. In the list of actions, do either of the following:
	- Select **Delay**, specify a **Count**, and specify a **Unit** of time such as second, minute, or hour.
	- Select **Delay until**, and then specify a date in the specified timestamp format.

	![Add a delay](./media/run-tasks-on-a-schedule/add-delay.png)
	![Specify delay in units of time](./media/run-tasks-on-a-schedule/delay.png)
	![Specify delay until](./media/run-tasks-on-a-schedule/delay-until.png)
