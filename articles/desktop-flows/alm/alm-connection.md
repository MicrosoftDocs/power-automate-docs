---
title: Create a connection with a service principal
description: This section describes how to create a connection for Desktop Flow by a Service Principal
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
---

# Create a connection with a Service Principal
To be able to create a connection with a Service Principal, you first need to give permissions to the Service Principal on the machine or the machine group.

## Give permissions on the machine or machine group
To give permissions on the machine:
1. Go to **Monitor** > **Machines**
2. Click on the machine or machine group you want to share.
3. Click on the **Share** button.
4. Search for the Application User in your Dataverse instance.
5. Once selected, choose **User** and click on **Save**.

:::image type="content" source="./media/share-sp.png" alt-text="Screenshot of share panel for a machine":::

## Create a connection with a Service Principal
Once you have shared the machine with the application user, we can create the connection. We need to create the connection as the service principal, therefore we can't use the Portal.

### Request an access token
First step is to request an access token to interact with Power Platform API using this [documentation](/power-platform/admin/programmability-authentication-v2#step-5-request-an-access-token).

### Get the group id of the machine or group.
To be able to create the connection, we need to get the group id associated with our machine or machine group.

- If it's a group, you can go to **Monitor** > **Machines** > **Machine groups** and click on the group. You can then get the group id from the url.
- If it's a machine, you need to go to **Data** > **Tables** > **All** > **Flow Machine  Group**. Search for your machine in the list and display the column **Flow Machine Group**, it's the group id associated with your machine. 

### Create a connection using your Service Principal.
To create a connection, you need to send an HTTP PUT to Power Apps API to create the connection, using the access token that we obtain earlier.

```HTTP
Content-Type: application/json
Host: https://{ENVIRONMENT_ID_URL}.environment.api.powerplatform.com
Accept: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJu...
PUT https://{ENVIRONMENT_ID_URL}.environment.api.powerplatform.com/connectivity/connectors/shared_uiflow/connections/{CONNECTION_ID}?api-version=1
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
- ENVIRONMENT_ID_URL: The environment id, with all separator removed, and the last character separated by a dot.  (Example: 41a2170d78d5ebfd8c7ec78fe561c67.c)
- ENVIRONMENT_ID: The environment id.
- CONNECTION_ID: The connection id use to create the connection. It needs to be a valid Guid. (You can use the `New-Guid` PowerShell command).
- MACHINE_ACCOUNT: The username of the account used to open a Windows session.
- MACHINE_PASSWORD: The password the account.
- GROUP_ID: The group id we want to create the connection for. Refer to the section `Get the group id of the machine or group`.

Once the request is completed, save the connection id that you use in your request, we'll use it in the next step.

### Next
- [Prepopulate connection references for automated deployment](/power-platform/alm/conn-ref-env-variables-build-tools)

