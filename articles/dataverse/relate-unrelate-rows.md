---
title: Relate or unrelate rows in Dataverse | Microsoft Docs
description: Learn how to add relationships and remove relationships among rows in Microsoft Dataverse with flows.  
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/06/2021
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - maker
---

# Relate or unrelate rows in Dataverse

>[!IMPORTANT]
>You can associate two Dataverse rows only if they have a one-to-many or many-to-many relationship.

## Relate rows

Follow these steps to associate two rows.

1. Add the **Relate rows** action to your flow. 

   ![Relate rows image](../media/dataverse-how-tos/6dd67e3c9cb92199b29485dd48afd449.png)

   Like other actions in this connector, a list of supported tables is available.
   
1. Select the type of table that you want to which you want to relate, or enter a custom value for the table set name.  

   ![Table set name](../media/dataverse-how-tos/85fd83805a60778314c37b254c4dd042.png)

1. You will need to enter the identifier of the row you want to relate.  

   ![Identifier image](../media/dataverse-how-tos/e46483d4603d63dac48465d506e8e76b.png)

   The list of supported one-to-many and many-to-many relationships based on the table type selected is populated in the format \<Related Entity Type\> – \<Relationship Schema Name\>. You can select the relationship to which you want to relate your row.  


   ![Relationship image](../media/dataverse-how-tos/ff61e4be7303f6b37c9210f0e09d8b05.png)

1. Enter the full resource URL of the row to which you want to add the relationship. This URL is the full OData identifier of the resource, as shown in the following image.  

   ![Full odata URL](../media/dataverse-how-tos/63ce93d208822da9bddc6c7640da2312.png)

   >[!TIP]
   >You can get the row identifier from a previous step from the available Dynamic content.  


   ![Dynamic content image](../media/dataverse-how-tos/42e13802e201c7978f798546405717de.png)


## Unrelate rows

1. Add the **Unrelate rows** action to your flow. 

   Your flow uses this action to disassociate two Dataverse rows if they are linked via a one-to-many or many-to-many relationship.

   ![Unrelate rows image](../media/dataverse-how-tos/a716036f314e07c9a8706667088cbe2e.png)

1. Select the type of table you want to unrelate from or enter a custom value for the table set name.  

   ![Table set custom value](../media/dataverse-how-tos/8c7404838cdd850c0c5c2ca416c99839.png)

1. Enter the identifier of the row you want to unrelate from.  

   ![Identifier image](../media/dataverse-how-tos/ec312c11730150cfb9bd6e37b2a7928d.png)

   The list of supported one-to-many and many-to-many relationships based on the table type selected above will be populated in the format \<Related Entity Type\> – \<Relationship Schema Name\>. Select the relationship you want to unrelate the related table from or enter your custom value of the relationship schema name.  

   ![The unrelate rows card](../media/dataverse-how-tos/32bf6c8258bd3cf157fc90e63853fac0.png)

1. Enter the full resource URL of the related table you want to unrelate. This
will be the full OData identifier of the resource.  

   ![Resource URL](../media/dataverse-how-tos/13117f752dc1c3ab791b59457712f4c9.png)

   >[!TIP]
   >You can usually grab the row identifier from a previous step by using dynamic content.  

   ![Dynamic content image](../media/dataverse-how-tos/33403937ade7afee4e2583be75d81bc4.png)
