---
title: Find and fix errors with Flow Checker in Power Automate
description: Find and fix errors quickly with Flow checker in Power Automate.
suite: flow
author: v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 03/05/2025
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
---

# Find and fix errors with Flow Checker

Flow Checker in Power Automate promotes higher quality flows by ensuring you follow best practices when you design flows. When you run the checker, you get insights into questions like "which areas of my flow's implementation pose a performance or reliability risk?"

For each issue the checker identifies, the checker points to specific occurrences within the flow where you should consider making improvements. And, you learn how to implement these improvements by following detailed guidance.

The checker is always active, appearing in the command bar in the designer. 

## Resolve errors and warnings

While designing your flow, you can select **Flow Checker** to open the checker to view errors and warnings.

The checker also opens automatically when you save the flow if there are errors or warnings. Once the checker opens, it shows all errors and warnings in your flow. In each section, the checker calls out the actions where the error or warning occurs. 

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

# [New designer](#tab/new-designer)

The Flow Checker shows you errors or warnings in your flow. It also provides help to fix the errors and warnings in red on both the action panel and the flow card.

1. To run the checker, select **Flow Checker**.

    :::image type="content" source="./media/checker/checker-in-new-designer.png" alt-text="Screenshot of Flow Checker in new designer.":::

    The **Flow Checker** panel opens.

1. In the Flow Checker panel, select the error or warning and correct your error with the help of the red text from the checker.

    :::image type="content" source="./media/checker/select-error-in-new-designer.png" alt-text="Screenshot of selecting error in the Flow Checker panel in new designer.":::

    Alternatively, select the red error in the flow card to open the same window where you correct the error.

1. Run the Flow Checker again. If there are no errors or warnings, you get a message in the Flow Checker panel that says *No errors found*. We recommend that you test your flow to ensure it works as expected.

# [Classic designer](#tab/classic-designer)

The Flow Checker shows you errors or warnings in your flow. It also provides help to fix the errors and warnings in red on both the action panel and the flow card.

1. To run the checker, select **Flow Checker**. It shows a red dot when it finds one or more errors, potential errors, or warnings in your flow.
    
    :::image type="content" source="./media/checker/checker-in-classic-designer.png" alt-text="Screenshot of Flow Checker in classic designer.":::
    
1. To see more details about the issue, expand an error or warning in the Flow Checker panel.
1. In the Flow Checker panel, select the error or warning. For example, in the following screenshot, the error is *'Message Id' is required*.

    :::image type="content" source="./media/checker/error-in-classic-designer.png" alt-text="Screenshot of the Flow Checker panel in classic designer.":::

1. Correct the error.

1. Run the Flow Checker again. If there are no errors or warnings, we recommend that you test your flow to ensure it works as expected.

---

## More information

[Get started with Power Automate](getting-started.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
