---
title: Run your flows with Flics smart buttons (preview)
description: Learn how run your flows with physical buttons from Flic by Shortcut Labs.
services: ''
suite: flow
documentationcenter: na
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - kartikraop
  - v-aangie
ms.author: napienko
ms.reviewer: angieandrews
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/30/2023
search.audienceType: 
  - flowmaker
  - enduser
---
# Run your flows with Flics smart buttons (preview)

Trigger your flows by pressing a physical button, known as a Flic, from Shortcut Labs. For example, select a Flic to track your working hours, block your calendar, count visitors at an event, or save geographical locations.

> [!IMPORTANT]
>
> Configure all Flic properties by using Flic's mobile app for [Android](https://play.google.com/store/apps/details?id=io.flic.app) or [iOS](https://itunes.apple.com/us/app/flic-app/id977593793?ls=1&mt=8) before you create your flow.

## Prerequisites

To use Flics with Power Automate, you must have:

- Access to [Power Automate](https://make.powerautomate.com).

- Downloaded Flic's [Android](https://play.google.com/store/apps/details?id=io.flic.app) or [iOS](https://itunes.apple.com/us/app/flic-app/id977593793?ls=1&mt=8) mobile app, and used it to pair one or more Flics.

## Configure Flic properties

Use Flic's mobile app to program the Flic's events. The events are:

- Click (one quick press)

- Double-click (two quick presses)

- Hold (one long press)

This screenshot shows a sample of what your Flic configuration process might be like:

:::image type="content" alt-text="Screenshot of configuration of Flics." source="./media/flic-button-flows/configure-flic-actions.png":::

After you've linked a Flic event to Power Automate, you can select that Flic as a trigger for your flows. You select triggers later in this tutorial.

## Create a cloud flow that's triggered by a Flic

In this tutorial, we use a Flic to run a cloud flow that records the time a consultant spends at each client. The consultant selects the Flic once upon arrival, and then selects it again, just before departure from the client. Each selection of the Flic starts a run of the flow to which it's connected. The flow saves the current time in Google Sheets, and then sends an email notification. The email contains details about the flow run.

Be sure you've used the Flic mobile app to pair and configure at least one click action to trigger Power Automate.

:::image type="content" alt-text="Screenshot of a Flic example." source="./media/flic-button-flows/flic-configured-for-flow.png":::

In this screenshot:

1. The **Click** action is configured to trigger Power Automate.

1. Later in this tutorial, you'll configure the **Flow** to trigger when the Flic is pressed once (clicked).

Let's get started creating our flow.

### Start with a template

1. Sign in to [Power Automate](https://make.powerautomate.com).

2. In the **Search** field, enter **flic**, and then select the search icon.

3. Select the **Track your working hours with Flic smart button** template.

### Create a spreadsheet in Google Sheets

1. Review the template's details and note that this template requires a spreadsheet in Google Sheets.

    :::image type="content" alt-text="Screenshot of template details." source="./media/flic-button-flows/flic-template-details.png":::

1. In Google Sheets, create a spreadsheet that contains a sheet with columns named **ClickType** and **TimeStamp**.

    >[!TIP]
    >
    >You name columns in Google Sheets by entering the column name at the top of the column. Your sheet should appear like this screenshot.
   
   ![Google Sheet.](./media/flic-button-flows/flic-google-sheet.png)

    >[!NOTE]
    >
    >You use this sheet later in this tutorial.

### Add the Flic trigger to your flow

1. Sign in to the template's services, and then select **Continue**.
   
     **Continue** is enabled after you sign into all required services for the template.

1. Enter **flic** into the search box, and then select the **Flic - When a Flic is pressed** trigger.

1. Select the Flic you want to use from the **Flic button** list on the **Flic - When a Flic is pressed** card.

1. Select **click** from the **Events** list to indicate that you want to trigger the flow when the Flic is pressed once.

   Optionally, you can select **any** to indicate that each Flic event (click, double-click, or hold) triggers the flow.

   **Double-click** indicates that the flow triggers when the Flic is quickly pressed two times. **Hold** indicates that a long press on the Flic triggers the flow.

   You're free to create other flows and trigger them using the other events in the **Events** list. For example, you can use the **double-click** event to note the time you leave a client.

### Configure the sheet
 
On the **Insert row** card:

1. Select the spreadsheet you created earlier from the **File** list.

1. Select the sheet from the **Worksheet** list.

    >[!NOTE]
    >
    >Two additional boxes appear on the **Insert row** card after you select the sheet. These boxes represent the two columns in the sheet you created earlier.

1. Select the **ClickType** box, and then select the **Click type** token.

1. Select the **Timestamp** box, and then select the **Click time** token.

    :::image type="content" alt-text="Screenshot of Google Sheets data configuration." source="./media/flic-button-flows/flick-insert-row-card.png":::

### Confirm the email settings are correct

1. Confirm the **Send me an email notification** card looks like this screenshot.

    :::image type="content" alt-text="Screenshot of confirming email notification." source="./media/flic-button-flows/email-settings.png":::

### Save your flow and test it

1. Give your flow a name, and then save it.

    :::image type="content" alt-text="Screenshot of a flow name." source="./media/flic-button-flows/save.png":::

If you've followed along, pressing the Flic once triggers the flow. The flow then records the click type and the current time in the sheet and then sends an email to you.

1. Press your Flic once.

1. Open your worksheet in Google Sheets. You should see the **ClickType** and the **Timestamp** columns populated with the "click" and the time, respectively.

    :::image type="content" alt-text="Screenshot of the ClickType and Timestamp columns." source="./media/flic-button-flows/flic-google-sheet-after-run.png":::

1. You can also see the results of the run from Power Automate or from the Power Automate mobile app. Here's a screenshot of my test run.

    :::image type="content" alt-text="Screenshot of the test run." source="./media/flic-button-flows/flic-test-run-results-portal.png":::

1. Here's what the body of the notification email that you'll receive from the run of the flow looks like.

    :::image type="content" alt-text="Screenshot of the notification body." source="./media/flic-button-flows/flic-email-body.png":::

Consider extending the flow to automatically store your location (latitude and longitude) when the Flic is pressed.

### See also

- [Share button flows](share-buttons.md)
- [Use button trigger tokens to send current data when your button flows are executed](introduction-to-button-trigger-tokens.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
