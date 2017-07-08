<properties
   pageTitle="Create a button flow | Microsoft Flow"
   description="Create a button flow and team flow for Contoso Flooring."
   services=""
   suite="flow"
   documentationCenter="na"
   authors="v-joaloh"
   manager="anneta"
   editor=""
   tags=""
   featuredVideoId="kZs7lqgp4LU"
   courseDuration="5m"/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="06/08/2017"
   ms.author="v-joaloh"/>

# Create a button flow #

Welcome to Guided Learning, where you will learn how to **build a button flow** for the Contoso Flooring Company. 

Button flows can be used to **send email** to a team and **alert them of tasks** to perform. **Ownership** of the flows **can be assigned to one** worker or **shared by multiple** members of the team.  

  
First, go to the [ Microsoft Flow website](https://ms.flow.microsoft.com/en-us/) and sign-in.

Once you are done with the sign-in, select **My Flows**, and then **Create from blank**.

![Create from blank](./media/learning-create-button-flow/2-create-from-blank.png)

The first thing you'll need is a **trigger**. The **button flow** is a convenient one to use. 

If it's not there in your list, enter **button in the top field**, and it will pop up for you. 

Select **Flow button for mobile**.

![Search button](./media/learning-create-button-flow/3-button-flow.png) 

Select **Flow button for mobile -- Manually Trigger a flow**.

![Select manual trigger](./media/learning-create-button-flow/4-press-it.png)

On the input screen, enter **input text**,

![Add input](./media/learning-create-button-flow/5-add-input.png)

and enter **Delivery Arrived** for a title.

![Add input](./media/learning-create-button-flow/6-text-for-flow.png)

Select **New step**, 

![Input text](./media/learning-create-button-flow/7-input-description.png)

and then select **Add an action**. 

![Add action](./media/learning-create-button-flow/8-add-an-action.png)

If you didn't have it pre-populated, just **search outlook**, and there it is.

![Search outlook](./media/learning-create-button-flow/9-search-outlook.png)


The action that you want to use is **send an email**.

When the **button is pressed**, an email is sent to the **whole Contoso Warehouse team**, no matter where they are in the building, letting them know that the delivery has arrived.

![Send email](./media/learning-create-button-flow/10-send-email.png)

Go ahead and **expand the fields** and customize this to work for Contoso flooring.

In the To field, type the Contoso Warehouse distribution list, **Warehouse@Contoso.com**.

Make the subject of the email say, **Delivery Arrived**. 

To the right, notice a **dynamic content** box popped up. To show, in the Subject line, the exact date and time the **button was pressed**, click **Date** and **Timestamp**. 

![Email date time](./media/learning-create-button-flow/11-email-date-time.png)


Now, type a simple **Body** of the email saying something like, **Warehouse Team, please come to the unload bay as todays delivery has arrived**.

Press **Create flow**, to send the email.

![Create flow](./media/learning-create-button-flow/12-create-flow.png)


## Create a team flow ##

You can use this button flow as an example of how to create a team flow. What if the creator of this flow is out sick? What if she leaves the company? You want to make sure that this flow keeps running. To do that,  **add co-owners**.

Click the **team icon** on your flow to add a co-owner.

![Create team flow](./media/learning-create-button-flow/13-create-team-flow.png) 

Enter **names**, **email addresses**, or **user groups** to add co-owners.

![Add co-owners](./media/learning-create-button-flow/14-add-co-owners.png)

To **remove co-owners**, click the trash can to the right of their name.

![Remove co-owners](./media/learning-create-button-flow/15-remove-co-owners.png)

Verify you want to **Remove this owner**.

![Remove co-owners](./media/learning-create-button-flow/16-agree-to-remove.png)

## Summary ##

In this lesson, you've seen how to **create a button flow**. 

In minutes, the flow gave a warehouse worker the ability to **alert her team** to a **delivery arrival**, so that the team didn’t have to stand around and wait, wasting valuable time they could spend on other tasks. 

The worker then shared that button out to her team, so others could trigger the same flow if she wasn’t around.

## Next lesson ##

Check out the next lesson to see how to create a flow that uses **push notifications**. 