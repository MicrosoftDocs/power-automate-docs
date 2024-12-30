---
title: Use data operations
description: Learn how to use data operations
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

# Working with data operations

Data operations in Power Automate refer to the manipulation, transformation, and management of data within your automation flows in an efficient way. 

Actions like **Filter array**, **Select**, and **Join** can help avoid any unnecessary loops to process data. 

:::image type="content" source="media/data-operations.png" alt-text="A screenshot of available data operations":::

For example, instead of using a condition in a loop to find elements in a table that match a certain criteria, you can use a filter or select operation. This approach simplifies your cloud flow and improve performance. 

Learn more: [Use data operations](/power-automate/data-operations)

>[!TIP]
>Data operations in Power Automate are useful for transforming and manipulating data from external sources that lack built-in filtering or selection capabilities. For instance, when retrieving data from an API via an HTTP request or using a custom connector that does not support filter parameters, you can use data operation actions to handle these tasks. By using actions such as Filter array, Select, Compose, and Parse JSON, you can effectively filter, select, and transform the data within your flow. This approach allows you to tailor the data to your specific needs, ensuring that only relevant information is processed and utilized in subsequent steps of your automation.

Using data operations in Power Automate offers several benefits, especially when dealing with complex data manipulation tasks. Here are some key advantages:

- **Efficiency**
  - The **Filter array** action allows you to quickly filter out unwanted data based on specific conditions, making your workflows more efficient. For example, you can easily filter out records that don't meet certain criteria without using conditions and loops.
  - The **Select** action helps you transform the shape of your data by selecting only the necessary fields. It simplifies the data structure and reduces the amount of data processed in subsequent steps.
  - The **Join** action combines multiple values into a single string, which is useful for creating summaries or concatenating data for reports or notifications.

- **Improved data management**
  - The **Filter array** action helps manage large datasets by narrowing down the data to only what is relevant and enable you to process or analyze specific subsets of data.
  - The **Select** action allows you to focus on the essential parts of your data, making it easier to manage and understand. It also helps in reducing the payload size when sending data to other systems or services.
  - The **Join** action facilitates the creation of readable and formatted strings from arrays, which can be used in emails, reports, or logs, enhancing the clarity and presentation of your data.

- **Flexibility and customization**
  - The **Filter array** action offers flexibility in defining complex filtering conditions using logical operators. Using this action enables you to tailor the filtering process to meet specific business requirements.
  - The **Select** action can help you rename fields and create new structures, allowing for customized data outputs that fit your needs.
  - The **Join** action allows you to specify custom delimiters, giving you control over how the combined data is formatted.

- **Enhanced performance**
  - The **Filter array** action reduces the amount of data processed in subsequent steps, which can significantly improve the performance of your workflows.
  - The **Select** action streamlines data by removing unnecessary fields, which can speed up data processing and reduce the risk of errors.
  - The **Join** action simplifies the process of combining data, making it easier to generate summaries or formatted outputs quickly.

>[!TIP]
>When working with data sources such as Dataverse in Power Automate, it’s important to optimize your flows for better performance. Instead of using the **Filter array** and **Select** actions, consider using the **Select columns** and **Filter rows** options directly within the action. This approach reduces the number of actions required in your flow, which can enhance performance and efficiency. By filtering and selecting data at the source, you minimize the amount of data processed and transferred, leading to faster execution times and more streamlined workflows.

## Variables vs compose

**Variables** are used to store data that can be updated or changed throughout the flow. They're useful when you need to:

- **Store and update values**: Variables can hold data that might change as the flow progresses, such as counters, accumulators, or dynamic values.
- **Maintain state**: They help in maintaining the state of data across different actions and conditions within the flow.
- **Perform calculations**: You can use variables to perform arithmetic operations or concatenate strings.
- **Reuse values**: Variables allow you to store a value once and reuse it multiple times throughout the flow, reducing redundancy.

**Benefits of variables**:

- **Flexibility**: Variables can be updated multiple times, making them ideal for scenarios where data changes dynamically.
- **Persistence**: They retain their value throughout the flow, which is useful for maintaining state and performing iterative operations.

The **Compose** action is used to generate a single output from a given input expression. It's useful when you need to:

- **Simplify expressions**: Compose can be used to simplify complex expressions by breaking them down into smaller, manageable parts.
- **Store static values**: It's ideal for storing values that don't change throughout the flow but need to be read many times. 
- **Intermediate calculations**: Use Compose to perform intermediate calculations or transformations that don't need to be updated later.
- **Pass data between actions**: Compose can be used to pass data between actions without the need to create a variable.

**Benefits of compose**:

- **Efficiency**: Compose is lightweight and doesn't require initialization or declaration, making it faster to set up.
- **Readability**: It improves the readability of your flow by allowing you to break down complex expressions into simpler components.
- **Performance**: Compose can be more efficient in scenarios where data doesn't change.

Use variables when you need to store and update data dynamically throughout the flow. Use compose when you need to generate a static output or perform intermediate calculations that don't require updates.

When working with a set of variables that are updated within the same logical blocks in the flow, use JSON variables instead of individual variables to reduce the number of actions in the flow. 

For example, instead of working with Var1 and Var2 as separate variables, use one object variable to manage both values:

| Individual variables | One object variable |
| --- | --- |
| Using separate variables for var1 and var2 requires two **Initialize variable** actions and two **Set variable** actions to update them, resulting in additional steps in the flow. | By using a single object variable in JSON format, you only need one **Initialize variable** action and one **Set variable** action, which reduces the number of steps in the flow. |
| :::image type="content" source="media/var-individual.png" alt-text="A screenshot of using individual variables"::: | :::image type="content" source="media/var-object.png" alt-text="A screenshot of using an object variable and JSON":::


