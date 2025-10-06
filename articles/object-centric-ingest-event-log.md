---
title: Ingest object-centric event log (preview)
description: Learn how to ingest an object-centric event log.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/06/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Ingest Object-centric Event Log (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

To access OCPM analysis in Power Automate Process Mining, it's first necessary to create a process model by ingesting the object-centric event log.

To prepare the object-centric event log, follow the guidelines in [How to create an object‑centric event log (OCEL)](object-centric-create-event-log.md). Then, store the resulting file in a CSV format in either Azure Data Lake Gen2 or OneLake.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Ingest the data

1. On the navigation pane to the left, select **Process mining** > **Start here**.
1. Select **Object-centric process mining**.
1. In the **Process name** field, enter a name for your process.
1. Under the **Data source** heading, **Azure Data Lake** or **OneLake** and select **Continue**.

   :::image type="content" source="media/object-centric-ingest-event-log/object-centric-create-process.png" alt-text="Screenshot of the 'Create a new process' step.":::

1. The subsequent steps on the **Connection setup** screen, differ for Azure Data Lake or OneLake. Follow the respective documentation until you reach the attribute mapping screen:

   - Azure Data Lake - [Bring your own Azure Data Lake Storage Gen2](/power-automate/process-mining-byo-azure-data-lake)
   - OneLake -  [Ingest data from Fabric OneLake](/power-automate/process-mining-files-fabric-onelake)
1. On the **Map your data** screen, map your data columns to appropriate attributes.

   * One attribute of type **Activity** must be mapped
   * One attribute of type **Start event** must be mapped
   * **End event** attribute is optional
   * **Resource** attribute is optional 
   * At least two attributes of type **Object type** must be mapped
   * Event and Object level attributes (incl. financial) are optional but highly recommended for more detailed analysis
     * **Event level attribute** is bound to the event itself, so even if the event is referencing several objects of different object types, the attribute is bound to the event in all of the referenced objects.
     * **Object level attribute** is bound to the object of a particular referenced object type. The value is taken from the last or first event referencing that object type. To define the object level attribute first select the **Object Level Attribute (first or last event)**  and in the selection next to it, select the **Object type** to which the object level attribute is connected.

        :::image type="content" source="media/object-centric-ingest-event-log/object-centric-map-data.png" alt-text="Screenshot of the 'Map your data' step.":::

1. Select **Save and Analyze**.

    After the ingestion is finished, you should be navigated to the **Process Intelligence Studio for OCPM** with **Process overview** tab active.

   :::image type="content" source="media/object-centric-ingest-event-log/object-centric-process-overview.png" alt-text="Screenshot of the 'Process overview' tab in Process Intelligence Studio for OCPM.":::

## Related information

[OCPM process overview (preview)](object-centric-process-overview.md)
