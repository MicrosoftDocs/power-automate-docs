---
title: Optimize flow performance
description: Learn how to optimize workflows in Power Automate for faster execution and fewer errors with these best practices.
#customer intent: As a Power Automate maker, I want to optimize flow performance so that my workflows execute faster and with fewer errors.  
author: PetrosFeleskouras
ms.subservice: guidance
ms.topic: best-practice
ms.date: 06/25/2025
ms.author: pefelesk
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/13/2025
---

# Optimize flow performance

Optimizing the performance of flows in Power Automate is essential for creating efficient, reliable workflows that execute quickly and with minimal errors. Follow these best practices to streamline automation processes and achieve better outcomes.

## Choose the right actions to interact with apps and services

When looking for actions to automate your app or service, consider the following priorities, listed from most to least preferable:

1. Cloud connector actions. Learn more about [Cloud connectors as Power Automate for desktop actions](../../desktop-flows/actions-reference/cloudconnectors.md).

    :::image type="content" source="media/optimize-flow-performance/actions.png" alt-text="Screenshot showing SharePoint actions in Desktop flow designer." lightbox="media/optimize-flow-performance/actions.png":::

1. Application or file-specific Power Automate for desktop actions. For example, for Excel, PDF, and file/folder.

    :::image type="content" source="media/optimize-flow-performance/desktop-actions.png" alt-text="Screenshot showing Excel actions in flow designer." lightbox="media/optimize-flow-performance/desktop-actions.png":::

1. Actions from the **UI automation** and **Browser automation** groups of actions.

1. Image recognition actions like **Move mouse to image** and **Extract text with OCR**, **Mouse and keyboard** actions like **Send keys** and **Send mouse click**, and **Clipboard** actions. Learn more about [automating with mouse, keyboard, and OCR actions](../../desktop-flows/how-to/automate-using-mouse-keyboard-ocr.md).

    As an alternative to OCR actions for extracting data, consider the AI Builder cloud connector action **Recognize text in an image or a PDF document**, which is available for cloud flows. Learn more about [using the text recognition prebuilt model in Power Automate](/ai-builder/flow-text-recognition).

For more advanced scenarios, consider **Scripting** actions, like **Run VBScript** or **Run Python script**, and **HTTP** actions such as **Invoke web service**. 

## Apply error handling

Identify potential points of failure within your flow and handle them with the in-product error handling functionality.

- Handle errors for individual actions through their **On error** parameters.

    :::image type="content" source="media/optimize-flow-performance/files-folder.png" alt-text="Screenshot of Retry action configuration for an action in flow designer." lightbox="media/optimize-flow-performance/files-folder.png":::

- Handle errors for groups of actions with the **On block error** action.

- Retrieve the latest occurred error and use it in later actions with the **Get last error** action.

- Use the **Stop flow** action to stop the flow gracefully.

- Log custom messages with the **Log message** action or any other action that can write text to an external location.

Learn more about [configuring error handling functionality](../../desktop-flows/errors.md#configure-error-handling-functionality).

## Use "Wait for" actions and timeouts

Using wait actions and timeouts can help improve flow performance and reliability.

- Use **Wait for …** actions and set a timeout. (Avoid using the generic **Wait** action.)

    :::image type="content" source="media/optimize-flow-performance/wait-for.png" alt-text="Screenshot showing Wait for actions in flow designer." lightbox="media/optimize-flow-performance/wait-for.png":::

- Configure the **Flow timeout** property to specify the maximum allowed time that the flow is allowed to run.

    :::image type="content" source="media/optimize-flow-performance/flow-timeout.png" alt-text="Screenshot of the Flow properties dialog highlighting Flow timeout configuration." lightbox="media/optimize-flow-performance/flow-timeout.png":::

- Adjust the timeout settings for distinct desktop and web automation scenarios. Learn more about [Timeout configuration for UI and browser automation](/power-automate/desktop-flows/how-to/ui-automation-change-timeout-cofiguration).

## Remove unused components

Keep only the necessary flow components by deleting any disabled actions and removing unused UI elements and images. This practice decreases the size of the flow and reduces saving and loading times.

:::image type="content" source="media/optimize-flow-performance/ui-elements.png" alt-text="Screenshot showing the Remove unused UI elements option." lightbox="media/optimize-flow-performance/ui-elements.png":::

## Avoid unnecessary loops

Avoid looping through large datasets, such as Excel files with thousands of records.

- Use the **Data table** actions or **Database** actions for data table-related operations.

    :::image type="content" source="media/optimize-flow-performance/database.png" alt-text="Screenshot showing Data table actions for variables in flow designer." lightbox="media/optimize-flow-performance/database.png":::

- Use **PowerFx** functions. Learn more about [Power Fx in desktop flows](/power-automate/desktop-flows/power-fx).

- Use **Scripting** actions, like **Run VBScript** or **Run Python script**.

Follow best practices for cloud flows by learning more about [working only with relevant data](/power-automate/guidance/coding-guidelines/work-with-relevant-data) and [avoiding anti-patterns](/power-automate/guidance/coding-guidelines/avoid-anti-patterns).
