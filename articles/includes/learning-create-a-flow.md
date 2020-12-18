Welcome back to Guided Learning for Power Automate. In this lesson, you will see more of the Power Automate environment, and you can **build your first flow**.

Getting started with Power Automate is easy, as there are a huge number of **templates to choose** from, which will help you connect the services you are already using in more meaningful ways.  

## Power Automate templates
Take a look at the [ Power Automate website](https://ms.flow.microsoft.com), and open the **Templates** menu. As you scroll through the list, you see that Power Automate allows you to connect to many services.

![Flow Website -> Template list](./media/learning-create-a-flow/template-list.png)

## Choose a template
**Searching for attachments** through email can be time consuming, and this flow saves time by **storing all your email attachments** into a folder in your OneDrive.

Select the **Save Office 365 email attachments to OneDrive for Business** template.

![Office 365 email](./media/learning-create-a-flow/office-365-email.png)

## Create and administer a cloud flow
This is one of our **one click** templates, where you only answer relevant questions **necessary to build the flow**.

On the template graphic, there is a **description** of what the template **does and needs** to succeed.

You are asked to **provide credentials** for the **Office 365 Outlook** and **SharePoint** services. If you use both services regularly, you will already be signed into them.

![Save Office 365 email](./media/learning-create-a-flow/save-flow-office-description.png)

1. Select **Create Flow**.
   
    ![Click create flow](./media/learning-create-a-flow/click-create-flow.png)
   
    Then you'll see the results. 
   
    ![Create successful](./media/learning-create-a-flow/create-successful.png)
   
    Flow has **created a folder** on your OneDrive, where it will now automatically place **every attachment** that gets emailed to your work email.
2. Open **My Flows**.
   
    ![Open my flows](./media/learning-create-a-flow/click-my-flows.png)
3. Select the **flow you just made** to see how it works.
   
    ![Select the flow](./media/learning-create-a-flow/click-the-flow.png)
4. You see a **green check mark**, indicating that the **flow succeeded**. Select **Succeeded** to see the run history and the results.
   
    ![Flow successful](./media/learning-create-a-flow/flow-successful.png)
   
    **All parts of the flow** were successful. 
   
    ![Run history](./media/learning-create-a-flow/run-history.png)

## Important concepts in Power Automate
Some things to know about when building flows. 
Every flow has two key parts: a **trigger**, and **one or more actions**. 

You can think of the **trigger** as the starting action for the flow, which can be things like **On new Email** that you have here or, **when a new item is added**, if you happened to be using SharePoint. It can also be a fixed schedule, if you use a trigger called **Recurrence**, which you'll learn about later.

**Actions are the activities** you want to happen when **a trigger is invoked**. For example, **Create file** will recreate the file in OneDrive.

![Actions on new email](./media/learning-create-a-flow/trigger-or-action.png)

Other actions could be, send an **email**, post a **Tweet**, start an **approval**, or many others.
These will all come into play later, as you build your own flows from scratch. 

## Next Lesson
The next lesson will look at the Power Automate Mobile app and its capabilities. 

