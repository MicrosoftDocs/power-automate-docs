---
title: Test and resubmit cloud flow runs
description: Learn how to test and resubmit cloud flow runs
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/30/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Cloud flow testing

Effective testing of Power Automate cloud flows is essential for ensuring their reliability, performance, and correctness. Here are some of the mechanisms that you could use to test your flows:

### Design phase testing

Consider using **Flow checker** and **Test Flow** tools during this phase. 

In the **Test pane**, there are two options for testing your flow:

- Manually trigger the test yourself by performing the action that triggers the flow. For example, you can go to your inbox and send yourself a test email. Or, you can go to SQL and insert a row.
- Use data from previous runs to perform the test.

:::image type="content" source="media/test-cloud-flows.png" alt-text="A screenshot of the Test Flow pane":::

### Static result testing (Mock Data)

The Static Result option in Power Automate is a feature designed to streamline the testing of your flows. It allows you to mock the outcomes of specific actions, enabling you to test different parts of your flow without having to execute the entire process each time.

- **Time efficiency**: By using static results, you can bypass long-running actions and focus on testing specific sections of your flow. 

- **Simplified testing**:  Mocking action outcomes allows you to simulate various scenarios and conditions without needing the actual data or events to occur. This approach makes it easier to validate the behavior of your flow under different circumstances.

- **Troubleshooting**: Static results can help isolate and troubleshoot issues within your flow. By controlling the output of specific actions, you can identify and resolve problems more effectively.

#### How to use static results

1. **Capture the action’s outcome**:
   - Create a new, manually triggered flow with the action you want to mock (for example, "Start and wait for an approval").
   - Run the flow once and complete the action to capture its outcome.
   - Go to the flow history, open the last run instance, and expand the action to view its outputs.
   - Copy the output data, which typically includes the "body" and other relevant details.

2. **Configure the static result**:
   - In the flow editor, select on the ellipsis on the action you want to mock and select **Static result (Preview)**.
   - Toggle **Enable Static Result (Preview)** and select the fields you want to provide as a response.
   - Save the changes.

3. **Run the flow with static results**: When you run the flow again, it uses the static result for the mocked action, skipping the actual execution and using the predefined output instead.

## Resubmitting cloud flow runs

Sometimes, a cloud flow might stop working unexpectedly or fail due to server issues or an asynchronous process not meeting certain requirements. You can rerun the flow by going to the Run History and selecting Resubmit. You can also [resubmit or cancel runs in bulk](../../how-tos-bulk-resubmit.md).

### Considerations for resubmitting runs

When resubmitting a flow run in Power Automate, it's important to keep several key considerations in mind to ensure the process is smooth and effective:

- **Error handling**: Ensure your flow includes effective error handling and retry policies. This approach can help address the issues that caused the initial failure and provide better insights into why a run might fail again.

- **Data duplication**: Be cautious of potential data duplication or other side effects from resubmitting a run. For example, if your flow creates records or sends emails, resubmitting might repeat these actions, leading to duplicates.

- **Input data**: Verify that the input data required for the flow run is still valid and available. Changes in the data or environment (such as deleted files or records) can affect the outcome of the resubmitted run.

- **Flow updates**: If you made changes to the flow since the original run, consider whether these changes might affect the resubmission. It's best to resubmit using the version of the flow that was in place at the time of the original run to ensure consistency.
 

