In this topic, you’ll see how to run pre-scheduled flows using a trigger called **Recurrence**.  You’ll build a cloud flow for the Contoso marketing team that automatically pulls customer email addresses from an Excel table on OneDrive. You’ll configure the flow so that once per day, new email addresses that were added to the spreadsheet are then added to a MailChimp customer list. 

## Create a scheduled flow
1. Open **Power Automate**, select **My flows**, and then select **Create from blank**. 
   
    ![](./media/learning-recurrence/flow-create-blank.png)
2. Select **Search hundreds of connectors and triggers**.
3. Search for the **Schedule** service, select it, and then select the **Schedule – Recurrence** trigger.
   
    ![](./media/learning-recurrence/flow-recurrence-trigger.png)
4. Set **Frequency** to **Day**, and **Interval** to **1**. Select **New step**, and select **Add an action**. 
   
    ![](./media/learning-recurrence/frequency-interval.png)
5. Search for **Excel**, select the **Excel** service, and select the action **Excel – Get Rows**. 
   
    ![](./media/learning-recurrence/excel-get-rows.png)
   
    **Note**: Be sure to select **Get rows**, not **Get row**. 
6. Select **File name** and navigate to your file location. Select **Table name** and select the desired table in the spreadsheet. 
   
    ![](./media/learning-recurrence/excel-get-file.png)
7. Add a new action. 
   
    ![](./media/learning-recurrence/new-step.png)
8. Search for the **MailChimp** service, then select the action **MailChimp - Add member to list**.
   
    ![](./media/learning-recurrence/select-mailchimp.png)
   
    **Note:** MailChimp is a *premium* connector. Depending on your Power Automate license, you might need to sign up for a trial to use this connector.
9. Add the **List Id** and **Status** fields from the dropdown menus:
   
   * **List Id** – Select your desired MailChimp mailing list
   * **Status** – Select **Subscribed** 
     
     ![](./media/learning-recurrence/mailchimp-id-status.png)
10. In **Email Address**, use the dynamic content feature to add the **ContactEmail** field. 
    
     ![](./media/learning-recurrence/mailchimp-address.png)
    
     Notice that the flow automatically creates an additional step. Flow detects that you are going to set an action that requires an additional action. Whenever the flow reads a new email address, it will also create a new action for each row. 
    
     ![](./media/learning-recurrence/mailchimp-for-each.png)
11. Use dynamic content to fill in the **First name** and **Last name** fields:
    
    * **First name** – FirstName
    * **Last name** – LastName
      
      ![](./media/learning-recurrence/mailchimp-names.png)

Now this flow will run once a day and get new rows from this Excel table, grab the email address and name, and use them to populate the MailChimp Contoso mail list, saving you both time and money. 

