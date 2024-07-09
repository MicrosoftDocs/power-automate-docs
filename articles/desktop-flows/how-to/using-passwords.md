---
title: Using passwords
description: How to use passwords in desktop flow actions.
author: jpapadimitriou

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/09/2024
ms.author: dipapa
ms.reviewer: 
contributors:
- jpapadimitriou
search.audienceType: 
  - flowmaker
  - enduser
---

# Using passwords

There are actions in desktop flows that require the use of passwords, for example, while configuring the [Launch Excel](../actions-reference/excel.md#launch-excel) action in order to open a password protected Excel file.

:::image type="content" source="media/using-passwords/launch-password-protected-excel-file.png" alt-text="Screenshot of the Launch Excel action configured to open a password protected file" border="false":::

Desktop flows allow you to either provide a password directly or use a variable as a password input in the respective fields that require a password. 

:::image type="content" source="media/using-passwords/input-password-options.png" alt-text="Screenshot of the available options for password input" border="false":::

The option **Direct password input** uses encryption that is machine based to ensure a maximum level of security. 

> [!IMPORTANT]
> Provided passwords in the respective password fields can only work on the machine that they are originally inputted. Direct password inputs use encryption that is machine-based. If the flow is opened on another machine, these inputs will be invalid and must be provided from scratch.

Flows that are configured to use the direct password input in the respective fields will not be shown as invalid if opened in different machines than the one where the password was originally provided and you will have to provide passwords from scratch.

To allow the use of such flows from other machines you can use the "Password input as variable" option. 

> [!IMPORTANT]
> Sensitive variables aren't meant to provide protection over hardcoded data. You shouldn't hardcode critical data in plain text, like passwords and PINs, in the properties of actions like Set variable, even if the said variables are marked as sensitive. The desktop flow logs will be protected, but the hardcoded values are visible in the modal and the flow definition in Microsoft Dataverse. To find more information regarding sensitive inputs in cloud flows, see [Manage sensitive input like passwords](https://learn.microsoft.com/power-automate/how-tos-use-sensitive-input)

To increase the level of obscurance when using the option "Password input as variable" make sure to mark the respective variable as [sensitive](../manage-variables.md#sensitive-variables)

:::image type="content" source="media/using-passwords/sensitive-variable.png" alt-text="Screenshot of sensitive variable holding a password" border="false":::