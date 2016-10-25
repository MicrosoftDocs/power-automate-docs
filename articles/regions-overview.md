<properties
    pageTitle="Regions overview for Microsoft Flow | Microsoft Flow"
    description="Overview with question and answer about regions in Microsoft Flow"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="MandiOhlinger"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="10/24/2016"
   ms.author="mandia"/>

# Regions overview in Microsoft Flow

## Q & A

### Question: How do I find out where my data is stored?
All data is stored in the region that hosts the environment. For example, if your environment is created in the Europe region, then all your data is stored in Europe data centers. 

The Microsoft Flow administrator center shows you the region. This admin center is only available to Administrators: 

1. Go to [admin.flow.microsoft.com](https://admin.flow.microsoft.com), and sign-in with your work account. 
2. In the administrator center, all existing environments are listed, including the **Region** where your data is stored:  
    ![](media/regions-overview/environments-list.png)

### Question: What regions are available?
The following regions are available, or will be available: 

- **United States**
- **Europe**
- **Asia**
- **Australia**
- **India**
- **Japan**
- **United States (First Release)** (available after General Availability (GA)) 
- **Canada** (available after General Availability (GA)) 
- **United Kingdom** (available after General Availability (GA))  

### Question: What features are specific to a given region?

Environments can be created in different regions, and are bound to that geographic location. When you create a flow in an environment, that flow is stored in datacenters in that geographic location. This applies to any items you create in that environment, including common data model, flows, connections, gateways, PowerApps, and custom APIs.

For the optimal performance, if your users are in Europe, then create and use the environment in the Europe region. If your users are in the United States, then create and use the environment in the U.S. 

**Gateways**: 
- Currently not available in the **India** or **United States (First Release)** regions.
- Currently supported in the default environment. They are not supported in custom environments.

### Question: Where exactly are the datacenters located?

Microsoft does not publicly advertise all datacenters, but the [Office 365 datacenter map](http://o365datacentermap.azurewebsites.net/) provides more information.

### Question: Is Microsoft Flow available in national clouds?

No, Microsoft Flow is not currently available in the US Gov, Germany or China regions. Availability for national clouds is planned for 2017.

### Question: What is the "First Release" region?
This is a special region in the United States that gets new features before any other region. So when a new feature or new functionality is added, these changes are first deployed to this "First Release" region. There is typically a week between availablity in First Release and full global rollout, but it can vary from feature-to-feature.
