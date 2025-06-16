---
title: Testing
description: Learn how to create test cases with Testing actions

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 06/16/2025
ms.author: QuentinSele
ms.reviewer: dmartens
contributors:
search.audienceType: 
  - flowmaker
  - enduser
ms.custom:
- ai-gen-docs-bap
- ai-gen-description
- ai-seo-date:10/29/2024
---

# Testing actions

In this module, you find actions that allow you to create and execute test cases directly within the PAD designer. This capability enhances the reliability of desktop flows by enabling structured validation and integration into automated pipelines..

## <a name="runtestflow"></a> Test a desktop flow

Tests a desktop flow that can receive input variables and might produce output variables. The parent flow run will be paused until the called desktop flow completes.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Desktop flow|No|Desktop flow||Select the desktop flow to run from within this flow. The called flow always runs in the same Windows session as the parent flow.|

### Variables produced

This action produces the output variables of the selected flow.

## <a name="assertaction"></a> Assert

Validates the output against expected results using operators like equals, contains, or greater than.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Assert expression|Yes|[Text value](../variable-data-types.md#text-value)||Expression that will verify that the actual result of your desktop flow matches with the result you expect |
|Assert message|Yes|[Text value](../variable-data-types.md#text-value)||Message that will be displayed in case of failure of your test|


