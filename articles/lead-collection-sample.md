---
title: Lead collection sample | Microsoft Docs
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
# Lead collection sample

The **Lead Collection** sample is an Adaptive Card input form designed for
collecting leads from anyone that may come into contact with individuals
interested in a set of products. Feel free to change the choices for the
products, remembering that each choice can have display text, as well as an
internal value which will be output once the card is submit (they can also both
be the same as shown in the sample code block).

![](media/5ed2b3740485e1c039b54209661032fa.png)

*Inputs/Outputs and notes:*

| Dynamic Token Name    | Placeholder Text       | Notes:                                                                                        |
|-----------------------|------------------------|-----------------------------------------------------------------------------------------------|
| Title                 |                        | Display text                                                                                  |
| acInstructions        |                        | Display text                                                                                  |
| acLeadFName           | {firstName}            | Response **output**                                                                           |
| acLeadLName           | {lastName}             | Response **output**                                                                           |
| acLeadEmail           | {emailAddress}         | Response **output**                                                                           |
| acLeadPrimaryPhone    | {primaryPhone10digits} | Response **output**                                                                           |
| acLeadProductInterest | {productInterests}     | Response **output**                                                                           |
|                       |                        | As multi-select values, where each selection will be separated by a comma. 

``` json
{
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "body": [
        {
            "type": "ColumnSet",
            "columns": [
                {
                    "type": "Column",
                    "width": 2,
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Lead Notification",
                            "weight": "Bolder",
                            "id": "Title",
                            "size": "ExtraLarge"
                        },
                        {
                            "type": "TextBlock",
                            "text": "Please fill out a single form for each individual expressing interest in our products. ",
                            "isSubtle": true,
                            "wrap": true,
                            "id": "acInstructions",
                            "size": "Large"
                        }
                    ]
                }
            ]
        },
        {
            "type": "Container",
            "items": [
                {
                    "type": "TextBlock",
                    "text": "Potential Customer FIRST NAME",
                    "wrap": true,
                    "size": "Medium"
                }
            ]
        },
        {
            "type": "Input.Text",
            "id": "acLeadFName",
            "placeholder": "{firstName}"
        },
        {
            "type": "TextBlock",
            "text": "Potential Customer LAST NAME",
            "wrap": true
        },
        {
            "type": "Input.Text",
            "id": "acLeadLName",
            "placeholder": "{lastName}"
        },
        {
            "type": "TextBlock",
            "text": "Corporate email",
            "wrap": true
        },
        {
            "type": "Input.Text",
            "id": "acLeadEmail",
            "placeholder": "{emailAddress}",
            "style": "Email"
        },
        {
            "type": "TextBlock",
            "text": "Business Phone Number"
        },
        {
            "type": "Input.Text",
            "id": "acLeadPrimaryPhone",
            "placeholder": "{primaryPhone10digits}",
            "style": "Tel"
        },
        {
            "type": "RichTextBlock",
            "inlines": [
                {
                    "type": "TextRun",
                    "text": "{productInterests}"
                }
            ]
        },
        {
            "type": "Input.ChoiceSet",
            "placeholder": "Placeholder text",
            "choices": [
                {
                    "title": "Office 365",
                    "value": "Office 365"
                },
                {
                    "title": "Dynamics 365",
                    "value": "Dynamics 365"
                },
                {
                    "title": "Azure Services",
                    "value": "Azure Services"
                },
                {
                    "title": "Power Platform",
                    "value": "Power Platform"
                }
            ],
            "style": "expanded",
            "id": "acLeadProductInterest",
            "isMultiSelect": true
        }
    ],
    "actions": [
        {
            "type": "Action.Submit",
            "title": "Submit"
        }
    ]
}
```|

// [block 4
// [here](https://microsoft-my.sharepoint.com/:u:/p/audrie/Eaj7BRLTjIVImOnfPZzE9wgBY9bAgB3ud4hDQdSQCnPHNg?e=HVBq2w)]

// **\*Template Name:**

// **Post an Adaptive Card on Microsoft Teams for lead collection**  

## Next steps

