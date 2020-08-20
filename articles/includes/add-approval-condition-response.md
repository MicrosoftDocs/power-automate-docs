1. Select **+New step**, and then select **Condition** in the list of actions.
1. in the **Condition** card, and then enter **response** into the search box on the **Add dynamic content from the apps and services used in this flow** card.
1. On the **Condition** screen, select the first **Choose a value** field to display a list of dynamic content options. Then, select **Responses Approver response**.

    ![select response token](media/modern-approvals/search-for-response.png)
1. Select the **Value** box, and then enter **Approve** into the box.

   > [!NOTE]
   > The valid responses to the **Approvals - Start an approval** action are "Approve" and "Reject". These responses are case-sensitive.

1. Your **Condition** card should now show:
    
    * Object name: *Response*
    * Relationship: *Is equal to*
    * Value: *Approve*

    ![View of the condition card](media/modern-approvals/response-condition-test.png "View of the condition card")
