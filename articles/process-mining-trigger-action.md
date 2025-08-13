---
title: Triggering actions using business rules and flows (preview)
description: Learn how to act on business rules results by triggering Power Automate flows.
author: michalrosik
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 08/12/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Triggering actions using business rules and flows (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Business rules in Power Automate Process Mining allow you to define and evaluate specific behavioral patterns or KPIs in your process. Business rules are re-evaluated with each data refresh. Using the **Process mining trigger** in Power Automate flow definition allows you to model and execute custom actions after each data refresh, based on the result of business rules evaluation.

To achieve this, it is necessary to:
1. Create a case scope business rule in Power Automate Process Mining
2. Create an automated cloud flow triggered by a process mining trigger in Power Automate

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Creating a case scope business rule

Case scope business rule is a rule, which is evaluated in the scope of a case (process instance identified by a unique case ID). For each case that meets the criteria specified by the rule, there is an evaluation result and an associated severity.

For more information on business rules and steps how to create a case scope business rule, please follow the description in [Bussines rules](/power-automate/minit/business-rules) section of the documentation.
From the best practice perspective, there are two recommended approaches to creating a case scope business rules - behavior deviation and KPI based approach. For the description of both approaches we will use an example from invoice approval process:
The customer has defined, that the business goal is to approve and process any invoice from US region in maximum 48 hours (in other words, the duration of the process instance should not be greater than 48 hours).

### Behavior deviation approach

In Behavior deviation approach, the customer defines behavior of the process that is considered as deviating from the business goal and the business rule returns only cases that are considered deviating according to the definition. All other cases are considered as non-deviating. The action is then taken only for the deviating cases.

For the above mentioned example:
- we define a **case scope** business rule such that
    - we setup an attribute filter for cases where **Region is equal to US** and a metrics filter for case duration metric to be **greater than 48 hours**
    - we calculate custom metric as **count of such cases** (this actually means that each case will be evaluated with result 1)
    - we define **Error** severity with a condition **Any**

This means, that any invoice in US region with case duration greater than 48 hours will be considered as deviating, will be assigned an Error severity and will be included in the result set for the action.

### KPI based approach

KPI based approach, alllows the customer to also define behavior of the process that is considered as deviating from the business goal, in a way, that it is looking at all cases meeting defined filtering criteria, but the threshold KPI is calculated for all such cases. The resulting KPI values can then be categorized on a more granular level into several severity buckets. This allows the customer to define which cases are considered already deviating, which are considered to be deviating soon and which are non-deviating. This allows to take different actions for different severity categories.

For the above mentioned example:
- we define a **case scope** business rule such that
    - we setup an attribute filter for cases where **Region is equal to US**
    - we calculate custom metric as **case duration**
    - we define **Error** severity with a condition **greater than 48 hours**, Warning severity with condition **between 36 and 48 hours** and OK severity with **less than 36 hours**

This means, that for each invoice in US region case duration KPI will be evaluated and based on the result, the case will be assigned a particular severity. All cases meeting the filter will be included in the result set for the action. The action flow can then decide on a particular route case by case. 

### Checking the business rule result

After defining the business rule, we recommend checking the results in the Power Automate Process Mining Desktop application. You can do this using [Business rules in statistics](/power-automate/minit/business-rules-statistics) and setting the optional scope to the newly defined business rule.

The resulting screen is divided into two parts:
- **Left side** - shows the summary stastics of the business rule evaluation - number of cases fitting the business rule and numbers of cases per severity
- **Right side** - shows a case by case detailed evaluation of the business rule including KPI value and corresponding severity.

All information included in both parts of the screen is available in the flow, when executed.

:::image type="content" source="media/process-mining-trigger-action/business-rule-statistics.png" alt-text="Screenshot showing the results of the evaluation of a specific business rule.":::

If the information displayed is correct you can proceed to step [Creating a triggered automated cloud flow]()

## Creating a triggered automated cloud flow

To execute an action on top of business rule evaluation, you need to create an automated cloud flow in Power Automate (learn more about [Cloud flows in Power Automate](/power-automate/overview-cloud)) that is using a Process mining trigger.

1. To create an automated cloud flow please follow [Create a cloud flow from Scratch](/power-automate/get-started-logic-flow?tabs=without-copilot%2Cnew-designer#create-a-cloud-flow)
2. When selecting a trigger, search for "process mining"
3. Select **When a Process data is refreshed** trigger subtitled **Process Mining**
4. The Power Automate editor will open, with the flow in *Edit* mode
5. The step at the top of the flow is the trigger. If the trigger is not correctly configured, you will be visually notified with a warning icon and text **Invalid parameters**. Click on the step
6. In the configuration panel, setup the connection to Process Mining and set the manadatory parameters
    a) Select your **process**
    b) Select the **process view** to which the business rule will be applied (learn more about views in [Manage views](/power-automate/minit/process-hub#manage-views))
    c) Select your newly created **business rule**

:::image type="content" source="media/process-mining-trigger-action/flow-trigger-config.png" alt-text="Screenshot showing the correctly configured trigger action and configuration panel.":::

7. To further configure your cloud flow please follow [Configure your cloud flow in the designer](/power-automate/get-started-logic-flow?tabs=without-copilot%2Cnew-designer#configure-your-cloud-flow-in-the-designer)
8. When you want to access the data supplied to the flow from Process mining, select the lightning bolt icon to the right. This will show you the available options. The potions are contextually filtered to show the ones relevant for the context of the action you are configuring. Select **Show more** to see all options.

:::image type="content" source="media/process-mining-trigger-action/flow-action-options.png" alt-text="Screenshot showing the available data fields supplied by the Process mining trigger.":::

> [!NOTE]
> If you select a data field from the case details, Power Automate flow editor will automatically encapsulate the activity into a For-Each activity, to iterate over all the cases in the dataset.

Process mining trigger will fire with each data refresh, no matter if it is [manual, scheduled or custom triggered refresh](/power-automate/process-mining-data-source?branch=main#refresh-data).
There are two sets of data structures available to you, related to the left and right side of the screen described in the previous chapter.

**body/businessRuleSummaryStatistics** - summary of the business rule evaluation outcome (summary on left side)

|Data field|Description|
|----------|-----------|
|Item Count|Number of all cases returned by the business rule evaluation|
|Error Count|Number of cases fitting the Error severity condition|
|Warning Count|Number of cases fitting the Warning severity condition|
|OK Count|Number of cases fitting the OK severity condition|
|Undefined Count|Number of cases not fitting Error, Warning or OK severity condition|

**Business Rule Items** - detailed evaluation for each case fitting the business rule (table on right side). Consists of list of **Item Detail** structures, each holding the following data fiels.

|Data field|Description|
|----------|-----------|
|Name|Item name (CaseID)|
|Index|Item index (technical identificator of the case)|
|Start Date|Case start date and time|
|End Date|Case end date and time|
|Event Count|Number of events for a case|
|Metric Value|Result of the business rule metric evaluation for the case|
|Severity|Severity evaluation based on the *Metric Value* for the case|
