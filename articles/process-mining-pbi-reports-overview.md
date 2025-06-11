---
title: Power BI reports in Process Mining overview
description: Discover Power BI reports in Process Mining and learn how to get started migrating customized Process Mining Power BI reports.
author: janPidych
contributors:
  - janPidych
  - rosikm
  - hamenon-ms
  - donums
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: concept-article
ms.date: 04/03/2025
ms.author: michalrosik
ms.reviewer: ellenwehrle
search.audienceType: 
  - flowmaker
  - enduser
#customer intent: As a business process analyst, I want to learn more about Power BI reports in Process Mining, so I can create them to identify improvement opportunities in my organization's current processes.
---

# Power BI reports in Process Mining overview

The rebind method you choose depends on whether your two processes are using two different workspaces or the same workspace.

The references in this section use fictitious names. These names are for demonstration purposes. You should use names that suit your business needs. As you go through the procedures, select your own environments and workspaces that correspond to these references.

- **Dev environment**: Environment *from which* you want to migrate process mining artifacts.
- **Test environment**: Environment *to which* you want to migrate process mining artifacts.
- **WkSpace A**: Custom Power BI or Fabric workspace associated with the Dev environment *from which* you want to migrate the Power BI report.
- **WkSpace B**: Custom Power BI or Fabric workspace associated with the Test environment *to which* you want to migrate the Power BI report.
- **Report A**: Name of the Power BI report for the process in Dev environment.
- **Report B**: Name of the Power BI report for the process in Test environment.

> [!NOTE]
> Typically, you perform ALM for the Power BI report after you perform ALM for the other resources of the process using solutions.

The procedures in the **Migrate customized Process Mining Power BI reports** section assume you already completed these tasks:

- Attached a Power BI or Fabric workspace to your process in your Dev environment.
- Performed ALM on other process mining artifacts using solutions. Learn more in [Migrate ALM process mining entities with Power Platform solutions](process-mining-alm-entities-solutions.md).
- Created the Power BI report customizations that you want to migrate. If you didn't do this task, take the following steps:

  1. Go to the report page of your process in Power Automate.
  1. Select **Open in Power BI** from the command bar.
  1. Make the changes you want to migrate and *save* and *publish* the report.

You can transfer the Power BI reports in three ways:

- Rebind without using a composite model.

  - [With two different workspaces](process-mining-alm-rebind-without-comp-diff-wkspace.md)
  - [With the same workspace](process-mining-alm-rebind-without-comp-same-wkspace.md)
  
- Rebind using a composite model.
  - [With two different workspaces](process-mining-alm-rebind-with-comp-diff-wkspace.md)
  - [With the same workspace](process-mining-alm-rebind-with-comp-same-wkspace.md)
  
- [Use Power BI pipelines and rebind](process-mining-alm-migrate-using-pbi-pipelines-and-rebinding.md).
