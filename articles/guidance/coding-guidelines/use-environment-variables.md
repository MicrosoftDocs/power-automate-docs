---
title: Use environment variables
description: Learn how to use environment variables in Power Automate to separate configuration from logic, making your workflows modular and easier to manage.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 07/11/2025
ms.author: rachaudh
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/03/2025
---

# Use environment variables

Environment variables in Power Automate cloud flows enhance the flexibility and maintainability of your workflows, especially in development, testing, and production environments. This article provides best practices for using environment variables effectively in your flows.

## Why use environment variables?

Environment variables are parameters that can store configuration settings like URLs, API keys, and connection strings. They can be easily changed without modifying the actual flow logic, which is helpful when you move your flows between environments that require different configurations.

Environment variables:

- Separate configuration and logic, making flows more modular and easier to manage.

- Simplify deployment across different environments, such as development, testing, and production, by allowing you to change configurations without editing the flows.

- Make flows easier to update and maintain. When a configuration value needs to change, you can update the environment variable without editing each individual flow.

For example, imagine your flow connects to an API endpoint that's different in each of your development, testing, and production environments. Instead of hardcoding the URL in your flow, store it in an environment variable called `API_Base_URL`. You can easily change the URL in the environment variable settings without modifying the flow itself.

- In the development environment, set `API_Base_URL` to the default value `https://api.dev.example.com`.
- In the testing environment, change the value to `https://api.test.example.com`.
- In the production environment, change the value to `https://api.example.com`.

Then, in the HTTP action in your flow, set the URL to `@{variables('API_Base_URL')}`.

## Best practices for using environment variables

- **Use consistent naming conventions**: Use clear and consistent naming conventions for your environment variables to ensure that they're easily identifiable and understandable.

- **Use default values wisely**: Set meaningful default values that can be used as fallbacks in case the current value isn't set.

- **Document your variables**: Document the purpose and usage of each environment variable to ensure that team members understand what each variable is for and how to configure it. Add a description when creating an environment variable.

- **Limit sensitive data**: Avoid storing highly sensitive data directly in environment variables. Consider using secure mechanisms for sensitive configurations, such as Azure Key Vault.
