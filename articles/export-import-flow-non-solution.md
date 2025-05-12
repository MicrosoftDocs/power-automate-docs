---
title: Export and import a non-solution flow
description: Learn how export a flow from one environment and import it to another.
suite: flow
author: kewaiss
contributors:
  - jamiemwork
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 01/29/2024
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType:
  - flowmaker
  - enduser
---

# Export and import a non-solution flow

You can export and import non-solution flows by using packages. This feature allows you to export one flow from one environment and import it to another. Export and import packages have the file format *.zip*.

If you would like to export and import multiple flows, you can either use solutions, as described in the [Export a solution](export-flow-solution.md#export-a-specific-solution-cloud-flow) and [Import a solution](/power-automate/import-flow-solution) articles, or you can [copy an environment](/power-platform/admin/copy-environment).

> [!IMPORTANT]
> - You must have [third party cookies](/troubleshoot/power-platform/power-automate/widget-cookies-pop-up-error) enabled to export and import non-solution flows .
> - For application lifecycle management (ALM) capabilities in Microsoft Power Platform environments, use Microsoft Dataverse and solutions instead of the package export and import. More information: [Overview of ALM](/power-platform/alm/overview-alm)
> - Flow packages can't be used with [Dataverse solution packages](/power-apps/maker/data-platform/solutions-overview) because of the package incompatibility.

## Resources included in the package

When you export a flow, the dependent resources for your flow are also exported into the package.

|Resource | Supported | Import options |
|---------|-----------|----------------|
| Flow | Yes | There are two options to import a flow into an environment:</li><li>**Create as new**: The flow is created as a new flow into the environment where the package is imported.</li><li>**Update**: The flow already exists in the environment and is updated when this package is imported. |

## Permissions required to import and export a non-solution flow

Only the [owner or co-owner](/sharepoint/dev/business-apps/power-automate/guidance/manage-list-flows) of a flow can export the flow. To import a flow, the [Environment Maker](/power-platform/admin/database-security) is required on the destination environment.

## Export a flow package

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left navigation pane, select **My Flows** > **Cloud flows**, and then select the flow you want to export.
1. On the menu, select the down arrow next to **Export**, and then select **Package (.zip)**.
1. On the next screen, enter a name and description for your package.
1. *(Optional)* Configure the package.
    1. Under **Review Package Content** in the **ACTION** field, select **Configure** (the tool icon).
    1. Select **Update (default**) or **Create as new**.  

        For a description of these options, go to the table in the [Resources included in the package](#resources-included-in-the-package) section in this article.

    1. Select **Save**.

1. *(Optional)* Add a comment.
    1. Under the **Review Package Content** heading in the **ACTION** field, select **Comment** (the speech balloon icon).
    1. Enter your comment.
    1. *(Optional)* You can view multiple lines in your comment by using the up and down arrows in the scroll bar. Alternatively, you can enlarge the field by selecting and dragging the diagonal lines on the lower right corner of the field.
    1. Select **Save**. The icon in the **ACTION** column now contains quotation marks to indicate there's a comment.

1. On the bottom right corner, select **Export**.

    Your package starts downloading shortly after. If your download doesn't start automatically, select **Download**.

1. When you're ready to import a flow, you'll need the downloaded .zip file.

## Import a flow

1. On the left navigation pane, select **My Flows**.
1. On the menu, select **Import** > **Import Package (Legacy)**.
1. Select **Upload** > ***your zip file*** > **Open**.
1. The **Upload** button now reads **Uploading**, and the name of your .zip file appears to the left of the button.

    When the upload is complete, the package details appear.

1. In the **IMPORT SETUP** column in the first row, select the content in the field, and then select **Create as New** or **Update** from the **Setup** dropdown menu.

    For a description of the fields in the **Setup** menu, go to [Resources included in the package](#resources-included-in-the-package).

1. Select **Save**.
1. Under **Related Resources**, do the following steps:
    1. In the **IMPORT SETUP** column, select the contents of the field for each row.
    1. In the **Import setup** dialog, select the item if it's required to set up the flow to place a checkmark at the end of the row.

    :::image type="content" source="media/export-import-flow-non-solution/import-setup.svg" alt-text="<alt text>":::

    c. Select **Save**.

1. The **Import** button becomes active once you've successfully configured all the required settings. Select **Import**.

## Related information

- [Export a solution](export-flow-solution.md#export-a-specific-solution-cloud-flow)
- [Import a solution](/power-automate/import-flow-solution)
- [Share a cloud flow](/power-automate/create-team-flows)
- [Send a copy of a cloud flow](create-team-flows.md#send-a-copy-of-a-cloud-flow)


