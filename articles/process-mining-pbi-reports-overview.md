---
title: Power BI reports in Process Mining overview
description: Discover how to migrate customized Process Mining Power BI reports.
author: janPidych
contributors:
  - janPidych
  - rosikm
  - hamenon-ms
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 08/12/2024
ms.author: janpidych
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Power BI reports in Process Mining overview

The rebind method you choose depends on whether the two processes you have are using two different workspaces or the same workspace.

The articles in this section use fictitious names. These names are for demonstration purposes and you should use names that suit your preferences. As you go through the procedures, select your own environments and workspaces that correspond to these references.

- **Dev environment**: Environment *from which* you want to migrate process mining artifacts.
- **Test environment**: Environment *to which* you want to migrate process mining artifacts.
- **WkSpace A**: Custom Power BI or Fabric workspace associated with the Dev environment *from which* you want to migrate the Power BI report.
- **WkSpace B**: Custom Power BI or Fabric workspace associated with the Test environment *to which* you want to migrate the Power BI report.
- **Report A**: Name of the Power BI report for the process in Dev environment.
- **Report B**: Name of the Power BI report for the process in Test environment.

> [!NOTE]
> Typically, you perform ALM for the Power BI report after you have performed ALM for the other resources of the process using solutions.

The procedures in the **Migrate customized Process Mining Power BI reports** section assume you completed the following tasks:

1. You attached a Power BI or Fabric workspace to your process in your Dev environment.

1. [You performed ALM on other process mining artifacts using solutions](process-mining-alm-entities-solutions.md).

1. You made the Power BI report customizations that you want to migrate. If you didn't do this task, do the following steps:</br>

    1. Navigate to the report page of your process in Power Automate.
    1. From the command bar, select **Open in Power BI**.
    1. Make the changes you want to migrate and save and publish the report.

You can transfer the Power BI reports in three ways:

- Rebind without a using a composite model
    - [With two different workspaces](process-mining-alm-rebind-without-comp-diff-wkspace.md)
    - [With the same workspace](process-mining-alm-rebind-without-comp-same-wkspace.md)
- Rebind using a composite model
    - [With two different workspaces](process-mining-alm-rebind-with-comp-diff-wkspace.md)
    - [With the same workspace](process-mining-alm-rebind-with-comp-same-wkspace.md)
- [Use Power BI pipelines and rebind](process-mining-alm-migrate-using-pbi-pipelines-and-rebinding.md)
