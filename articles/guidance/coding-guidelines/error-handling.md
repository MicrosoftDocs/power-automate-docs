---
title: Employ robust error handling
description: Learn how to employ robust error handling
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Employ robust error handling

Error handling in Power Automate is essential for ensuring the reliability and robustness of your automated workflows. Here are some key strategies for implementing error handling in Power Automate:

## Configure "run after" settings

For each action in your flow, you can configure the "Run After" settings to specify whether the action should run based on the outcome of previous actions. This enables conditional execution and error handling. For example, you can configure an action to run only if the previous action failed, skipped or timed out.

In this example, a user gets a notification anytime the flow fails at the step “Update a row”

![A screenshot of a computer Description automatically generated](media/fa521d5db5678e0b1cda492a7112ac5a.png)

![A screenshot of a computer Description automatically generated](media/5f2a4bbaf2c9ea7d4a7213a52d10f90e.png)

You can also use the **workflow() function** in Power Automate to get detailed information about the flow run, including the current environment guid, Flow name, Flow guid and run ID.  
  
Workflow() json schema

```json
{
    "type": "object",
    "properties": {
        "id": {
            "type": "string"
        },
        "name": {
            "type": "string"
        },
        "type": {
            "type": "string"
        },
        "location": {
            "type": "string"
        },
        "tags": {
            "type": "object",
            "properties": {
                "flowDisplayName": {
                    "type": "string"
                },
                "environmentName": {
                    "type": "string"
                },
                "logicAppName": {
                    "type": "string"
                },
                "environmentFlowSuspensionReason": {
                    "type": "string"
                },
                "state": {
                    "type": "string"
                },
                "createdTime": {
                    "type": "string"
                },
                "lastModifiedTime": {
                    "type": "string"
                },
                "createdBy": {
                    "type": "string"
                },
                "triggerType": {
                    "type": "string"
                }
            }
        },
        "run": {
            "type": "object",
            "properties": {
                "id": {
                    "type": "string"
                },
                "name": {
                    "type": "string"
                },
                "type": {
                    "type": "string"
                }
            }
        }
    } }
```

<!-- TODO replace with parse json action and better description -->

![A screenshot of a computer  Description automatically generated](media/image40.png)

You can then parse that information and build the flow run URL which you can include as a hyperlink in the notification email.

> [!CAUTION]
> Use this option wisely as it could lead to a lot of custom logging and cause too many actions and impact overall performance. In one way, it can spiral into a large anti-pattern if alerted too many times.

## Implement try-catch pattern by using scopes

Results of Try will give you all the details of the action within the try block. In the example, we have 4 Compose Actions within the try block configured as follows

Action1 – test (string)

Action 2 – concat('af','g')

Action 3 – div(1,0)

Action 4 – test (string)

![A screenshot of a computer  Description automatically generated](media/image41.png)

![A screenshot of a computer  Description automatically generated](media/image42.png)

Use Filter array to filter the Result function to get the failed errors. Users can further clean up the records and create an HTML table to send email alerts as shown below

![A screenshot of a computer  Description automatically generated](media/image43.png)

![A screenshot of a computer  Description automatically generated](media/image44.png)

## Use retry policy

Retry policy under flow settings helps in handling default transient failure. It is recommended to choose exponential policies as they can go for a prolonged period of time.

<!-- TODO replace -->
![A screenshot of a computer  Description automatically generated](media/image45.png)

## Use flow remediation email

Power Automate Flow service generates email alerts to all flow owners for certain common or critical failures like broken connections or flow turning off due to throttling. These email contain the error information in detail and troubleshooting tips on how to rectify the issue.

