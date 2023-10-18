---
title: Approvals Kit Workshop Contoso coffee scenario | Microsoft Learn
description: Approvals Kit Workshop Contoso coffee scenario
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Working with Contoso Coffee

The Approvals Kit learning workshop builds on module two of the App in a Day workshop from the [Power Platform Training Worhshops](https://powerplatform.microsoft.com/training-workshops/) site.

## Workshop Scenario

We have been asked by a business owner to help remove the manual work around the business approval process. The current process conditionally involves multiple stages of approval depending on the machines requested, which has resulted in delays and inefficiencies. Our objective for today is to help you build an approval process that extend the current low code Contoso Coffee request process with an automated business approvals process that is streamlined and efficient.

This workshop will build on the skills and knowledge gained from the last App in a Day workshop, which covered how to build a canvas app and store data in Dataverse. In this workshop, we will use the data stored in Dataverse to trigger the defined business approval process.

By the end of this workshop, you will be able to identify the different levels of approval required for each machine request, determine the appropriate level of approval based on the value of the machine, and create an automated workflow that will facilitate the approvals process.

## Prerequisites

It is assumed before you start this module that you have the following in a Power Platform Environment:

- The Contoso Coffee solution has been imported.
- A current version of the Approvals Kit has been installed and configured
- You have an assign role of [Environment Maker](https://learn.microsoft.com/power-platform/admin/database-security#environments-with-a-dataverse-database) so that you can add a new Business Approvals Cloud flow to integrate with Contoso Coffee.

## Missing Prerequisites?

If you have any missing prerequisites for this workshop the following links could be useful to assist you getting ready.

1. Create or request access to a shared development environment. If you don't have access to a shared development environment consider [Creating a developer environment with the Power Apps Developer Plan](https://learn.microsoft.com/power-platform/developer/create-developer-environment)

1. Review the [Import Contoso Coffee](./import-contoso-coffee.md) workshop guide.

1. Install or have your administration team install the Approvals Kit using the [Setup guide](../../setup.md)
