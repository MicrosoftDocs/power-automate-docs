---
title: Drafts and versioning for cloud flows
description: Learn about drafts and versioning feature set for cloud flows.
services: ''
suite: flow
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 03/04/2024
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Drafts and versioning for cloud flows

When authoring a solution cloud flow, drafts can be saved in Microsoft Dataverse before the flow is complete. Then, the flow can be published when you're ready to run the flow. As you're evolving the flow, a version history is built up in Dataverse and can be accessed on the version history panel.

## Availability

The flow drafts and versioning feature set is only available for [solution cloud flows](/power-automate/create-flow-solution). Solution cloud flows can be [created directly in a solution](/power-automate/create-flow-solution#create-a-solution-aware-cloud-flow), [added into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution), or created by default if the [Create in Dataverse solutions environment setting](/power-apps/maker/canvas-apps/add-app-solution-default#enable-the-feature) is enabled.

The flow drafts and versioning feature set is being released slowly across specific environments region-by-region. When drafts and versioning capabilities show up in an environment in your region, please allow two weeks for full release in that region.

## Save drafts

Save a draft of a flow whenever you want, even with errors. Make changes to your flow with confidence at your own pace.

1. Open the flow in the designer.
1. Make changes as needed.
1. Select **Save draft**.

    A confirmation message appears in the information bar.

    The flow state is visible next to the flow title.

### State indicator

The state of the flow (*Draft* or *Published*) shows beside the flow title to indicate if that version of the flow was published, or if the flow has draft changes.

## Publish a flow

When you're ready for changes to a flow to have an effect at runtime, the flow can be published.

1. Open the flow in the designer.
1. Make changes as needed.
1. Select **Publish**.

    A confirmation message appears in the information bar.

## Version history

Review a flow's version history list to understand how it evolved. View flow versions grouped by day with indicators for *Latest version*, *Published*, and *Past published*.

1. Open the flow in the designer.
1. Select **Version history**.

    The version history panel opens.

## Version restore

When you view a flow's version history list, you can select a previous version for review, and optionally restore it as a new draft.

1. Open the flow in the designer.
1. Select **Version history**.

    The version history panel opens.

1. Select a previous version.
1. Select **Restore**.
1. Confirm the restore action.

    The flow is now the latest draft in the version history.

## FAQ

### Why is the drafts and versioning feature set only available for solution cloud flows?

Dataverse is the storage used for drafts that aren't published. It's also the storage used for version history. Solution cloud flows are defined in Dataverse, so they can have drafts and a version history.

### How do I change a non-solution cloud flow into a solution cloud flow?

When you [add your non-solution cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution), it adds the definition into Dataverse so it can have versions.

### Can notes or titles be added to versions?

Notes and titles can't be added to the version at this time.

### Can drafts be tested?

Not at this time. Flow changes need to be published and runnable to be tested.

### Is there a unique identifier for a version?

Timestamps are used to differentiate between versions. There is a GUID identifier used for each version, but that doesn't show in the version history cards. A simple integer identifier isn't available at this time.

### Can the version history list be filtered?

Not at this time.

### Can a summary of the version changes show in the version history cards?

Not at this time.

### Can copilot summarize the changes made to a flow over a certain time period?

Not at this time.

### Can versions be compared?

Versions can be compared by viewing them in succession, or by opening up another browser tab to view a specific version. A side-by-side comparison of versions isn't available at this time.

### Can connection permissions be associated with a certain version so a new connection authorization is needed when the flow is changed by a co-owner?

Not at this time.

### See also

- [Manage and edit a cloud flow](/power-automate/get-started-logic-flow#manage-a-cloud-flow)
- [Create a solution](./overview-solution-flows.md)
- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Edit a solution-aware cloud flow](/power-automate/edit-solution-aware-flow)
- [Set a preferred solution](/power-apps/maker/data-platform/preferred-solution)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
