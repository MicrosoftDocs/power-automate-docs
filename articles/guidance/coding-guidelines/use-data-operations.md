---
title: Work with data operations
description: Learn how to efficiently manipulate, transform, and manage data within your cloud flows using data operations in Power Automate.
#customer intent: As a Power Automate user, I want to learn how to efficiently manipulate, transform, and manage data within my cloud flows so that I can optimize my automation processes.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/17/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
  - flowmaker
---

# Work with data operations

Data operations in Power Automate refer to the manipulation, transformation, and management of data within your automation flows in an efficient way. Actions like **Filter array**, **Select**, and **Join** help avoid unnecessary loops to process data.

:::image type="content" source="media/data-operations.png" alt-text="Screenshot of available data operations." lightbox="media/data-operations.png":::

Learn more: [Use data operations](/power-automate/data-operations)

## Example use cases for data operations

Consider using a filter or select operation instead of a condition in a loop to find elements in a table that match certain criteria. This approach can simplify your cloud flow and improve performance.

Data operations in Power Automate are useful for transforming and manipulating data from external sources that lack built-in filtering or selection capabilities. For instance, when retrieving data from an API via an HTTP request or using a custom connector that doesn't support filter parameters, you can use data operation actions to handle these tasks. By using actions such as **Filter array**, **Select**, **Compose**, and **Parse JSON**, you can effectively filter, select, and transform the data within your flow. This approach lets you tailor the data to your specific needs, ensuring that only relevant information is processed and utilized in subsequent steps of your automation.

## Advantages of using data operations

Using data operations in Power Automate offers several benefits, especially for complex data manipulation tasks. Here are some key advantages:

- **Efficiency**
   - The **Filter array** action lets you quickly filter out unwanted data based on specific conditions, making your workflows more efficient. For example, you can easily filter out records that don't meet certain criteria without using conditions and loops.
   - The **Select** action helps you transform the shape of your data by selecting only the necessary fields. It simplifies the data structure and reduces the amount of data processed in subsequent steps.
   - The **Join** action combines multiple values into a single string, which is useful for creating summaries or concatenating data for reports or notifications.

- **Improved data management**
   - The **Filter array** action helps manage large datasets by narrowing down the data to only what is relevant and enables you to process or analyze specific subsets of data.
   - The **Select** action lets you focus on the essential parts of your data, making it easier to manage and understand. It also helps reduce the payload size when sending data to other systems or services.
   - The **Join** action facilitates the creation of readable and formatted strings from arrays, which can be used in emails, reports, or logs, enhancing the clarity and presentation of your data.

- **Flexibility and customization**
   - The **Filter array** action offers flexibility in defining complex filtering conditions using logical operators. Using this action lets you tailor the filtering process to meet specific business requirements.
   - The **Select** action can help you rename fields and create new structures, allowing for customized data outputs that fit your needs.
   - The **Join** action lets you specify custom delimiters, giving you control over how the combined data is formatted.

- **Enhanced performance**
   - The **Filter array** action reduces the amount of data processed in subsequent steps, which can significantly improve the performance of your workflows.
   - The **Select** action streamlines data by removing unnecessary fields, which can speed up data processing and reduce the risk of errors.
   - The **Join** action simplifies the process of combining data, making it easier to generate summaries or formatted outputs quickly.

> [!TIP]
> When working with data sources such as Dataverse in Power Automate, it's important to optimize your flows for better performance. Instead of using the **Filter array** and **Select** actions, consider using the **Select columns** and **Filter rows** options directly within the action. This technique reduces the number of actions required in your flow, enhancing performance and efficiency. By filtering and selecting data at the source, you minimize the amount of data processed and transferred, leading to faster execution times, and more streamlined workflows.

## Variables vs Compose

Variables store data that you can update or change throughout the flow. They're useful when you:

- **Store and update values**: Variables can hold data that might change as the flow progresses, such as counters, accumulators, or dynamic values.
- **Maintain state**: Variables help in maintaining the state of data across different actions and conditions within the flow.
- **Perform calculations**: You can use variables to perform arithmetic operations or concatenate strings.
- **Reuse values**: Variables allow you to store a value once and reuse it multiple times throughout the flow, reducing redundancy.

Benefits of variables include:

- **Flexibility**: Variables can be updated multiple times, making them ideal for scenarios where data changes dynamically.
- **Persistence**: Variables retain their value throughout the flow, which is useful for maintaining state and performing iterative operations.

The **Compose** action generates a single output from a given input expression. It's useful when you:

- **Simplify expressions**: Simplify complex expressions by breaking them down into smaller, manageable parts.
- **Store static values**: Store values that don't change throughout the flow but need to be read many times.
- **Perform intermediate calculations**: Perform intermediate calculations or transformations that don't need later updates.
- **Pass data between actions**: Pass data between actions without the need to create a variable.

Benefits of the **Compose** action include:

- **Efficiency**: **Compose** is lightweight and doesn't require initialization or declaration, making it faster to set up.
- **Readability**: **Compose** improves the readability of your flow by allowing you to break down complex expressions into simpler components.
- **Performance**: **Compose** can be more efficient in scenarios where data doesn't change.

Use variables when you need to store and update data dynamically throughout the flow. Use **Compose** when you need to generate a static output or perform intermediate calculations that don't require updates.

### JSON variables vs individual variables

When working with a set of variables that are updated within the same logical blocks in the flow, use JSON variables instead of individual variables to reduce the number of actions in the flow.

Using separate variables for each value requires multiple actions: two **Initialize variable** actions and two **Set variable** actions to update them, resulting in additional steps in the flow.

:::image type="content" source="media/var-individual.png" alt-text="Screenshot of using separate variables for var1 and var2." lightbox="media/var-individual.png":::

The second approach, using a single object variable in JSON format, reduces the number of actions in the flow and makes it easier to manage related data.

:::image type="content" source="media/var-object.png" alt-text="Screenshot of using a single object variable in JSON format." lightbox="media/var-object.png":::

With this approach, you only need one **Initialize variable** action and one **Set variable** action, reducing the number of steps in the flow.