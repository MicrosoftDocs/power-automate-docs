---
title: Test cloud flows
description: Discover effective methods for testing Power Automate cloud flows, including design phase testing and static result testing.
#customer intent: As a Power Automate user, I want to test my Power Automate cloud flows so that I can ensure their reliability, performance, and accuracy.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Test cloud flows

Testing your Power Automate cloud flows is crucial to ensure their reliability, performance, and accuracy. By following these best practices, you streamline your testing process, identify and resolve issues more efficiently, and maintain the integrity of your automated workflows.

## Design phase testing

Consider using **Flow Checker** and **Test Flow** tools during the design phase to identify issues.

In the **Test** pane, there are two options for testing your flow:

- Manually trigger the test by performing the action that triggers the flow. For example, depending on the use case, go to your inbox and send yourself a test email, or go to SQL and insert a row.

- Use data from previous runs to perform the test.

:::image type="content" source="media/test-cloud-flows.png" alt-text="Screenshot of the Test Flow pane." lightbox="media/test-cloud-flows.png":::

## Static result testing (mock data)

The Static Result option in Power Automate streamlines testing your flows. It lets you mock the outcomes of specific actions, enabling you to test different parts of your flow without executing the entire process each time.

Advantages of using static result testing include:

- **Time efficiency**: By using static results, you bypass long-running actions and focus on testing specific sections of your flow. 

- **Simplified testing**: Mocking action outcomes lets you simulate various scenarios and conditions without needing the actual data or events to occur. This approach makes it easier to validate the behavior of your flow under different circumstances.

- **Troubleshooting**: Static results can help isolate and troubleshoot issues within your flow. By controlling the output of specific actions, you can identify and resolve problems more effectively.

### How to use static results

Take a three-step approach:

1. **Capture the action's outcome**
   - Create a new manually triggered flow with the action you want to mock (for example, **Start and wait for an approval**).
   - Run the flow once and complete the action to capture its outcome.
   - Go to the flow history, open the last run instance, and expand the action to view its outputs.
   - Copy the output data, which typically includes the "body" and other relevant details.

2. **Configure the static result**
   - In the flow editor, select the ellipsis on the action you want to mock and select **Static result**.
   - Toggle **Enable Static Result** and select the fields you want to provide as a response.
   - Save the changes.

<!-- Not able to check first steps above -->

3. **Run the flow with static results**

      - When you run the flow again, it uses the static result for the mocked action, skipping the actual execution and using the predefined output instead.

## Resubmitting cloud flow runs

Sometimes, a cloud flow stops working unexpectedly or fails due to server issues or an asynchronous process not meeting certain requirements. Rerun the flow by going to **Run history** and selecting **Resubmit**. You can also [resubmit or cancel runs in bulk](../../how-tos-bulk-resubmit.md).

### Considerations for resubmitting runs

When resubmitting a flow run in Power Automate, keep the following key considerations in mind to ensure that the process is smooth and effective:

- **Error handling**: Ensure your flow includes effective error handling and retry policies. This approach helps address the issues that caused the initial failure and provides better insights into why a run might fail again.

- **Data duplication**: Be cautious of potential data duplication or other side effects from resubmitting a run. For example, if your flow creates records or sends emails, resubmitting might repeat these actions, leading to duplicates.

- **Input data**: Verify that the input data required for the flow run is still valid and available. Changes in the data or environment (such as deleted files or records) can affect the outcome of the resubmitted run.

- **Flow updates**: If you made changes to the flow since the original run, consider whether these changes might affect the resubmission. It's best to resubmit using the version of the flow that was in place at the time of the original run to ensure consistency.
 

