---
title: Candidate feedback sample | Microsoft Docs
description: Use this sample to create an Adaptive Card to collect feedback for job candidates.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.service: power-automate
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
# Candidate feedback sample

The **candidate feedback form** sample is an Adaptive Card input form that's designed for collecting feedback during an interview loop. We recommend using this with a shared instant flow button to enable anyone on the team to provide feedback on candidates during an interview loop. Extend this by recording responses in a database or other desired data sources to support these additional opportunities:

-   Facilitate the review of follow-up suggestions before the next session with the
    candidate.
-   Facilitate aggregated data review after all responses are recorded.
-   Notify the human resources representative with the hire/no hire vote count at the end of the process

     ![Candidate feedback form.](media/adaptive-cards/candidate-form.png)

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
      "weight": "Bolder",
      "id": "Title",
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




[!INCLUDE[footer-include](includes/footer-banner.md)]
