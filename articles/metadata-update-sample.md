---
title: Adaptive Cards metadata update card sample | Microsoft Docs
description: Notify or update Teams members or channels with metadata related to a record, file, or topic.
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
ms.date: 01/04/2020
ms.author: angieandrews
ms.reviewer: angieandrews
---


# Metadata update card sample

The **Metadata Update** sample is an adaptive card designed to enable flow makers to notify or update Teams members or channels with metadata related to a record, file, or topic. This card is a display only adaptive card. However, input fields may be added if one of the *wait for response* actions are used to create it.

This card is comprised of three sections:

1. The topic header area with header, sub-header, and description.
1. The fact list area for relevant row metadata.
1.  A column set which supports a table array of data

![Metadata sample.](media/adaptive-cards/metadata-sample.png) 


*Inputs/Outputs and notes*

| Dynamic Token Name (inputs) | Placeholder Text    | Notes                                     |
|-----------------------------|---------------------|--------------------------------------------|
| acHeader                    | {Header}            | Display text                               |
| acSubHeader                 | {SubHeader}         | Display text                               |
| acDescription               | Latin Text          | Display text                               |
| acFact1                     | {acFact1}           | Display text                               |
| acFact2                     | {acFact2}           | Display text                               |
| acFact3                     | {acFact3}           | Display text                               |
| acColumnSetHeader           | Headers 1 through 3 | Display text <br>  Column set header display tex                               |
| acColumnSet                 | Columns 1 through 3 | Replace with array or column values.       |


``` json
{
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "body": [
        {
            "type": "TextBlock",
            "text": "Metadata Update Card",
            "weight": "bolder",
            "size": "large",
            "id": "acTitle"
        },
        {
            "type": "ColumnSet",
            "columns": [
                {
                    "type": "Column",
                    "width": "auto",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Sub Header Tag Line",
                            "weight": "Bolder",
                            "wrap": true,
                            "id": "acSubHeader"
                        }
                    ]
                }
            ]
        },
        {
            "type": "TextBlock",
            "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum leo lorem, at facilisis augue hendrerit eget. Praesent ut malesuada ipsum. Vivamus semper faucibus felis quis sagittis. Nunc pellentesque metus at nunc gravida, vitae volutpat sapien vehicula. Nulla lorem nibh, porttitor vel semper ut, ornare nec erat.",
            "wrap": true,
            "id": "acDescriptionArea"
        },
        {
            "type": "FactSet",
            "facts": [
                {
                    "title": "Fact 1:",
                    "value": "{acFact1}"
                },
                {
                    "title": "Fact 2:",
                    "value": "{acFact2}"
                },
                {
                    "title": "Fact 3:",
                    "value": "{acFact3}"
                }
            ],
            "id": "acFactSet"
        },
        {
            "type": "Container",
            "spacing": "Large",
            "items": [
                {
                    "type": "ColumnSet",
                    "columns": [
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "TextBlock",
                                    "weight": "Bolder",
                                    "text": "HEADER 1"
                                }
                            ],
                            "width": "stretch"
                        },
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "TextBlock",
                                    "weight": "Bolder",
                                    "text": "HEADER 2"
                                }
                            ],
                            "width": "stretch"
                        },
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "TextBlock",
                                    "weight": "Bolder",
                                    "text": "HEADER 3"
                                }
                            ],
                            "width": "stretch"
                        }
                    ]
                }
            ],
            "bleed": true
        },
        {
            "type": "ColumnSet",
            "columns": [
                {
                    "type": "Column",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Column 1",
                            "wrap": true,
                            "id": "acCol1"
                        }
                    ],
                    "width": "stretch"
                },
                {
                    "type": "Column",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Column 2",
                            "wrap": true,
                            "id": "acCol2"
                        }
                    ],
                    "width": "stretch"
                },
                {
                    "type": "Column",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Column 3",
                            "wrap": true,
                            "id": "acCol4"
                        }
                    ],
                    "width": "stretch"
                }
            ],
            "$data": "acDataContext"
        }
    ],
    "bleed": true

}
```


[!INCLUDE[footer-include](includes/footer-banner.md)]
