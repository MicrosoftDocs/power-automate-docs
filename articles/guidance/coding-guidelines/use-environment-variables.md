---
title: Use environment variables
description: Learn how to use environment variables
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
search.audienceType: 
  - admin
  - flowmaker
---

## Use environment variables

Environment variables in Power Automate cloud flows enhance the flexibility, maintainability, and manageability of your workflows, especially when working with multiple environments like development, testing, and production. Here’s an in-depth look at how environment variables are used and managed in Power Automate:

### Why use environment variables?

Environment variables are parameters that can be used to store configuration settings and other values that can be easily changed without modifying the actual flow logic. These variables can be referenced within flows, making it easier to manage environment-specific settings, such as URLs, API keys, connection strings, or any other configuration data.

- **Separation of configuration and logic**: By using environment variables, you separate the configuration data from the flow logic. This makes the flows more modular and easier to manage.
- **Easier Deployment**: Environment variables simplify the deployment process across different environments (development, testing, production) by allowing you to change configurations without editing the flows.
3.  **Maintainability**: They make it easier to update and maintain flows. When a configuration value needs to change, you can update the environment variable without needing to edit each individual flow.

Consider following best practices while using environment variables:

- **Consistent Naming Conventions**: Use clear and consistent naming conventions for your environment variables to ensure they're easily identifiable and understandable.
- **Use Default Values Wisely**: Set meaningful default values that can be used as fallbacks in case the current value isn't set.
- **Document Variables**: Document the purpose and usage of each environment variable to ensure that team members understand what each variable is for and how to configure it.
- **Limit Sensitive Data**: Avoid storing highly sensitive data directly in environment variables. Consider using secure mechanisms for sensitive configurations (for example, Azure Key Vault).

**Example Scenario**

Imagine you have a flow that connects to an API endpoint which differs across development, testing, and production environments:

1.  **Create environment variables**:
    -   API_Base_URL with default value https://api.dev.example.com for development.
    -   Change the current value to https://api.test.example.com in the testing environment.
    -   Change the current value to https://api.example.com in the production environment.
2.  **Reference in flow**:
    -   In the HTTP action within your flow, set the URL to @{variables('API_Base_URL')}.

By using environment variables, when you promote your solution from development to testing and production, you only need to update the environment variable values without altering the flow logic. This ensures consistency, reduces errors, and simplifies management.