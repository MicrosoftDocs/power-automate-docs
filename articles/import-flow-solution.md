---
title: Import a solution
description: Learn how to import a solution.
author: ChrisGarty
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 03/26/2024
ms.author: cgarty
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType: 
  - flowmaker
  - enduser
---

# Import a solution

After you exported your solution, you can import it into any environment that meets the prerequisites. Follow these steps to import a solution.

> [!TIP]
> If you want to have your flows start automatically after you import a solution, use the Microsoft Dataverse connector in your flow when you create it.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation bar to the left, select **Solutions**.
1. Select **Import**.
1. On the **Import a solution** page that opens, select **Browse**.
1. Find and select the solution that you want to import.
1. Select **Open**.

   You should now see the **Import a Solution** page similar to the following image.

    :::image type="content" source="./media/import-flow-solution/import-solution.png" alt-text="Screenshot of the 'Import a solution' dialog box.":::

1. Select **Next**.

   If there are no errors, the importation completes within a few moments.

> [!NOTE]
> You can't import a solution into an environment in which the solution already exists.

## FAQ

### What will the flow state be after import?

When you import a solution containing flows, the import process attempts to restore them to the state they were in when exported. If the flows were on when exported and any connection references get connections, then the flows should be turned on as part of the import process.

If the flow already exists in the target environment, then the import of an update to that flow won't affect the flow state. For example, if the flow is turned off in the target environment and then an update is imported, the flow remains turned off.

### If the importing user doesn't have permissions to all the connections in the flow, will the flow be turned on?

If the importing user doesn't have permissions to all the connections in the flow, then the [connections need to be shared](/power-apps/maker/data-platform/create-connection-reference#share-connections-with-another-user-so-flows-can-be-enabled) with the importing user so that they can turn the flow on.

### See also

- [Create a solution](./overview-solution-flows.md)
- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Export a solution](./export-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)
- [Remove a solution-aware flow](.//remove-solution-aware-flow.md)
- [Use connection references](/power-apps/maker/data-platform/create-connection-reference)
- [Manage connections in Power Automate](/power-automate/add-manage-connections)

[!INCLUDE[footer-include](includes/footer-banner.md)]
