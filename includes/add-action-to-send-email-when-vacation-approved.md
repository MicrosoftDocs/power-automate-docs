### Add an email action for approvals

Follow these steps to send an email if the vacation request is approved:

1. Select **Add an action** on the **IF YES, DO NOTHING** branch of the condition.

     ![add new step](./media/modern-approvals/add-action-after-condition.png)

1. Enter **send email** into the search box on the **Choose an action** card.

     ![search for email actions](./media/modern-approvals/search-send-email-yes.png)

1. Select the **Office 365 Outlook - Send an email** action.

     ![select send and email action](./media/modern-approvals/select-send-email-yes.png)

1. Configure the **Send an email** card to suit your needs.

     Note: **To**, **Subject**, and **Body** are required.

     This card is the email template for approved vacation requests.

     ![configure approved email template](./media/modern-approvals/yes-email-config.png)

     Note: In the **Body** box on the **Send an email** card, use the **Comments** token from the **Approvals - Start an approval** action.
