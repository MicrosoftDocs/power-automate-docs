---
title: Known limitations for automation center (preview)
description: Known limitations for automation center (preview)
ms.topic: conceptual
ms.date: 05/06/2024
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---

# Known limitations

Following lists the current limitations of the automation center and its underlying data structure. Some of these limitations will be resolved as we continue to develop this feature.

- Cloud flow run-specific data retention settings and known limitations can be reviewed [here](dataverse/cloud-flow-run-metadata.md).
- Visualizations are based on top-level cloud flow runs only.
- Only runs for solution-based cloud flows are available in the automation center.
- No top-level desktop-flow runs support yet (for local attended or API-based scenarios)
- No support for shared flows yet (users won't see runs of flows that have been shared with them).
- No child flow run-specific filter or sorting support yet.
- Users with broader access to run data (i.e. admins, or CoEs) may see *Private flow* as flow names if the corresponding cloud flow hasn't been explicitly shared with them (or deleted in the meantime).
- Users with broader access to run data may encounter increased latency during data load because of high cloud flow run volumes. Performances can be improved selecting more filters and reducing date range for examples.
- Only 1st-level child cloud and desktop flow runs are shown under **Runs**.
- In case of a visual showing "*Too many results"*, try to adjust your filter to limit the number of data that is being returned.
- Older cloud flow run history may be missing for the selected date range filter. This may be due to your current environment's TTL (time-to-live) configuration, which is set to retain cloud flow runs for a period of *n-days* only. [Learn more](dataverse/cloud-flow-run-metadata.md#cloud-flow-run-elements)
