---
title: Use passwords
description: Learn how to use passwords in desktop flow actions.
author: kewaiss
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/09/2024
ms.author: nimoutzo
ms.reviewer: 
contributors:
- jpapadimitriou
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Use passwords

Certain actions within desktop workflows require the use of passwords. For example, the configuration of the [Launch Excel](../actions-reference/excel.md#launchexcel) action is essential for accessing an Excel file secured by a password.

:::image type="content" source="media/using-passwords/launch-password-protected-excel-file.png" alt-text="Screenshot of the Launch Excel action configured to open a password protected file" border="false":::

Desktop flows allow you to either provide a password directly or use a variable as a password input in the designated password-required fields.

:::image type="content" source="media/using-passwords/input-password-options.png" alt-text="Screenshot of the available options for password input" border="false":::

The option **Direct password input** uses encryption that is machine based to ensure a maximum level of security.

> [!IMPORTANT]
> Passwords entered in designated fields only work on the machine where they were initially set. This is due to the machine-specific encryption used for direct password inputs. If the flow is opened on a different machine, these passwords will not be valid and will need to be re-entered.

Flows set up with direct password input in specific fields are shown as invalid when opened on a machine other than the one where the password was first entered. In such cases, you need to reenter the passwords.

To allow the use of such flows from other machines, you can use the **Password input as variable** option.

> [!IMPORTANT]
> Marking variables as sensitive does not secure hardcoded information. Avoid embedding sensitive details such as passwords and PINs directly into action properties like Set variable, even if you classify these variables as sensitive. While desktop flow logs safeguard this data, hardcoded values remain exposed in both the modal and the flow definition in Microsoft Dataverse. For additional guidance on handling sensitive inputs in cloud flows, learn more in [Manage sensitive input like passwords](../../how-tos-use-sensitive-input.md).

To enhance the security of the "Password input as variable" feature, it's important to designate the corresponding variable as [sensitive](../manage-variables.md#sensitive-variables).

:::image type="content" source="media/using-passwords/sensitive-variable.png" alt-text="Screenshot of sensitive variable holding a password" border="false":::
