---
title: Ingest Object-centric Event Log (preview)
description: Learn how to ingest an object-centric event log.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/01/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Ingest Object-centric Event Log (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

To access OCPM analysis in Power Automate Process Mining it is first necessary to create a process model by ingesting the object-centric event log. 

To prepare the object-centric evenet log please follow the guidelines in [How to Create an Object‑Centric Event Log (OCEL)](object-centric-create-ocel.md), and store the resulting file in a CSV format in either Azure Data Lake Gen2 or OneLake.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Ingesting the data

1. On the navigation pane to the left, select **Process mining** > **Start here**.

2. Select **Object-centric process mining**

3. In the **Process name** field, enter a name for your process.

4. Under the **Data source** heading, **Azure Data Lake** or **OneLake** and click **Continue**.

   :::image type="content" source="media/object-centric-process-mining/ocpm-create-process.png" alt-text="Screenshot of the 'Create a new process' step.":::

6. The subsequent steps on the **Connection setup** screen, differ for Azure Data Lake or OneLake, please follow the respective documentation until you reach the attribute mapping screen:

   1. Azure Data Lake - [Bring your own Azure Data Lake Storage Gen2](/power-automate/process-mining-byo-azure-data-lake)
   2. OneLake -  [Ingest data from Fabric OneLake](/power-automate/process-mining-files-fabric-onelake)

7. On the **Map your data** screen, map your data columns to appropriate attributes.

   * One attribute of type **Activity** must be mapped
   * One attribute of type **Start event** must be mapped
   * **End event** attribute is optional
   * **Resource** attribute is optional 
   * At least two attributes of type **Object type** must be mapped
   * Event and Object level attributes (incl. financial) are optional but highly recommended for more detailed analysis
     * **Event level attribute** is bound to the event itself, so even if the event is referencing several objects of different object types, the attribute is bound to the event in all of the referenced objects.
     * **Object level attribute** is bound to the object of a particular referenced object type. The values is taken from the last or first event referencing that object type. To define the object level attribute first select the **Object Level Attribute (first or last event)**  and in the selection next to it, select the **Object type** to which the object level attribute is connected.

   :::image type="content" source="media/object-centric-process-mining/ocpm-map-data.png" alt-text="Screenshot of the 'Map your data' step.":::

9. Click **Save and Analyze**

10. After the ingestion is finished you should be navigated to the **Process Intelligence Studio for OCPM** with **Process overview** tab active.

   :::image type="content" source="media/object-centric-process-mining/ocpm-process-overview.png" alt-text="Screenshot of the 'Process overview' tab in Process Intelligence Studio for OCPM.":::

   Learn more about [Process Intelligence Studio for OCPM - Process overview.](object-centric-process-overview.md)
