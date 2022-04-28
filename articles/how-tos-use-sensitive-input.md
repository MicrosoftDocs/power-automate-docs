---
title: Manage sensitive input like passwords in Power Automate | Microsoft Docs
description: Learn how to manage sensitive input like passwords in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kVivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/20/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---


# Manage sensitive input like passwords

Some inputs like passwords need to be obfuscated and omitted from the logs. Power Automate supports inputs called **Sensitive text inputs** for storing these "private" values.

To retrieve sensitive content from another connector, turn on **Secure Inputs** and **Secure Outputs** by following these steps.

1. Select **…** on the top right corner of the action.
1.Select **Settings**.

    ![The settings option](./media/manage-sensitive-input/settings.png "The settings option")

1. Turn on the **Secure Inputs** and **Secure Outputs** properties to prevent these settings from being shown in the logs.

   ![Secure inputs and outputs.](./media/manage-sensitive-input/secure-outputs-secure-inputs.png "Secure inputs and outputs")

1.Select **Done**.

  You will notice that the action now has a lock icon on the top right, indicating special handling for input and output values.

  ![The lock icon.](./media/manage-sensitive-input/lock-icon.png "The lock icon")

      >[!TIP]
      >Follow the same steps to configure inputs as given earlier in this article to pass the output from this connector to a desktop flow, and then turn on **Secure Text** in the **Settings**.

      ![Pass outputs to a flow .](./media/manage-sensitive-input/pass-to-desktop-flow.png "Desktop flow inputs")

[!INCLUDE[footer-include](includes/footer-banner.md)]