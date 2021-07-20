## What is an environment:
An environment is a virtual space used to store, manage and share apps, flows, and business data in Microsoft Dataverse. Environments are geolocated so all apps and data stored within an environment's database are geolocated as well.  

## Terms you should get familiar with

| **Term** | **Description** |
| --- | --- |
| **Admin center** |The admin center is a [Web portal](https://admin.powerplatform.microsoft.com/) for managing all your environments and data loss prevention policies. |
| **Microsoft Dataverse** |Microsoft Dataverse allows you to add data storage and modeling capabilities to your apps. |
| **Environment roles** |The two environment roles are Environment Admin and Environment Maker. |
| **User roles** |The two default user roles are Organization User and Database Owner. You can add roles, and associate permissions with those roles. |

## Purposes for an environment
You can use environments to:  

* Separate apps, flows and business data based on different roles, security requirements or users.  
* Separate apps, flows and business data based on the location of your teams or departments.
* Manage test and production environments.  

## How to use environments
Environments can serve several different purposes, depending on your organizational needs, some examples are:  

* You can choose to build all your apps and flows in a single environment. 
* You could choose to create an environment for different types of apps and flows. For example, you could create an environment for test and another environment for production.  
* You may also choose to create environments based on your organizational structure or even based on geographic location of your teams or departments. For example, if you have teams in Australia, Mexico and Europe, you could create an environment for each of these locations and manage them independently.  

**Note**: Environments are not visible to users so they don't need to be concerned with which environments they are in. Environments are a tool for admins to categorize, manage and share organizational apps and flows.  

## What are roles?
A person with access to an environment must be assigned either the **Environment Admin** or the **Environment Maker** role. Environment admins can perform all administrative tasks on an environment. An environment maker can create resources in an existing environment. An individual can have both roles simultaneously.  

**Note**: All users will have access to a default environment when each user is given access to Power Automate. Users can have access to multiple environments.  

## Create an environment
You create environments from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with these steps:  

1. Name your environment.
2. Select a region where your environment will be hosted.
3. Optionally you can decide to create a database for your environment. You can create a database after you've created an environment, if you desire.
4. Optionally select who will have access to the database. You can either restrict access or give everyone access to the database. 

## Add users to an environment
After you create an environment, you can add users to either the Environment Admin role or the Environment Maker role. As with all other administrative tasks, you do this from the admin center.  

After you've created the environment and added users, you may also want to create a data loss prevention (DLP) policy to help manage the use of your business data. We'll cover that in the next topic. 

