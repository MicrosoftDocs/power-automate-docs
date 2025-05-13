---
title: Troubleshoot cloud flows
description: Learn tips for troubleshooting errors and failures in your Power Automate cloud flows, including how to fix 400-error codes.
#customer intent: As a Power Automate user, I want to identify where a flow failed so that I can review error messages and resolve issues.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/13/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Troubleshoot cloud flows

When your cloud flows encounter a problem that causes them to stop working, a few troubleshooting steps can usually resolve the issue.

First, check the flow's run history to identify where the flow failed and review any error messages.

Make sure that all connections are authenticated and have the necessary permissions. Verify that input data is correct and available, and check for any changes in the environment that might affect the flow.

[Employ robust error handling](error-handling.md) and retry policies to manage transient issues.

Learn more in [Troubleshoot a cloud flow](/power-automate/fix-flow-failures) and [Troubleshoot common issues with triggers](/power-automate/triggers-troubleshoot).

## Understand error codes

Error codes are an important part of troubleshooting. They often provide specific information about why a flow failed, helping you quickly identify and address the underlying issues.

Error codes in the 400s are usually easy to fix. They often indicate a problem with the request sent to the service, such as an invalid parameter or missing authentication. Here are some common error codes you might encounter:

- **400 - Bad Request**: The trigger or action might be misconfigured.
- **401 - Access Denied**: The user doesn't have access to the service.
- **403 - Forbidden**: The user has access to the service but isn't allowed to access a specific endpoint.
- **404 - Not Found**: The resource that's being called doesn't exist.

Error codes 500 and 502 are related to the service and can be temporary. These errors should be reviewed at the service level.
