---
title: Attended and unattended scenarios for process automation | Microsoft Docs
description: With any of the automation methods you use, the automation is going to be either attended or unattended. This article explains the scenarios for each type.
author: taiki-yoshida
ms.service: power-automate
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.date: 01/28/2025
ms.author: tayoshi
ms.reviewer: kathyos

---

# Attended and unattended scenarios

With any of the automation methods you use, the automation is going to be either
attended or unattended.

:::image type="complex" source="media/unattended-attended.png" alt-text="Unattended and attended.":::
   Diagram showing a person sitting at a computer unaware of the unattended automation running alongside, and another diagram showing several people sitting at computers that each have attended automation running on demand.
:::image-end:::

**Attended (human-initiated) scenarios**
In these scenarios, the automation is executed when users are in front of their
computers. This is suitable when you want to automate tasks and
processes at an individual level. The automation is often triggered manually
whenever the user wants to run it. The process might require
human interaction or decisions between steps.

**Unattended (fully automated) scenarios**
In these scenarios, a designated computer or a server is set up to run
the automation on behalf of a user. The whole automation process is run fully by
Power Automate, and no interaction or decision is made by a human (with the
exception of
[approval](../../modern-approvals.md) flows, in
which the person doing the approving is considered to be technically a "third
party" to the automation). The automation process can be triggered automatically
from another system or service, or on a schedule.

The following table summarizes the two types of automation scenarios.

| Attended          | Unattended                                              |
|-------------------|---------------------------------------------------------|
| Requires human interaction or decisions      | No human interaction or decisions required                  |
| Manually triggered               | Automatically triggered                                     |
| Sign-in isn't required because the automation assumes that the system is already signed in. | Windows Sign-in is automated with predefined user credentials |

You can use a combination of attended and unattended automation in your solution. However, since attended automation requires an active session and unattended automation requires users to be signed out or have a disconnected session, don't mix attended and unattended automation on the same machine or machine group.

In the expense report example, the approval process can be automated with
unattended automation. The cash reimbursement process might be better suited to attended
automation, because Abhay might want to check the details of the bank transaction
as a final confirmation.

:::image type="complex" source="media/unattended-attended.png" alt-text="Business process that shows a combination of attended and unattended scenarios.":::
   Diagram showing a business process flow with multiple people involved, where emailing approval results and archiving expense reports are unattended automations, and looking up employees' banking details reimbursing cash are attended automations.
:::image-end:::

> [!div class="nextstepaction"]
> [Next step: Separate flows into smaller automated processes](separate-flows.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
