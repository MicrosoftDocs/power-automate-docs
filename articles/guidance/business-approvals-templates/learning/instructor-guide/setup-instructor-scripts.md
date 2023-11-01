---
title: Setup instructor scripts | Microsoft Learn
description: Approvals Kit setup instructor scripts
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Setup Instructor Scripts

Ensure that the [Getting Started](./getting-started.md) is complete and you have an installation of the required tools. Start a session using the following steps so that you can perform various automation tasks contained within the available PowerShell scripts

1. Start a PowerShell session

```bash
pwsh
```

1. Change location to where you cloned or unzipped the Business approvals kit GitHub repository. For example

```pwsh
Set-Location powercat-business-approvals-kit
```

1. Change the location to the Workshop instructor guide automation folder

```pwsh
Set-Location ./Workshop/src
```

1. Import the PowerShell scripts

```pwsh
. .\scripts\users.ps1
```
