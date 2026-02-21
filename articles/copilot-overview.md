---
title: Copilot in Power Automate
description: Discover how to use Copilot in Power Automate to streamline your automation processes with natural language instructions.
author: kewaiss
contributors:
  - HeatherOrt
  - v-aangie
  - jhaskett-msft
ms.topic: overview
ms.date: 01/16/2026
ms.update-cycle: 180-days
ms.author: matow
ms.reviewer: angieandrews
ms.contributors:
  - appapaio
  - cochamos
  - heortaol
  - kisubedi
ms.custom: bap-template
ms.collection: bap-ai-copilot
---

# Copilot in Power Automate

Copilot in Power Automate accelerates your journey to adopting automation and transforming your processes. It enhances these scenarios by using the instructions you give Copilot written in natural language to surface possible solutions that can achieve desired results. Copilot stays with you all the way during creation to guide you through your entire process.

Use the following sections to learn how to use Copilot features in Power Automate.

## Copilot in cloud flows

Copilot in cloud flows allows you to create automation that helps streamline your workflow through quick and easy natural language expressions. You can create a flow by describing what you need through multiple steps of conversation.

- [Create a cloud flow using Copilot](create-cloud-flow-using-copilot.md#create-a-cloud-flow-using-copilot)
- [Get contextual help with flows from the Microsoft Copilot Studio bot](contextual-help-bot.md)
- [Use flows as plugins in Copilot for Microsoft 365 (preview)](flow-plugins-m365.md)

## Copilot in Process Mining

Copilot in Process Mining *ingestion* navigates you through the ingestion experience in Process Mining. Copilot in Process Mining process *analytics* helps you generate process insights through natural language. Copilot can then take the data you collected and easily summarize findings from it quantitatively and qualitatively.

- [Copilot in Process Mining ingestion](process-mining-copilot-in-ingestion.md)
- [Copilot in Process Mining process analytics](process-mining-copilot-in-process-analytics.md)

## Copilot in desktop flows

Copilot in desktop flows offers various capabilities to enhance your automation experience. You can analyze desktop flow activity, create flows using natural language, repair automation errors, and get answers to product-related questions. These features democratize access to insights and streamline your workflow.

- [Get started with Copilot in Power Automate for desktop (preview)](desktop-flows/copilot-in-power-automate-for-desktop.md)
- [Create desktop flows using Record with Copilot (preview)](desktop-flows/create-flow-using-ai-recorder.md)
- [Natural language to script powered by copilot (preview)](desktop-flows/actions-reference/scripting.md#natural-language-to-script-powered-by-copilot-preview)
- [Repair flow automation errors (preview)](desktop-flows/repair-at-runtime.md)
- [Use Copilot to analyze desktop flow activity (preview)](desktop-flows/use-copilot-to-analyze-desktopflow-activity.md)
- [Use Copilot to get answers to product-related questions](desktop-flows/copilot-in-power-automate-for-desktop.md#use-copilot-to-get-answers-to-product-related-questions)

## Copilot in automation center

Copilot in automation center enables makers, business analysts, and members of the Center of Excellence team to easily retrieve information about past flow runs, work queue performance, and general product features. You can get this information by asking questions in natural language.

- [Copilot](automation-center-overview.md#copilot)
- [Use Copilot to analyze automation activity and ask product questions](automation-center-copilot.md)

## Enable or disable Copilot in Power Automate

If a region has GPUs (UK, Australia, US, India), we turn on Copilot by default. In this scenario, an admin needs to contact support and they use a PowerShell script to turn it off only at tenant level. Environment level support isn't available. If a region doesn't have GPUs (everywhere else except sovereign clouds), we turn on Copilot by default by toggling on the cross-geo data sharing. In this scenario, if you want to disable Copilot, you can toggle off the cross-geo data sharing in Power Platform admin center at the tenant level.

Learn more in [Availability by region](regions-overview.md#region-availability-for-power-automate-cloud-flows-with-copilot).

## Next step

> [!div class="nextstepaction"]
> [Explore the Power Automate home page](getting-started.md)

## Related information

- [Responsible AI FAQs for Power Automate](responsible-ai-overview.md)
- [Explore the cloud flows designer](flows-designer.md)
- [Troubleshoot in Copilot](fix-flow-failures.md#troubleshoot-in-copilot)
