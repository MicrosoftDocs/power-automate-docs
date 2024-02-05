---
title: Image share sample for sharing photos | Microsoft Docs
description: Learn how to create a photo sharing Adaptive Card.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/01/2020
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Image share sample 

The **Image Share Form** sample is an Adaptive Card designed for sharing photos that have been posted to SharePoint and which may be a dependency for a process to complete (such as processes related to inspection, compliance, and audits). This is a display only adaptive card.

![Display only adaptive card.](media/adaptive-cards/image-share.png)

*Inputs/Outputs and notes*

| Dynamic Token Name (inputs) | Placeholder Text   | Notes                                              |
|-----------------------------|--------------------|-----------------------------------------------------|
| acphotoTitle                | {acphotoTitle}     | Display text                                        |
| acTimestamp                 | {acTimestamp}      | Display date/time                                   |
| acImageThumbnail            | {acImageThumbnail} | Display image <br>This must be replaced with a valid URL|
| acAltText                   | {acAltText}        | Accessibility alternative text                      |

``` json
{
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "body": [
        {
            "type": "TextBlock",
            "text": "{acphotoTitle}",
            "id": "Title",
            "size": "Large"
        },
        {
            "type": "TextBlock",
            "text": "{acTimestamp}",
            "size": "Medium",
            "weight": "Lighter"
        },
        {
            "type": "Image",
            "altText": "{acAltText}",
            "url": "{acImageThumbnail}"
        }
    ],
    "spacing": "None"
}
```




[!INCLUDE[footer-include](includes/footer-banner.md)]
