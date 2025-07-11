---
title: Use copilot to analyze desktop flow activity
description: Use copilot to analyze flow runs, errors, machines, and more by asking questions in natural language. 
ms.topic: how-to
ms.date: 04/24/2025
ms.update-cycle: 180-days
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
ms.collection: bap-ai-copilot
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---
# Use copilot to analyze desktop flow activity

[This article is prerelease documentation and is subject to change.]

Understanding automation performance is key to achieving operational excellence and reliability goals, regardless of the size of the automation estate, team, or role within the organization. To reach those goals requires advanced and dynamic monitoring capabilities that provide you with valuable insights that highlight areas of success and identify potential bottlenecks, trends and areas for improvement. Having more detailed insights allows you to make informed decisions that optimize your automation processes, leading to increased efficiency and effectiveness.

:::image type="content" source="media/analyze-automation-activity-copilot/copilot-overview.png" alt-text="Screenshot of a copilot experience as part of desktop flow activity page." lightbox="media/analyze-automation-activity-copilot/copilot-overview.png":::

The latest advancements in AI provide us with unprecedented opportunities to explore new automation health monitoring use-cases that could include anything from simple data exploration to anomaly detection, smart recommendations, and even self-healing bots.

With copilot now able to analyze desktop flow activity we're taking the first step in a new direction, allowing you to democratize access to insights by asking copilot desktop flow activity-specific questions using natural language.

> [!IMPORTANT]
>
> - This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
> - Copilot is a new technology that is still being developed. It's optimized for use with English language and has limited support with other languages. As such, parts of it might appear in English rather than your preferred language.
> - Read the [responsible AI FAQs for copilot in desktop flow activity](../faqs-copilot-automation-activity.md) to learn more about this new copilot experience.
> - More FAQs: [Responsible AI FAQs for Power Automate](../responsible-ai-overview.md),[FAQ for copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

## Prerequisites

- A work or school account with access to a Power Automate [environment](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) that's based in the United States.
- Check [known limitations](#known-issues-and-limitations) for more information.

## How does it work?

This copilot experience is powered by the [Azure OpenAI](/azure/ai-services/openai/overview) service and is capable of translating user prompts into valid [Dataverse FetchXML queries](#what-are-fetchxml-queries). Initially, these queries are focused on and optimized for desktop flow activity, such as runs, flows, errors, and machines.

### High-level process

1. Once the user inputs a valid prompt, copilot generates a valid [FetchXML](#what-are-fetchxml-queries) query based on the input.
1. If the generated FetchXML is valid, the query is then executed against the Dataverse backend under the current user's security context to retrieve matching data. This ensures that users only see data that they're already authorized to access.
1. Copilot then determines the most suitable output visualization, such as a table, pie chart, bar chart, or line chart, to effectively present the insights and data to the user.

### What are FetchXML queries?

Microsoft Dataverse [FetchXML](/power-apps/developer/data-platform/use-fetchxml-construct-query) is a language used for retrieving data from a Dataverse database. It's designed to be easy to create, use, and understand. For example, you might want to ask Dataverse to give you a list of all flow runs for a specific flow. The FetchXML query is the way you phrase that question so the database understands it and can give you the right results.

## Prompting best-practices

- Be specific: The more specific you are with your prompt, the better the AI will understand and respond. If the AI isn't producing the desired output, don't worry, try again by adjusting your prompt.
- Experiment with prompts: If you're not getting the results you were expecting, try rephrasing your prompt or provide more context.
- Provide feedback: If the AI produced great or unsatisfactory responses, let us know by selecting the thumbs up or down with an option to provide more feedback via the **Tell Microsoft what you liked about this feature** link that appears underneath.

## Prompt examples

Examples of prompts that can be used as starter prompt for your own use-cases are explained in this section. Some of these prompts might not be applicable or return incorrect results, since the accuracy might be influenced by model understanding or the actual prompt and the data available to you based on your permissions. We recommend that you review and validate the returned results and FetchXML query. More information: [Validate FetchXML query results generated by copilot](#validate-fetchxml-query-results-generated-by-copilot).

### Runs

- Which flows ran the most last week?
- What were yesterday’s top five flows by number of completed runs?
- What was the average run duration of the *'[insert your flow name here]'* flow during last semester?

### Errors

- Show me the most frequent run errors during last month.
- Show me a distribution of successful versus failed flows during last quarter.
- What were the number of failed runs during the week prior to the last one?

### Machines

- Which bots had the most run failures today?
- Which machines are in maintenance mode?
- What are the machines with the most run failures?

### Makers

- Show me the top flows by number of runs together with their owner info.
- Who were the top 10 users running flows during last month?
- When and by whom were desktop flows modified last week?

### Multi-turn prompts

In the context of AI, *multi-turn* prompts allow you to have an ongoing conversation with the copilot, where it remembers the context of the previous messages in the conversation. It's not just answering one-off questions; it's engaging in a dialogue with you, where each response is based on what's been said before.

> [!NOTE]
> When engaging in a multi-turn conversation, copilot keeps track of the five most recent questions only. This means that copilot starts clearing the prompts that were entered first and only keeps the latest five. To improve response quality, we suggest limiting your follow-up questions to four and then restart the chat. More information: [Clearing previous prompt context to start over](#clearing-previous-prompt-context-to-start-over).

#### Example

| **Turn** | **Prompt and reply**
|-------------------------|-------------------------|
|:::image type="icon" source="media/analyze-automation-activity-copilot/1.png":::| **User**: show me a distribution of successful vs failed flows during last quarter|
||**Copilot**: *Here's the distribution of successful vs failed flows during the last quarter.*|
|:::image type="icon" source="media/analyze-automation-activity-copilot/2.png":::| **User**: what was the top error of those that failed?|
||**Copilot**: *Here's the top error of those that failed.*|
|:::image type="icon" source="media/analyze-automation-activity-copilot/3.png":::| **User**: on which machine names did they fail the most?|
||**Copilot**: *Here are the machine names where the most failures occurred.*|
|:::image type="icon" source="media/analyze-automation-activity-copilot/4.png":::| **User**: of those that succeeded what were their average run duration?|
||**Copilot**: *Here's the average run duration of the flows that succeeded.*|

:::image type="content" border="false" source="media/analyze-automation-activity-copilot/copilot-multi-turn-chat.png" alt-text="Screenshot of a copilot multi-turn chat with different output data and visualizations." lightbox="media/analyze-automation-activity-copilot/copilot-multi-turn-chat.png":::

### Influencing the output format

You can influence copilot's output format by asking for explicit output types like *"show me failed vs. succeeded flow run distribution as a bar chart."* This likely produces the following outcome:

:::image type="content" source="media/analyze-automation-activity-copilot/copilot-influence-output-format.png" alt-text="Screenshot of a copilot reply that responded to a user prompt with a pie chart." lightbox="media/analyze-automation-activity-copilot/copilot-influence-output-format.png":::

### Clearing previous prompt context to start over

If you wish to reset the conversation with copilot you can select the three dots `...` next to the copilot name, and then select **New chat**.

:::image type="content" source="media/analyze-automation-activity-copilot/copilot-new-chat.png" alt-text="Screenshot of a copilot New chat option to reset a conversation." lightbox="media/analyze-automation-activity-copilot/copilot-new-chat.png":::

## Validate FetchXML query results generated by copilot
  
The following steps guide you through the process to validate (and potentially reuse) [FetchXML](/power-apps/developer/data-platform/use-fetchxml-construct-query) queries in Power Automate cloud flows.

### Step 1: Make a copy of the FetchXML query

After submitting your query to the copilot, you get a reply that includes a link labeled **Show code**. Select this link and then select the copy icon located in the upper right corner of the `FetchXML` box to copy the code.

### Step 2: Create cloud flow and test FetchXML query
  
1. Navigate to the [Power Automate portal](https://make.powerautomate.com) and select **My flows** from the left-navigation menu.
2. Continue by selecting **+ New flow** on the command bar, and then select **Instant cloud flow** from the dropdown menu.
3. Enter a flow name, select **Manually trigger a flow**, and then select **Create**.
4. The cloud flow designer appears. Find and then select the **+ New Step** button.
5. On the search bar that appears, enter **Dataverse**, and then select the **Dataverse** connector from the results.
6. Various actions are displayed. Scroll through until you find and select the **List rows** action.
7. Within the **List rows** action, select the **Show advanced options** link.
8. A FetchXML query field appears. This is where you input the copied FetchXML query that copilot previously generated.
9. After pasting in your FetchXML, select **Save**.  
10. Test your flow by selecting **Test**.
11. Follow the prompts on your screen to start your flow manually to review its results.  
  
### Step 3: Understanding the results  

Let's assume you asked the copilot '*how many failed vs succeeded flows did we have last month?'* This produces a [FetchXML](/power-apps/developer/data-platform/use-fetchxml-construct-query) query similar to the following:

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

If data matches the given FetchXML query, the **List rows** Dataverse action configured in [step 2](#step-2-create-cloud-flow-and-test-fetchxml-query) returns data in a format called [JSON](https://www.json.org/json-en.html) (JavaScript Object Notation), which is essentially a method used to present data in a well-organized manner, making it easy to read and write digitally.
  
For distribution-based questions like previously mentioned, data is grouped by one or more fields (`statuscode`), together with an aggregation (`count`) that returns the number for each group (that is, `failed`, `succeeded`, and so on).

Each of the returned records contains fields such as:  
  
- `flowsession_count`: The number of times the workflow ran.  
- `flowsession_regardingobjectid`: The unique identifier for the flow run.  
- `flowsession_statuscode`: The status of the flow run (for example, **Failed**).  
- `workflow_name`: The name of the flow.  
  
If you want to know how many times a specific flow ran, look at the `flowsession_count` column of the record where `workflow_name` is *your flow name*.

## Understanding copilot replies on problematic prompts

This table shows default responses that are returned when the copilot is unable to understand your question, intent, or generate a valid answer.

| **Copilot reply** | **Details**
|-------------------------|-------------------------|
| *Sorry, something went wrong. Please try again.* |  Indicates that an unexpected error occurred. Rephrase your question and try again. |
| *Sorry, I couldn’t understand your question. Please rephrase it and try again. I’m able to answer questions that are about the data on this page. For more examples of prompts that you can ask the copilot, you can visit the [prompt example section](#prompt-examples) on our [documentation page](#use-copilot-to-analyze-desktop-flow-activity).* |  Indicates that your question couldn't be translated into a valid FetchXML query. Rephrase your question and try again. |
| *Sorry, Copilot is at capacity and temporarily unavailable — please try again in a little while.* |  Indicates there are resource constraints on the backend. Retry your question after a short time. |
| *Sorry, your message contains potentially harmful content. Please ensure your input is appropriate and try again.* |  Indicates that your question might include potentially harmful content and has been blocked by the backend service. Remove any potentially harmful content from your question and try again. |
| *Sorry, I was not able to generate a valid answer based on your question. Please rephrase it and try again. I’m able to answer questions that are about the data on this page. For more examples of prompts that you can ask the copilot, you can visit the [prompt example section](#prompt-examples) on our [documentation page](#use-copilot-to-analyze-desktop-flow-activity).* |  Indicates that the generated FetchXML is invalid or that the query failed when copilot tried to execute it. Rephrase your question and try again. |
| *Sorry, your search includes too many results. Please refine your query and try again. For examples on how to limit search results returned by the copilot, visit our [documentation page](#use-copilot-to-analyze-desktop-flow-activity).* |  Indicates that the filter(s) applied to your query exceed current aggregation [limits in FetchXML](/power-apps/developer/data-platform/use-fetchxml-aggregation#limitations). Add more appropriate filters such as asking for *yesterday's* or *last month's* data to your query to ensure that it returns data within those limits. |

## Known issues and limitations

The following list contains known limitations of the copilot in desktop flow activity.

- Copilot is a new technology that is still being developed. It's optimized for use with English language and has limited support with other languages. As such, parts of it might appear in English rather than your preferred language.
- Copilot might return wrong or incomplete data and FetchXML queries.
- Copilot is initially only capable to answer questions about desktop flow activity such as errors, machines, and past and current runs.
- In multi-turn conversations, copilot keeps context of the last five question only. If you encounter wrong or incomplete results, consider resetting the conversation. More information: [Clearing previous prompt context to start over](#clearing-previous-prompt-context-to-start-over).
- For queries that return large result-sets, copilot might not be able return or render these.

## Related information

- [Create your first cloud flow using Copilot](../create-cloud-flow-using-copilot.md)
- [FAQ for Copilot in desktop flow activity](../faqs-copilot-automation-activity.md)
- [FAQ for Copilot in cloud flows](../faqs-copilot.md)
- [FAQ for Copilot in Power Automate Process Mining](../faqs-copilot-in-process-mining.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
