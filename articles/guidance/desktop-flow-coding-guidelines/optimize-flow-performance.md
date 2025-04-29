---
title: Optimize flow performance
description: Learn how to enhance flow performance by choosing the right actions, applying error handling, and avoiding unnecessary loops.
# customer intent: As a Power Automate user, I want to optimize flow performance so that my workflows execute faster and with fewer errors.
author: PetrosFeleskouras
ms.subservice: guidance
ms.topic: conceptual
ms.date: 04/29/2025
ms.author: pefelesk
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
---

# Optimize flow performance

Optimizing the performance of flows in Power Automate is essential for creating efficient, reliable workflows that execute quickly and with minimal errors. Follow these best practices to streamline automation processes and achieve better outcomes.

## Choose the right actions to interact with apps and services

When looking for actions to automate your app or service, consider the following priorities, listed from most to least preferable:

1.  Cloud connector actions. Learn more about [Cloud Connectors in Power Automate for desktop](/power-automate/desktop-flows/actions-reference/cloudconnectors).

:::image type="content" source="media/optimize-flow-performance/actions.png" alt-text="Screenshot showing various cloud connector actions in Power Automate." lightbox = "media/optimize-flow-performance/actions.png":::

2.  Application or file-specific Power Automate for desktop actions like Excel, PDF, File/Folder, etc.

:::image type="content" source="media/optimize-flow-performance/desktop-actions.png" alt-text="Screenshot of a computer. AI-generated content might be incorrect." lightbox="media/optimize-flow-performance/desktop-actions.png":::

1. Actions from the **UI automation** and **Browser automation** groups of actions.

1. Image recognition actions like **Move mouse to image** and **Extract text with OCR**, **Mouse and keyboard** actions like **Send keys** and **Send mouse click**, and **Clipboard** actions. Learn more about [automating with mouse, keyboard, and OCR actions](/power-automate/desktop-flows/how-to/automate-using-mouse-keyboard-ocr).

1. As an alternative to OCR actions for extracting data, consider the AI Builder cloud connector action **Recognize text in an image or a PDF document**, which is available for cloud flows. Learn more about [using the text recognition prebuilt model in Power Automate](/ai-builder/flow-text-recognition).

For more advanced scenarios, consider the **Scripting** actions, like **Run VBScript** or **Run Python script**, and the **HTTP** actions, like **Invoke web service**. 

## Apply error handling

- Identify potential points of failure within your flow and handle them with the in-product error handling functionality.

- Handle errors for individual actions through their **On error** parameters.

:::image type="content" source="media/optimize-flow-performance/files-folder.png" alt-text="Screenshot showing the configuration of file and folder actions in Power Automate." lightbox = "media/optimize-flow-performance/files-folder.png":::

- Handle errors for groups of actions with the **On block error** action.

- Retrieve the latest occurred error and use it in later actions with the **Get last error** action.

- Use the **Stop flow** action to stop the flow gracefully.

- Log custom messages with the **Log message** action or any other action that can write text to an external location.

Learn more about [configuring error handling functionality](/power-automate/desktop-flows/errors#configure-error-handling-functionality).

## Use “Wait for” actions and timeouts

- Use **“Wait for …”** actions and set a timeout.

- Avoid using the generic **Wait** action.

> [!NOTE]  
> Screenshot of a computer AI-generated content may be incorrect.

:::image type="content" source="media/optimize-flow-performance/wait-for.png" alt-text="Screenshot showing the configuration of a Wait for action in Power Automate." lightbox = "media/optimize-flow-performance/wait-for.png":::

- Configure the **Flow timeout** property to specify the maximum allowed time that the flow is allowed to run.

:::image type="content" source="media/optimize-flow-performance/flow-timeout.png" alt-text="Screenshot of the Flow timeout property configuration." lightbox = "media/optimize-flow-performance/flow-timeout.png":::

- Adjust the time-out settings for distinct desktop and web automation scenarios. Learn more about [Timeout configuration for UI and browser automation](/power-automate/desktop-flows/how-to/ui-automation-change-timeout-cofiguration)

## Remove unused components

Keep only the necessary flow components by deleting any disabled actions and removing unused UI elements and images. This decreases the size of the flow and reduce its saving and loading times.

:::image type="content" source="media/optimize-flow-performance/ui-elements.png" alt-text="Screenshot of a flow diagram showing unused components." lightbox = "media/optimize-flow-performance/ui-elements.png":::

## Avoid unnecessary loops

Avoid looping through large datasets, for example Excel files with 1000s of records.

- Use the **Data table** actions or **Database** actions for data table related operations.

:::image type="content" source="media/optimize-flow-performance/database.png" alt-text="Screenshot of a data table. AI-generated content may be incorrect." lightbox = "media/optimize-flow-performance/database.png":::

- Use **PowerFx** functions. Learn more about [Power Fx in desktop flows](/power-automate/desktop-flows/power-fx).

- Use **Scripting** actions, like **Run VBScript** or **Run Python script**.

## Related information

- [Working only with relevant data](/power-automate/guidance/coding-guidelines/work-with-relevant-data)
- [Avoiding anti-patterns](/power-automate/guidance/coding-guidelines/avoid-anti-patterns).