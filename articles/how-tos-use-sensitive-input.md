---
title: Manage sensitive input like passwords in Power Automate | Microsoft Docs
description: Learn how to manage sensitive input like passwords in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 06/13/2022
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage sensitive input like passwords

Some inputs like passwords need to be omitted from the logs. Power Automate uses **Sensitive text inputs** to store these "confidential" values.

Follow these steps to turn on **Secure Inputs** and **Secure Outputs** to work with sensitive content from connectors.

1. On the top right corner of an action, select (**…**).

1. Select **Settings**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the settings option.](./media/manage-sensitive-input/settings.png "Settings option")

1. Turn on the **Secure Inputs** and **Secure Outputs** properties to prevent these values from being shown in the logs.

    >[!div class="mx-imgBorder"]
    >![Screenshot of secure inputs and outputs.](./media/manage-sensitive-input/secure-outputs-secure-inputs.png "Secure inputs and outputs")

1. Select **Done**.

  You'll notice that the action now has a lock icon on the top right, indicating special handling for input and output values.

  ![The lock icon.](./media/manage-sensitive-input/lock-icon.png "The lock icon")

  >[!TIP]
  >Follow the same steps to configure inputs as given earlier in this article to pass the output from this connector to a desktop flow, and then turn on **Secure Text** in the **Settings**.

  ![Pass outputs to a flow.](./media/manage-sensitive-input/pass-to-desktop-flow.png "Desktop flow inputs")

[!INCLUDE[footer-include](includes/footer-banner.md)]
