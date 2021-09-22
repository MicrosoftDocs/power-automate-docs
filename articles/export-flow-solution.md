---
title: Learn how to export solution-aware flows | Microsoft Docs
description: Learn how to export solution-aware flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 10/06/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Export a solution


Follow these steps to move your solution and its dependencies to a new environment:

1. Select **Solutions** from the navigation bar.
1. Select the unmanaged solution that you want to export, and then select **Export**. You can't export managed solutions. More information: [Managed and unmanaged solutions](/power-platform/alm/solution-concepts-alm#managed-and-unmanaged-solutions)
1. The **Before you export** right pane appears. Choose from the following options, and then select **Next**:  
    - **Publish all changes**. Notice that, when you export an unmanaged solution, only published components are exported. We recommend that you select **Publish all changes** to make sure all components are included in the exported solution. 
    - **Check for issues**. Run the solution checker against the solution to detect performance and stability issues.
1. The **Export this solution** right pane appears. Enter or select from the following options, and then select **Export**:  
    - **Version number**: Power Automate automatically increments your solution version while displaying the current version. You can accept the default version or enter your own. 
    - **Export as**: Select the package type, either **Managed** or **Unmanaged**. More information: [Managed and unmanaged solutions](/power-platform/alm/solution-concepts-alm#managed-and-unmanaged-solutions)

 The export can take several minutes to complete. Once finished, the export .zip file is available in the download folder specified by your web browser.

> [!NOTE]
> To implement healthy application lifecycle management (ALM) in your organization, consider using a source control system to store and collaborate on your solutions, and automate the solution export process. More information: [ALM basics](/power-platform/alm/basics-alm) in the Power Platform ALM guide.

> [!NOTE]
> Once a flow is solution-aware and in Dataverse, then it must be exported in a solution as described above. Exporting a solution flow from the flow details page will no longer be possible. 

## Learn more


* [Create a solution](./overview-solution-flows.md)
* [Create a cloud flow in a solution](./create-flow-solution.md)
* [Import a solution](./import-flow-solution.md)
* [Edit a solution-aware flow](./edit-solution-aware-flow.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
