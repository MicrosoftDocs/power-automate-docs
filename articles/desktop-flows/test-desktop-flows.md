---
title: Create and manage test cases for desktop flows
description: Learn to test desktop flows in Power Automate. Create structured test cases, validate outputs, and debug results for seamless automation.
author: QuentinSele
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/30/2025
ms.author: quseleba
ms.reviewer: null
contributors:
  - Flow
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:06/17/2025
---

# Create and manage test cases for desktop flows

Test cases help you verify that your desktop flows work correctly. Instead of manually running a flow and checking results every time you make changes, you can create a test case that automatically runs your flow and checks if the output matches what you expect.

## Prerequisites

- Power Automate for desktop version 2.54 or later
- A Power Automate Premium license

## Create a test case

A test case validates a single desktop flow. Take the following steps to create a new test case:

1. Open Power Automate for desktop.
1. In the left navigation, select **Tests**.
1. Select **+ New** > **Test case**.
1. Enter a name for your test case.
1. Select the desktop flow you want to test.
1. Select **Create**.

The test case opens in the designer, where you see the *Actions* pane and can add actions to run your flow and validate the results.

## Add actions to your test case

Every test case uses two actions: one to run your flow, and one to check the results.

### Test a desktop flow

The *Test a desktop flow* action runs the desktop flow you selected when creating the test case.

- If your flow requires **input values**, enter them in the action's parameters.
- When the flow runs, any **output variables** it produces become available for you to validate.

### Assert

The **Assert** action checks if a value matches what you expect. If the check fails, the test fails.

To add an assertion:

1. In the Actions pane, under **Testing**, drag the **Assert** action into your test case.
1. In **Assert expression**, enter a condition to validate. For example:
   - `%Sum = 25%` checks if Sum equals 25
   - `%Total > 0%` checks if Total is greater than zero
   - `%Status contains 'Success'%` checks if Status contains the word "Success"
1. In **Assert message**, enter a message that explains what went wrong if the test fails, such as "Expected Sum to equal 25".

> [!TIP]
> You can add multiple Assert actions to validate different outputs from your flow.

For the full list of parameters, see [Testing actions reference](actions-reference/testing.md).

## Run a test case

You can run tests in two ways:

**From the Tests console:**

1. Select **Tests** in the left navigation.
1. Select the test case you want to run.
1. Select **Run** in the toolbar.

**From the designer:**

1. Open your test case.
1. Select **Run** in the toolbar.

## View test results

After running a test, the **Status** column in the Tests console shows the result:

| Status | Description |
|--------|-------------|
| **Passed** | All assertions succeeded. Your flow works as expected. |
| **Failed** | One or more assertions failed. Review the assertion message to understand what went wrong. |

When a test fails, you might need to:

- Fix an issue in your desktop flow
- Update the expected values in your Assert actions if requirements changed

## Related information

- [Testing actions reference](actions-reference/testing.md)
