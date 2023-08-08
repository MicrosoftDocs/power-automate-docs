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

:::image type="content" source="/media/share-sp.png" alt-text="Screenshot of share panel for a machine":::

## Create a connection with a Service Principal
Once you have share the machine with the application user, we can create the connection. We need to create the connection as the service principal, therefore we cannot use the Portal.

### Request an access token
First step is to request an access token to interact with Power Platform API using this [documentation](/power-platform/admin/programmability-authentication-v2#step-5-request-an-access-token).

### Create a connection using your Service Principal.
To create a connection, you need to send an HTTP PUT to PowerApps API to create the connection, using the access token that we obtain earlier.

```HTTP
Content-Type: application/json
Host: https://{ENVIRONMENT_ID}.environment.api.powerplatform.com
Accept: application/json
POST https://{ENVIRONMENT_ID}.environment.api.powerplatform.com/connectivity/connectors/shared_uiflow/connections/{CONNECTION_ID}?api-version=1
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
                "targetId":{"value":"{MACHINE_OR_GROUP_ID}"}
            }
        }
    }
}
```


### Capture the connection id.

