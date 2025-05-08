1. Select **Add an action** to add the **Condition** action.
1. Select the **Responses Approval response** token from the **Approvals - Start and wait for an approval** action and set it equal to *Approve* in the Parameters tab of the **Condition** action.
1. Select **Add an action** on the **If yes** branch of the condition.

    :::image type="content" source="media/modern-approvals/add-action-after-condition.png" alt-text="Screenshot showing how to add a new action after the condition in classic designer.":::
1. Enter **send email** into the search box on the **Choose an action** card.
1. Select the **Send an email (V2)** action.

    :::image type="content" source="media/modern-approvals/select-send-email-yes.png" alt-text="Screenshot showing how to select the send email action in classic designer.":::
1. Configure the email card to suit your needs.

     >[!NOTE]
     > **To**, **Subject**, and **Body** are required.

     This card is a template for the email that is sent when the status of the vacation request changes.

     In the **Body** box on the **Send an email (V2)** card, use the **Comments** token from the **Approvals - Start and wait for an approval** action created in [Add an approval action](../modern-approvals.md#add-an-approval-action).
