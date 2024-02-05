---
title: Relate or unrelate rows in Dataverse | Microsoft Docs
description: "Learn how to use flows to add relationships and remove relationships among rows in Microsoft Dataverse."  
services: ''
suite: flow
documentationcenter: na
author: v-aangie
ms.author: Matow
ms.reviewer: angieandrews
editor: ''
tags: ''

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/06/2021
search.audienceType: 
  - maker
---

# Relate or unrelate rows in Dataverse

>[!IMPORTANT]
>You can associate two Microsoft Dataverse rows only if they have a one-to-many or many-to-many relationship.<!-- Edit note: I don't think this topic is in the TOC. -->

## Relate rows

Follow these steps to associate two rows while editing your flow:

1. Select **New step** to add an action to your flow.

1. Enter **relate rows** into the **Search connectors and actions** search box on the **Choose an operation** card.

1. Select **Microsoft Dataverse**.

1. Select the **Relate rows** action.

   ![Filter to relate rows actions.](../media/relate-rows/relate-rows-action.png "Filter to relate rows actions")

   Like other actions in this connector, a list of supported tables is available.

1. Select the table to which you want to relate or enter a custom value for the table name.  

   ![Select a Table name value.](../media/relate-rows/table-name.png "Select a Table name value")

1. You will need to enter the identifier of the row you want to relate.  

   ![Add identifier for row to relate to Row ID box.](../media/relate-rows/identifier.png "Add identifier for row to relate to Row ID box")

   The list of supported one-to-many and many-to-many relationships based on the table type selected is populated in the format \<Related Table Type\> – \<Relationship Schema Name\>. You can select the relationship to which you want to relate your row.  

   ![Examples of relationship types for relate.](../media/relate-rows/relationship.png "Examples of relationship types for relate")

1. Enter the full resource URL of the row to which you want to add the relationship.

   This URL is the full OData identifier of the resource, as shown in the following image:  

   ![Full OData URL.](../media/relate-rows/relate-with-url.png "Full OData URL")

   >[!TIP]
   >You can get the row identifier URL from a previous step from the available dynamic content.  

## Unrelate rows

1. Select **New step** to add an action to your flow.

1. Enter **unrelate rows** into the **Search connectors and actions** search box on the **Choose an operation** card.

1. Select **Microsoft Dataverse**.

1. Select **unrelate rows** action.

   Your flow uses this action to disassociate two Dataverse rows if they are linked by a one-to-many or many-to-many relationship.

   ![Filter to unrelate rows actions.](../media/relate-rows/unrelate-action.png "Filter to unrelate rows actions")

1. Select the type of table you want to unrelate from or enter a custom value for the table name.

1. Enter the identifier of the row that you want to unrelate from.  

   ![Table name selected and identifier added to Row ID.](../media/relate-rows/unrelate-table-name-identifier.png "Table name selected and identifier added to Row ID")

   The list of supported one-to-many and many-to-many relationships based on the table type you selected will be populated in the format \<Related Table Type\> – \<Relationship Schema Name\>. Select the relationship you want to unrelate the related table from or enter your custom value for the relationship schema name.<!-- Edit note: From here the screenshots look different including name change from row to records. Maybe should be re-taken. -->

   ![Examples of relationship types for unrelate.](../media/dataverse-how-tos/32bf6c8258bd3cf157fc90e63853fac0.png "Examples of relationship types for unrelate")

1. Enter the full resource URL of the related table you want to unrelate. This URL will be the full OData identifier of the resource.  

   ![Enter the Resource URL.](../media/dataverse-how-tos/13117f752dc1c3ab791b59457712f4c9.png "Enter the Resource URL")

   >[!TIP]
   >You can usually copy the row identifier from a previous step by using dynamic content.<!-- Edit note: Do you mean URL not row ID. -->

   ![Dynamic content from previous steps.](../media/dataverse-how-tos/33403937ade7afee4e2583be75d81bc4.png "Dynamic content from previous steps")
