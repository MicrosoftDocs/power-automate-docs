---
title: Use consistent naming for flow components
description: Learn best practices for naming Power Automate flow components to improve collaboration, troubleshooting, and workflow maintenance.
#customer intent: As a Power Automate user, I want to establish consistent naming standards for Power Automate flows so that I can ensure clarity and consistency across workflows.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Use consistent naming for flow components

Maintaining consistent naming conventions for the components within your Power Automate flows is important for ensuring clarity, organization, and ease of management. By adopting a standardized approach to naming, you enhance collaboration among team members, simplify troubleshooting, and streamline the development and maintenance of your workflows.

Here are some naming convention guidelines to follow:

- **Descriptive and meaningful names**: Give meaningful names to your flows. Choose names that accurately describe the purpose or function of each component. Avoid generic or ambiguous names that could lead to confusion. For example, instead of naming a trigger *Trigger1*, use a descriptive name like "New Email Received" to clearly indicate its purpose.

- **Camelcase or underscores**: Use camelCase (capitalizing the first letter of each word except the first one) or underscores to separate words in your component names. Using camelCase or underscores improves readability and makes it easier to distinguish between different parts of the name. For instance, name an action "sendEmailNotification" or "send_email_notification" for consistency.

- **Prefixes or tags**: Consider using prefixes or tags to categorize components based on their type or functionality. For example, you could use prefixes like "Trg_" for triggers, "Act_" for actions, or "Var_" for variables. Prefixes or tags help you quickly identify the role of each component within the flow.

- **Consistency across flows**: Maintain consistency in naming conventions across all your Power Automate flows to facilitate navigation and standardization. Consistent naming ensures that team members can easily understand and work with different flows without having to decipher unique naming styles.

- **Document naming conventions**: Document your naming conventions in a style guide or other documentation to ensure that all team members are aware of the standards to follow. Documenting your naming conventions promotes uniformity and reduces the likelihood of inconsistencies or misunderstandings. Consider setting up a [SharePoint site](/power-platform/guidance/adoption/wiki-community#create-a-power-platform-hub) to share guidelines with your maker community.

- **Commenting**: Adding notes to the actions makes it easy to understand the flow implementation logic.

    :::image type="content" source="media/comments-example.png" alt-text="Screenshot showing an example of notes or comments added to a flow." lightbox="media/comments-example.png":::
