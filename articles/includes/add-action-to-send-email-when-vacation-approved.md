1. To add the **Condition** action, select **New step**.
1. In the search field, type **condition**.
1. In the **Action** list below the search field, select the **Condition** action.
1. In the **Condition** field, select the first **Choose a value** field.
1. In the **Dynamic content** list, select the **Responses Approval response** value.
1. In the next field, select **is equal to** from the dropdown menu.
1. In the other **choose a value** field, type **Approve**.
1. On the **If yes** branch of the condition, Select **Add an action**.

    :::image type="content" source="media/modern-approvals/add-action-after-condition.png" alt-text="Screenshot showing how to add a new action after the condition in classic designer.":::

1. On the **Choose an operation** card, enter **send email** in the search field.
1. Select the **Send an email (V2)** action.

    :::image type="content" source="media/modern-approvals/select-send-email-yes.png" alt-text="Screenshot showing how to select the send email action in classic designer.":::

1. In the **To** field, select **Add dynamic content**.
1. Select the **Created By Email** dynamic value from the **Approvals - Start and wait for an approval** action you created in [Add an approval action](../modern-approvals.md#add-an-approval-action).
1. In the **Subject** field, type a subject for the email. This example uses *Your vacation request has been approved* as the subject.
1. In the **Body** field, type a message for the email:
    1. Type the standard text you want to appear in the email, such as *Your vacation request has been approved by*.
    1. To insert the name of the person who approved the vacation request, place your cursor in the **Body** field at the location where you want the name to appear, and then select **Add dynamic content**.
    1. Select a dynamic value from the dropdown menu. The following example uses the **Responses Approver name** dynamic value.
    1. To insert the comments from the approver, type *Approver's comments*.
    1. Place your cursor in the **Body** field at the location where you want the comments to appear, and then select **Add dynamic content**.
    1. Select a dynamic value from the dropdown menu. The following example uses the **Responses comments** dynamic value.

