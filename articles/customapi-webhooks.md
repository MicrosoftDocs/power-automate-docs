---
title: Use webhooks with Microsoft Flow | Microsoft Docs
description: Learn how to create flows that interact with webhooks in Microsoft Flow
services: ''
suite: flow
documentationcenter: ''
author: msftman
manager: anneta
editor: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/08/2017
ms.author: deonhe

---
# Use webhooks with Microsoft Flow
[Webhooks](http://www.webhooks.org/) are simple HTTP callbacks used to provide event notifications.  Microsoft Flow allows you to use webhooks to trigger flows.  This tutorial demonstrates how to create a flow triggered by a webhook.

> [!NOTE]
> We will use GitHub as an example of a service that can send notifications via webhooks, but the techniques demonstrated here can be extended to any service that uses webhooks.
> 
> 

## Prerequisites
To complete the tutorial, you will need:

* Basic understanding of [webhooks](http://www.webhooks.org/).
* Basic understanding of the [OpenAPI Specification](http://swagger.io/specification/) (Swagger).
* A [GitHub](https://www.github.com) account.
* The [sample OpenAPI JSON file](http://pwrappssamples.blob.core.windows.net/samples/githubWebhookSample.json) for this tutorial.
* Alternatively you can also use the [triggers UI](customapi-webhooks.md#creating-webhook-triggers-from-the-ui) to define webhook triggers, in case you don’t want to hand write the OpenAPI file.

## The OpenAPI file
Webhooks are implemented in Microsoft Flow as a type of [custom connector](register-custom-api.md), so we'll need to provide an OpenAPI JSON file to define the shape of our webhook.  The OpenAPI contains three definitions critical to making the webhook work:

1. Creating the webhook
2. Defining the incoming hook request from the API (in this case, GitHub)
3. Deleting the webhook

### Creating the webhook
The webhook is created on the GitHub side by an HTTP POST to `/repos/{owner}/{repo}/hooks`.  Microsoft Flow will need to post to this URL when a new flow is created using the trigger defined in the OpenAPI, or whenever the trigger is modified.  In the sample below, the `post` property contains the schema of the request that will be posted to GitHub.

```json
"/repos/{owner}/{repo}/hooks": {
    "x-ms-notification-content": {
    "description": "Details for Webhook",
    "schema": {
        "$ref": "#/definitions/WebhookPushResponse"
    }
    },
    "post": {
    "description": "Creates a Github webhook",
    "summary": "Triggers when a PUSH event occurs",
    "operationId": "webhook-trigger",
    "x-ms-trigger": "single",
    "parameters": [
        {
        "name": "owner",
        "in": "path",
        "description": "Name of the owner of targetted repository",
        "required": true,
        "type": "string"
        },
        {
        "name": "repo",
        "in": "path",
        "description": "Name of the repository",
        "required": true,
        "type": "string"
        },
        {
        "name": "Request body of webhook",
        "in": "body",
        "description": "This is the request body of the Webhook",
        "schema": {
            "$ref": "#/definitions/WebhookRequestBody"
        }
        }
    ],
    "responses": {
        "201": {
        "description": "Created",
        "schema": {
            "$ref": "#/definitions/WebhookCreationResponse"
        }
        }
    }
    }
},
```

> [!IMPORTANT]
> The `"x-ms-trigger": "single"` property is a schema extension that tells Microsoft Flow to display this webhook in the list of available triggers in the flow designer, so be sure to include it.
> 
> 

### Defining the incoming hook request from the API
The shape of the incoming hook request (the notification from GitHub to Microsoft Flow) is defined in the custom `x-ms-notification-content` property, as shown in the sample above.  It doesn't need to contain the entire contents of the request, just the portions you want to use in your flows.

### Deleting the webhook
It's very important to include a definition in the OpenAPI that tells Microsoft Flow how to delete the webhook.  Microsoft Flow will try to delete the webhook every time you update the trigger in your flow, or when you delete your flow.

```json
"/repos/{owner}/{repo}/hooks/{hook_Id}": {
    "delete": {
    "description": "Deletes a Github webhook",
    "operationId": "DeleteTrigger",
    "parameters": [
        {
        "name": "owner",
        "in": "path",
        "description": "Name of the owner of targetted repository",
        "required": true,
        "type": "string"
        },
        {
        "name": "repo",
        "in": "path",
        "description": "Name of the repository",
        "required": true,
        "type": "string"
        },
        {
        "name": "hook_Id",
        "in": "path",
        "description": "ID of the Hook being deleted",
        "required": true,
        "type": "string"
        }
    ]
    }
},
```

> [!IMPORTANT]
> In order for Microsoft Flow to be able to delete a webhook, the API **must** include a `Location` HTTP header in the 201 response at the time the webhook is created.  The `Location` header should contain the path to the webhook that will be used with the HTTP DELETE.  For example, the `Location` included with GitHub's response follows this format: `https://api.github.com/repos/<user name>/<repo name>/hooks/<hook ID>`.
> 
> 

## Authentication
The API sending the webhook request to Microsoft Flow will usually have some form of authentication, and GitHub is no exception.  Several types of authentication are supported.  For this tutorial, we'll use GitHub's personal access tokens.

1. Navigate to [GitHub](https://www.github.com) and sign in if you haven't already.
2. In the upper right, click your **profile picture**, and then, in the menu, click **Settings**.
   
    ![Settings](./media/customapi-webhooks/github-settings.png)
3. In the menu on the left, under **Developer settings**, click **Personal access tokens**.
   
    ![Personal access tokens](./media/customapi-webhooks/personal-access-tokens.png)
4. Click the **Generate new token** button.
   
    ![Generate new token](./media/customapi-webhooks/generate-new-token.png)
5. In the **Token description** box, enter a description.
6. Select the **admin:repo_hook** checkbox.
   
    ![admin:repo_hook](./media/customapi-webhooks/repo-hook.png)
7. Click the **Generate token** button.
8. Make note of your new token.
   
    ![New token](./media/customapi-webhooks/new-token.png)
   
   > [!IMPORTANT]
   > You won't be able to access this token again. You should copy and paste it somewhere like Notepad to use later in the tutorial.
   > 
   > 

## Adding the webhook to Microsoft Flow
Now we've got everything we need to add the webhook to Microsoft Flow as a custom connector.

1. Navigate to the [Microsoft Flow web portal](https://flow.microsoft.com) and sign in if you haven't already.
2. Click the **settings** icon, and then click **Custom Connectors**.
   
    ![custom connectors](./media/customapi-webhooks/custom-apis.png)
3. Click the **Create custom connector** button.
4. Click the file folder icon in the **Import OpenAPI** box and then select the sample OpenAPI file.
5. Click **Upload icon** in the **General information** section and then select an image file to use as an icon.
6. Click **Continue**.
   
    ![Import OpenAPI](./media/customapi-webhooks/import-swagger.png)
7. On the next screen, we'll configure security settings.  Under **Authentication type**, select **Basic authentication**.
8. In the **Basic authentication** section, for the label fields, enter the text **User name** and **Password**.  Note that these are only labels that will be displayed when the trigger is used in a flow.
   
    ![Basic auth](./media/customapi-webhooks/basic-auth.png)
9. At the top of the page, give your flow a name and click **Create connector**.
   
    ![Create API](./media/customapi-webhooks/create-api.png)

The new custom connector should now appear in the list on the custom connectors page.

## Creating webhook triggers from the UI
1. After uploading / creating your baseline OpenAPI file, navigate to the **Definition** tab of the custom connector wizard.
2. In the left hand pane, click **+ New trigger**, and fill out the description of your trigger. In this example, we are creating a trigger that fires when a pull request is made to a repository.
   
    ![Create Trigger-1](./media/customapi-webhooks/create-new-trigger-1.png)
3. Next, define the request to create the webhook trigger. You can do this by importing a sample *create webhook trigger* request. See the [Github API reference](https://developer.github.com/v3/repos/hooks/#create-a-hook) for creating a webhook. 
4. Microsoft Flow automatically adds standard ```content-type``` and security headers, so we don’t need to define those while importing from a sample. 
   
    ![Create Trigger-2](./media/customapi-webhooks/create-new-trigger-2.png)
5. After importing the create webhook request, next we will define the webhook response by importing from a sample response. See the [Github API reference](https://developer.github.com/v3/activity/events/types/#pullrequestevent) for a pull request event. 
   
    **Note**: You don’t have to paste in the full response. Only the fields that you need should be defined.
   For this example, we are extracting only the PR url and information of the user who made the PR.
   
    ![Create Trigger-3](./media/customapi-webhooks/create-new-trigger-3.png)
6. The final step is to select a parameter in the webhook creation request, in the value of which Microsoft Flow should populate a callback URL for Github to populate. For us this is the url property in the ```config``` object.
   
    ![Create Trigger-4](./media/customapi-webhooks/create-new-trigger-4.png)

## Using the webhook as a trigger
Now that we've got everything configured, we can use the webhook in a flow.  Let's create a flow that will send a push notification to the Microsoft Flow mobile app whenever our GitHub repo receives a git push.

1. In the [Microsoft Flow web portal](https://flow.microsoft.com), at the top of the page, click **My flows**.
2. Click **Create from blank**.
3. In the designer for Microsoft Flow, search for the custom connector we registered earlier.
   
    ![New trigger](./media/customapi-webhooks/new-trigger.png)
   
    Click on the item in the list to use it as a trigger.
4. Since this is the first time we've used this custom connector, we have to connect to it.  For **Connection name**, enter a descriptive name.  For **User name**, use your GitHub username.  For **Password**, use the **personal access token** you created earlier.
   
    ![New connection](./media/customapi-webhooks/new-connection.png)
   
    Click **Create**.
5. Now we need to give Microsoft Flow information about the repo we want to monitor.  You might recognize the fields from the **WebhookRequestBody** object in the OpenAPI file.  For **owner** and **repo**, enter the owner and repo name of a GitHub repo you want to monitor.
   
    ![Repo info](./media/customapi-webhooks/repo-info.png)
   
   > [!IMPORTANT]
   > In this example, I'm using the repository for [Visual Studio Code](https://code.visualstudio.com). You should use a repo that your account has rights to.  The easiest way to do this would be to use your own repo.
   > 
   > 
6. Click **+ New step**, and then click **Add an action**.
7. Search for and select the **Push notification** action.
   
    ![Push notification](./media/customapi-webhooks/push-notification.png)
8. Enter some text in the the **Text** field.  Note that the **WebhookPushResponse** object in the OpenAPI file defines the list of parameters you can use.
   
    ![Push notification details](./media/customapi-webhooks/push-details.png)
9. At the top of the page, give the flow a name and click **Create flow**.
   
    ![Flow name](./media/customapi-webhooks/flow-name.png)

## Verification and troubleshooting
To verify everything is set up correctly, click **My flows**, and then click the **information icon** next to the new flow to view the run history.  You should already see at least one "Succeeded" run from the webhook creation.  This indicates that the webhook was created successfully on the GitHub side.  If the run failed, you can drill into the run details to see why it failed.  If the failure was due to a "404 Not Found" response, it's likely your GitHub account doesn't have the correct permissions to create a webhook on the repo you used.

## Summary
If everything is correctly configured, you will now receive push notifications in the Microsoft Flow mobile app whenever a git push occurs on the GitHub repository you selected.  Using the process above, you can use any webhook-capable service as a trigger in your flows.

## Next steps
* [Register a custom connector](register-custom-api.md).
* [Use an ASP.NET Web API](customapi-web-api-tutorial.md).
* [Register an Azure Resource Manager API](customapi-azure-resource-manager-tutorial.md).

