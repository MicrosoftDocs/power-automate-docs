---
title: Troubleshoot cloud flows
description: Learn how to troubleshoot cloud flows in Power Automate, identify failures, and review error messages to ensure smooth operation.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/06/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Troubleshoot cloud flows

Cloud flows in Power Automate can sometimes encounter issues that require troubleshooting to ensure smooth operation.

When troubleshooting cloud flows in Power Automate, identify where the flow failed and review any error messages provided by checking the **Run History**. Ensure that all connections are authenticated and have the necessary permissions. Verify that input data is correct and available, and check for any changes in the environment that might affect the flow. Implement [error handling](error-handling.md) and retry policies to manage transient issues. 

For more guidance, refer to [Troubleshoot a cloud flow](/power-automate/fix-flow-failures) and [Troubleshoot common issues with triggers](/power-automate/triggers-troubleshoot).

## Understand error codes

Understanding error codes is important when troubleshooting. Error codes provide specific information about why a flow failed, helping you to quickly identify and address the underlying issues. By recognizing and interpreting these codes, you can implement improvements, ensuring your flows run smoothly and efficiently. 

You can usually fix error codes in the 400s:

- **400 - Bad Request**: Often due to a misconfiguration at the trigger or action level.
- **401 - Access Denied**: User doesn't have access to the service.
- **403 - Forbidden**: User has access to the service but isn't allowed to access a specific endpoint.
- **404 - Not Found**: The resource being called doesn't exist.

Error codes 500 and 502 are related to the service and can be temporary. These errors should be reviewed at the service level.