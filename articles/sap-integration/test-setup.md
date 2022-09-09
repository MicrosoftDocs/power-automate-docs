---
title: Test and verify SAP integration with Power Platform (preview)
description: Learn about how to test and verify Power Platform integration with SAP
services: ''
suite: flow
documentationcenter: na
author: EllenWehrle
manager: jongilman
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2022
ms.author: ellenwehrle
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# TO BE REMOVED - Test and verify SAP integration with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

The newest version of Power Platform's SAP connector has enhanced functionalities. It enables Message Server support and allows for easier entering of parameters needed when connecting to SAP.

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

There is a minimum of two required fields for this action to begin:

-   SAP System: This is a JSON string containing all the necessary SAP connection parameters. For a complete list of all the available properties, refer to the "SAP property guidance" table. The JSON string can be manually entered or chosen from an existing environment variable within a solution.

-   RFC name: The name of the remote call function (RFC) you would like to call.

