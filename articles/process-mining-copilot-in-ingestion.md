---
title: Copilot in Process Mining ingestion (preview)
description: Learn how to identify your process during data ingestion and auto map your data to the required data schema.
ms.date: 04/01/2025
ms.topic: article
author: HeatherOrt
contributors:
  - janPidych
  - HeatherOrt
  - v-aangie 
ms.custom: bap-template
ms.author: janpidych
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
---

# Copilot in Process Mining ingestion (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Copilot in Process Mining ingestion navigates you through the ingestion experience in Process Mining. With Copilot in Process Mining ingestion, you can identify your process during data ingestion and automap your data to the required data schema.

Copilot can perform the following actions:

- Discover your process in your Azure Data Lake.
- Give automapping recommendations to required data schema.
- Answer your questions about your process data.
- Answer your general questions about processes.


> [!IMPORTANT]
>- This feature is generally available only in the United States region, and is in preview for all other regions.
>- Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
>- For more information, go to our [preview terms](https://go.microsoft.com/fwlink/?linkid=2189520).
>- This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
>- More information: [FAQ for Copilot data security and privacy in Power Platform](/power-platform/faqs-copilot-data-security-privacy)

## Prerequisite

You need a Power Platform environment for Copilot in Process Mining.

> [!NOTE]
> - If you still don’t see the Copilot experience, contact your admin. An admin can turn the Copilot feature off or on in the Power Platform admin center.
> - In some geographic regions outside United States, Australia, and United Kingdom, an admin needs to turn on the cross geo calls to enable Copilot. More information: [Copilot availability by region](get-started-with-copilot.md#availability-by-region).

## Ingest Data with Copilot

Follow these steps to ingest data with Copilot.

1. Sign in to [Power Automate](https://powerautomate.com).
1. Select **Process mining** > **Start here** (under **Create new process**).
1. In the **Process name** field, enter a name for your process.
1. Under the **Data source** heading, select **Azure Data Lake (preview)**.
1. Select **Continue**.

    :::image type="content" source="media/process-mining-copilot-in-ingestion/new-process.png" alt-text="<alt text>":::

1. Complete the steps in the **Connection setup** screens for the Azure Data Lake container.
1. Select **Next**.

1. Select the folder or file you're interested in analyzing and Copilot identifies the process.
1. Confirm that it's the process you're interested in analyzing by selecting **Confirm process** > **Next**.

    :::image type="content" source="media/process-mining-copilot-in-ingestion/step-2.png" alt-text="Screenshot of the data source.":::

1. In the mapping screen, Copilot offers an automapping suggestion that you can review and choose to map your data to.

1. Once you've reviewed the automapping, you can save and analyze your process.

## Frequently asked questions

For the list of questions for Copilot in Process Mining ingestion, go to [Frequently asked questions](process-mining-copilot-in-process-analytics.md#frequently-asked-questions).

## Limitations of Copilot in Power Automate

For a list of limitations of Copilot in Power Automate, go to [Limitations of Copilot in Power Automate](process-mining-copilot-in-process-analytics.md#limitations-of-copilot-in-power-automate).

## Related information

- [Responsible AI FAQs for Power Automate](responsible-ai-overview.md)
- [FAQ for Copilot in Power Automate Process Mining](faqs-copilot-in-process-mining.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
