---
title: Create a connection with a service principal
description: This article describes how to create a connection for a desktop flow by using a service principal
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
ms.reviewer: matp
ms.date: 01/24/2025
ms.topic: overview
---

# Create a connection with a service principal

There are two solutions to use a connection with a service principal:

1. Create a connection using the service principal. This article details this solution.
1. Create a connection with a user principal and share it to a service principal. Learn more in [Set a run owner on a Desktop Flow connection](/power-automate/desktop-flows/how-to/set-runowner-desktopflowconnection).

To create a connection with a service principal, the best approach is to register the machine using a [service principal with silent registration](/power-automate/desktop-flows/machines-silent-registration#using-a-service-principal-account). Alternatively, you can give permissions to the service principal on the machine or the machine group and then create a connection using the service principal.

## Give permissions on the machine or machine group

To give permissions on the machine:

1. Sign into [Power Automate](https://make.powerautomate.com), and then select **Machines** on the left navigation pane. If the item isn’t in the left navigation pane, select **… More** and then select the item you want.
1. Select the machine or machine group you want to share.
1. Select **Share**, and then search for and select the **Application User AAD** in your Dataverse instance.
1. Select **User**, and then select **Save**.

:::image type="content" source="./media/share-sp.png" alt-text="Screenshot of share panel for a machine":::

## Create the connection using a service principal

Once you have shared the machine with the application user, create the connection. You need to create the connection as the service principal. Creating a connection as a service principal isn't supported with the Power Automate web portal. This is currently only supported with a direct call to the Web API.

### Request an access token

First, request an access token to interact with the Power Platform API. More information: [Request an access token](/power-platform/admin/programmability-authentication-v2#step-5-request-an-access-token).

### Get the group ID of the machine or group

To be able to create the connection, get the group ID associated with the machine or machine group.

- If it's a group, you can go to **Monitor** > **Machines** > **Machine groups** and select the group. You can then get the group ID from the URL.
- If it's a machine, go to **Data** > **Tables** > **All** > **Flow Machine  Group**. Search for your machine in the list and display the column **Flow Machine Group**, it's the group ID associated with your machine.

### Create a connection using your service principal

To create a connection, send an `HTTP PUT` to the Power Apps API to create the connection, using the access token that you obtained earlier.

```HTTP
PUT https://{ENVIRONMENT_ID_URL}.environment.api.powerplatform.com/connectivity/connectors/shared_uiflow/connections/{CONNECTION_ID}?api-version=1
Content-Type: application/json
Host: {ENVIRONMENT_ID_URL}.environment.api.powerplatform.com
Accept: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJu...
BODY:
{
    "properties":
    {
        "environment":
        {
            "id": "/providers/Microsoft.PowerApps/environments/{ENVIRONMENT_ID}",
            "name":"{ENVIRONMENT_ID}"
        },
        "connectionParametersSet":
        {
            "name":"azureRelay",
            "values":
            {
                "username":{"value":"{MACHINE_ACCOUNT}"},
                "password":{"value":"{MACHINE_PASSWORD}"},
                "targetId":{"value":"{GROUP_ID}"}
            }
        }
    }
}
```

The above example contains placeholders:

- `ENVIRONMENT_ID_URL`: The environment ID, with all separators removed, and the last two characters separated by a period. (Example: *37520647-dbdf-49fa-ba01-6134c14680c4 -> 37520647dbdf49faba016134c14680.c4*).
- `ENVIRONMENT_ID`: The environment ID.
- CONNECTION_ID: The connection ID used to create the connection. It needs to be a valid GUID. (You can use the `New-Guid` PowerShell command to get this).
- `MACHINE_ACCOUNT`: The username of the account used to open a Windows session.
- `MACHINE_PASSWORD`: The password for the account.
- `GROUP_ID`: The group ID you want to create the connection for. More information: [Get the group ID of the machine or group](#get-the-group-id-of-the-machine-or-group)

Once the request is completed, save the connection ID that you used in your request. You'll use it in the next step to [Prepopulate connection references for automated deployment](/power-platform/alm/conn-ref-env-variables-build-tools).

## Next steps

- [Prepopulate connection references for automated deployment](/power-platform/alm/conn-ref-env-variables-build-tools)
