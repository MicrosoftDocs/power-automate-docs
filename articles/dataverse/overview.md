---
title: Overview of how to integrate flows with Dataverse | Microsoft Docs
description: Learn how to create Power Automate flows that use Microsoft Dataverse, including triggers and actions.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
ms.author: Matow
ms.reviewer: angieandrews
editor: ''
tags: ''

ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/12/2021
search.audienceType: 
  - maker
---

# Overview of how to integrate Power Automate flows with Dataverse

With [Microsoft Dataverse](https://powerplatform.microsoft.com/dataverse/?ef_id=4425b9cfc5191d82cc2ed9a8b6fe9233:G:s&OCID=AID2100430_SEM_4425b9cfc5191d82cc2ed9a8b6fe9233:G:s&msclkid=4425b9cfc5191d82cc2ed9a8b6fe9233), you can store and manage data for business applications and integrate natively with other Microsoft Power Platform services like Power Apps, Power Pages, and Microsoft Copilot Studio from your [cloud flows](../overview-cloud.md).

The Microsoft Dataverse connector provides [several triggers](#overview-of-triggers) to start your flows and [many actions](#overview-of-actions) that you can use to create or update data in Dataverse while your flows run. You can use Dataverse actions even if your flows don't use a trigger from the Dataverse connector.

Use the Microsoft Dataverse connector to create cloud flows that start when data changes in Dataverse tables and custom messages. <!--todo, how is custom messages-->For example, you can send an email whenever a row gets updated in Dataverse.

:::image type="content" source="media/overview/example-dataverse-flow.png" alt-text="A screenshot of a flow triggering on changes in Dataverse, listing rows, and updating a row.":::

## Overview of triggers

The Microsoft Dataverse connector provides the following triggers to help you define when your flows start:

- [When a row is created, updated, or deleted](create-update-delete-trigger.md)
- [When a row is selected](row-selected.md)
- [When an action is performed](action-trigger.md)

## Overview of actions

The Microsoft Dataverse connector provides the following actions to help you manage data in your flows:<!-- Edit note: How about a See also link to more details about triggers or actions, like a page describing them. -->

- [Create a new row](create.md)
- [Update a row](update.md)
- [Search rows with relevance search](search.md)
- [Get a row](get-row-id.md)
- [List rows](list-rows.md)
- [Delete a row](delete-row.md)
- [Relate rows](relate-unrelate-rows.md)
- [Unrelate rows](relate-unrelate-rows.md)
- [Execute a changeset request](change-set.md)
- [Download file or image content](upload-download-file.md#download-file-or-image-content)
- [Upload file or image content](upload-download-file.md#upload-file-or-image-content)
- [Perform a bound action](bound-unbound.md#bound-actions)
- [Perform an unbound action](bound-unbound.md#unbound-actions)