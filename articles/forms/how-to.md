---
title: How to use Forms in flows| Microsoft Docs
description: Top questions on how to use Forms within flows- Get response details, when a new response is submitted
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/09/2020
ms.author: napienko
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# How to

Here are the top how to questions about forms in Power Automate with examples on how to achieve them:

- Change the date and time format of the forms response.
- Configure a flow with a group form. 
- Send an email based on a conditional form response.
- Convert an attachment in Microsoft Forms to PDF.
- Upload forms responses to a Power BI dataset to visualize responses.
- Create a lead from a Microsoft Forms response.

## Change the date and time format of the forms response

By default, the form submission time will show the UTC time zone but users might want to change it to their local time zone. 

- For information about how to convert the time zone, see: [Converting time zone in Microsoft Power Automate](https://support.microsoft.com/help/4557244/converting-time-zone-in-microsoft-power-automate)
- For information about how to customize date formats in the flow, see: [How to customize/format Date and Time values in a flow](https://support.microsoft.com/help/4534778/how-to-customize-format-date-and-time-values-in-a-flow)

## Configure a flow with a group form

Go to your form. Copy the Form Id from the URL of the form and add it as a custom value. 

## Send an email based on a conditional form response

Once you choose the Microsoft Forms trigger and action, you can add a [condition](/add-condition.md#add-a-condition) based on a particular response in the form. The condition can include being equal to a text value or numerical value. Once the condition is created, you will see an “If yes” and “If no” statement for which you can add actions. For example, if someone responded that they would attend an event, you can send them the event details. Step by step instructions:[Create an automated workflow for Microsoft Forms]
(https://support.microsoft.com/office/create-an-automated-workflow-for-microsoft-forms-dee28c00-503a-48b3-89df-91a5084e6e43)

## Convert an attachment in Microsoft Forms to PDF

After creating the Forms trigger and action, add a [Select data](/data-operations#use-the-select-action) operation, Create HTML table, [Create file](/connectors/onedrive/#create-file) in OneDrive for Business, and then [Convert file](/connectors/onedrive/#convert-file) in OneDrive for Business to a PDF or other type of file. Please view [this helpful tutorial](https://www.youtube.com/watch?v=6dJTkG-KE-E&feature=emb_logo) from Lernen Tech.

## Upload forms responses to a Power BI data set to visualize responses

In Power BI, you can create a dashboard that aligns with questions in your form. See step-by-step instructions: [Turning Forms surveys into insights with Flow and Power BI](https://flow.microsoft.com/blog/forms-and-flow-and-powerbi/) 

## Create a lead from a Microsoft Forms Response

You can push a responder’s data as a lead to Dynamics 365. More information: [Converting Web Forms to Dynamics 365 Leads with Microsoft Flow & Forms](https://www.preact.co.uk/blog/converting-web-forms-to-dynamics-365-leads-with-microsoft-flow-forms)


### See also

- [Troubleshoot common issues](troubleshoot-issues.md)
- [Microsoft Forms - known issues and limitations](/connectors/microsoftforms/#known-issues-and-limitations)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
