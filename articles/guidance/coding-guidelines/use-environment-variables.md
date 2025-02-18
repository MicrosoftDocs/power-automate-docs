---
title: Use environment variables
description: Learn how to use environment variables in Power Automate to enhance workflow flexibility and maintainability across different environments.
#customer intent: As an admin, I want to use environment variables in Power Automate so that I can enhance workflow flexibility and maintainability across different environments.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/05/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Use environment variables

Environment variables in Power Automate cloud flows enhance the flexibility and maintainability of your workflows, especially in development, testing, and production environments. 

## Why use environment variables?

Environment variables are parameters that can be used to store configuration settings and other values that can be easily changed without modifying the actual flow logic. Reference these variables within flows to manage environment-specific settings like URLs, API keys, connection strings, or other configuration data.

Benefits of using environment variables include:

- **Separation of configuration and logic**: By using environment variables, you separate the configuration data from the flow logic. This approach makes the flows more modular and easier to manage.
- **Easier deployment**: Environment variables simplify the deployment process across different environments (development, testing, production) by allowing you to change configurations without editing the flows.
- **Maintainability**: Environment variables make it easier to update and maintain flows. When a configuration value needs to change, you can update the environment variable without editing each individual flow.

## Best practices for using environment variables

Follow these best practices when using environment variables:

- **Use consistent naming conventions**: Use clear and consistent naming conventions for your environment variables to ensure they're easily identifiable and understandable.
- **Use default values wisely**: Set meaningful default values that can be used as fallbacks in case the current value isn't set.
- **Document variables**: Document the purpose and usage of each environment variable to ensure that team members understand what each variable is for and how to configure it. Add a description when creating an environment variable.
- **Limit sensitive data**: Avoid storing highly sensitive data directly in environment variables. Consider using secure mechanisms for sensitive configurations (for example, Azure Key Vault).

## Example scenario

Imagine you have a flow that connects to an API endpoint that differs across development, testing, and production environments.

1.  **Create environment variable**:
    -   API_Base_URL with default value `https://api.dev.example.com` for development.
    -   Change the value to `https://api.test.example.com` in the testing environment.
    -   Change the value to `https://api.example.com` in the production environment.
2.  **Reference in flow**:
    -   In the HTTP action within your flow, set the URL to `@{variables('API_Base_URL')}`.

By using an environment variable, you only need to update the environment variable values when you promote your solution from development to testing and production. You don't have to alter the flow logic, ensuring consistency, reduce the chance of errors, and simplify management.