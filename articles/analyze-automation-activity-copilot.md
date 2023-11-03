---
title: Use Copilot to analyze automation activity
description: Use Copilot to analyze flow runs, errors, machines and more by asking questions in natural language. 
ms.topic: conceptual
ms.date: 10/30/2023
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---
# Analyze automation activity with Copilot (preview)

[This article is pre-release documentation and is subject to change.]

> [!IMPORTANT]
> [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

Understanding automation performance is key to achieving your operational excellence and reliability goals, regardless of the size of your automation landscape, team or your role within the organization. Reaching those goals requires advanced and dynamic monitoring capabilities that provide you with valuable insights that highlight areas of success and identify potential bottlenecks, trends and areas for improvement. Having more detailed insights, allows you to make informed decisions that optimize your automation processes, leading to increased efficiency and effectiveness.

To further support you on this journey, we're providing industry-leading new **generative AI Copilot capabilities** available (initially) under [Desktop flow activity](/articles/desktop-flows/desktop-flow-activity) that will allow you to ask the Copilot automation-specific questions using natural language and get the dynamic insights you're looking for.

  > [!IMPORTANT]
  >
  > - This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
  > - Copilot is a new technology that is still being developed. It is optimized for use with English language and has limited support with other languages. As such, parts of it may appear in English rather than your preferred language.
  > - More information: [Responsible AI FAQs for Power Automate](responsible-ai-overview.md), [Responsible AI FAQ for Copilot in desktop flow activity](faqs-copilot-automation-activity.md), [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

## Prerequisites

- A work or school account with access to a Power Automate [environment](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) that's based in Europe or the United States.
- Check [**known limitations**](#known-issues-and-limitations) for more information.

  > [!NOTE]
  >
  > - During the initial preview, you need to have an environment in United States region in order to use this feature. If you don’t have access to an environment that's based in the United States, you can ask your administrator to [create a new environment in Power Platform Admin Center and select United States](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) as its region.
  > - While the initial release focuses on desktop flow specific activities, we continually extended its reach to other Power Automate product areas as well.
  
## Get started with Copilot

:::image type="content" source="media/analyze-automation-activity-copilot/copilot-overview.png" alt-text="Screenshot of a Copilot experience as part of desktop flow activity page." lightbox="media/analyze-automation-activity-copilot/copilot-overview.png":::

The Copilot can be used for basic ad-hoc activity questions like *"How many flows failed yesterday?"* or engage in a more conversation-like (*multi-turn*) experience where the Copilot maintains context of the previous conversation, allowing you to ask follow-up questions.

In the context of AI, a **multi-turn** prompt means you're having an ongoing conversation with the AI, where the AI remembers the context of the previous messages in the conversation. It's not just answering one-off questions, it's engaging in a dialogue with you, where each response is based on what's been said before.

Let's look at an example:

- **User:** Show me a distribution of successful vs failed flows during last quarter
- **Copilot:**
        :::image type="content" source="media/analyze-automation-activity-copilot/copilot-multi-turn-1.png" alt-text="Screenshot of a Copilot responding with the distribution of successful vs failed flows during the last quarter." lightbox="media/analyze-automation-activity-copilot/copilot-multi-turn-1.png":::
- **User:** what was the top error of those that failed?
- **Copilot:**
        :::image type="content" source="media/analyze-automation-activity-copilot/copilot-multi-turn-2.png" alt-text="Screenshot of a Copilot responding with the top error of those that failed during the last quarter." lightbox="media/analyze-automation-activity-copilot/copilot-multi-turn-1.png":::
- **User:** on which machine names did they fail the most?
- **Copilot:**
        :::image type="content" source="media/analyze-automation-activity-copilot/copilot-multi-turn-3.png" alt-text="Screenshot of a Copilot responding with the machine names where the flows failed the most during the last quarter." lightbox="media/analyze-automation-activity-copilot/copilot-multi-turn-3.png":::
- **User:** of those that succeeded what where their average run duration?
- **Copilot:**
         :::image type="content" source="media/analyze-automation-activity-copilot/copilot-multi-turn-4.png" alt-text="Screenshot of a Copilot responding with the average run duration of the flows that succeeded during the last quarter." lightbox="media/analyze-automation-activity-copilot/copilot-multi-turn-4.png":::

> [!NOTE]
> In this initial release, Copilot will only keep context of the last 5 questions you've asked.

## A look behind the scenes

The Copilot uses the [Azure Open AI](/azure/ai-services/openai/overview) service to translate natural language into valid Dataverse fetchXml queries. It then executes these queries against the Dataverse backend to retrieve matching data, all while taking into account the current user's security context. Initially, these queries are focused on and optimized for **desktop flow activity**, such as runs, flows, errors, and machines but we will extend these to many more areas of the automation suite. The Copilot also determines the most suitable output visualization (table, pie, bar or line chart) to be returned to the user. [Learn more](/articles/faqs-copilot-automation-activity.md)

## Before You Start  

Ensure that you're in the same environment that was used by Copilot to generate the fetchXML query and that you have necessary privileges to create new Power Automate cloud flows in this environment.

## What are fetchXml queries?

Dataverse [fetchXml](/power-apps/developer/data-platform/use-fetchxml-construct-query) queries are a way to retrieve information from a Microsoft Dataverse database. Dataverse is designed to operate at a global enterprise scale and serves as key data foundation for Power Automate and various other products across Microsoft Power Platform and Dynamics 365.

[FetchXml](/power-apps/developer/data-platform/use-fetchxml-construct-query) is a language used for retrieving data from a Dataverse database. It's designed to be easy to create, use and understand.

For example, you might ask Dataverse to give you all the runs of a flow during last week, or the contact details of the flow owner that had the most failed runs yesterday. The FetchXML query is the way you phrase that question so the database understands it and can give you the right results.

## Validate fetchXml query results generated by Copilot
  
This guide helps you validate (and reuse) [fetchXml](/power-apps/developer/data-platform/use-fetchxml-construct-query) queries using Power Automate cloud flows.

### Step 1: Make a copy of the fetchXml output

After submitting your query to the system, you will receive a reply that includes a link labeled "Show code." Click on this link and then select the copy icon located in the upper right corner of the fetchXml box to copy the fetchXml code.

### Step 2: Create a new cloud flow
  
1. Open the the [Power Automate portal](https://make.powerautomate.com) and select **My flows** from the left-navigation menu.
2. Continue by selecting **+ New flow** on the command bar and then select **Instant cloud flow** option from the dropdown menu.
3. Enter a flow name and choose **Manually trigger a flow**, then select **Create**.
4. The cloud flow designer appears. Here, look for and select the **+ New Step** button.
5. On the search bar that appears, type in **Dataverse** and select the **Dataverse** connector from the results.
6. Various actions are displayed. Scroll through until you find and select the **List rows** action.
7. Within the **List rows** action, select the **Show advanced options** link.
8. A FetchXML query field appears. This is where you input the copied fetchXML query that the Copilot had previously generated.

### Step 3: Save and Try Out Your Flow  
  
1. After pasting in your fetchXML that you've copied in [step 1](#step-1-make-a-copy-of-the-fetchxml-output), save your flow.  
2. Now, let's test your flow by selecting **Test**. Follow the prompts on your screen to start your flow manually to review its results.  
  
## Understanding the Results  
  
If data matches the given fetchXml query, the **List rows** action will return data in a format called [JSON](https://www.json.org/json-en.html) (JavaScript Object Notation), which is essentially a method used to present data in a well-organized manner, making it easy to read and write digitally.
  
Now, let's assume we'd ask the Copilot '*how many failed vs succeeded flows did we have last month?'* This would produce a [fetchXml](/power-apps/developer/data-platform/use-fetchxml-construct-query) query similar to the following:

```xml
<fetch version="1.0" mapping="logical" aggregate="true" count="3" page="1">
    <entity name="flowsession">
        <attribute name="flowsessionid" alias="flowsession_count" aggregate="count" />
        <attribute name="statuscode" alias="flowsession_statuscode" groupby="true" />
        <filter type="and">
            <condition attribute="completedon" operator="last-x-months" value="1" />
        </filter>
    </entity>
</fetch>
```

For distribution-based questions like above, data will be grouped by one or more field (`statuscode`), together with an aggregation (`count`) that returns the number for each group (i.e. `failed`, `succeeded` etc.).

Each of the returned records contains fields such as:  
  
- `flowsession_count`: The number of times the workflow has been run.  
- `flowsession_regardingobjectid`: The unique identifier for the flow run.  
- `flowsession_statuscode`: The status of the flow run (e.g., "Failed").  
- `workflow_name`: The name of the flow.  
  
So, if you wanted to know how many times a specific flow has been run, you would look at the flowsession_count field of the record where workflow_name is *your flow name*.
  
## Prompting best-practices

- **Be specific:** The more specific you are with your prompt, the better the AI will understand and respond. If the AI is not producing the desired output, don't worry, simply try again by adjusting your prompt.
- **Experiment with prompts:** If you're not getting the results you were expecting, try rephrasing your prompt or provide more context.
- **Provide feedback:** If the AI produced great or unsatisfactory responses, don't hesitate to let us know by selecting the thumps up or down with an option to provide even more verbose feedback via the *Tell Microsoft what you liked about this feature* link that appears below.

## Prompt examples

The list below provides some example prompts that can be used as prompt starters for your own use-cases. However, please note that some of these prompts may not be applicable or return incorrect results, which is influenced by the AI model, actual prompt and the activity data available to you based on your permissions. We therefore recommend that you review and validate the returned results and fetchXml query as outlined [here](#validate-fetchxml-query-results-generated-by-copilot).

### Runs

- Which flows ran the most last week?
- What were yesterday’s top 5 flows by number of completed runs?
- What was the average run duration of the *'[insert your flow name here]'* flow during last semester?

### Errors

- Show me the most frequent run errors during last month
- Show me a distribution of successful vs failed flows during last quarter
- What were the number of failed runs during the weekend prior to the last one?

### Machines

- Which bots had the most run failures today?
- Which machines are in maintenance mode?
- What are the machines with the most run failures?

### Makers

- Show me the top flows by number of runs together with their owner info
- Who were the top 10 users running flows during last month?
- When and by whom were desktop flows modified last week?

You can also influence Copilot's output format by asking for explicit chart types like *"show me failed vs. succeeded flow run distribution **as bar chart**"*. This will likely produce the following outcome:
:::image type="content" source="media/analyze-automation-activity-copilot/copilot-influence-output-format.png" alt-text="Screenshot of a Copilot reply that responded to a user prompt with a pie chart." lightbox="media/analyze-automation-activity-copilot/copilot-influence-output-format.png":::

### Clearing previous prompt context to start over

If you wish to reset the conversation with Copilot you can select the three dots `...` next to it's name and select **New chat**.

:::image type="content" source="media/analyze-automation-activity-copilot/copilot-new-chat.png" alt-text="Screenshot of a Copilot 'New chat' option to reset a conversations." lightbox="media/analyze-automation-activity-copilot/copilot-new-chat.png":::

## Known issues and limitations

The following list contains known limitations of the **Analyze automation activity Copilot** in Power Automate.

- Copilot is a new technology that is still being developed. It is optimized for use with English language and has limited support with other languages. As such, parts of it may appear in English rather than your preferred language.
- This Copilot is currently only available in Dataverse environments based in the United States.
- Copilot may return wrong or incomplete data and fetchXml queries.
- Copilot is initially only capable to answer questions about desktop flow activity such as errors, machines, past and current runs.
- In multi-turn conversations we keep the last 5 question only. Consider resetting the conversation by following these [steps](#clearing-previous-prompt-context-to-start-over).
- For queries that return large result-sets, Copilot might not be able return or render these.
