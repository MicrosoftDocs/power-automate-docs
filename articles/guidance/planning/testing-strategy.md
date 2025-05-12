---
title: Testing strategy for a Power Automate project | Microsoft Docs
description: After you've completed your automation, the next step is for you to test it out. This article explains about the testing strategies you should consider.
author: taiki-yoshida
ms.service: power-automate
ms.subservice: guidance
ms.topic: concept-article
ms.custom: guidance
ms.date: 12/10/2020
ms.author: tayoshi
ms.reviewer: kathyos

---

# Testing strategy

After you've finished making your flows and automation, the next step is for you to test it. You should consider testing all possible patterns and outcomes of your
flows. This is because your flow might not simply fail, it might run but produce
unexpected results. Testing all patterns will reduce this risk.

If you're new to building flows in Power Automate, testing the
automation each time you add a new step is the best way to ensure that you catch
mistakes, rather than attempting to build the entire flow and then testing it.

Let's take a look at the example shown in the following illustration.

:::image type="complex" source="media/compliance-flow.png" alt-text="Example of a compliance check flow.":::
   From "Expense report created," an arrow leads to the decision "Check if report meets compliance." From "Check if report meets compliance," Yes leads to "Status updated to 'Compliance check complete'" and No leads to "Request fixes."
:::image-end:::

We recommend that you record your results in the **Actual result** column in a table like the following, to make sure you've covered all
possible combinations that might fail.

| Case No. | Step details                                  | Condition              | Expected result                                                | Actual result |
|----------|-----------------------------------------------|------------------------|----------------------------------------------------------------|---------------|
| 1-1      | Check whether report meets compliance              | Compliance met         | Status updated to "Compliance check complete"                  |              |
| 1-2      | Check whether report meets compliance              | Compliance not met     | Email sent to employee to fix the expense report                            |               |
| 1-3      | Check whether report meets compliance              | Compliance check fails | Notified flow maker and logged failure to the "flow runs" feature. |               |
| 2        | Status updated to "Compliance check complete" | Status update fails    | Notified flow maker and logged failure to the "flow runs" feature. |               |
| 3        | Email sent to employee to fix the expense report           | Email send fails       | Notified flow maker and logged failure to the "flow runs" feature. |               |

>[!TIP]
>To simulate email send failures, try sending a test email to a nonexistent address.

## Testing in "live only" environments

Ideally, all tests should be done in test environments. However, there might be
situations where you don't have an environment to test separately from
live systems. In these cases, you can use the following methods:

- **For lookups**: Use static text as the result to mimic a lookup.

- **For data entry**: Create a step to make new record, followed by another flow
to delete the same record.

- **For sending data**: If possible, set up a test environment on the system you want to send the
data to.

## Testing with users

After you've completed the systematic tests, you should also run a final check
with your users (ideally the same people who were working on the process prior
to the automation). This helps ensure your automation does what you expect and
presents consistent outcomes.

> [!div class="nextstepaction"]
> [Next step: Tools to test your automation](tools-and-settings.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
