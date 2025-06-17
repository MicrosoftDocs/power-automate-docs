---
title: Testing actions
description: Enhance desktop flow reliability with structured test cases and validation tools in Power Automate for desktop.
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 06/17/2025
ms.author: QuentinSele
ms.reviewer: dmartens
contributors: null
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:06/17/2025
---

# Testing actions

In this module, you find actions that let you create and run test cases directly within Power Automate for desktop. This capability improves the reliability of desktop flows by enabling structured validation and integration into automated pipelines.

## <a name="runtestflow"></a> Test a desktop flow

Test a desktop flow that receives input variables and might produce output variables. The parent flow run pauses until the called desktop flow completes.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Desktop flow|No|Desktop flow||Select the desktop flow to run within this flow. The called flow runs in the same Windows session as the parent flow.|

### Variables produced

This action shows the output variables of the selected flow.

## <a name="assertaction"></a> Assert

Validates output against expected results using operators like equals, contains, or greater than.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Assert expression|Yes|[Text value](../variable-data-types.md#text-value)||Expression that verifies the actual result of your desktop flow matches the result you expect |
|Assert message|Yes|[Text value](../variable-data-types.md#text-value)||Message displayed if the test fails|

## Related information

[Test desktop flows](../test-desktop-flows.md)