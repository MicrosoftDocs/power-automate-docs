<properties
    pageTitle="Embed the Flow experience | Microsoft Flow"
    description="Embed the Microsoft Flow experiences into your website or app"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="bbarath"
    manager="erikre"
    editor=""
    tags=""
 />
<tags
    ms.service="flow"
    ms.devlang="na"
    ms.topic="article"
    ms.tgt_pltfrm="na"
    ms.workload="na"
    ms.date="09/07/2016"
    ms.author="barathb"/>

# Extend your app or website by integrating with Microsoft Flow #
Embed Microsoft Flow right into your app or website to give users a simple way to automate their personal or professional tasks.

To create flows, users will need either a **Microsoft Account** or a work or school account in **Azure Active Directory**. Microsoft Flow doesn't support, for example, a whitelabel solution that supports whatever identity your system  uses (unless it already uses Microsoft Accounts or AAD).

## Prerequisites ##
- [Build an API](get-started-flow-dev.md) that connects your service to Microsoft Flow.
- [Create and publish one or more templates](publish-a-template.md) that use your API.

## Show templates for your scenarios ##
To start, add this code to show the flow templates directly in your website:

```
<iframe src="https://flow.microsoft.com/{locale}/widgets/templates/?q={search term}&pagesize={number of templates}&appid={application id}&destination={destination}"></iframe>
```

| Parameter  | Description |
|-------------------------|-----------|
| locale | The four-letter language and region code for the template view. For example, `en-us` represents American English, and `de-de` represents German.  |
| search term | The search term for the templates that you want to show in the view. For example, search `wunderlist` to show templates for Wunderlist. |
| number of templates | The number of templates that you want to show in the view. |
| application id | Send mail to flowdev@service.microsoft.com to get a unique application ID. |
| destination | The page that opens when users click the template. Specify `details` to show the details about the template, or specify `new` to open the Microsoft Flow designer. |
| parameters.{name} | Additional context to pass into the flow. |

If the destination parameter is `new`, Microsoft Flow opens when users click a template, and they can create a flow in the designer. See the next section if you want to have the full experience work from inside of the app.

### Passing additional parameters to the flow ###
If the user is in a certain context in your website or app, you might want to pass that context to the flow. For example, a user might open a template for *Notify me when an item is added to a list* while looking at a certain list in Wunderlist. By following these steps, you can pass in the list ID as a *parameter* to the flow:

1. Define the parameter in the flow template before you publish it. A parameter looks like `@{parameters('parameter_name')}`.
2. Pass the parameter in the iframe src. For example, add `&parameters.listName={the name of the list}` if you have a parameter called **listName**.

### Full sample ###
To show the top four templates about Wunderlist in German and to start the user with **myCoolList**:

```
<iframe src="https://flow.microsoft.com/de-de/widgets/templates/?q=wunderlist&pagesize=4&appid=XXXXXXXXXXXXXX&destination=details&parameters.listName=myCoolList"></iframe>
```

## Embed the management of flows ##
Use the authenticated Flow SDK to allow users to create and manage flows directly from your website or app (instead of navigating to the Microsoft Flow portal). You'll need to sign the user in to Microsoft Account or Azure Active Directory to use the authenticated SDK.

### Include the JavaScript for the authenticated SDK ###
Include the SDK in your HTML code by following this example. You may also download, minify, and package the SDK with your product. The SDK isn't versioned yet, but that change is in our near-term backlog.

```
<script src="https://flow.microsoft.com/content/msflowsdk.js" async defer></script>
```

### Create a container to contain the view ###
Add an HTML div:

```
<div id="flowDiv" class="flowContainer"></div>
```

We recommend that you style this container so that it appears with appropriate dimensions in your experience:

```
<head>
    <style>
        .flowContainer iframe {
            width: 400px;
            height: 1000px;
            border: none;
            overflow: hidden;
    }
    </style>
</head>
```

Note that the iframe won't render properly below 320 pixels in width and won't fill content above 1200 pixels in width. Any height should work.

### Authentication against the SDK ###
For listing flows that the user has already authored and also to create flows from templates, provide an authToken from the AAD.

```
<script>
    window.msFlowSdkLoaded = function() {
        var sdk = new MsFlowSdk({
            appId: 'XXXXXXXXXXXXXX', // get one from Flow team
            hostName: 'https://flow.microsoft.com'
        });
        var widget = sdk.renderWidget('flows', {
            container: 'flowDiv'
        });
        widget.callbacks.GET_ACCESS_TOKEN = function(requestParam, widgetDoneCallback)
       {
            var authCallback = function(token) {
                widgetDoneCallback(null, {
                    token: token // Get AAD access token from your backend system
                });
            };
        }
    }
</script>
```

### Full sample ###
Here is a full example that demonstrates all of these pieces together:

```
<!DOCTYPE html>
<html>
<head>
    <style>
        .flowContainer iframe {
            width: 400px;
            height: 1000px;
            border: none;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <h1>Sample FLOW IFRAME</h1>
    <div id="flowDiv" class="flowContainer"></div>
    <!-- this authHelper is an example only. Replace it with your own AAD library -->
    <script src="sdk/authHelper.js"></script>
    <script src="https://flow.microsoft.com/content/msflowsdk.js" async defer></script>
    <script>
        window.msFlowSdkLoaded = function() {
            var sdk = new MsFlowSdk({
                appId: 'XXXXXXXXXXXXXX',
                hostName: 'https://flow.microsoft.com'
            });
            var widget = sdk.renderWidget('flows', {
                container: 'flowDiv'
            });
            var authHelper = new window.AuthHelper();
            widget.callbacks.GET_ACCESS_TOKEN = function(requestParam, widgetDoneCallback) {
                var authCallback = function(token) {
                    widgetDoneCallback(null, {
                        token: token
                    });
                };

                // this auth helper is an example only. replace it with your own login logic
                authHelper.getToken(requestParam.data.resource, authCallback);
            }
        }
    </script>
</body>
</html>
```
