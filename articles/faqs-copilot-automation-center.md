---
title: FAQ for copilot in automation center (preview)
description: This FAQ discusses copilot used in automation center (preview) and the key considerations for making use of this technology responsibly.
ms.date: 05/20/2024
ms.custom: 
  - responsible-ai-faqs
ms.topic: article
author: rpapostolis
ms.author: appapaio
ms.reviewer: dmartens
contributors:
  - DanaMartens
ms.collection: bap-ai-copilot
---

# FAQ for copilot in automation center (preview)

Copilot in automation center enables makers, business analysts, and members of the CoE team to easily retrieve information about past flow runs, work queue performance and general Power Automate product features (referred to as generative answers) by asking questions in natural language. For example, users can ask about the number of flows that ran yesterday, which machine ran the most flows, or how many flows are currently queued. In response, the copilot generates outputs that provide insights and answers to the questions asked.

## What can copilot in automation center do?

Copilot in automation center is able to answer questions about the following four skills:

| Index | Skill | Questions able to answer|
|---|---|---|
| 1 | Cloud flow run logs | Cloud flow run status, trigger type, run duration, failure rate etc. |
| 2 | Desktop flow run logs | Desktop flow run status, used machine, run mode, failure rate etc. |
| 3 | Work queue data | Work queue items statuses, SLA attainment, processor counts etc. |
| 4 | Generative answers | General Power Automate feature questions such as *how to analyze activity with Copilot* |

The first three skills in the above, will translate natural language queries (questions) entered by users into Microsoft Dataverse FetchXML query syntax. This allows users to easily retrieve information about their automation data by asking questions in a natural language. Additionally, copilot determines the most suitable output visualization, such as a table, pie chart, bar chart, or line chart, to effectively present the insights and information to the user.

The fourth skill uses the Azure OpenAI service to search for answers in Power Automate for desktop's public documentation based on user prompts.

## What are automation center copilot's general intended use(s)?

The purpose of this system is to enable users to retrieve information about their automation activity data, and general product features by asking questions in a natural language.

## What are automation center copilot's intended use(s) for generative answers?

The intended use of copilot's generative answers is to help users find quick and accurate answers to product-related questions without having to navigate away from Power Automate for desktop.

## How was copilot in automation center evaluated? What metrics are used to measure performance?

- The performance of copilot in automation center was evaluated using a comprehensive set of metrics. The copilot interface includes thumb up and thumb down gestures, allowing users to submit feedback on the AI outputs. This feedback is closely monitored to ensure that the copilot remains compliant, appropriate, and free of bias.

## How was copilot's generative answers in automation center evaluated? What metrics are used to measure performance?

- Copilot's generative answers capability has been evaluated against real-world scenarios in each phase of its design, development, and release. Using a combination of research and business impact studies, we've evaluated various quantitative and qualitative metrics about copilot, including its accuracy, usefulness, and agent trust.
- We have a robust set of metrics we're tracking to measure the model's performance and resulting customer experience. We follow the feature's SLA to make sure it's always available to you. We track the telemetry of thumbs-up and thumbs-down gestures present in the UI experience for each AI output that you can submit feedback for.

## What operational factors and settings allow for effective and responsible use of copilot in automation center?

- Effective and responsible use of copilot in automation center can be achieved by ensuring that the user has the appropriate rights to access the Copilot relevant data in Dataverse. This means that the copilot only answers questions based on the data the user has permission to access. Additionally, it's important for users to understand the scope and limitations of the copilot, and to phrase their queries accordingly.
- For generative answers, you should constantly review the answers provided by the copilot's generative answers capability before using them.

## What are the limitations of copilot in automation center? How can users minimize the impact of copilot in automation center’s limitations when using the system?

One of the limitations of copilot in automation center is that it currently only supports answering questions about cloud and desktop flow activity, work queues and Power Automate documentation, and not yet about capacity etc. Additionally, the copilot supported language is currently English and only available in Dataverse environments provisioned in the United States region. To minimize the impact of these limitations, users can ensure that their queries are specific to supported product areas and are phrased in English.

## What are the limitations of automation center copilot's generative answers? How can users minimize the impact of copilot's generative answers's limitations when using the system?
  
- This feature is currently in preview for environments located in the United States and only supports English.
- The generative answers capability can only answer to product-related features. It can't answer general questions or anything unrelated to the product.
- There's a limit of 200 characters to describe the question.

## See also

- [Use Copilot in automation center (preview)](automation-center-copilot.md)
- [Use Copilot to analyze desktop flow activity (preview)](./desktop-flows/use-copilot-to-analyze-desktopflow-activity.md)
- [Get started with Copilot in cloud flows (preview)](get-started-with-copilot.md)
- [FAQ for Copilot in cloud flows](faqs-copilot.md)
- [FAQ for Copilot in Power Automate Process Mining](faqs-copilot-in-process-mining.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

[!INCLUDE[footer-include](./includes/footer-banner.md)]
