---
title: Separate flows into smaller automated processes in a Power Automate project | Microsoft Docs
description: This article gives tips and examples for architecting your flows into smaller, separate automated processes. 
author: taiki-yoshida
ms.service: power-automate
ms.subservice: guidance
ms.topic: concept-article
ms.custom: guidance
ms.date: 12/10/2020
ms.author: tayoshi
ms.reviewer: kathyos

---

# Separate flows into smaller automated processes

When you're setting up an automation, try to architect your flows so that you
don't have a single automation that covers the entire process. There are several reasons why you should make multiple, smaller flows:

- Maintenance is easier.

- Error handling doesn't need to be as sophisticated.

- Multiple people can work on the automation.

- There's no need to restart the automation from the beginning if a step fails.

In the example below, one automation has been set up for an approval process, covering multiple
processes with a single automation.

:::image type="complex" source="media/flow-before-split.png" alt-text="Example of a very long process diagram set up for automation.":::
   Diagram showing a business process where an expense report is created. The entire business process is set up as a single long automation with ten steps to complete.  
:::image-end:::

If for example, the cash reimbursement process fails, the whole automation will
be considered a failure. If a requirement or specification for looking up employee
banking details changes, the whole process will have to be suspended until the updates are in place.

Instead, you can separate the automation into modules, as shown in the following image.

:::image type="complex" source="media/flow-after-split.png" alt-text="Example of process diagram split to three smaller processes.":::
   Diagram showing automation split to three smaller automations so that each automation only includes three or four steps. First automation starts when an expense report is created and checks whether the created reports meet compliance. If compliant, the status is updated to Compliance check complete. If not, it will request for fixes.
   Second automation starts when status is updated to Compliance check complete. If approved, the result is emailed and status is set to approved. If the request is declined, it will request for fixes. Third automation starts when status is updated to approved. The system automatically will look up employee's banking details and reimburse cash to the employee, and also archive the expense report.
:::image-end:::

In this example, Automation \#2 depends on the previous automation to
set the status of the expense report to "Compliance
check complete." However, if there's a problem with the mail system and
Automation \#2 fails, the tasks in Automation \#1 will still be completed. Only tasks in Automation \#2 will need to be restarted.

> [!div class="nextstepaction"]
> [Next step: Authentication and security](authentication-security.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
