---
title: Export and import your process
description: Learn how to import and export a process in the process mining capability.
author: donums
contributors:
  - donums
  - v-aangie 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Export and import your process

You can copy or move process mining processes from one environment to another using Microsoft Power Platform solutions. You need to be an owner or co-owner of a process to export it.

> [!NOTE]
>
> Only the export and import of *task mining* (recordings) processes are currently supported. *Process mining* (data) processes can't currently be exported and imported.

To learn more about solutions from Microsoft Power Platform, go to [Overview of solution-aware flows](overview-solution-flows.md).

## Export a process

1. Sign in to [Power Automate](https://make.powerautomate.com).

    Make sure you've selected the environment where the process you want to export has been created.

1. Select **Solutions** in the navigation pane on the left.

1. In the list, select the solution you want to use to add your process, or create a solution and select it.

1. Select **Add existing** > **PM Inferred Task**.

1. Search for and select the process you want to export, and then select **Add**.

You can now export your solution and import it in another environment.

For more information about solution export, go to [Export a solution](export-flow-solution.md).

## Import a process

To import a process into another environment:

1. Make sure you've exported your process with a solution.

1. Go to the environment where you want to import your process.

1. Follow the instructions in [Import a solution](import-flow-solution.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
