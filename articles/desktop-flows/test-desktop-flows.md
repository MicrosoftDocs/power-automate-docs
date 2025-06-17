---
title: Test desktop flows
description: Learn to test desktop flows in Power Automate. Create structured test cases, validate outputs, and debug results for seamless automation.
author: QuentinSele
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/17/2025
ms.author: QuentinSele
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

# Create and manage test cases for desktop flows in Power Automate

With the introduction of "Tests" in Power Automate for desktop, makers create, manage, and run test cases directly within the Power Automate for desktop console. This capability enhances the reliability of desktop flows by enabling structured validation and integration into automated pipelines.

## Desktop flow test cases

Test cases are essential for desktop flow development. They let you validate automation across scenarios, ensure consistent behavior after changes, and catch issues before deployment. This section covers how to create and execute test cases, understand their structure, and leverage assertions to validate your flow's outputs.

### What is a Test Case?

A test case in the Power Automate desktop app is a flow that:

- Runs a target desktop flow
- Validates output with assertions
- Logs results for review and debugging

### Prerequisites

- You need Power Automate desktop version 2.54 or greater.
- Tests are a premium feature that require a Power Automate premium license.

### Create a new test

- In the left bar of the console, select the **Tests** section, then select **New test case** from the command bar.
- Enter a case name, choose the flow to validate, and select **Create**.

A test case for desktop flows follows the "Given" "When" "Then" structure:

- **Given**: Input parameters are defined
- **When**: The desktop flow runs
- **Then**: Assertions are made on the output

### Core actions

- **Test a desktop flow**
  Executes a specified desktop flow and captures its output. You need to select the same flow you defined in the create window.

- **Assert**  
  Validates the output against expected results using operators like `equals`, `contains`, or `greater than`.

  Example: In the Assert expression, verify that the output of your desktop flow equals the expected value: `%OutputResult=ExpectedResult%`.

## Related information

[Testing actions reference](actions-reference/testing.md)
