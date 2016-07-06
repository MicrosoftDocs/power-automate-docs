<properties
    pageTitle="Manage connections | Microsoft Flow"
    description="Add or manage connections to SharePoint, SQL, OneDrive for Business, Salesforce, Office 365, OneDrive, DropBox, Twitter, Google Drive and more"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="stepsic-microsoft-com"
    manager="erikre"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="04/23/2016"
   ms.author="stepsic"/>

# Manage connections in Microsoft Flow
Connections in Microsoft Flow allow you to easily access your data while building flows. Flow includes commonly used connections, including SharePoint, SQL, Office 365, OneDrive for Business, Salesforce, Excel, Dropbox, Twitter, and more. Connections are shared with Microsoft PowerApps, so when you create a connection in PowerApps, it shows up in Microsoft Flow, and vice-versa.

For example, you can use connections to:

- Update a list on a SharePoint site.
- Get Excel data from your OneDrive for Business or Dropbox account.
- Connect to Office 365 and send email.
- Create a Twitter connection to send a tweet.

You can create connections in Microsoft Flow in multiple scenarios, such as:

- Creating a [flow from a template](get-started-logic-template.md)

- Creating a [flow from blank](get-started-logic-flow.md) or updating an existing flow

- Creating a connection in the [Microsoft Flow portal][1]

This topic shows you how to manage connections in the [Microsoft Flow portal][1].

### What you need to get started

- Sign in to the [Microsoft Flow portal][1].

## Add a connection to Microsoft Flow
1. In the [Microsoft Flow portal][1], sign in with your work or organization account.

1. Select the **Account** menu at the top-right of the screen.

1. Select **My Connections**.

1. Select **Add a connection**.

1. From the list of **Available connections**, select the connection you want to set up, such as SharePoint Online. Then, enter your credentials to set up the connection

1. Once the connection is setup, it's listed in **My Connections**.

## Connect to your data via on-premise data gateway

As of this writing SQL Server and SharePoint are the two services that support the on-premises data gateway. To create connection that uses a gateway - 

1. Follow the steps to add a connection

1. From the list of **Available connections**, select the connection you want to set up eg. SQL Server. Then, select the "Connect via on-premise data gateway" checkbox as shown here.
  ![Create a connection using on-premise data gateway][2]

1. Configure the connection credentials and select the gateway you want to use. For details about how to install a gateway, see [Understanding gateways](gateway-reference.md). 

1. Once the connection is setup, it's listed in **My Connections**.

## Delete a connection
1. Go to the **My Connections** page, and select the connection you want to delete.

1. In the details view of the connection, select **Delete**.

When you delete a connection, it is removed from Microsoft PowerApps and Microsoft Flow.

## Update a connection

1. Go to the **My Connections** page, and select the edit icon.

2. When prompted, update your connection with new credentials.

When you update a connection, it will be updated for both Microsoft PowerApps and Microsoft Flow.

<!--Reference links in article-->
[1]: https://flow.microsoft.com
[2]: TODO
