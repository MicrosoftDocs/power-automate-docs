---
title: Automate email accounts with two-step verification | Microsoft Docs
description: Automate email accounts with two-step verification
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 07/22/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate email accounts with two-step verification

If you need to automate an email account protected with two-step verification, you have to create an app password.

App passwords are randomly generated passwords that can be used only once when you sign in to an app or device that doesn't support two-step verification.

To create app passwords for Microsoft personal or organizational accounts, follow the instructions in [Create new app passwords](https://docs.microsoft.com/azure/active-directory/user-help/multi-factor-authentication-end-user-app-passwords#create-new-app-passwords). 

To create app passwords for other webmail services, follow the instructions provided in the respective documentation.

After creating an app password, you can populate it in the **Password** field of the **IMAP server** or **SMTP server** tabs of the email actions.

![The Password field in the Send email action.](media/automate-emails-accounts-two-step-verification/send-email-action.png)