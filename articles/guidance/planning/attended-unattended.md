---
title: Attended and unattended scenarios for process automation | Microsoft Docs
description: With any of the automation methods you use, the automation is going to be either attended or unattended. This article explains the scenarios for each type.
author: taiki-yoshida
ms.service: flow
ms.topic: conceptual
ms.custom: guidance
ms.date: 12/05/2020
ms.author: tayoshi
ms.reviewer: kathyos

---

# Attended and unattended scenarios

With any of the automation methods you use, the automation is going to be either
attended or unattended.<!--note from editor: What do you think of the alt text in the image markup? This is what we can use when we need more than 150 characters to describe an image. My suggestion might be too long, but I think something like this would be more useful for the reader.--> <!--tayoshi: This is much better, thank you for the suggestion.-->

:::image type="complex" source="media/unattended-attended.png" alt-text="Unattended and attended":::
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
| Sign-in isn't required because the automation assumes that the system is already signed in. | Windows Sign-in<!--note from editor: Are you sure this is the correct term? I don't find it in any style guide, and "login" is forbidden unless it matches the UI. (but it doesn't seem to). Same comment in authentication-security.md.--><!--tayoshi: Fixed to Sign-in as specified in style guide--> is automated with predefined user credentials |

You can use a combination of attended and unattended automation in your
solution.

In the expense report example, the approval process can be automated with
unattended automation. The cash reimbursement process might be better suited to attended
automation, because Abhay might want to check the details of the bank transaction
as a final confirmation.<!--note from editor: Needs better alt text. --><!--tayoshi: Fixed alt text and with descriptions-->

:::image type="complex" source="media/unattended-attended.png" alt-text="Business processes that shows a combination of attended and unattended scenarios":::
   Diagram showing a business process flow with multiple people is involved, where emailing approval results and archiving expense reports are unattended automations, and looking up employees banking details reimbursing cash is attended automations.
:::image-end:::