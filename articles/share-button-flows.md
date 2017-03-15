<properties
    pageTitle="Share button flows with others.| Microsoft Flow"
    description="Share button flows with others so they can save time by using your buttons."
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
   ms.date="03/15/2017"
   ms.author="deonhe"/>

# Share button flows from your mobile app

You can share [button flows](./introduction-to-button-flows.md) (buttons) with other users or groups in your organization. When you share a button flow, the person or group you share with can run and trigger your flow. Sharing buttons improves organizational efficiency since others can use a button that's already created by someone else. You can manage all button flow sharing activities from the Microsoft Flow mobile app.

>[AZURE.NOTE]All shared buttons will run using the *connections* that the creator of the button flow used to design the button flow. However, persons or groups with whom a button flow has been shared cannot access the credentials used in these connections. Further, the *connections* in the button flow cannot be used in any other flow.

## What you need to share button flows

To share buttons, you need the following:

- An account with access to [Microsoft Flow](https://flow.microsoft.com)
- A mobile device with the Microsoft Flow app installed. This app is available for [iOS](https://itunes.apple.com/app/microsoft-flow/id1094928825) and [Android](https://play.google.com/store/apps/details?id=com.microsoft.flow) devices.
- A group or user within your organization with whom to share your button

## Share a button flow

Sharing a button flow requires only a few steps from either the **Buttons** or **Flows** tab of the Microsoft Flow app.

From the **Buttons** tab:

1. Tap **...** next to the button flow you want to share.

     ![share button](./media/share-button-flows/share-button-flows-buttons-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-button-flows/share-button-flows-run-only.png)

Optionally, from the **Flows** tab:

1. Tap the flow you want to share.

     ![share a button from the flows tab](./media/share-button-flows/share-button-flows-flows-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-button-flows/share-button-flows-tab-run-only.png)

After you've tapped **Share as run-only** from either the **Flows** or **Buttons** tab, follow these steps to share your button flow with another user or group:

1. Tap **Invite others** from the **Button users** page.

      ![share button](./media/share-button-flows/share-button-flows-button-users.png)

1. Search for, and then select the group or person with whom you'd like to share the button.

      ![share button](./media/share-button-flows/share-button-flows-invite-others-select.png)

1. Tap **SEND** on the **Invite others** page.

      ![share button](./media/share-button-flows/share-button-flows-invite-others-send.png)

1. Tap **OK** to acknowledge that your button flow will use the *connections* that exist in the button whenever the person or group you've shared it with runs it.

      ![share button](./media/share-button-flows/share-button-flows-invite-others-ok.png)

1. Tap **DONE** on the page that indicates the button flow sharing operation completed successfully.

      ![share button](./media/share-button-flows/share-button-flows-invite-others-done.png)

## View the list of button users

You can view the list of groups or users with whom you have shared your buttons.

From the **Buttons** tab:

1. Tap **...** next to the button flow you want to share.

     ![share button](./media/share-button-flows/share-button-flows-buttons-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-button-flows/share-button-flows-run-only.png)

Optionally, from the **Flows** tab:

1. Tap the flow you want to share.

     ![share a button from the flows tab](./media/share-button-flows/share-button-flows-flows-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-button-flows/share-button-flows-tab-run-only.png)

1. After you've tapped **Share as run-only** from either the **Flows** or **Buttons** tab, you'll see the **Button users** page; this page shows the list of groups or users with whom the specific button is shared.

     ![share button](./media/share-button-flows/share-button-flows-button-users-list.png)

## Stop sharing a button

You can remove a user or group from the list of users if you no longer want to share a button flow with that user or group. To do this, follow these steps:

From the **Buttons** tab:

1. Tap **...** next to the button flow you want to share.

     ![share button](./media/share-button-flows/share-button-flows-buttons-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-button-flows/share-button-flows-run-only.png)

Optionally, from the **Flows** tab:

1. Tap the flow you want to share.

     ![share a button from the flows tab](./media/share-button-flows/share-button-flows-flows-tab.png)

1. Tap **Share as run-only**.

      ![share button](./media/share-button-flows/share-button-flows-tab-run-only.png)

1. After you've tapped **Share as run-only** from either the **Flows** or **Buttons** tab, you'll see the **Button users** page; this page shows the list of groups or users with whom the specific button is shared.

     ![share button](./media/share-button-flows/share-button-flows-button-users-list.png)

To stop sharing a button flow, follow these steps from the **Button users** page:

1. Tap the name of the user or group that you want to remove from the shared users list.

     ![share button](./media/share-button-flows/share-button-flows-remove-user-list.png)

1. Tap **Remove user** when the user's page is displayed.

     ![share button](./media/share-button-flows/share-button-flows-remove-user.png)

1. Wait for the remove operation to complete. Notice the **Button users** list refreshes, and the user or group you removed is no longer listed.

     ![share button](./media/share-button-flows/share-button-flows-remove-user-result.png)

## Monitor the run history of a shared button

All run history, including the runs initiated by a person with whom a button flow was shared, appear only on the **Activity** tab of the button flow creator's Microsoft Flow mobile app.

## Use buttons shared with me

You can find buttons that have been shared with you by going to the **Add buttons** list. You get to this list by tapping either the share banner or **GET MORE**.

### From the share banner

1. You will receive an alert on the **Buttons** tab whenever a new button flow is shared with you.

     ![new button shared with me](./media/share-button-flows/share-button-flows-banner.png)

1. Select the **New buttons are available** banner and you will see a list of all buttons that have been shared with you.

     ![new button shared with me](./media/share-button-flows/share-button-flows-buttons-shared-with-me.png)

### From the Add buttons list

1. Select **GET MORE** from the **Buttons** tab.

     ![new button shared with me](./media/share-button-flows/share-button-flows-buttons-tab-get-more.png)

1. You will now see the list of button flows that have been shared with you.

      ![new button shared with me](./media/share-button-flows/share-button-flows-buttons-shared-with-me.png)

To use a button flow from this list, simply tap it; tapping it will immediately add it to the **Buttons** tab of the Microsoft Flow app. You can then use the button flow from the **Buttons** tab, just like any other button flow that's listed there.

## Remove a shared button

If you no longer want to use a button that was shared with you, remove it from the **Buttons** tab by taking the following steps from the **Buttons** tab:

1. Tap **...** next to the shared button flow you no longer want to use.

     ![share button](./media/share-button-flows/share-button-flows-added-shared-button.png)

1. Tap **Remove** from the menu that appears.

      ![share button](./media/share-button-flows/share-button-flows-share-no-more.png)

That's it. The button will no longer appear on the **Buttons** tab of the Microsoft Flow app.

>[AZURE.NOTE]After you remove a shared button, if you need to, add it back into the **Buttons** tab later by selecting **GET MORE** from the **Buttons** tab.
