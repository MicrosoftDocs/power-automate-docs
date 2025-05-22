---
title: Deploying and refining phase for a Power Automate project | Microsoft Docs
description: When you deploy an automation, consider how you'll replace the current business process with the new automation, to avoid disrupting the business.
author: taiki-yoshida
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.custom: guidance
ms.date: 12/10/2020
ms.author: mapichle
ms.reviewer: kathyos

---

# Deploying and refining phase

When you're deploying an automation, it's important to consider how you'll
replace the current business process with the new automation, to avoid
disrupting the business.

## Deploying your automation to production

### Add redundant owners

If you have a flow that's used by your entire team, you don't want people
calling you up while you're on vacation if it breaks. Make sure you add a couple
of co-owners so that they can update the flow in your absence. Who you add
depends on how the flow is used. Probably you'll at least want to add your direct manager, who can
act as your proxy, and maybe your manager's manager if all their reports are
relying on your automation. If your group is large enough, or if you have a lot of team
flows, you might consider creating a security group of two or three people who are willing
to set aside a small amount of time to keep an eye on all the team flows. Don't
add your entire organization as a co-owner, though; that just invites more people to mess
up the flow. If your company has a [Center of Excellence](/power-platform/guidance/coe/starter-kit)
for Microsoft Power Platform, they might have guidelines for flow ownership.

Keep in mind that the access applies not just to the flows themselves but
to the connections they use. For example, if your flow sends mail from a shared
mailbox, make sure that the co-owners have access to that mailbox in case they
need to re-create the connection.

### Use solutions

Solutions are a great way to organize flows to manage versions and migrate from
one environment to another. You'll need to start by adding (or asking your admin
to add) a Microsoft Dataverse database to your environment. After that's done,
you can go to the **Solutions** tab to create a new solution for your team, or you
can create multiple solutions if you have a lot of flows that you'd like to
further organize. There are a number of other benefits too, such as [native storage](/powerapps/maker/common-data-service/data-platform-intro)
for your data, [child flows](../../create-child-flows.md) to reuse
functionality, and [solution export](../../overview-solution-flows.md) as a
backup. Solutions do have some known limitations, though, so this might
not apply to all your flows.

### Mark it as production

Solutions are the recommended way to organize flows, but sometimes your flow
can't go in a solution, or sometimes your solution will get crowded with other
drafts and proofs of concept. Either way, we recommend prefixing the names of
your production flows with "[PROD]" so that co-owners know to leave it be unless it has issues.

## Deploy the automation in stages

To make sure your deployment is successful, you should consider taking the
following approach:

1.  Use the automation with a small number of people.

2.  Check that there are no issues for those people.

3.  Have the remaining people start using the automation.

> [!div class="nextstepaction"]
> [Next step: Assessing the business impact of the automation](analyze-and-assess.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
