---
title: Test cloud flows
description: Learn how to use built-in tools in Power Automate to test the design of your cloud flows to ensure their reliability, performance, and accuracy.
#customer intent: As a Power Automate user, I want to test my Power Automate cloud flows so that I can ensure their reliability, performance, and accuracy.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 07/10/2025
ms.author: rachaudh
ms.reviewer: jhaskett-msft
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Test cloud flows

Make it a habit to test your Power Automate cloud flows. It's crucial to ensuring their reliability, performance, and accuracy. This article discusses how to use built-in tools in Power Automate to help you identify and resolve issues more efficiently.

## Design phase testing

During the design phase, use the Flow Checker and Test Flow tools to identify and fix problems with flow logic, actions, and connectors.

### Flow Checker

The Flow Checker tool analyzes your flow before you run it. It identifies potential errors and performance issues and provides suggestions for improvements early in the design process, reducing the time and effort needed to troubleshoot later.

:::image type="content" source="media/test-cloud-flows-flow-checker.png" alt-text="Screenshot of Flow Checker results in the Power Automate designer showing a flow with one error.":::

Learn more in [Find and fix errors with Flow Checker](../../error-checker.md).

### Test Flow

Even if Flow Checker doesn't show any issues, it's a good idea to test your flow. Testing ensures that the flow behaves as expected and that all actions and connectors are working correctly.

The **Test Flow** pane in the Power Automate designer allows you to test a flow either manually or automatically. You must save your flow before you can test it, and you must test it manually at least once before you can use the automatic testing option.

Select **Test** from the cloud flow designer to test your flow.

 :::image type="content" source="media/test-cloud-flows-designer.png" alt-text="Screenshot of the cloud flow designer showing the Test button.":::

- **To manually test the flow**, perform the action that triggers the flow.

- **To test the flow automatically**, use a recently used trigger or repeat a previous test run.

:::image type="content" source="media/test-cloud-flows-test-flow-pane.png" alt-text="Screenshot of the Test Flow pane in the Power Automate designer showing manual and automatic testing options.":::

Learn more in [Test button](../../flows-designer.md#test-button) in the article [What is the cloud flows designer?](../../flows-designer.md).

## Static result testing with mock data

The static outputs option in Power Automate lets you run an action with mock data. When the flow runs, it essentially treats the action as successful without actually running it. It's a good way to test different parts of your flow without executing the entire process each time.

Static result testing offers several advantages:

- You can bypass long-running actions and focus on testing specific sections of your flow.

- Mock action outcomes let you simulate various scenarios and conditions without needing the actual data or events to occur. This approach makes it easier to validate the behavior of your flow under different circumstances.

- Controlling the output of specific actions helps you isolate and troubleshoot issues in your flow more effectively.

Learn more in [Disable an action or enable static results on an action](../../flows-designer.md#disable-an-action-or-enable-static-results-on-an-action) in the article [What is the cloud flows designer?](../../flows-designer.md).

### How to use static results

First, create a flow with the action you want to mock and capture its output. Then, configure the action to return the same results in future runs. When you run the flow again, it uses the static result for the mocked action, skipping the actual execution.

In the following example, we want to run the **Start and wait for an approval** action with static results to test the flow without actually sending an approval request.

#### Capture the action's outcome

1. Create a manually triggered flow. Add the action you want to mock and a **Compose** action to capture the output of the previous action.

    :::image type="content" source="media/test-cloud-flows-compose-inputs-new-designer.png" alt-text="Screenshot of the Power Automate designer showing the input of a Compose action set to the output of the previous action.":::

1. Save the flow.

1. Run the flow using a manual test in the **Test Flow** pane. Complete the action.

1. After the flow runs, go to its run history and select the last run instance.

1. Expand the action you want to mock and select **Show raw outputs**.

    :::image type="content" source="media/test-cloud-flows-raw-output-new-designer.png" alt-text="Screenshot of the Power Automate designer showing the raw outputs of an action.":::

1. In the **Outputs** window, copy everything in the `"body":` section. Be sure to include the corresponding closing bracket (`}`). This output is the static result you'll use in the next step.

    :::image type="content" source="media/test-cloud-flows-body-output-new-designer.png" alt-text="Screenshot of the raw output of an action, with the body section highlighted.":::

1. Close the output window and the test run. Edit the flow in the flow designer.

#### Configure the static result (new designer)

1. Select the action, and then select the **Testing** tab in the action's properties pane. Toggle **Static result off** to **Static result on**.

1. Under **Testing**, select the **Status** and **Outputs** fields. The **Status** field should be set to **Succeeded**.

1. Under **Output**, select the **StatusCode**, **Headers**, and **Body** fields.

1. Under **Body**, select the **Body** field. Select the text box under **body** and paste the static result you copied earlier.

    :::image type="content" source="media/test-cloud-flows-static-results-new-designer.png" alt-text="Screenshot of an action's Static result settings in the Power Automate new designer.":::

1. Select **Save**.

A beaker icon appears on the action card, indicating that the action is set to use static results.

:::image type="content" source="media/test-cloud-flows-beaker-new-designer.png" alt-text="Screenshot of an action in the Power Automate new designer showing a beaker icon.":::

#### Configure the static result (classic designer)

1. Select the ellipsis (**&hellip;**) on the action you want to mock, and then select **Static result**. Select the **Enable Static Result** toggle.

1. To the right of **Static Result**, select the **Switch to JSON Mode** icon.

    :::image type="content" source="media/test-cloud-flows-json-mode.png" alt-text="Screenshot of an action's Static result settings, with the Switch to JSON Mode icon highlighted.":::

1. In the **Static Result** pane, type a comma at the end of the `"headers":` line and press Enter to start a new line.

1. Paste the static result you copied earlier, starting with the `"body":` line. Be sure to include the corresponding closing bracket (`}`) at the end.

1. Select **Done**.

A beaker icon appears next to the action name, indicating that the action is set to use static results.

:::image type="content" source="media/test-cloud-flows-beaker-classic-designer.png" alt-text="Screenshot of an action in the Power Automate classic designer showing a beaker icon.":::

## Resubmit cloud flow runs

If a cloud flow stops working unexpectedly, you can rerun it. You can also cancel a flow that's running too long. Select the flow run instance in the run history, and then select either **Resubmit** or **Cancel**.

:::image type="content" source="media/test-cloud-flows-resubmit-flow-runs.png" alt-text="Screenshot of a flow run instance, with the Resubmit and Cancel actions highlighted.":::

You can also resubmit or cancel multiple runs at the same time. Learn more in [Cancel or resubmit flow runs in bulk](../../how-tos-bulk-resubmit.md).

Before you resubmit a flow run, keep the following considerations in mind:

- Make sure that your flow includes error handling and retry policies to address whatever caused the initial failure.

- Be cautious of potential data duplication or other side effects from resubmitting a run. For example, if your flow creates records or sends emails, resubmitting it might result in duplicated data or emails.

- Verify that the input data required for the flow run is still valid and available. Changes in the data or environment, such as deleted files or records, can affect the outcome of the resubmitted run.

- If you made changes to the flow after the original run, consider how your changes might affect the resubmission. It's best to resubmit using the version of the flow that was in place at the time of the original run to ensure consistency.
