<properties
    pageTitle="Start button flows with physical buttons from Flic by Shortcut Labs.| Microsoft Flow"
    description="Easily start button flows with physical buttons from Flic by Shortcut Labs."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="04/24/2017"
   ms.author="deonhe"/>

# Run your flows by using physical buttons

It's easy to trigger Microsoft Flow buttons from the Microsoft Flow mobile app on [Android](https://aka.ms/flowmobiledocsandroid) and [iOS](https://aka.ms/flowmobiledocsios), or from [Microsoft Flow](https://flow.microsoft.com).

Taking this a step further, we've now added triggers that you can use to start your flows touching a physical button. For example, you can call your helpdesk, send an email to your team, block your calendar, or reorder supplies by pressing a physical button that starts a flow. Currently, Microsoft Flow partners with [Bttn by The Button Corporation](https://my.bt.tn/) (bttn) and [Flic by Shortcut Labs](https://flic.io/) (flic), two of the leading physical button manufacturers. Visit their websites to learn more about their products, and then integrate your physical buttons with your button flows.

We discuss Flic buttons (Flics) in this document. See the [bttn topic](./bttn-button-flows.md) if you're interested in integrating your bttns with Microsoft Flow.

## Prerequisites

To use Flics with Microsoft Flow, you must have:

- Access to [Microsoft Flow](https://flow.microsoft.com).

- Downloaded Flic's [Android](https://play.google.com/store/apps/details?id=io.flic.app) or [iOS](https://itunes.apple.com/us/app/flic-app/id977593793?ls=1&mt=8) mobile app, and used it to pair one or more Flics.

## Configure Flic button properties

Configure all Flic properties by using Flic's mobile app for [Android](https://play.google.com/store/apps/details?id=io.flic.app) or [iOS](https://itunes.apple.com/us/app/flic-app/id977593793?ls=1&mt=8) before you create your flow.

You can program Flic for clicks, double-clicks, and hold. This screenshot shows a sample of what your Flic configuration process might be like:

![configure Flics](./media/flic-button-flows/configure-flic-actions.png)

Ater you've configured the properties for a Flic button, you can access your registered Flics when you sign into the Flic service through [Microsoft Flow](https://flow.microsoft.com).

## Create a flow that uses Flic buttons

In this walkthrough, we use a Flic to track the amount of time a consultant spends at each client. The consultant pushes the button when she arrives, and then pushes it again, when she leaves a client. Each push of the button starts a run of the flow to which it's connected. The flow then saves the time information in Google Sheets, and then sends a push notification that contains details about the flow run.

Now that you've paired and configured your Flic, let's get started creating our flow.

### Start with a template

1. Sign into [Microsoft Flow](https://flow.microsoft.com).

     ![sign in](./media/flic-button-flows/sign-into-flow.png)

1. Enter **flic** into the search box, and then select the search icon.

     ![search flic](./media/flic-button-flows/search-flic.png)

1. Select the **Track your working hours with Flic smart button** template.

     ![select template](./media/flic-button-flows/flic-templates.png)

1. Review the template's details, and then create a Google Sheet with a **ClickType** column, and a **Timestamp** column.

   ![review template details](./media/flic-button-flows/flic-template-details.png)

     You will use this Google Sheet later in this walkthrough.

    You name columns in Google Sheets by entering the column name at the top of the column. So, your Google Sheet should appear like this:

    ![ddfdf](./media/flic-button-flows/flic-google-sheet.png)

### Add a trigger to your flow

1. Provide your credentials for the services that your selected template uses, and then select **Continue**.

     **Continue** is enabled after you sign into all required services for the template.

     ![provide credentials](./media/flic-button-flows/flic-template-services-sign-in.png)

1. Enter **flic** into the search box, and then select the **Flic - When a Flic is pressed** trigger.

     ![search for flic trigger](./media/flic-button-flows/flic-search-trigger.png)

1. Select the Flic you want to use in the flow from the **Flic button** list on the **Flic - When a Flic is pressed** card.

     ![select flic action](./media/flic-button-flows/select-flic.png)

   On the **Insert row** card:

1. Select the Google Sheet you created earlier from the **File** list.

1. Select the worksheet from the **Worksheet** list.

   Note: Two boxes will appear on the **Insert row** card after you select the worksheet. These boxes represent each of the two columns in the Google Sheet you created earlier.

1. Select the **ClickType** box, and then enter select the **Click type** token.

1. Select the **Timestamp** box, and then enter select the **Click time** token.

     ![configure google sheets data](./media/flic-button-flows/flick-insert-row-card.png)

1. Confirm that the **Send me an email notification** card looks like this screenshot.

     ![confirm email notification](./media/flic-button-flows/flick-insert-row-card.png)

1. Save your flow.

     ![save your flow](./media/flic-button-flows/flick-insert-row-card.png)

Run your flow, and then review the results in the Google Sheet and in your inbox.

For extra credit, consider extending the flow to automatically record your location (latitude and longitude) when the Flic button is pressed.

## More information

- [Share button flows](./share-buttons.md)
- Learn to use [button trigger tokens](./introduction-to-button-trigger-tokens.md) to send real-time data when your button flows are executed
- [Install the Flow app for Android](https://play.google.com/store/apps/details?id=com.microsoft.flow)
- [Install the Flow app for iOS](https://appsto.re/us/5M0qbb.i)
