---
title: Manage cloud flow behavior with Flow Checker
description: Learn how to manage cloud flow behavior with Flow Checker
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/30/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Manage cloud flow behavior with flow checker

The **Flow Checker** in Power Automate is a built-in tool designed to help users ensure the quality and correctness of their cloud flows. By providing real-time analysis and feedback on potential issues, it enhances the reliability and functionality of flows. 

## Key benefits of flow checker

- **Error Detection**: Flow Checker identifies errors that prevent the flow from running, such as missing or incorrect inputs, misconfigured actions, and connectivity issues. 

- **Warnings and Suggestions**: Flow Checker provides warnings and best practice suggestions to optimize the flow's performance and maintainability. These recommendations might include improving logic, updating deprecated actions, or enhancing overall flow efficiency.

- **Real-Time Feedback**: As you build or modify your flow, the Flow Checker offers real-time feedback. This immediate insight allows you to address issues as they arise, ensuring a smoother development process.

- **Detailed Explanations**: A detailed explanation and guidance on how to resolve the issue is provided with each error and warning. This extra detail makes it easier for users to understand the problem and implement the necessary fixes.

:::image type="content" source="media/flow-checker-result.png" alt-text="A screenshot of a Flow Checker result displaying two errors":::

## How to use flow checker

- **Accessing Flow Checker**: You can access Flow Checker from the editor in Power Automate. 
- **Reviewing issues**: When you run Flow Checker, it lists any detected errors and warnings. Each item includes a description and suggested actions.
- **Implementing fixes**: Follow the detailed guidance provided for each issue to make the necessary corrections. You might have to adjust inputs, reconfigure actions, or update connections.

Learn more: [About Flow Checker](/power-automate/error-checker).