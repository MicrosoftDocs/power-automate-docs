---
title: Test desktop flows
description: Creating and managing test Cases for desktop flows in Power Automate
author: QuentinSele

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/16/2025
ms.author: QuentinSele
ms.reviewer: 
contributors:
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Creating and managing test Cases for desktop flows in Power Automate

## Overview

With the introduction of the **Tests** in Power Automate desktop app (PAD), makers can now create, manage, and execute test cases directly within the PAD console. This capability enhances the reliability of desktop flows by enabling structured validation and integration into automated pipelines.

## Desktop flow test cases

### What is a Test Case?

A test case in Power Automate desktop app is a special type of flow that:

- Executes a target desktop flow 
- Validates its output using assertion(s)
- Logs results for review and debugging

### Prerequisites

You will need a version of Power Automate desktop app equals or above to 2.54 version.
Tests are a premium feature that require a Power Automate premium license to be used.

### Create a new test

- From the left bar of the console, select **Tests** section then select **New test case** from the command bar.
- Define a case name and the flow to validate and select **Create**

A test case for desktop flows follows the "Given" "When" "Then" structure:
Given: Input parameters are defined  
When: The desktop flow is executed  
Then: Assertions are made on the output 

### Core Actions

- **Test a desktop flow**  
  Executes a specified desktop flow and captures its output. You will need to select the same flow that the one you defined in the create window.

- **Assert**  
  Validates the output against expected results using operators like `equals`, `contains`, or `greater than`.

  Example: in the Assert expression, you can verify than the output of your desktop flow equals to the expected value: %OutputResult=ExpectedResult%


 

