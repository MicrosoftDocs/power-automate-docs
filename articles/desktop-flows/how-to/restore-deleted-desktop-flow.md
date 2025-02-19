---
title: Restore a deleted desktop flow
description: Learn how to restore a deleted desktop flow.
author: PetrosFeleskouras
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 08/22/2024
ms.author: pefelesk
ms.reviewer: 
contributors:
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - admin
---
# Restore a deleted desktop flow

This article provides solutions and workarounds to fully or partially recover a deleted desktop flow.

> [!NOTE]
> The solutions and workarounds provided in this article apply to users who sign in with [work or school accounts, or organization premium accounts](/power-automate/desktop-flows/requirements#sign-in-account-comparison).

## Fully restore a deleted desktop flow

Restore a deleted desktop flow with a solution or an environment backup.

#### Restore with solutions

As a prerequisite, the deleted desktop flow should be part of a solution that was previously exported locally.

To restore the flow, import the solution that contains the deleted flow. Learn more at [import a solution](../../import-flow-solution.md).

#### Restore with an environment backup

To restore the deleted flow through a Power Platform environment backup:

1. Create a new Power Platform environment.
1. Restore a backup of the deleted flow’s environment to the new target environment. Learn more at [restore environments](/power-platform/admin/backup-restore-environments).
1. In the new environment, create a new solution and add the desktop flow.
1. Export the solution locally.
1. Go back to the initial pre-existing environment with the missing flow and import the solution.

## Partially restore a deleted desktop flow

You can partially restore a deleted desktop flow using local flow run data or audit logs.

> [!IMPORTANT]
> Only the flow actions can be retrieved with this workaround. Any other flow dependencies such as UI elements, images, and connection references can't be retrieved.

#### Restore from local flow run data

##### Prerequisites

* The flow was deleted from the Power Automate portal (not from the Power Automate console).
* The flow was run locally from the Power Automate console at least once.

##### Recover actions of the deleted flow

To recover the actions of the deleted flow:

1. Open ***%localappdata%\Microsoft\Power Automate Desktop\Console\Workspace\\\<deleted desktop flow id>\\\<random string>\script.robin*** with notepad.
1. Copy all the lines right under the text **@SENSITIVE**.

    If the flow is segregated into multiple subflows, then:
     * For the *Main* subflow, copy all the lines under text **@SENSITIVE** (not included) and before the text **FUNCTION <subflow_name_1>** (not included).
     * For each of the other subflows, copy all the lines between **FUNCTION <subflow_name_x>** (included) and **END FUNCTION** (included).
1. Open the Power Automate console and create a new flow.
1. Paste the lines of the *Main* subflow in the main workspace of the designer. Right-click on the main workspace and select **Paste**.
1. Paste the lines of each subflow in the **Subflows** section of the designer. Right-click on the **Subflows** section on top of the workspace and select **Paste**.

#### Restore from environment audit logs

##### Prerequisites

Verify auditing is enabled in both the environment and the **Process** Dataverse table.

##### Check if auditing is enabled

To check if auditing is enabled:

1. Go to [Power Platform Admin Center](https://admin.powerplatform.microsoft.com) > **Environments** > ***your_environment_name*** > **Settings** > **Audit and logs**.
1. Open **Audit settings** and verify **Start Auditing** is enabled.
1. Open **Entity and field audit settings** > filter for **All** tables > search for the **Process** table > **Properties** > **Advanced options**. In the **For this table** section, verify **Audit changes to its data** is enabled.

##### Recover actions of the deleted flow

To recover the actions of the deleted flow:

1. Go to [Power Platform Admin Center](https://admin.powerplatform.microsoft.com) > **Environments** > ***your_environment_name*** > **Settings** > **Audit and logs** > **Audit summary view**.
1. Filter by **Delete** events in the **Process** entity to locate the event that deleted the flow.
1. Select the **Delete** event to open the record.
1. Copy the **Definition** field to a text editor and replace all the `\r\n` characters with new lines. Create a new line for each set of `\r\n` characters.
1. Follow the same steps as described in [Restore from local run data](#restore-from-local-flow-run-data) starting from step #2.
