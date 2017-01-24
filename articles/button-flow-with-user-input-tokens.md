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
   ms.date="01/24/2016"
   ms.author="deonhe"/>


# Introducing button flows with user input 

Button flows are used to run routine tasks by simply tapping a button. Sometimes, you may want to customize a button flow by allowing the consumer to provide specific details that will be used when the button flow executes. Button flows that take user input at run time allow the user to provide additional information before the button flow executes.  

**Note:** All screenshots in this document are taken from an Android mobile device, however, you can use an iOS device as well. The experience is similar on both devices.  

## Create a button flow with user input  

1. Launch the flow app on your mobile device and tap **Browse**  
![](./media/button-flow-with-user-input-tokens/mt0.png)  
2. Tap **+ Create a flow from scratch**  
![](./media/button-flow-with-user-input-tokens/mt1.png)  
3. Tap the white space below **Flow name**  and enter a name for your flow. In this example, I've given my flow the name **Create bug report with steps**. You can name yours anything that you prefer.  
![](./media/button-flow-with-user-input-tokens/mt2.png)  
4. Tap the **Manually trigger a flow** trigger  
![](./media/button-flow-with-user-input-tokens/mt3.png)  
5. Tap **Add text input**  
![](./media/button-flow-with-user-input-tokens/mt6.png)  
5. Enter **Title of bug** in the **Label for text input** field  
5. Enter **BugTitle** into the **Enter token label** field  
![](./media/button-flow-with-user-input-tokens/mt4.png)  
5. Tap **Add text input**  
![](./media/button-flow-with-user-input-tokens/mt6.png)  
6. Enter **Give detailed steps to reproduce** in the **Label for text input** field  
![](./media/button-flow-with-user-input-tokens/mt7.png)  
7. Enter **ReproSteps** into the **Enter token label** field  
![](./media/button-flow-with-user-input-tokens/mt8.png)  
8. Tap **+ New step**
![](./media/button-flow-with-user-input-tokens/mt9.png)  
9. Tap **Add an action**
![](./media/button-flow-with-user-input-tokens/mt9-addaction.png)  
10. Type **work item** into the search box to filter the actions list to display only actions that contain **work item** in the 
![](./media/button-flow-with-user-input-tokens/mt10.png)  
11. Tap **Visual studio Team Services Create a new work item**  
![](./media/button-flow-with-user-input-tokens/mt11-create-item.png)  
12. Select an **account name**, **Project name**, **Bug type** and select the **BugTitle** token as the **Title**.  
**Note:** Your options will vary based on what's available for the logged in account.  
![](./media/button-flow-with-user-input-tokens/mt11.png)  
13. Tap in the **Description** field  
![](./media/button-flow-with-user-input-tokens/mt12.png)  
14. Select the **ReproSteps** token  
![](./media/button-flow-with-user-input-tokens/mt13.png)  
15. Tap **Create** to save your flow
![](./media/button-flow-with-user-input-tokens/mt13-save.png)  
16. You flow is saved and you can now run it from the **Buttons** tab of the Flow app.
![](./media/button-flow-with-user-input-tokens/mt14.png)  

## Run a button flow with user input
In this walk-through, you will see how to provide user input in a run of the button flow.  

After launching the flow app:  
1. Tap the **Buttons** tab  
2. Tap the **Create bug report with steps** button  
![](./media/button-flow-with-user-input-tokens/runmt1.png)  
1. Enter the title for the bug you are reporting. For example:  
![](./media/button-flow-with-user-input-tokens/runmt2.png)  
1. Enter the steps to reproduce the bug you are reporting. For example:  
![](./media/button-flow-with-user-input-tokens/runmt3.png)  
1. Tap the **Done**. This will execute the flow, creating a bug with the title and repro steps you provided:  
![](./media/button-flow-with-user-input-tokens/runmt3-5.png)  
1. The flow runs. You can see the results on the **Activity** tab:
![](./media/button-flow-with-user-input-tokens/runmt5.png)  
1. See the detailed results of the flow run on the **Activity** tab by tapping the **Create a new work item** step:  
![](./media/button-flow-with-user-input-tokens/runmt6.png)  

## Next steps

- [Learn about button flows](./introduction-to-button-flows.md)  
- [Learn about flows](./guided-learning/learning-introducing-flow.md)  
