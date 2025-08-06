---
title: FAQ for Copilot in automation center 
description: This FAQ discusses Copilot in automation center and the key considerations for making use of this technology responsibly.
ms.date: 07/11/2025
ms.update-cycle: 180-days
ms.custom: 
  - responsible-ai-faqs
ms.topic: faq
author: rpapostolis
ms.author: appapaio
ms.reviewer: dmartens
contributors:
  - DanaMartens
ms.collection: bap-ai-copilot
---

# FAQ for Copilot in automation center

Copilot in automation center enables makers, business analysts, and members of the CoE team to easily retrieve information about past flow runs, work queue performance, and general Power Automate product features (referred to as generative answers) by asking questions in natural language. For example, users can ask about the number of flows that ran yesterday, which machine ran the most flows, or how many flows are currently queued. In response, Copilot generates outputs that provide insights and answers to the questions asked.

## What can Copilot in automation center do?

Copilot in automation center is able to answer questions about the following four skills:

| Index | Skill | Questions skill can answer|
|---|---|---|
| 1 | Cloud flow run logs | Cloud flow run status, trigger type, run duration, failure rate |
| 2 | Desktop flow run logs | Desktop flow run status, used machine, run mode, failure rate |
| 3 | Work queue data | Work queue items statuses, SLA attainment, processor counts |
| 4 | Documentation (generative answers) | General Power Automate feature questions such as *how to analyze activity with Copilot* |

The first three skills listed in the table translate natural language queries (questions) entered by users into Microsoft Dataverse FetchXML query syntax. This allows users to easily retrieve information about their automation data by asking questions in natural language. Additionally, Copilot determines the most suitable output visualization, such as a table, pie chart, bar chart, or line chart to effectively present the insights and information to the user.

The fourth skill uses the Azure OpenAI service to search for answers in Power Automate for desktop's public documentation based on user prompts.

## What is Copilot in automation center's general intended use?

The purpose of this system is to enable users to retrieve information about their automation activity data, and general product features by asking questions in natural language.

## What is Copilot in automation center's intended use for generative answers?

The intended use of Copilot's generative answers is to help users find quick and accurate answers to product related questions without having to navigate away from Power Automate for desktop.

## How was Copilot in automation center evaluated? What metrics are used to measure performance?

- The performance of Copilot in automation center was evaluated using a comprehensive set of metrics. The copilot interface includes thumbs up and thumbs down gestures, allowing users to submit feedback on the AI outputs. This feedback is closely monitored to ensure that Copilot remains compliant, appropriate, and free of bias.

## How was Copilot's generative answers in automation center evaluated? What metrics are used to measure performance?

- Copilot's generative answers capability has been evaluated against real-world scenarios in each phase of its design, development, and release. Using a combination of research and business impact studies, we've evaluated various quantitative and qualitative metrics about Copilot, including its accuracy, usefulness, and agent trust.
- We have a robust set of metrics we're tracking to measure the model's performance and resulting customer experience. We follow the feature's SLA to make sure it's always available to you. We track the telemetry of thumbs up and thumbs down gestures present in the UI experience for each AI output that you can submit feedback for.

## What operational factors and settings allow for effective and responsible use of Copilot in automation center?

- Effective and responsible use of Copilot in automation center can be achieved by ensuring that the user has the appropriate rights to access the relevant data in Dataverse. This means that Copilot only answers questions based on data the user has permission to access. Additionally, it's important for users to understand the scope and limitations of Copilot, and to phrase their queries accordingly.
- For generative answers, you should constantly review the answers provided by Copilot's generative answers capability before using them.

## What are the limitations of Copilot in automation center? How can users minimize the impact of Copilot in automation center’s limitations when using the system?

One of the limitations of Copilot in automation center is that it currently only supports answering questions about cloud and desktop flow activity, work queues, and Power Automate documentation, and not yet about other topics such as capacity. Additionally, the supported language is currently English and only available in Dataverse environments provisioned in the United States region. To minimize the impact of these limitations, users can ensure that their queries are specific to supported product areas and are phrased in English.

## What are the limitations of Copilot in automation center's generative answers? How can users minimize the impact of Copilot's generative answers's limitations when using the system?
  
- The generative answers capability can only answer to product related features. It can't answer general questions or anything unrelated to the product.
- There's a limit of 200 characters to describe the question.

## Related information

- [Use Copilot in automation center](automation-center-copilot.md)
- [Use Copilot to analyze desktop flow activity](./desktop-flows/use-copilot-to-analyze-desktopflow-activity.md)
- [Create your first cloud flow using Copilot](create-cloud-flow-using-copilot.md)
- [FAQ for Copilot in cloud flows](faqs-copilot.md)
- [FAQ for Copilot in Power Automate Process Mining](faqs-copilot-in-process-mining.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

[!INCLUDE[footer-include](./includes/footer-banner.md)]
