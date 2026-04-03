---
title: Manage connections in Power Automate
description: Add or manage connections to SharePoint, SQL Server, OneDrive for Business, Salesforce, Microsoft 365, OneDrive, Dropbox, Twitter, Google Drive, and more.
suite: flow
author: kewaiss
contributors:
  - schabungbam
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 06/25/2025
ms.author: matow
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-image-nochange
---

# Manage connections in Power Automate

Power Automate uses *connections* to make it easy for you to access your data while building flows. Power Automate includes commonly used connections, including SharePoint, SQL Server, Microsoft 365, OneDrive for Business, Salesforce, Excel, Dropbox, Twitter, and more. Connections are shared with Power Apps, so when you create a connection in one service, the connection shows up in the other service.

## Fix a broken connection

If your flow stopped working because of a connection error, start here.

### Quick diagnosis

| Error or symptom | Likely cause | Fix |
|---|---|---|
| **401 Unauthorized** or "invalid credentials" | Your password changed, MFA was updated, or the token expired | [Re-authenticate the connection](#re-authenticate-a-connection) |
| **403 Forbidden** | A DLP policy blocks this connector, or you lack permissions to the data source | [Check DLP policies](#check-dlp-policies) |
| **Connection not found** or "connection was deleted" | Someone removed the connection, or it was cleaned up by an admin | [Create a new connection](#add-a-connection) and update the flow |
| **Gateway offline** or "gateway unreachable" | The on-premises data gateway service is stopped or unreachable | [Troubleshoot the gateway](/data-integration/gateway/service-gateway-tshoot) |
| **The connection works in the portal but the flow still fails** | The flow uses a different connection than the one you fixed | [Verify which connection the flow uses](#verify-flow-connections) |

### Re-authenticate a connection

This is the most common fix. Connections use OAuth tokens that expire when your password changes, your MFA enrollment changes, or the token's lifetime expires (typically 90 days for some connectors).

1. Go to [make.powerautomate.com](https://make.powerautomate.com) > **Connections** (left navigation, under **Data**).
2. Find the broken connection. It shows a warning icon or **Error** status.
3. Select the three dots (**...**) next to the connection, then select **Fix connection** or **Edit**.
4. Sign in again with your credentials. Complete any MFA prompts.
5. After re-authenticating, go back to your flow and select **Test** > **Manually** to verify it runs.

> [!TIP]
> If you re-authenticated but the flow still fails, open the flow in the designer and check the **Flow checker** (top right). It highlights any steps that still reference a broken or different connection.

### Check DLP policies

Data Loss Prevention (DLP) policies set by your admin can block specific connectors or prevent connectors in different groups from being used together in the same flow.

1. If you see a 403 error mentioning policy, contact your Power Platform admin.
2. Admins can check DLP policies in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) > **Policies** > **Data policies**.
3. Look for policies that classify your connector in a different group than the other connectors in your flow.

For more information, see [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention).

### Verify flow connections

A flow can have multiple connections, and each step can use a different one. To check which connection a specific step uses:

1. Open the flow in the designer.
2. Select the step that is failing.
3. In the step details, look for the **Connection** field. It shows the connection name and the account it is signed in as.
4. If the connection shows a warning, select **Fix connection** and re-authenticate.

## Prevent connection failures

### Use service principal connections for production flows

Personal connections break when the user changes their password, leaves the organization, or has their account disabled. For flows that run in production, use a [service principal connection](/power-automate/connect-with-service-principal) instead. Service principals:

- Don't depend on a specific person's credentials
- Don't expire when someone changes their password
- Can be managed centrally by IT
- Support certificate-based authentication (no passwords to rotate)

### Monitor connection health

Set up a scheduled flow that runs daily and checks the status of your critical connections using the [Power Automate Management connector](/connectors/connector-reference/connector-reference-powerautomate-management). If a connection enters an error state, the flow can send a notification before your production flows start failing.

> [!TIP]
> For organizations with many flows, the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) provides a **Connections** view where admins can see all connections in an environment, including their status and owner.

Here's a quick video on managing connections.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=9d210b7d-5449-4da2-9ee8-62d049617cbd]

You can use connections to perform these tasks:

- Update a SharePoint list.
- Get data from an Excel workbook in your OneDrive for Business or Dropbox account.
- Send email in Microsoft 365.
- Send a tweet.

You can create a connection in multiple scenarios, including:

- Creating a [flow from a template](./get-started-logic-template.md).

- Creating a [flow from a blank](./get-started-logic-flow.md), or updating an existing flow.

- Creating a connection in [Power Automate](https://make.powerautomate.com).

>[!TIP]
> For detailed information about using SharePoint with Power Automate, see the [SharePoint documentation](/sharepoint/dev/business-apps/power-automate/sharepoint-connector-actions-triggers).

## Add a connection

1. Sign in to [Power Automate](https://make.powerautomate.com/).

1. On the left navigation pane, select **Data** > **Connections**.

    :::image type="content" source="media/add-manage-connections/data-connections-link.png" alt-text="Screenshot of the Connections menu option.":::

1. At the top of the page, select **New connection**.

1. In the list of available connections, choose the connection that you want to
    set up (such as SharePoint) by selecting the plus sign (**+**).

    :::image type="content" source="media/add-manage-connections/new-connections-list.png" alt-text="Screenshot of the connections that can be configured.":::

1. To find a particular connection option, enter the connector name into the search box that's located in the top right corner of the page, below the settings and help buttons.

1. Follow the steps to enter your credentials to configure the connection.

   > [!TIP]
   > You can find all the connections that you've created under **Data** > **Connections**.

## Connect to your data through an on-premises data gateway

Some connectors, such as the SharePoint connector, support the on-premises data gateway. To create a connection that uses a gateway:

1. Follow the steps earlier in this topic to [add a connection](#add-a-connection).

1. In the list of available connections, select **SharePoint**.

1. Select the **Connect using on-premises data gateway** option.

    :::image type="content" source="media/add-manage-connections/select-on-prem-option.png" alt-text="Screenshot of the on-premises option.":::

1. Provide the connection's credentials, and then select the gateway that you want to use. More information: [Manage gateways](./gateway-manage.md) and [Understand gateways](./gateway-reference.md)

> [!NOTE]
> After the connection is configured, it's listed in **Connections**.

## Delete a connection

When you delete a connection, it's removed from both Power Apps and Power Automate.

1. Go to **Data** > **Connections**, and select the connection that you want to delete.

1. Select **…** to view more commands, and then select **Delete**.

    :::image type="content" source="media/add-manage-connections/delete-connection.png" alt-text="Screenshot of the Delete option.":::

1. Select **Delete** to confirm that you would like to delete the connection.

## Update a connection

You can update a connection that isn't working because your account details or your password changed. When you update a connection, it's updated for both Power Apps and Power Automate.

1. Go to **Data** > **Connections**, and then select the **Fix connection** link for the connection that you want to update.

    :::image type="content" source="media/add-manage-connections/fix-connection-link.png" alt-text="Screenshot of the Fix connection option.":::

1. When prompted, update your connection with new credentials.

## Find which apps and flows use a connection

You can identify the apps and flows that use a connection to understand how the connection is used.

1. Go to **Data** > **Connections**, and then select the connection that you want to learn more about.

1. Select **…** to view more commands, and then select **Details** to see the details for the connections, including the status and the date it was created.

1. To view apps that use the connection, select **Apps using this connection**.

1. To view flows that use the connection, select **Flows using this connection**.

## Troubleshoot connections

### Connection ownership by a different account

Per the policies in your organization, you might need to use the same account to sign in to Power Automate and to create a connection to SharePoint, Microsoft 365, or OneDrive for Business, for example.

For example, you might sign in to Power Automate with *yourname@outlook.com* but receive an error when you try to connect to SharePoint with *yourname@contoso.com*. You can instead sign in to Power Automate with *yourname@contoso.com* and you'll be able to connect to SharePoint.

### Deprecation of the Power Automate Management connector's third-party authentication option

The [Power Automate Management connector](/connectors/flowmanagement/) authentication option of [third party](/connectors/flowmanagement/#third-party-deprecated) was deprecated in June 2020 and will no longer work after October 1, 2022. 

Follow these steps to replace third party authentication connections.

1. Find the third party authentication connection you want to replace, and then delete it.
1. Create a "first party authentication" connection.
1. Add the new connection on the flows that need it.

#### Find Power Automate Management connections as an admin

If you are an admin, you can find these problematic connections using a repeatable pattern that can be automated in a flow with the help of some admin connectors: 

1. Find the environments using [List environments as admin](/connectors/powerplatformforadmins/#list-environments-as-admin).
1. Find the connections in those environments using [Get Connections as admin](/connectors/powerappsforadmins/#get-connections-as-admin).
1. Find the connections to be replaced with **id="shared_flowmanagement" and properties.connectionParametersSet.name="thirdParty"** using a Parse JSON action with conditions .
1. Then finally, get the connection details, including the connection display name and the creator who should replace the connection.
  
After you have that list of connections, contact the connection owners to let them know that the connections should be replaced.

#### Find Power Automate Management connections as a user
If you are a non-admin user, you can find your Power Automate Management connections and learn about the apps and flows that use each connection before replacement.

If you don't know what authentication option was used on the Power Automate Management connection, you could create a flow and use the [List my connections](/connectors/flowmanagement/#list-my-connections) action to see the advanced connection metadata, or delete the existing connection and replace it with a new connection using the **Authentication Type** of **First Party**.

#### Deprecation of the Power Automate Management connector's legacy default authentication option

The [default](/connectors/flowmanagement/#default-deprecated) authentication option was also deprecated in June 2020, however, it was immediately hidden so that it couldn't be used from that date. All connections with the authentication of [default](/connectors/flowmanagement/#default-deprecated) were created prior to June 2020. Those connections should also be replaced. If you use the [Get Connections as admin](/connectors/powerappsforadmins/#get-connections-as-admin) action, those connections will have id="shared_flowmanagement" and properties.connectionParametersSet.name="".

## Common connection errors reference

| Error code or message | Connector types affected | Cause | Resolution |
|---|---|---|---|
| **401 Unauthorized** | All OAuth connectors | Token expired, password changed, MFA enrollment changed | Re-authenticate: **Connections** > select connection > **Fix connection** |
| **403 Forbidden** | All connectors | DLP policy violation, insufficient permissions on the data source, or the app registration was disabled in Entra ID | Check DLP policies; verify user has access to the underlying data source |
| **404 Connection not found** | All connectors | Connection was deleted by user or admin, or was part of a removed solution | Create a new connection and update the flow to use it |
| **409 Conflict** | SharePoint, Dataverse | Concurrent connection modifications, or connection reference mismatch after solution import | Re-import the solution and remap connection references during import |
| **Gateway unreachable** | SQL Server, File System, SAP, Oracle, and other on-premises connectors | On-premises data gateway service stopped, machine offline, or network connectivity lost | Restart the gateway service on the gateway machine; verify the machine can reach `*.servicebus.windows.net` on port 443 |
| **"Connection not configured for this service"** | Custom connectors, Dataverse | Connection reference in a solution flow points to a connection that doesn't exist in this environment | Create the required connection, then update the connection reference in **Solutions** > your solution > **Connection References** |
| **AADSTS700024 or "client assertion is not within its valid time range"** | Service principal connections | Certificate used by the service principal has expired | Upload a new certificate to the app registration in Entra ID, then update the connection |

## Related information

[Training: Streamline SharePoint processes with Power Automate (module)](/training/modules/streamline-processes/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
