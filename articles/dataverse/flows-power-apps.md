---
title: Use Dataverse-based flows in Power Apps | Microsoft Docs
description: Use Dataverse-based flows in Power Apps.
services: ''
suite: flow
documentationcenter: na
author: MSFTMan
manager: KVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/27/2021
ms.author: Deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---


# Use Dataverse-based flows in Power Apps  

Power Apps is a suite of apps, services, connectors, and data platform that provides a rapid application development environment to build custom apps for your business needs. Use Power Apps, to quickly build custom business apps that connect to your business data that’s stored *either* in the underlying data
platform ([Microsoft Dataverse](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)) *or* in various cloud and on-premises data sources, such as SharePoint, Microsoft 365,
Dynamics 365, SQL Server, and so on. 

![A picture containing text, screenshot, indoor Description automatically generated](../media/flows-power-apps/53bd97cb6b498c0c230cb5c92a8ce43e.png)

 

Apps built using Power Apps provide rich business logic and workflow capabilities to transform your manual business processes to digital, automated processes. Further, apps built using Power Apps have a responsive design, and can run seamlessly in browser or on mobile devices (phone or tablet). 

With Power Apps you can create [Canvas apps](https://docs.microsoft.com/powerapps/maker/canvas-apps/) and [Model-driven apps](https://docs.microsoft.com/powerapps/maker/model-driven-apps/), and both support using data stored in Microsoft Dataverse. You can use the Microsoft Dataverse connector in Power Automate to integrate your apps with an automated flow, setting them off whenever users push the associated button.

For more information about when to use Power Apps: 

- Watch [Power Apps demos](https://powerapps.microsoft.com/demo/) 

- Watch videos on the [Power Apps channel](https://www.youtube.com/channel/UCGfWR2ekfRFckLjev6eQYLg) on
    YouTube. 

 
## Canvas apps 

You can associate any button in a canvas app with a Power Automate flow that
uses the Microsoft Dataverse. Each time the canvas app user hits the button,
the associated flow runs in the background. 

1. Edit an existing canvas app, or create one by following the steps
    in [Create a canvas app from Microsoft Dataverse in Power Apps](https://docs.microsoft.com/powerapps/maker/canvas-apps/data-platform-create-app). Then go to the **Insert** menu and add a **Button** as shown here. 

   ![Add a button to a canvas app](../media/flows-power-apps/e8b786034944426d880af93cf28ad6f6.png)
 

1.  Select the button.

2.  Select the **Action** menu.

3.  Add a **Power Automate** flow by choosing an existing flow or creating a
    new one from the panel that appears on the right. If the flow requires any
    parameters, this step will prompt you to specify them in the formula bar. 

   ![Choose a flow or add a new one](../media/flows-power-apps/4638ca0fc8c68c60c9f128de603dcf57.png)

1. Be sure to use the Power Apps trigger as shown here. 

   ![Use the Power Automate trigger](../media/flows-power-apps/e6e061518de31812c0773bd98440e2f8.png)


1.  Create the flow as shown here. 

   ![Create the flow](../media/flows-power-apps/2256f5cbd86659605888d916830ac90b.png)

