---
title: Learn to connect to your data using connections and on-premises data gateways (contains video) | Microsoft Docs
description: Add or manage connections to SharePoint, SQL Server, OneDrive for Business, Salesforce, Microsoft 365, OneDrive, Dropbox, Twitter, Google Drive, and more
services: ''
suite: flow
documentationcenter: na
author: MSFTMan
manager: tapanm
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/08/2022
ms.author: Deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Manage connections in Power Automate

Power Automate uses *connections* to make it easy for you to access your data while building flows. Power Automate includes commonly used connections, including SharePoint, SQL Server, Microsoft 365, OneDrive for Business, Salesforce, Excel, Dropbox, Twitter, and more. Connections are shared with Power Apps, so when you create a connection in one service, the connection shows up in the other service.

Here's a quick video on managing connections.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWKZQq]

You can use connections to perform these tasks:

- Update a SharePoint list.
- Get data from an Excel workbook in your OneDrive for Business or Dropbox account.
- Send email in Microsoft 365.
- Send a tweet.

You can create a connection in multiple scenarios, including:

- Creating a [flow from a template](./get-started-logic-template.md).

- Creating a [flow from a blank](./get-started-logic-flow.md), or updating an existing flow.

- Creating a connection in [Power Automate](https://flow.microsoft.com/).

>[!TIP]
> For detailed information about using SharePoint with Power Automate, see the [SharePoint documentation](/sharepoint/dev/business-apps/power-automate/sharepoint-connector-actions-triggers).

## Add a connection

1. In [Power Automate](https://flow.microsoft.com/), sign in with your work or organization account.

1. On the left pane, select **Data** > **Connections**.

   ![Screenshot showing the Connections option.](media/add-manage-connections/data-connections-link.png)

1. At the top of the page, select **New connection**.

1. In the list of available connections, choose the connection that you want to
    set up (such as SharePoint) by selecting the plus sign (**+**).

   ![List of connections that can be configured.](media/add-manage-connections/new-connections-list.png)

1. To find a particular connection option, enter the connector name into the search box that's located in the top right corner of the page, below the settings and help buttons.

1. Follow the steps to enter your credentials to configure the connection.

   > [!TIP]
   > You can find all the connections that you've created under **Data** > **Connections**.

## Connect to your data through an on-premises data gateway

Some connectors, such as the SharePoint connector, support the on-premises data gateway. To create a connection that uses a gateway:

1. Follow the steps earlier in this topic to [add a connection](#add-a-connection).

1. In the list of available connections, select **SharePoint**.

1. Select the **Connect using on-premises data gateway** option.

   ![Select the on-premises option.](media/add-manage-connections/select-on-prem-option.png)

1. Provide the connection's credentials, and then select the gateway that you want to use. More information: [Manage gateways](./gateway-manage.md) and [Understand gateways](./gateway-reference.md)

> [!NOTE]
> After the connection is configured, it's listed in **Connections**.

## Delete a connection

1. Go to **Data** > **Connections**, and select the connection that you want to delete.

1. Select **…** to view more commands, and then select **Delete**.

   ![Select Delete to delete the connection.](media/add-manage-connections/delete-connection.png)

1. Select **Delete** to confirm that you would like to delete the connection.

   ![Delete connection confirmation.](media/add-manage-connections/delete-connection-confirmation.png)

When you delete a connection, it's removed from both Power Apps and Power Automate.

## Update a connection

You can update a connection that isn't working because your account details or your password changed.

1. Go to **Data** > **Connections**, and then select the **Fix connection** link for the connection that you want to update.

   ![Select the link to fix the connection.](media/add-manage-connections/fix-connection-link.png)

1. When prompted, update your connection with new credentials.

When you update a connection, it's updated for both Power Apps and Power Automate.

## Find which apps and flows use a connection

You can identify the apps and flows that use a connection to understand how the connection is used.

1. Go to **Data** > **Connections**, and then select the connection that you want to learn more about.

1. Select **…** to view more commands, and then select **Details** to see the details for the connections, including the status and the date it was created.

1. To view apps that use the connection, select **Apps using this connection**.

1. To view flows that use the connection, select **Flows using this connection**.

## Troubleshoot connections

### Connection ownership by a different account

Per the policies in your organization, you might need to use the same account to sign in to Power Automate and to create a connection to SharePoint, Microsoft 365, or OneDrive for Business.

For example, you might sign in to Power Automate with *yourname@outlook.com* but receive an error when you try to connect to SharePoint with *yourname@contoso.com*. You can instead sign in to Power Automate with *yourname@contoso.com* and you'll be able to connect to SharePoint.

### Deprecation of the Power Automate Management connector's third-party authentication option

The [Power Automate Management connector](/connectors/flowmanagement/) authentication option for [third party](/connectors/flowmanagement/#third-party-deprecated) was deprecated in June 2020 and will no longer work after October 1, 2022.

Follow these steps to replace third party authentication connections.

1. Find the third party authentication connection you want to replace, and then delete it.
1. Create a "first party authentication" connection.
1. Add the new connection on the flows that need it.

#### Find Power Automate Management connections as an admin

If you are an admin, you can find these problematic connections using a repeatable pattern that can be automated in a flow with the help of some admin connectors: 

1. **Find environments** using [List environments as admin](/connectors/powerplatformforadmins/#list-environments-as-admin)
1. **Find connections** in those environments using [Get Connections as admin](/connectors/powerappsforadmins/#get-connections-as-admin)
1. **Find connections to be replaced** with id="shared_flowmanagement" and properties.connectionParametersSet.name="thirdParty" using a Parse JSON action with conditions 
1. Then finally, **Get connection details** including the connection display name and the creator who should replace the connection
  
Once you have that list of connections, reach out to the connection owners to let them know that the connections should be replaced.

#### Finding Power Automate Management connections as a user
If you are a non-admin user, you can find your Power Automate Management connections and learn about the apps and flows that use each connection before replacement.

If you don't know what authentication option was used on the Power Automate Management connection, you could create a flow and use the [List my connections](/connectors/flowmanagement/#list-my-connections) action to see the advanced connection metadata, or delete the existing connection and replace it with a new connection using the **Authentication Type** of **First Party**.

[!INCLUDE[footer-include](includes/footer-banner.md)]
