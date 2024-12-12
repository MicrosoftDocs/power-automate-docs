---
title: Troubleshoot cloud flows
description: Learn how to troubleshoot cloud flows
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

## Troubleshoot cloud flows

Power Automate Cloud flows detailed troubleshooting documents are listed as follows:

[Troubleshooting triggers](/power-automate/triggers-troubleshoot)

[Troubleshoot Cloud flows](/power-automate/fix-flow-failures)

Here are some important handy tips

## Understand the error codes

Error codes in the 400s can usually be fixed by the user:

- **400 - Bad Request**: This can occur due to a misconfiguration at the trigger or action level.
- **401 - Access Denied**: The user does not have access to the service.
- **403 - Forbidden**: The user has access to the service but is not allowed to access a specific endpoint.
- **404 - Not Found**: The resource being called does not exist.

Error codes 500 and 502 are related to the service and may be temporary. These should be reviewed at the service level.