Cloud flows à Create a cloud flow from a description (preview)

Create a Power Automate flow by describing it (preview)

When building automation with Power Automate knowing which actions to stitch together might take time, especially when you’re new to the product. Now you can let Artificial Intelligence do all the hard work by describing what you want to automate in everyday language and see the corresponding flow created instantly.

| Important |
|-----------|


- This is a preview feature.

- Preview features may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

Prerequisites
=============

- A work or school account with access to Power Automate. Creating flows from a description is currently not available for Microsoft Accounts.

- To use this feature, you will need to be in an environment **based in the United States**. If you don’t have one, you can create a new environment and select United States as regions as [described here](https://learn.microsoft.com/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center).

- Check current *limitations*

Create a flow from a description
================================

Let’s see how easy it is by looking at one example. Here we want to build an automated cloud flow so that every time someone responds to a Microsoft Forms survey, we want to be notified right away on Teams and by email.

1.  Navigate to the **Create** page for Power Automate, and select **You describe it, AI Builds it**.

2.  A page opens where you can start typing what you’re looking to automate. You will also see examples you can use for inspiration and that you can try right away.

3.  Start typing, for our use case we’ll type: “Every time someone responds to a Microsoft Forms survey, post a message to Teams and send an email”

4.  Select **Submit** to the right of the text you’ve entered.

5.  Power Automate will return 1 or up to 3 suggested flows that respond to what you have entered. You can see a preview of the flow by selecting the preview icon to the right of each flow.  
      
    

    ![A screenshot that displays where you'd describe the flow in everyday language](media/describe-flow.png)

      
    [describe-flow-step-1.png](https://microsoft.sharepoint.com/:i:/t/PARIS/Eexvb_0mf6BDoZmW91reAxgBXIB_F5A9ZDNOWZUIlUpkSA?e=ToRJfZ)
    (Alt: Power Automate showing a suggested flow after providing a description of what to automate)

| Note If none of the suggestions respond to what you’re looking to automate. You can select “**This is not what I want”**. You will see additional guidance on what you can do next, and this signal will help us improve the AI behind this feature. |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


6.  Once you have selected one of the suggested flows, select **Next**.

7.  In this step, you will setup all the connections needed to run the flow.

8.  On the final step, you will be asked to enter information needed to run the flow. For example, which Microsoft Form to use and to whom send the Teams message and email message. You can decide to fill in the information on this step or do it later in the flow designer. In both cases, you then select
    **Create flow**.

9.  And there you have it! Your flow has been built – congratulations! You can decide to make any modification and edit the flow or save it and test it.
    [Learn more about cloud flows](https://learn.microsoft.com/power-automate/overview-cloud).  
      
    

    ![Graphical user interface, application Description automatically generated](media/generated-flow.png)

      
    [describe-flow-complete.png](https://microsoft.sharepoint.com/:i:/t/PARIS/EeadKHBuCipJneXeY07RUfsB8wtlI94-eA1AW311ooOUfw?e=FVE4JZ)
    (Alt: Power Automate showing a cloud flow that has been built from a description)

Behind the tech
===============

The implementation relies on OpenAI Codex, an AI model descendant of GPT-3 that can translate natural language to code, in this case descriptions to cloud flows. Its training data contains both natural language and a large number of sample cloud flows.

Limitations
============

- Descriptions written in **English** are currently supported.

- **Cloud flows** are the type of flow that are currently supported.

- The AI model that can transform a description into a cloud flow is currently optimized to automate the main actions for the following applications:

    - Excel
    - Microsoft Forms
    - Office 365 Outlook
    - OneDrive for Business
    - Planner
    - SharePoint
    - Teams

Giving us feedback
==================

If you have any feedback for this feature, e.g., the suggested flow is inaccurate or you have suggestions, ideas to share with us, you can [fill this
feedback survey](https://ncv.microsoft.com/1gCpCCaFfu).

Microsoft is committed to developing and deploying AI technologies in a responsible manner. If you find any inappropriate results generated by Power
Automate, please [report it now](https://msrc.microsoft.com/report/abuse?ThreatType=URL&IncidentType=Responsible%20AI&SourceUrl=https://make.powerautomate.com) to help us keep our AI model behaving in a responsible manner. Thank you for taking the time to provide your comments, they help us greatly build better products.
