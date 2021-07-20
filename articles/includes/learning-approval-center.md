In a previous topic, you saw how to power your Twitter feed with a SharePoint list in a  simple way. In this topic, you’ll learn how to build a more business-friendly scenario using approvals. This way, anyone with access to the SharePoint list can contribute tweets, and the social media team can approve or reject those tweets. The team maintains control of the account and the content that goes out to customers. 

## Create an approval request flow
1. On the **Power Automate** homepage, select **Approvals**, select **Create approval flow**, and then scroll down and select the **Post list items to Twitter after approval** template. 
   
    ![Select template.](./media/learning-approval-center/create-approval.png)
2. Verify your account credentials for **SharePoint**, **Approvals**, and **Twitter**, and select **Continue**. 
   
    ![Verify credentials.](./media/learning-approval-center/verify-credentials.png)

By default, this template starts an approval process whenever a new item is created in a particular list, and if the item is approved, then it posts a tweet to Twitter. In this topic, you’ll modify this process by adding steps that update the SharePoint list with the approval response, indicate whether it was approved or not, and add any comments that the approver may have added to the proposed tweet. 

1. In the **ContosoTweets** SharePoint list that you created previously, add two new columns:
   
   1. Select the plus sign “**+**”, and select **Yes/No**
   2. Enter **ApprovalStatus** and select **Create**
   3. Select the plus sign “**+**”, and select **Single line of text**
   4. Enter **ApproverComments** and select **Save**
      
      ![Add columns.](./media/learning-approval-center/new-columns.png)
2. Back in **Power Automate**, in the **When a new item is created** action, enter the following values:
   
   * **Site Address**: your team SharePoint URL
   * **List Name**: ContosoTweets
     
     ![Site and list.](./media/learning-approval-center/site-address.png)
3. In the **Start an approval** action, select **Edit** to display all the fields. 
   
    ![Edit fields.](./media/learning-approval-center/edit-all-fields.png)
4. In **Title**, enter **New tweet for** and select **Title** from the dynamic content list. 
   
    ![Title.](./media/learning-approval-center/tweet-title.png)
5. In **Assigned to**, enter and select your name, or a test user name. 
   
    ![Assigned to.](./media/learning-approval-center/tweet-assigned-to.png)
6. In **Details**, remove the default items and add **TweetContent**, **TweetDate** and **Created by DisplayName** from the dynamic content list, connected by the words **on** and **by**. 
   
    ![Details.](./media/learning-approval-center/tweet-details.png)
7. In **Item Link**, copy and paste the URL of your SharePoint list, and in **Item Link Description**, enter **Contoso Tweet List**. 
   
    ![Item link.](./media/learning-approval-center/tweet-item-link.png)
8. In the **Condition** action, hover over the **IF YES** box, select the plus sign “**+**”, and select **Add an action**. 
   
    ![Add an action.](./media/learning-approval-center/add-an-action.png)
9. Search for **update item**, select the **SharePoint** connector, and select the **SharePoint – Update item** action.
   
    ![SharePoint update item.](./media/learning-approval-center/update-item.png)
10. In **Site Address** and **List Name**, enter your site URL and the **ContosoTweets** list again, and in **ID**, enter **ID** from the dynamic content list. 
    
     ![Site, list, and ID.](./media/learning-approval-center/address-list-id.png)
11. Select the **Title** field, and in the dynamic content list, search for **title**. Add the **Title** item from the **When a new item is created** action. 
    
     ![New title.](./media/learning-approval-center/add-title.png)
12. Select **ApprovalStatus** and set the value to **Yes**, then select **ApproverComments** and set the value to **Comments** from the dynamic content list. 
    
     ![Status and comments.](./media/learning-approval-center/approver-status.png)
13. Near the bottom of the **IF NO, DO NOTHING** box, select **Add an action**.
    
     ![Add a no action.](./media/learning-approval-center/add-a-no-action.png)
14. Using the same steps that you used for the **IF YES** configuration, create a **SharePoint – Update item** action and configure the fields with the same values, with the exception of setting **ApprovalStatus** to **No**. 
    
     ![Status = no.](./media/learning-approval-center/status-no.png)
15. Select the **Post a tweet** action, select **Edit**, and set **Tweet text** to **TweetContent** from the dynamic content list.  At the top of the page, select **Create flow** to save your work. 
    
     ![Post and save.](./media/learning-approval-center/post-tweet.png)

This is just one way that Power Automate can empower productivity for your team. Your team can contribute ideas, relevant news, or product guidance, and you still get to maintain control over what gets tweeted out to customers.

In our next topic, we’ll see what it looks like when an approver receives a new request for a proposed tweet. 

