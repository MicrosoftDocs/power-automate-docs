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



First, go to the flow website and sign in https://flow.microsoft.com 

Click on "My Flows"

![Create button](./media/learning-create-a-button-flow/graphic.png)

and then Create from blank

search for the button flow trigger
 - select it

![Create button](./media/learning-create-a-button-flow/graphic.png)

Make the input text say "Delivery Arrived

Add a new step – add an action – if not pre-populated 

![Create button](./media/learning-create-a-button-flow/graphic.png)

Now let’s search for Office 365 outlook and choose the action “send an email”

Go ahead and expand the fields and let’s customize this to work for Contoso flooring

![Create button](./media/learning-create-a-button-flow/graphic.png)

On the to: line let’s use the Contoso Warehouse alias Warehouse@contoso.com - > If you’re not familiar

Let’s customize the subject a bit with some dynamic content so these emails don’t all look exactly identical.

![Create button](./media/learning-create-a-button-flow/graphic.png)

To do that let’s make the subject say “The Delivery for”

now click on dynamic content and 

![Create button](./media/learning-create-a-button-flow/graphic.png)

choose “Date” which gives us the date of the button press and 

continue with “has arrived at” and 

![Create button](./media/learning-create-a-button-flow/graphic.png)

select dynamic content again and enter the timestamp of the button press.

Make sense? Cool. Now let’s type up a simple Body of the email saying “Warehouse Team, please come to the unload bay as todays delivery has arrived”

Now let’s rename our Flow, click on create Flow, and voila!

![Create button](./media/learning-create-a-button-flow/graphic.png)

Demonstrate how easy it is to make a team Flow;

 we will use this button Flow as an example because what if the creator of this Flow is out sick? 

What if he leaves the company? We want to make sure that this Flow keeps running, so we will add co-owners!

## Create a Team Flow ##

Make sense? Cool. 

 We want to make sure that this Flow keeps running, so we will add co-owners!

![Create button](./media/learning-create-a-button-flow/graphic.png)


## Summary ##

In minutes, we created the ability for a warehouse worker to alert his team to a delivery arrival so they all didn’t have to stand around and wait for it, while wasting valuable time on other tasks. 

He then shared that button out to his team, so others could trigger the same Flow if he wasn’t around.

Check out the next video to see how we create a flow that uses push notifications

## Next lesson ##

Now that you've gotten a taste of what Microsoft Flow is and what it can do, let's take a look at what makes a flow. 