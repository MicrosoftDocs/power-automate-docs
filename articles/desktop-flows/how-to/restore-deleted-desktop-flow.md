---
title: Restore deleted desktop flows
description: Learn how to restore deleted desktop flows.
author: PetrosFeleskouras
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 08/22/2024
ms.author: pefelesk
ms.reviewer: 
contributors:
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - admin
---
# Restore deleted desktop flows

This article provides solutions and workarounds to fully or partially recover a deleted desktop flow. 

## Fully restore a deleted desktop flow

### Restore with solutions

As a prerequisite, the deleted desktop flow should be part of a solution that has been previously exported locally.

To restore the flow, import the solution that contains the deleted flow. Learn how to [import a solution](https://learn.microsoft.com/en-us/power-automate/import-flow-solution). 

### Restore with an environment backup

To restore the deleted flow through a Power Platform environment backup, follow the steps below: 

1. Create a new Power Platform environment.
1. Restore a backup of the deleted flow’s environment to the new target environment. Learn how to [restore environments](https://learn.microsoft.com/en-us/power-platform/admin/backup-restore-environments).
1. In the new environment, create a new solution and add the desktop flow.
1. Export the solution locally.
1. Go back to the initial pre-existing environment with the missing flow and import the solution.

## Partially restore a deleted desktop flow

> [!IMPORTANT]
> - Only the flow actions can be retrieved with this workaround. Any other flow dependencies like UI elements, images, connection references, etc. cannot be retrieved.

### Restore from local flow run data

As a prerequisite, the flow should have been deleted from the Power Automate portal (not from the Power Automate console) and it has run locally from the Power Automate console at least once.

To recover the actions of the deleted flow, follow the steps below: 

1. Open ***%localappdata%\Microsoft\Power Automate Desktop\Console\Workspace\\\<deleted desktop flow id>\\\<random string>\script.robin*** with notepad.
1. Copy all the lines right under the text **@SENSITIVE**.
   - If the flow is segregated into multiple subflows, then:
     - For the **Main** subflow, copy all the lines under text **@SENSITIVE** (not included) and prior to text **FUNCTION <subflow_name_1>** (not included).
     - For each one of the rest of the subflows, copy all the lines between **FUNCTION <subflow_name_1>** (included) and **END FUNCTION** (included). 
1. Open Power Automate console and create a new flow.
1. Paste the lines of the **Main** subflow in the main workspace of the designer (right-click on the main workspace > Paste).
1. Paste the lines of each subflow in the Subflows section of the designer (right-click on the Subflows section on top of the workspace > Paste).

### Restore from environment audit logs 

As a prerequisite, auditing should be enabled both in the environment, and in the **Process** Dataverse table. 

To check if auditing is enabled:
- Go to [Power Platform Admin Center](https://aka.ms/ppac) > Environments > *your_environment_name* > Settings > Audit and logs 
  - Open **Audit settings** and ensure **Start Auditing** is enabled.
  - Open **Entity and field audit settings** > filter for **All** tables > Search for the **Process** table > Properties > Advanced options > In the **For this table** section ensure **Audit changes to its data** is enabled.

To recover the actions of the deleted flow, follow the steps below: 
1. Go to [Power Platform Admin Center](https://aka.ms/ppac) > Environments > *your_environment_name* > Settings > Audit and logs > Audit summary view
1. Filtery by **Delete** events in the **Process** entity to locate the event that deleted the flow.
1. Select the **Delete** event to open the record. 
1. Copy the **Definition** field to a text editor and **replace** all the **\r\n** characters with new lines (create a new line for each set of \r\n characters)
1. Follow the same steps as described in [Restore from local run data](../restore-deleted-desktop-flow.md#restore-from-local-flow-run-data) starting from step #2.
