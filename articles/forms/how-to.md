---
title: How to do more with forms in Power Automate
description: Explore more ways to use a form in an automated flow.
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
editor: ''
tags: ''
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/22/2022
ms.author: jamiller
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# How to do more with forms in Power Automate

Here are some less-common things you can do with a form in your automated flows:

- Change the format of dates in a flow
- Change the response submission time zone
- Add a group form to a flow
- Send an email based on a conditional form response
- Convert an attachment on a form to PDF or other file type
- Upload form responses to a Power BI dataset
- Create a lead from a form response

## Change the format of dates in a flow

[Learn how to customize date formats in a flow](https://support.microsoft.com/help/4534778/how-to-customize-format-date-and-time-values-in-a-flow).

## Change the response submission time zone

By default, the form shows the response submission timestamp in the UTC time zone. [Learn how to convert the time zone](https://support.microsoft.com/help/4557244/converting-time-zone-in-microsoft-power-automate).

## Add a group form to a flow

If a group is the owner of the form you want to add to a flow, Power Automate doesn't list it in the Form Id.

Go to the form. Copy the Form Id from the URL of the form, and then add it as a custom value.

## Send an email based on a conditional form response

When you use a form in a flow, you can add a [condition](/power-automate/add-condition#add-a-condition) that's based on how a user responds to a question in the form. The condition can test a text value or a numerical value. The condition creates two parallel branches, *If yes* and *If no*, to which you can add actions.

For example, you can use a condition to email details about a specific event or a general calendar of events, depending on how customers respond on an interest form. To learn more, follow the step-by-step instructions in [Create an automated workflow for Microsoft Forms](https://support.microsoft.com/office/create-an-automated-workflow-for-microsoft-forms-dee28c00-503a-48b3-89df-91a5084e6e43).

## Convert an attachment on a form to PDF or another file type

Add your form to a flow, and then add the following actions.

- [Data Operation - Select](../data-operations.md#use-the-select-action)
- [Data Operation - Create HTML table](../data-operations.md#use-the-create-html-table-action)
- [OneDrive for Business - Create file](/connectors/onedrive/#create-file)
- [OneDrive for Business - Convert file](/connectors/onedrive/#convert-file)

## Upload form responses to a Power BI dataset

Learn how to [turn Forms surveys into insights with Power Automate and Power BI](https://make.powerautomate.com/blog/forms-and-flow-and-powerbi/).

## More information

- [Troubleshoot common issues](troubleshoot-issues.md)
- [Microsoft Forms - known issues and limitations](/connectors/microsoftforms/#known-issues-and-limitations)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
