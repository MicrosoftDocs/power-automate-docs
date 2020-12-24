---
title: Monitor UI flows in the Center of Excellence | Microsoft Docs
description: Learn about trends, usage patterns, and more.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/23/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - flowadmin
---

# Monitor desktop flows all up analytics in Power Platform Admin Center and CoE Starter kit

As an admin or CoE (Center of Excellence) team, there are 2 ways you can monitor the analytics for all the desktop flows in your environment.

1. The most easy and straightforward way is to visit PPAC [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/analytics/flow) 
This feature is out of box, no installation required, and avaiable for everyone who has environment admin access.
Here are some details regarding this feature:
    1) As of today, you will be able to see 3 analytic reports for UI flows: Runs, Usage and Created. More reports will be coming in the future. 
    2) You can filter the reports by Environment and Time period (up to 28 days) that you are interested
    3) You can switch the reports between Flows and UI flows
    4) For all UI flows reports, you can further drill down to see the data only for differnt types of UI flows such as Power Automate Desktop, Selenium IDE or Windows recorder (V1)
    5) You can also drill down to see UI flows data for attended or unattended run modes
    6) The Runs report gives you an overview of daily, weekly and monthly UI flows statics, the trend and success/failure/cancel breakdowns. This will provide you the insights on how active people are using UI flows in this environment so you can predict how automation are helping business processes.
    7) The Usaga report will show you the top UI flows being used in this environment and their detail information so you can identify the most critical UI flows in the environment.
    8) The Created report shows you the analytics on recent created new UI flows so you can understand how active the makers are in each environment. 
    
2. As admin or CoE, you may have addtional requirement that the PPAC does not include yet. In that case, we also have a powerful, highly extensible and customizable solution for you, called Power Platform CoE Starter Kit. [Microsoft Power Platform Center of Excellence](https://docs.microsoft.com/power-platform/guidance/coe/power-bi-monitor#ui-flows).
[Here](https://flow.microsoft.com/en-us/blog/power-automate-ui-flows-are-available-in-coe-starter-kit/) is the full introduction about the UI flows capabilty in CoE starter kit.
You will have to download and install the starter kit into your environment. 

Using the CoE Starter Kit you can not only monitor and govern analytics across all environments, across all Power Platform products such as Power Apps, Power Automate Flows/UI flows and Power Virtual Agents, you can also create custom reports and alters that meet your unique needs.

Here are the details on how to get started to use CoE Starter Kit for UI flows.

Prerequisites
The following are prerequisites for installing the CoE Starter Kit as it's included in the solution.
•	Admin account:
o	Microsoft Power Platform service admin, global tenant admin, or Dynamics 365 service admin for access to all tenant resources through the Power Apps APIs.
o	This solution will work for environment admins, but the view will be restricted to only the environments an environment admin has access to.
o	Dynamics 365 service admin is required for getting details about model-driven apps and solution-aware flows.
•	Power Apps Premium license (per app, per user, or Dynamics 365 Online licenses) is required for using Common Data Service.
•	Environment with a Common Data Service instance, where the user installing the solution has the System Administrator security role.
•	The environment must have a DLP policy that allows Common Data Service, Common Data Service (current environment), Office 365 Users, Power Platform for Admins, Power Automate Management, Office 365 Outlook, Power Apps for Admins, Power Apps for Makers, SharePoint, Azure AD and HTTP to be used together. Those connectors must be in the business data–only bucket of the DLP policy for this environment. 
Setup
1.	Go to make.powerapps.com and select the Environment you want to install the CoE Starter Kit in
2.	Go to Data > Connections and create new connections for the following connectors. This will help speed up the import 
a.	Common Data Service
b.	Common Data Service (current environment)
c.	Power Apps for Admins
d.	Power Apps for Makers
e.	Power Platform for Admins
f.	Power Automate for Admins
g.	Power Automate Management
h.	Office 365 Users
i.	Office 365 Outlook
j.	Office 365 Groups
k.	SharePoint

3.	Go to Solutions > Import, Browse to the CenterofExcellenceCoreComponents.zip file and select Next 
4.	Establish the connections > either by selecting your connection from the drop down or clicking New Connection. 
Please note, there’s currently a limit to how many flows can use the same connection reference hence you will notice that you have to establish four CDS connections. 
 
5.	Configure the following two environment variables

Power Automate Environment Variable	For a US environment: https://us.flow.microsoft.com/manage/environments/
For an EMEA environment: https://emea.flow.microsoft.com/manage/environments/
For a GCC environment: https://gov.flow.microsoft.us/manage/environments/

Admin eMail	Email address used in flows to send notifications to admins; this should be either your email address or a distribution list
6.	The import can take up to 6 mins to run, as it’s a large solution – this notification bar will turn to green when it’s done
 
Populate data in the CDS entities
Open the Center of Excellence – Core Components solution and make sure all flows titled Admin | Sync Flow v2 (…) are turned on. If any sync flows are turned off, please turn them on.
Then click on Admin | Sync Template v2
 
Run this Flow twice by clicking on Run (some data population only kicks off on the second run, so for a test case it is ideal to run it twice immediately after each other)
 

The flow that gets Ui Flow Session data is configured to get the data on a daily basis, please run this flow manually to get some data by selecting Admin | Sync Template v2 (Ui Flow Runs) and also clicking on Run here
 

Configure the Power BI Dashboard
Follow these steps to get the Environment URL needed to configure the Power BI Dashboard:
https://docs.microsoft.com/power-platform/guidance/coe/setup-powerbi#get-the-environment-url
Follow these steps to configure the Power BI Dashboard to point to your environment – please use the .pbix file attached to the email:
https://docs.microsoft.com/power-platform/guidance/coe/setup-powerbi#option-2-configure-the-power-bi-dashboard-by-using-the-pbix-file

There is no need to configure the embedded apps in the dashboard, as they are not used for Ui Flow scenarios. 



## Learn more

- Analyze the [UI flows risk assessment](https://docs.microsoft.com/power-platform/guidance/coe/power-bi-govern#ui-flows-risk-assessment) in your environment.
- [Create desktop UI flows](create-desktop.md).
- [Create Web UI flows](create-web.md).
- Run [UI flows](run-ui-flow.md).
