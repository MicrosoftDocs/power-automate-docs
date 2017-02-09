<properties
    pageTitle="Learn how to automate repetitive tasks with button flows that take user input | Microsoft Flow"
    description="Microsoft Flow makes it easy automate repetitive tasks. Your flows can even take user input when running a repetitive task."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="01/24/2017"
   ms.author="deonhe"/>


# Introducing button flows with user input 

Button flows are used to run routine tasks by simply tapping a button. Sometimes, you may want to customize a button flow by allowing the user to provide specific details that will be used when the button flow executes. This document walks you through the creation and execution of a button flow that takes user input at run time.  

## Create a button flow with user input  

1. Enter **Visual Studio** in the search box then tap the search icon to find all templates related to Visual Studio:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/1.png)  

2. Select the **Open a Priority 2 Bug in Visual Studio** template:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/2.png)  

4. Select the **Use this template** button:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/3.png)  

6. This template uses the Visual Studio Team Services (VSTS) and the Push notification services. You'll need to sign into these services if aren't any existing connections to any of them. The **Sign in** button will appear only if you need to sign into a service. After you've confirmed you're signed into all required services, select the **Continue** button:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/4.png)  

8. Optionally, you can change the name of the flow by typing a name of your choice into the menu at the top of the portal:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/5.png)  

10. Select **Edit**:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/6.png)  

12. Select the **+** icon to expand the page so you can add your custom input fields:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/7.png)  

14. Enter the **Input title** and **Input description** for each of the custom fields you wish to make available when someone uses your flow to report a bug.  

	In this example, I've created custom input fields so that anyone who uses this flow can enter the steps to reproduce the bug and rate the bug's severity:  

	![flow with user input image](./media/button-flow-with-user-input-tokens/8.png)  

16. Tap the **Create a new work item** card's title bar:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/9.png)  

18. Make the selections that are appropriate for your VSTS environment then, select **Edit**:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/10.png)  

20. Select **Show advanced options** to reveal the other fields for this card:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/11.png)  

22. Place the cursor before the **Bug title** token then enter "Severity: " into the **Title** text field. Next, with the cursor still in the title text field, select the **Bug severity** token then enter " -- ".  
23. In the **Description** text field, place your cursor just after the **Bug description** token and press the **Enter** key to start a new line. Place your cursor on the new line then select the **Bug Repro steps** token:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/12.png)  

24. Tap the title bar on the **Send a push notification** card to expand it then place the **Description** token into the **Link** text field then place the **Bug title** token into the **Link label** text field:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/13.png)  

14. Tap **Create flow** on the menu to create your flow:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/14.png)  

## Run a button flow with user input
In this walk-through, you will see how to provide user input in a run of the button flow.  

After launching the flow app:  

1. Tap the **Buttons** tab.  
2. Tap the **Create bug report with steps** button.  

	![flow with user input image](./media/button-flow-with-user-input-tokens/runmt1.png)  
3. Enter the title for the bug you are reporting. For example:  

	![flow with user input image](./media/button-flow-with-user-input-tokens/runmt2.png)  
4. Enter the steps to reproduce the bug you are reporting. For example:  
	![flow with user input image](./media/button-flow-with-user-input-tokens/runmt3.png)  
5. Tap **Done**. This will execute the flow, creating a bug with the title and repro steps you provided.  

	![flow with user input image](./media/button-flow-with-user-input-tokens/runmt3-5.png)  
6. The flow runs. You can see the results on the **Activity** tab.  

	![flow with user input image](./media/button-flow-with-user-input-tokens/runmt5.png)  
7. See the detailed results of the flow run on the **Activity** tab by tapping the **Create a new work item** step.  

	![flow with user input image](./media/button-flow-with-user-input-tokens/runmt6.png)  

## Next steps

- [Learn about button flows](./introduction-to-button-flows.md)  
- [Learn about button flows with trigger tokens](./introduction-to-button-trigger-tokens.md)  
- [Learn about flows](./guided-learning/learning-introducing-flow.md)  
