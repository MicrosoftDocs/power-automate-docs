### Add a condition

1. Select **New step**, and then select **Add a condition**.

     ![add condition](./media/modern-approvals/add-response-condition.png)

1. Select the **Object Name** box, and then enter **response** into the search box on the **Add dynamic content from the apps and services used in this flow** card.

1. Select the **Response** token.

     ![select response token](./media/modern-approvals/search-for-response.png)

1. Select the **Value** box, and then enter **Approve** into the box.

> [AZURE.NOTE]The valid responses to the SharePoint Online list requests are "Approve" and "Reject". These responses are case-sensitive.

1. Your **Condition** card should now resemble this image:

     ![](./media/modern-approvals/response-condition-test.png)