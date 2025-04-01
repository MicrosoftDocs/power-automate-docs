---
title: Use consistent naming for flow components
description: Learn best practices for naming Power Automate flow components to improve collaboration, troubleshooting, maintenance, and consistency across workflows.
#customer intent: As a Power Automate user, I want to establish consistent naming standards for Power Automate flows so that I can ensure clarity and consistency across workflows.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Use consistent naming for flow components

Building Power Automate flows that are consistent, perform well, and are easier to maintain starts with establishing standard naming conventions for the components of your flows. With a standardized approach to naming, you enhance collaboration among team members, simplify troubleshooting, and streamline the development and maintenance of your workflows.

We recommend the following best practices in naming your flow components:

- **Create descriptive and meaningful names**. Choose names that accurately describe the purpose or function of each component. Avoid generic or ambiguous names that could lead to confusion. For example, instead of naming a trigger "Trigger1," use a descriptive name like "New Email Received" to help team members quickly understand the component's purpose and functionality.

- **Use camelCase or underscores to separate words**. Use camelCase (capitalizing the first letter of each word except the first one) or underscores to separate words in your component names. For example, "sendEmailNotification" or "send_email_notification" is easier to read than "sendemailnotification."

- **Categorize components with prefixes or tags**. Consider using prefixes or tags to categorize components based on their type or functionality to help team members quickly identify the role of each component within the flow. For example, you could use prefixes like "Trg_" for triggers, "Act_" for actions, or "Var_" for variables.

- **Apply standard names consistently across flows**. Apply your naming conventions consistently to help team members easily understand and work with different flows without having to decipher unique naming styles.

- **Document your naming conventions**. Codify your naming conventions in a style guide or other document to make sure that all team members are aware of the standards to follow. Documenting your naming conventions promotes uniformity and reduces the likelihood of inconsistencies or misunderstandings. Consider setting up a [SharePoint site](/power-platform/guidance/adoption/wiki-community#create-a-power-platform-hub) to share guidelines with your maker community.

- **Comment your flows**. Add notes to actions to makes it easy to understand the flow logic, just as you would add comments to lines of code. This practice is especially important for complex flows or when multiple people are working on the same flow. Use comments to explain the purpose of each action, any specific logic used, and any other relevant information that can help others understand the flow's design.
