<properties
   pageTitle="All about environments | Microsoft Flow"
   description="Learn about environments in Microsoft Flow"
   services=""
   suite="flow"
   documentationCenter="na"
   authors="msftman"
   manager="anneta"
   editor=""
   tags=""
   featuredVideoId="wnScBLz7css"
   courseDuration="5m"/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="11/24/2016"
   ms.author="deonhe"/>


# Learn all about Microsoft Flow environments

## What is an environment:
A virtual space used to store, manage and share apps, flows and business data within the [common data service](https://powerapps.microsoft.com/blog/powerapps-cds-ga/). Environments are geolocated so all apps and data stored within an environment's database are geolocated as well.  

## Terms you should get familiar with
Term|Description
-----|-----
**Admin center**|[Web portal](https://admin.flow.microsoft.com) for managing all your environments and data loss prevention policies.
**Common data service**|The [common data service](https://powerapps.microsoft.com/blog/powerapps-cds-ga/) allows you to add data storage and modeling capabilities to your PowerApps. 
**Users**|These can be either environment admins or environment makers.
**Roles**|The two roles are environment admin or environment maker.


## Purposes for an environment

You can use environments to:  
- Separate apps that may have different roles, security requirements or users.  
- Manage test and production environments.  
- Separate apps, flows and business data based on the location of your teams or departments.  

## How to use environments:
Environments can serve several different purposes, depending on your organizational needs, some examples are:
- You can choose to build all your apps in a single environment
- You could choose to create an environment for different types of apps. For example, you could create an environment for test apps and another environment for production apps.  
- You may also chose to create environments based on your organizational structure or even based on geographic location of your teams or departments. For example, if you have teams in Australia, Mexico and Europe, you could create an environment for each of these locations and manage them independently.  

**Note**: Environments are not visible to users so users don't need to be concerned with which environments she/he is in. Environments are a tool for admins to categorize, manage and share organizational apps.  

## What are roles
A person with access to an environment must be be assigned either the **environment admin** or the **environment maker** role. Environment admins can perform all administrative tasks on an environment. An environment maker can create resources in an existing environment.  

**Note**: All flow users will have access to a default environment when each user is given access to flow. Users can have access to multiple environments.  

## Create an environment
You create environments from the [flow admin center](https://admin.flow.microsoft.com) with just two steps:
1. Name your environment.
2. Select a region where your environment will be hosted.
3. Optionally you can decide to create a database for your environment. You can create a database after you've created an environment, if you desire.
4. Optionally select who will have access to the environment. You can either restrict access or give everyone access to the environment. However, you can only give access to an environment if you opted to create a database for the environment. 

## Add users to an environment
After you create an environment, you can add users to either the environment admin role or the environment maker role. As with all other administrative tasks, you do this from the admin center.  

After you've created the environment and added users, you may also want to [create a data loss prevention (DLP) policy](../prevent-data-loss.md) to help manage the use of your business data.  

## Next steps  
- [Learning - Flow parts](./learning-flow-parts.md)
- [Learning - Introduction to Flow](./learning-introducing-flow.md)  
- [Introduction to data loss prevention](../prevent-data-loss.md)  
