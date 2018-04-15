---
title: Microsoft Flow GDPR Data Subject Export Requests  | Microsoft Docs
description: Learn how to use Microsoft Flow to respond to GPDR Data Subject Requests.  
services: ''
suite: flow
documentationcenter: na
author: keweare
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 4/17/2018
ms.author: keweare

---
# Responding to GDPR Data Subject Export Requests for Microsoft Flow

## Introduction

As part of our commitment to partner with you on your journey to the GDPR, we’ve developed  documentation to help you prepare. The documentation not only describes what we’re doing to prepare for the GDPR but also shares examples of steps you can take today with Microsoft to support GDPR compliance when using  Microsoft Flow.

## Manage export requests
The steps below describe how both user and administrative functions exist to serve export requests for GDPR.

## Prerequisites
You can perform the administrative operations that this document outlines if you sign in to the [PowerApps Admin Center](https://admin.powerapps.com/), sign in to the [Microsoft Flow Admin Center](https://admin.flow.microsoft.com/), or run [PowerApps Admin PowerShell cdmlets](https://go.microsoft.com/fwlink/?linkid=871804) with an account that has these permissions:
*	A paid or trial license for Flow/PowerApps Plan 2.
If you [sign up for a trial license](http://web.powerapps.com/trial), it will expire after 30 days.

*	[Office 365 Global Administrator](https://support.office.com/article/assign-admin-roles-in-office-365-for-business-eac4d046-1afd-4f1a-85fc-8219c79e1504) or [Azure Active Directory Global Administrator](https://docs.microsoft.com/azure/active-directory/active-directory-assign-admin-roles-azure-portal).


**Export a flow** 

Either an end user or an administrator can export a flow by following these steps:
1. Sign in to the [Microsoft Flow site](https://flow.microsoft.com/).
1. Select the **My flows** link, and then select the flow to export.
1. Select **… More**, and then select **Export**.
![Export flow](./media/gdpr-dsr-export/export-flow.png)
1. Select **Package (.zip)**.

Your flow will now be available as a zipped package. For more information, see the blog post about [how to export and import a flow](https://flow.microsoft.com/en-us/blog/import-export-bap-packages/).

**Export run history** 

Run history includes a list of all executions that have occurred for a specific flow. This data includes the flow’s status, start time, duration, and input/output data for triggers and actions.

Either an end user or an administrator can export this data by following these steps:

1.	Sign in to the [Microsoft Flow site](https://flow.microsoft.com/).
1.	Select the **My flows** link, and then select the flow for which you wan to export the run history.
1.	In the **Run History** pane, select **See all**.
![Run history](./media/gdpr-dsr-export/run-history.png)
1.  Select **Download CSV**.
![Download CSV](./media/gdpr-dsr-export/download-csv.png)
The run history is downloaded as a .csv file so that you can open it in Microsoft Excel or a text editor and further analyze the results.

**Export a user's activity feed** 

On the [Microsoft Flow site](https://flow.microsoft.com/), the activity feed shows a user’s history of activities, failures and notifications. Any user can view their activity feed by: 
1. Signing in to the [Microsoft Flow site](http://flow.microsoft.com/), selecting the bell icon near the upper-right corner, and then selecting **Show all activity**. 
![Show activity feed](./media/gdpr-dsr-export/show-activity-feed.png)
1. In the **Activity** screen, users can copy the results and then paste them into a document editor, such as Microsoft Word.
![Show activity feed](./media/gdpr-dsr-export/export-activity-feed.png)


**Export a list of a user’s connections**

Connections allow flows to connect to APIs, SaaS applications, and other third-party systems. Any user can view their connections by:
1. Signing in to the [Microsoft Flow site](http://flow.microsoft.com/), selecting the gear icon near the upper-right corner, and then selecting **Connections**.
![Show Connections](./media/gdpr-dsr-export/show-connections.png)
1. Users can copy the results and then paste them into a document editor, such as Microsoft Word.

**Export a list of a user’s connection permissions**

A user can export the connection role assignments for all connection that they have access to via the Get-ConnectionRoleAssignment function in the PowerApps PowerShell cdmlets:
![Export connection permissions](./media/gdpr-dsr-export/export-connection-permissions.png)

**Export a list of a user’s Custom connectors**
Custom Connectors supplement the existing out of box connectors and allow for connectivity to other APIs, SaaS and custom-developed systems. Custom Connector ownership may need to be transferred to other users in the organization or the Custom Connector can be deleted. To export a list of customer connectors, a user should:

1. Navigate to the [Microsoft Flow website](https://flow.microsoft.com).
1. Click on the settings **gear** icon.
1. Click on **Custom Connectors**.
1. Copy and paste the list of custom connectors into a text editor, such as Microsoft Word.
![Export custom connectors](./media/gdpr-dsr-export/export-custom-connectors.png)

In addition to the experience provided in the Microsoft Flow website, a Powershell cmdlets is also available to export all custom connectors they have created to via the Get-Connector function in the PowerApps PowerShell cdmlets:

![Export custom connectors powershell](./media/gdpr-dsr-export/export-custom-connectors-powershell.png)

**Export a list of a user’s Custom connector permissions**
A user can export all custom connector permissions they have created to via the Get-ConnectorRoleAssignment function in the PowerApps PowerShell cdmlets:

![Export custom connector permissions powershell](./media/gdpr-dsr-export/export-connector-permissions.png)

**Export approval history**

Microsoft Flow Approvals History captures a historical record of approvals that have been received or sent for a user. Any user can view their approval history by:
1. Signing in to the [Microsoft Flow site](http://flow.microsoft.com/), selecting **Approvals**, and then selecting **History**.
![View approval history](./media/gdpr-dsr-export/view-approval-history.png)
1. A list shows approvals that the user received. The users can show approvals that they sent by selecting the down arrow next to **Received** and then selecting **Sent**.
![View approvals received](./media/gdpr-dsr-export/view-received-approvals.png)

**Export user details from Microsoft Flow**

User details can be exported by calling a Powershell cmdlet which will be available soon. 


