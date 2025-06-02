1. To add the **Condition** action, select the plus sign.
1. In the **Add an action** search field, type **condition**.
1. In the list below the search field, select the **Condition** action.
1. In the **Parameters** tab, select the first **Choose a value** field, and then select the lightning bolt icon.
1. Select the **Responses Approval response** value.

    If the expected response doesn't appear, select **See more** in the title bar of the dropdown menu to display additional values.

1. In the next field, select **is equal to** from the dropdown menu.
1. In the other **choose a value** field, type **Approve**.

    :::image type="content" source="media/modern-approvals/add-condition.png" alt-text="Screenshot showing how to add a condition in the new designer.":::

1. Close the configuration pane.
1. In the designer, select the plus sign in the **True** branch.
1. In the **Add an action** search field, type **send email**.
1. In the list below the search field, select the **Send an email (V2)** action.

    The **Parameters** tab displays. This is the template for the email that is sent when the status of the vacation request changes.

1. Select the **To** field and then select the lightning bolt icon.
1. Select the **Created By Email** dynamic value from the **Approvals - Start and wait for an approval** action you created in [Add an approval action](../modern-approvals.md#add-an-approval-action).
1. In the **Subject** field, type a subject for the email. This example uses *Your vacation request hs been approved* as the subject.
1. In the **Body** box, type a message for the email:
    1. Type the standard text you want to appear in the email, such as *Your vacation request has been approved by*.
    1. To insert the name of the person who approved the vacation request, place your cursor in the **Body** box at the location where you want the name to appear, and then select the lightning bolt icon.
    1. Select a dynamic value from the dropdown menu. The following example uses the **Responses Approver name** dynamic value.
    1. To insert the comments from the approver, type *Approver's comments*.
    1. Place your cursor in the **Body** box at the location where you want the comments to appear, and then select the lightning bolt icon.
    1. Select a dynamic value from the dropdown menu. The following example uses the **Responses comments** dynamic value.

        :::image type="content" source="media/modern-approvals/yes-email-config-new-designer.png" alt-text="Screenshot showing how to configure an email in the new designer.":::


