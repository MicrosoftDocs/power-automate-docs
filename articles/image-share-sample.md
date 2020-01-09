---
title: Image share sample | Microsoft Docs
description: Blah.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/01/20
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Image share sample 

The **Image Share Form** sample is an Adaptive Card designed for sharing photos that have been posted to SharePoint and which may be a dependency for a process to complete (such as processes related to inspection, compliance, and audits). This is a display only adaptive card.

![](media/77274c50cc05caf7f73a5bcc76db0443.png)

*Inputs/Outputs and notes*

| Dynamic Token Name (inputs) | Placeholder Text   | Notes                                              |
|-----------------------------|--------------------|-----------------------------------------------------|
| acphotoTitle                | {acphotoTitle}     | Display text                                        |
| acTimestamp                 | {acTimestamp]      | Display date/time                                   |
| acImageThumbnail            | {acImageThumbnail} | Display image                                       |
|                             |                    | This must be replaced with a valid URL              |
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

<!-- [block 3
[here](https://microsoft-my.sharepoint.com/:u:/p/audrie/EUJZQN50Kn5KrkuRjNisyxUBtgJLBP6wkBvpd4dbsg_gbw?e=jz3Bhn)] -->

## Next steps

