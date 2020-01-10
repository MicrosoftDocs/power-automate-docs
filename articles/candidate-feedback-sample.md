---
title: Candidate feedback sample | Microsoft Docs
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
ms.date: 01/01/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Candidate feedback sample
**Sample 7 – Candidate Feedback Form**

The **Candidate Feedback Form** sample is an Adaptive Card input form designed
for collecting feedback during an interview loop. We recommend using this with a
shared instant flow button to enable anyone on the team to provide feedback on
candidates during the interview loop. Extend this by recording responses in a
database or other desired data source in support of these additional
opportunities:

-   facilitate review of follow-up suggestions before the next session with the
    candidate

-   facilitate aggregated data review after all responses are recorded

-   notify HR representative with the Hire/No Hire vote count at the end of the
    process

<!-- ![](media/34eafd57a4cd4a11af27d8d50beffa97.png) -->

![](media/candidate-form.png)

*Inputs/Outputs and notes*

| Dynamic Token Name | Placeholder Text | Notes:              |
|--------------------|------------------|---------------------|
| {acFullName}       | {acFullName}     | Display text        |
| {acComments}       | {acComments}     | Display text        |
| {acDecision}       |                  | Response **output** |
| {acFollowUp}       |                  | Response **output** |

``` json
{
  "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
  "type": "AdaptiveCard",
  "version": "1.0",
  "body": [
    {
      "type": "TextBlock",
      "size": "Medium",
      "weight": "Bolder",      "id": "Title",
      "text": "CANDIDATE FEEDBACK FORM",
      "horizontalAlignment": "Left"
    },
    {
      "type": "Input.Text",
      "placeholder": "{acFullName}",
      "style": "text",
      "isMultiline": false,
      "maxLength": 75,
      "id": "acFullName"
    },
    {
      "type": "Input.Text",
      "placeholder": "{acComments}",
      "style": "text",
      "isMultiline": true,
      "maxLength": 200,
      "id": "acComments"
    },
    {
      "type": "TextBlock",
      "size": "Medium",
      "weight": "Bolder",
      "text": "Decision",
      "horizontalAlignment": "Left",
      "separator": true
    },
    {
      "type": "Input.ChoiceSet",
      "id": "acDecision",
      "value": "1",
      "choices": [
        {
          "title": "Hire",
          "value": "Hire"
        },
        {
          "title": "No Hire",
          "value": "No Hire"
        }
      ],
      "style": "expanded"
    },
    {
      "type": "TextBlock",
      "text": "Suggest follow-up discussion regarding:",
      "weight": "Bolder"
    },
    {
      "type": "Input.ChoiceSet",
      "id": "acFollowUp",
      "isMultiSelect": true,
      "value": "",
      "choices": [
        {
          "title": "Past experience in the topic area",
          "value": "Experience"
        },
        {
          "title": "Inclusive behaviors and work ethics",
          "value": "Inclusivity"
        },
        {
          "title": "Ability to work without supervision",
          "value": "Independent"
        }
      ]
    }
  ],
  "actions": [
    {
      "type": "Action.Submit",
      "title": "Submit"
    }
  ]
}
```

<!-- [block 7
[here](https://microsoft-my.sharepoint.com/:u:/p/audrie/EVWwYgSTXp5Hq5nd0QctjvkB8Ogd5kAH_6wreYo1nKFZAA?e=vGYLsc)] -->

## Next steps

