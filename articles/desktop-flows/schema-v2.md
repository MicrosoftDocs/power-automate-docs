---
title: Power Automate v2 schema
description: Learn about the Power Automate v2 schema.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 02/06/2023
ms.author: dbekirop
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Automate v2 schema

The v2 schema enables new features and functionality related to Power Automate for desktop and is applicable for users with paid subscriptions.

When the feature is enabled (at an environment level), new, modified, and resaved desktop flows get converted into the new schema. The process definition for a desktop flow takes up less Dataverse capacity and offsets information related to images and controls used in automated scripts into [Dataverse for Apps File Capacity](/power-platform/admin/capacity-storage#licenses-for-the-new-storage-model). Dataverse for Apps File Capacity is also included with your subscription.

As best practices, administrators must update all Power Automate for desktop users and unattended machines with the February 2023 product release or a later version.

## Enable the v2 schema

V2 schema is applied at the environment level, and you can manage it through the Power Platform Admin Center.

## Manage desktop flows in environments with the v2 schema enabled

Power Automate desktop flows currently stored in the v1 schema will continue functioning as intended in environments where the v2 schema is enabled. New, modified, and resaved desktop flows will be stored in the v2 schema.

## Limitations of v2 schema desktop flows

Desktop flows stored in the v2 schema only function in environments with the v2 schema feature enabled.

V1 schema desktop flows in a managed solution may operate in an environment where the v2 schema is enabled, but first you must resave them into another environment where the v2 schema is enabled.

The updated v2 schema version of the same process can then be imported to the managed environment where it's intended to run. The active layer can be replaced by the v2 schema version of the automated process.

|Scenario|Power Automate for desktop prior to February 2023 release | Power Automate for desktop after to February 2023 release |
|--------|----------------------------------------------------------|-----------------------------------------------------------|
|**Can run v1 schema desktop flows in environments with the v2 schema enabled?** |Yes|Yes|
|**Can run v2 schema desktop flows in environments with the v2 schema enabled?** |No (user notified of error)|Yes|
|**Can run v2 schema desktop flows in environments with the v2 schema disabled?** |No (user notified of error)|Yes|
|**Can edit/save v1 desktop flows into v1 schema in environments with the v2 schema disabled?** |Yes|Yes|
|**Can edit/save v1 desktop flows into v1 schema in environments with the v2 schema enabled?** |Yes|No (flows are upconverted and saved in the v2 schema)|
|**Can edit/save v2 desktop flows into z1 schema in environments with the v2 schema disabled?** |No (user notified of error)|Yes (flows are downgraded to and saved in the v1 schema)|
|**Can edit/save v2 desktop flows into v2 schema in environments with the v2 schema enabled?** |No (user notified of error)|Yes|
