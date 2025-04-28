---
title: Employ robust error handling
description: Learn key strategies for effective error handling in Power Automate flows, including configuring run after settings and using retry policies.
#customer intent: As a Power Automate user, I want to implement strategies to identify and resolve issues quickly and efficiently.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Employ robust error handling

Error handling ensures the reliability and robustness of your automated workflows in Power Automate. Implement these key strategies to identify and resolve issues quickly and efficiently.

## Configure Run after settings

Use **Run after** settings to specify what should happen if an action fails, times out, is skipped, or is successful. For each action, you can set conditions to determine the next steps based on the outcome of the previous action. This approach allows you to create alternative paths for error handling. For example, if an action fails, you can configure to send a notification or log the error details as the next action.

In this example, a user receives an email anytime the flow fails at the step **Update a row**:

:::image type="content" source="media/run-after-settings.png" alt-text="Screenshot of configuring the Run after condition to send an email when the Update a row action fails." lightbox="media/run-after-settings.png":::

You can also use the `workflow()` function in Power Automate to get detailed information about the flow run, including the current environment GUID, flow name, flow GUID, and run ID.  
  
The `workflow()` json schema is as follows:

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
    } 
}
```

Use the **Parse JSON** action with the JSON schema to parse the response from the `workflow()` function.

:::image type="content" source="media/parse-workflow-data.png" alt-text="Screenshot of parsing the JSON of the workflow function.":::

Use the **Compose** action to create a flow run URL. Use this URL to directly link to the flow run in a notification email or store it in a table where you log errors.

In this example, the following is used as input to the **Compose** action:

```http
https://make.powerautomate.com/environments@{body('Parse_JSON')?['tags']?['environmentName']}/flows@{body('Parse_JSON')?['tags']?['logicAppName']}/runs@{body('Parse_JSON')?['run']}
```

:::image type="content" source="media/compose-workflow-run.png" alt-text="Screenshot of using the Compose action to compose the flow run URL.":::

> [!CAUTION]
> Use this option carefully, as it can result in excessive custom logging and an increased number of actions, which might negatively impact overall performance. Overuse can lead to an anti-pattern, where frequent alerts and actions degrade the efficiency and effectiveness of your workflow.

## Group actions into scopes for error handling

Group related actions into scopes and use scopes to handle errors collectively. You can implement a try-catch pattern using scopes to manage errors. Create a "Try" scope for your main actions and a "Catch" scope for error handling. If an error occurs in the main scope, the error handling scope can be triggered to manage the error. Configure the "Catch" scope to run if the "Try" scope fails.

:::image type="content" source="media/configure-catch-scope.png" alt-text="Screenshot of configuring the Catch scope to only run when the Try scope fails.":::

Use the **Filter array** action to filter the [**Result function**](/azure/logic-apps/workflow-definition-language-functions-reference#result) to get the failed errors. 

:::image type="content" source="media/filter-result-function.png" alt-text="Screenshot of using the filter array action to filter the response from the result function." lightbox="media/filter-result-function.png":::

You can use the **Create HTML table** action to create an HTML table from this response to send an email alert or store the details in your error logging table. 

## Implement a retry policy

By implementing an exponential retry policy, you can effectively manage transient failures and enhance the reliability of your automated workflows. The **Retry policy** in flow settings is designed to handle transient failures, which are temporary issues that can often be resolved by retrying the action.

> [!TIP]
> Choose exponential retry policies because they can extend the retry period over time and increase the chances of successfully completing the action.

Transient failures are temporary errors that occur due to network issues, service unavailability, or other intermittent problems. The retry policy helps manage these failures by attempting the action again after a specified interval. Learn more: [Recommendations for handling transient faults](/power-platform/well-architected/reliability/handle-transient-faults)

An **exponential retry policy** starts with a short retry interval and gradually increases the interval between retries. This approach helps to avoid overwhelming the system with frequent retries and allows more time for the issue to resolve.

Consider this example of an exponential retry policy: 

- The first retry might occur after 1 minute.
- The second retry after 2 minutes.
- The third retry after 4 minutes, and so on.

An exponential retry policy improves the likelihood of success without causing excessive load on the system. 

To configure the retry policy:

1. Open your flow in Power Automate and go to the **Settings** of the action you want to configure.
1. Select the exponential option under **Retry policy**, and configure the initial interval and maximum retry count according to your needs.
1. Monitor the performance of your flow and adjust the retry settings as necessary to optimize for your specific use case.

:::image type="content" source="media/retry-policy.png" alt-text="Screenshot of the Retry policy settings in a cloud flow." lightbox="media/retry-policy.png":::

## Use the Terminate action

Use the **Terminate** action to stop the flow and set a specific status (Succeeded, Failed, or Cancelled). Add the **Terminate** action when you need to explicitly stop the flow due to an error. For example, if a critical error occurs, you can use the **Terminate** action to stop the flow and set the status to "Failed," ensuring that no further actions are executed. Provide a status and message to further debug why the flow failed.

:::image type="content" source="media/terminate-flow.png" alt-text="Screenshot of configuring the Terminate action.":::

## Implement logging and notifications

Implement logging and notifications to monitor and track errors. Use actions to log error details to a database, SharePoint list, or other storage solutions. Set up notifications to alert relevant stakeholders when an error occurs. For example, if an error is detected, log the error details and send an email notification to the support team for immediate attention.

Instead of using custom logging, you can set up [Application Insights](/power-platform/admin/app-insights-cloud-flow) with Power Automate and [create alerts for cloud flow run failures](/power-platform/admin/app-insights-cloud-flow#create-alerts-for-cloud-flow-run-failures).

## Use flow remediation email

The Power Automate flow service sends email alerts to flow owners for common or critical failures like broken connections or throttling issues. Email alerts include detailed error information and troubleshooting tips.

