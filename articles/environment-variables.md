---
title: Create environment variables
description: Create environment variables and use them across environments.
author: v-aangie
ms.author: angieandrews
ms.reviewer: angieandrews
ms.date: 08/05/2025
ms.topic: how-to
---

# Create environment variables

Environment variables store values&mdash;such as email addresses, connection strings, or URLs&mdash;that can be reused across flows and solutions. Environment variables are useful when you need to change values based on the environment (like Development, Test, or Production). They allow you to update values without modifying the flow logic itself.

For example, you might have an environment variable for a SharePoint site URL that's used in multiple flows. If the URL changes, you need to update only the environment variable instead of each individual flow.

This article shows you how to create environment variables, use them in your flows, and deploy them across different environments.

## Use cases for environment variables

Environment variables can be used in various scenarios. Here are some common use cases:

| **Use case**        | **Environment variable** | **Example**   |
|---------------------|--------------------------|---------------|
| API integration     | API_Base_URL             | Used in an HTTP action to call `https://dev.api.com` or `https://prod.api.com` |
| Email notifications | SupportEmail             | Used in a `Send an email` action to route messages to the correct team    |
| SharePoint          | SP_Site_URL              | Used in SharePoint actions to dynamically set the site URL                |

## Create environment variables

Create environment variables to help you avoid hardcoding values and make your flows more portable and easier to maintain. You create them within a [solution](overview-solution-flows.md) and then reference them in your cloud flows.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. In the **Environments** list in the title bar, select the environment where you want to create the variable.
1. On the navigation pane to the left, select **Solutions**.
1. Open an existing solution or create a new one.

    - To open an existing solution, select it from the list.
    - To create a new solution, select **+ New solution**, fill in the required fields, and then select **Create**. Learn more in [Create a solution-aware cloud flow](create-flow-solution.md#create-a-solution-aware-cloud-flow).

1. Select **+ New** > **More** > **Environment variable**.

    :::image type="content" source="media/environment-variables/new-environment-variable.png" alt-text="Screenshot of selecting the 'New environment variable' pane.":::

1. Fill in the fields:

    - **Display name**: A friendly name for the variable.
    - **Name**: The unique name used in code.
    - (Optional) **Description**: A brief description of the variable's purpose.
    - **Data type**: Choose from Decimal number, JSON, Text, Yes/No, Data source, and Secret.
    - **Default value**: The value used unless overridden.
    - **Current value**: Optional override for the current environment.

1. Select **Save**.

## Use environment variables in cloud flows

Once created, you can reference environment variables in your cloud flows in a [solution](overview-solution-flows.md).

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. In the **Environments** list in the title bar, select the environment where your variable is stored.
1. On the navigation pane to the left, select **Solutions**.
1. Open an existing solution or create a new one.
    - To open an existing solution, select it from the list.
    - To create a new solution, select **+ New solution**, fill in the required fields, and then select **Create**. Learn more in [Create a solution-aware cloud flow](create-flow-solution.md#create-a-solution-aware-cloud-flow).
1. In your solution, [create](create-flow-solution.md#create-a-solution-aware-cloud-flow) or [open a cloud flow](create-flow-solution.md#add-an-existing-cloud-flow-into-a-solution).
1. Select or add an action that will use the environment variable.
1. Select field where you want to insert the environment variable, and then select the lightning bolt icon to show the dynamic content list.

    If the icon isn't visible, select the gear icon, and then select **Use dynamic content**.

1. Search for and select your environment variable. It appears in the field as a dynamic value.

    The following screenshot shows the `Contacts`environment variable in the Dynamic content list. Select it to copy it to the cloud flow action:

    :::image type="content" source="media/environment-variables/select-in-flow.png" alt-text="Screenshot of selecting an environment variable in a cloud flow action.":::

1. Save and test your flow to ensure the environment variable is being used correctly.

## Deploy across environments

To use an environment variable in a different environment, you need to export your solution. When you import the solution into another environment, the environment variable is included.

- Learn how to [export a solution](export-flow-solution.md).
- Learn how to [import a solution](import-flow-solution.md).

When you import the solution, you can set the environment variable's value for that environment. This allows you to customize the variable for different environments without changing the flow logic.

## Related information

- [Environment variables for Power Platform overview](/power-apps/maker/data-platform/environmentvariables)
- [Why use environment variables?](guidance/coding-guidelines/use-environment-variables.md#why-use-environment-variables)
- [Best practices for using environment variables](guidance/coding-guidelines/use-environment-variables.md#best-practices-for-using-environment-variables)

