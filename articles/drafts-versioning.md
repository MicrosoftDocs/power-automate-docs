---
title: Drafts and versioning for cloud flows
description: Learn about drafts and versioning for cloud flows
services: ''
suite: flow
documentationcenter: na
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/29/2024
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Drafts and versioning for cloud flows


## Availability

Drafts and versioning is only available for [solution cloud flows](/power-automate/create-flow-solution). 
Solution cloud flows can be [created directly in a solution](/power-automate/create-flow-solution#create-a-solution-aware-cloud-flow), [added into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution), or created by default if the [Create in Dataverse solutions environment setting](/power-apps/maker/canvas-apps/add-app-solution-default#enable-the-feature) has been enabled.

Drafts and versioning is being released slowly across specific environments region-by-region. When drafts and versioning capabilities show up in an environment in your region, please allow two weeks for full release in that region.

## Overview

When authoring a solution cloud flow, drafts can be saved in Dataverse before the flow is complete and the flow can be published when you are ready to run the flow. As you are evolving the flow, a version history will be built up in Dataverse and can be accessed via the version history panel. 
 
## Saving drafts 
Save a draft of a flow whenever you want, even with errors. Make changes to your flow with confidence at your own pace.

1. Open flow in designer
2. Make changes as needed
3. Click **Save draft**
4. A confirmation message will be presented in the information bar
5. The flow state will be visible next to the flow title

### State indicator
The state of the flow (Draft or Published) will be shown beside the flow title to indicate whether or not that version of the flow has been published or if the flow has draft changes.

## Publishing
When you are ready for changes to a flow to have an effect at runtime, the flow can be published.

1. Open flow in designer
2. Make changes as needed
3. Click **Publish**
4. A confirmation message will be presented in the information bar

## Version history
Review a flow's version history list to understand how it has evolved. View flow versions grouped by day with indicators for "Latest version", "Published", and "Past published".

1. Open flow in designer
2. Click **Version history**
3. The version history panel will be presented

## Version restore
When viewing a flow's version history list, a previous version can be selected for review, and optionally restored as a new draft. 
 
1. Open flow in designer
2. Click **Version history**
3. The version history panel will be presented
4. Select a previous version
5. Click **Restore**
6. Confirm the restore action
7. The flow will now be the latest draft in the version history

## FAQ

### Why is drafts and versioning only available for solution cloud flows?
Dataverse is the storage used for drafts that have not been published and for version history. Solution cloud flows are defined in Dataverse, so they can have drafts and a version history. 

### How do I change a non-solution cloud flow into a solution cloud flow?
When you [add your non-solution cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution), it will add the definition into Dataverse so it can have versions. 

### Can notes or titles be added to versions?
Notes or titles cannot be added to the version at this time. 
 
### Can drafts be tested?
Not at this time. Flow changes need to be published and runnable to be tested. 
 
### Is there a unique identifier for a version?
Timestamps are used to differentiate between versions. There is a GUID identifier used for each version, but that is not shown in the version history cards. A simple integer identifier is not available at this time. 
 
### Can the version history list be filtered?
Not at this time. 
 
### Can a summary of the version changes be shown in the version history cards?
Not at this time. 
 
### Can copilot summarize the changes made to a flow over a certain time period?
Not at this time. 
 
### Can versions be compared?
Versions can be compared by viewing them in succession or by opening up another browser tab to view a specific version. A side-by-side comparison of versions is not available at this time. 
 
### Can connection permissions be associated with a certain version so a new connection authorization is needed when the flow is changed by a co-owner?
Not at this time. 


## See also

- [Manage and edit a cloud flow](/power-automate/get-started-logic-flow#manage-a-cloud-flow)
- [Create a solution](./overview-solution-flows.md)
- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Edit a solution-aware cloud flow](/power-automate/edit-solution-aware-flow)
- [Set a preferred solution](/power-apps/maker/data-platform/preferred-solution)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
