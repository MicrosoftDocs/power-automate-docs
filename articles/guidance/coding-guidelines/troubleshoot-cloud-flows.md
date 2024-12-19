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

# Troubleshoot cloud flows

When troubleshooting cloud flows in Power Automate, identify where the flow failed and review any error messages provided by checking the **Run History**. Ensure that all connections are authenticated and have the necessary permissions. Verify that input data is correct and available, and check for any changes in the environment that might affect the flow. Implement [error handling](error-handling.md) and retry policies to manage transient issues. 

For more detailed guidance, refer to [Troubleshooting triggers](/power-automate/triggers-troubleshoot) and [Troubleshoot Cloud flows](/power-automate/fix-flow-failures).

## Understand the error codes

Understanding error codes is important when troubleshooting cloud flows in Power Automate. These codes provide specific information about why a flow failed, helping you quickly identify and address the underlying issues. By recognizing and interpreting these codes, you can implement improvements, ensuring your flows run smoothly and efficiently. 

You can usually fix error codes in the 400s:

- **400 - Bad Request**: This error can occur due to a misconfiguration at the trigger or action level.
- **401 - Access Denied**: The user doesn't have access to the service.
- **403 - Forbidden**: The user has access to the service but isn't allowed to access a specific endpoint.
- **404 - Not Found**: The resource being called doesn't exist.

Error codes 500 and 502 are related to the service and might be temporary. These errors should be reviewed at the service level.