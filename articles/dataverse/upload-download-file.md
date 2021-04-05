---
title: Upload or download image and file content| Microsoft Docs
description: Learn how upload or download image and file content in Microsoft Dataverse with flows.  
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

# Upload or download image and file content

In late 2019, two new column datatypes were added to Dataverse.

- **File** – With **File**, you can have a [column that stores arbitrary file data for your table](https://docs.microsoft.com/powerapps/developer/common-data-service/file-columns).

- **Image** – In addition to a column for storing the full size of an image as
    a file, the **Image** datatype can also include [thumbnail information](https://docs.microsoft.com/powerapps/developer/common-data-service/image-columns).

You can use the Microsoft Dataverse connector to work with these datatypes in Power Automate.

## Download image or file contents

1. Add the **Get file or image content** action to your flow to download content from a corresponding file or image column from Dataverse so that you can use the file content elsewhere in your flow.

   ![Get a file or image content](../media/dataverse-how-tos/8dfaa50270a05c4f7a18a8f40713b441.png)

   As with any action in this connector, a list of supported tables is available. 
1. Select the table from which you want to download file/image content or enter your own custom value for the table name.  


   ![Table name](../media/dataverse-how-tos/9f024b055c034121d89988112c250f57.png)

1. Enter the identifier of the row you want to get the file or image content from in **Item ID**.  


   ![The identifier](../media/dataverse-how-tos/908a2001986233440252cd272d7dd3ce.png)

   >[!TIP]
   >You can normally grab the row identifier from a previous request via the dynamic content.

   ![Dynamic content](../media/dataverse-how-tos/2ec8bcb926da0e68395b17c0b6fa4b0f.png)

   The list of supported file and image columns based on the table type selected earlier will be populated for your selected table. 
   
1. Select the column from which you want to download content or enter a custom value.  

   ![Select a column](../media/dataverse-how-tos/10e4205e0d3df2e0ca7121296621600e.png)

1. With the content output of the action you can pass it to any action as you want. In this image, it's being passed to the **Create file** action.

   ![Create file action](../media/dataverse-how-tos/24b222e32d8b2b9b91d97371da163213.png)

## Upload file or image content

1. Add the **Upload file or image content** action to your flow so that you can upload content to a corresponding file or image column in Dataverse.

   ![Upload file or image content action image](../media/dataverse-how-tos/20ee879d20c6485eb290e40b120c9a9b.png)

1. Select the table to which you want to upload the file/image content or enter a custom value for the **Table name**.  


   ![Table name image. Select one or enter a custom value](../media/dataverse-how-tos/0afc811bfcb8004630e2425bfe485280.png)

1. Enter the identifier for the row to which you want to upload the file or image content.  

   ![Item Id](../media/dataverse-how-tos/594f2be3d89aad67e1fe1ea1ffeb53f1.png)

   >[!TIP]
   >You can normally grab the row identifier from a previous request by using the dynamic content.  


   ![Dynamic content view](../media/dataverse-how-tos/999fcfc576dfa3c85406230ee30ce8f8.png)

   The list of supported file and image columns based on the table you selected is populated. 
   
1. Select the column to which you want to upload the content or enter custom value.  

   ![Column to upload to](../media/dataverse-how-tos/5daa43665c59a1a1b7033f6ec9608153.png)

1. Enter the content you want to upload to the column.  

   ![Content to upload](media/842db60eb80af4b54ece2a6249637d32.png)