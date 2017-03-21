<properties
    pageTitle="Share your button flows with others. | Microsoft Flow"
    description="Share your button flows with others so they can use your buttons and save time."
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
   ms.date="03/22/2017"
   ms.author="deonhe"/>

# Share button flows from your mobile app

You can share [button flows](./introduction-to-button-flows.md) (buttons) with other users or groups within your organization. When you share a button flow, the person or group with whom you share can trigger and run your flow, the same way they run their own flows. You can stop sharing your flows at any time. You manage all button flow sharing activities from the Microsoft Flow mobile app.

>[AZURE.NOTE]All shared buttons run using the *connections* that the button creator used to design the button. However, persons or groups with whom a button has been shared can neither access the credentials used in these *connections*, nor reuse these *connections* in any other flow.

## What you need to share button flows

To share button flows, you need:

- An account with access to [Microsoft Flow](https://flow.microsoft.com).
- A flow to share.
- A mobile device with the Microsoft Flow app installed. This app is available for [iOS](https://itunes.apple.com/app/microsoft-flow/id1094928825) and [Android](https://play.google.com/store/apps/details?id=com.microsoft.flow) devices.
- A group or user within your organization with whom to share your button.

## Share a button flow

Share a button from either the **Buttons** or **Flows** tab of the Microsoft Flow app.

From the **Buttons** tab:

1. Tap **...** next to the button flow you want to share.

     ![share button](./media/share-buttons/share-button-flows-buttons-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-buttons/share-button-flows-run-only.png)

Optionally, from the **Flows** tab:

1. Tap the flow you want to share.

     ![share a button from the flows tab](./media/share-buttons/share-button-flows-flows-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-buttons/share-button-flows-tab-run-only.png)

After you've tapped **Share as run-only** from either the **Flows** or **Buttons** tab, follow these steps to share your button flow with another user or group:

1. Tap **Invite others** from the **Button users** page.

      ![share button](./media/share-buttons/share-button-flows-button-users.png)

1. Search for, and then select the group or person with whom you'd like to share the button.

      ![share button](./media/share-buttons/share-button-flows-invite-others-select.png)

1. Tap **SEND** on the **Invite others** page.

      ![share button](./media/share-buttons/share-button-flows-invite-others-send.png)

1. Tap **OK** to acknowledge that your button flow will use the *connections* that exist in the button whenever the person or group you've shared it with runs it.

      ![share button](./media/share-buttons/share-button-flows-invite-others-ok.png)

1. Tap **DONE** on the page that indicates the button flow sharing operation completed successfully.

      ![share button](./media/share-buttons/share-button-flows-invite-others-done.png)

## View the list of button users

You can view the list of groups or users with whom a button is shared by going to either the **Buttons** or **Flows** tab and following the steps below.

From the **Buttons** tab:

1. Tap **...** next to the button flow in which you are interested.

     ![view button users](./media/share-buttons/share-button-flows-buttons-tab.png)

1. Tap **Share as run-only**.

      ![view button users](./media/share-buttons/share-button-flows-run-only.png)

Optionally, from the **Flows** tab:

1. Tap the flow in which you are interested.

     ![view button users](./media/share-buttons/share-button-flows-flows-tab.png)

1. Tap **Share as run-only**.

      ![view button users](./media/share-buttons/share-button-flows-tab-run-only.png)

After you've tapped **Share as run-only** from either the **Flows** or **Buttons** tab, you'll see the **Button users** page; this page shows the list of groups or users with whom the specific button is shared.

![view button users](./media/share-buttons/share-button-flows-button-users-list.png)

## Stop sharing a button

Use the **Buttons** or **Flows** tab when you want to stop sharing a button with a user or group.

From the **Buttons** tab:

1. Tap **...** next to the button flow you no longer want to share.

     ![stop sharing button](./media/share-buttons/share-button-flows-buttons-tab.png)

1. Tap **Share as run-only**.

      ![stop sharing button](./media/share-buttons/share-button-flows-run-only.png)

Optionally, from the **Flows** tab:

1. Tap the flow you no longer want to share.

     ![stop sharing a button from the flows tab](./media/share-buttons/share-button-flows-flows-tab.png)

1. Tap **Share as run-only**.

      ![stop sharing button](./media/share-buttons/share-button-flows-tab-run-only.png)

After you've tapped **Share as run-only** from either the **Flows** or **Buttons** tab, you'll see the **Button users** page; this page lists the groups or users with whom the specific button is shared.

![stop sharing button](./media/share-buttons/share-button-flows-button-users-list.png)

Now you're on the **Button users** page, use these steps to stop sharing a button flow with a user or group:

1. Tap the user or group with whom you want to stop sharing the button.

     ![stop sharing button](./media/share-buttons/share-button-flows-remove-user-list.png)

1. Tap **Remove user** when the user's page is displayed.

     ![stop sharing button](./media/share-buttons/share-button-flows-remove-user.png)

1. Wait for the remove operation to complete. Notice the **Button users** list refreshes, and the user or group you removed is no longer listed.

     ![stop sharing button](./media/share-buttons/share-button-flows-remove-user-result.png)

## Monitor the run history

All run history, including the runs initiated by a person with whom a button flow is shared, appear only on the **Activity** tab of the button flow creator's Microsoft Flow mobile app.

## Use shared buttons

You can find buttons that have been shared with you by going to the **Add buttons** list. You get to this list by tapping either the **New buttons are available** banner or **GET MORE**. Both of these options are available from the **Buttons** tab, however, the **New buttons are available** banner only displays when a new button is shared with you.

### From the New buttons are available banner

1. Select the **New buttons are available** banner from the **Buttons** tab. This banner shows on the **Buttons** tab whenever a new button flow is shared with you. After you select the **New buttons are available** banner, the **Add buttons** page displays, showing the list of buttons that have been shared with you. When you select a button from this list, it is added to your **Buttons** tab. You must add buttons that have been shared with you to the  **Buttons** tab before you can run them.

     ![new button shared with me](./media/share-buttons/share-button-flows-banner.png)

1. Tap the button flow you want to use. The tapped button will be immediately added to the **Buttons** tab of the Microsoft Flow app. You can then use the button flow from the **Buttons** tab, just like any other button flow that's listed there.

     ![new button shared with me](./media/share-buttons/share-button-flows-buttons-shared-with-me.png)

### From **GET MORE**

1. Select **GET MORE** from the **Buttons** tab. You will then see the **Add buttons** list, which shows all button flows that have been shared with you.

     ![new button shared with me](./media/share-buttons/share-button-flows-buttons-tab-get-more.png)

1. Tap the button flow you want to use. The tapped button will be immediately added to the **Buttons** tab of the Microsoft Flow app. You can then use the button flow from the **Buttons** tab, just like any other button flow that's listed there.

      ![new button shared with me](./media/share-buttons/share-button-flows-buttons-shared-with-me.png)

## Stop using a shared button

If you no longer want to use a button that was shared with you, remove it from the **Buttons** tab by taking these steps from the **Buttons** tab:

1. Tap **...** next to the button flow you no longer want to use.

     ![remove button](./media/share-buttons/share-button-flows-added-shared-button.png)

1. Tap **Remove** from the menu that appears.

      ![remove button](./media/share-buttons/share-button-flows-share-no-more.png)

That's it. The button will no longer appear on the **Buttons** tab of the Microsoft Flow app.

>[AZURE.NOTE]After you remove a shared button, you can add it back into the **Buttons** tab later by selecting **GET MORE** from the **Buttons** tab.
