<properties
    pageTitle="Embed the Flow experience | Microsoft Flow"
    description="Embed the Microsoft Flow experiences into your web site or application"
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

# Extend your application or web site by integrating with Microsoft Flow #
Microsoft Flow makes it easy for anyone to automate tasks in their life. If you have an application or a web site that may need a way to give your users a simple way to build automation, then you can now embed Microsoft Flow right into your experience.

**Prerequisites**

1. Before you embed you will probably want to build an API inside flow that connects to your service. [Read more here](get-started-flow-dev.md) about how to expose your API to Microsoft Flow.
2. Second, you will want to publish one or more templates that use your API. [Read more here](publish-a-template.md) to see how you can publish a template.

## Show flow templates for your scenarios ##

The fastest way to get started is to embed a view of possible flow templates for your users. Once you have some templates you can show them directly in your website:

```
<iframe src="https://flow.microsoft.com/{locale}/widgets/templates/?q={seach term}&pagesize={number of templates}&appid={application id}&destination={destination}"></iframe>
```

| Parameter           | Description                   |
|---------------------|-------------------------------|
| locale              | The four-letter language and region code for the template view. For example `en-us` for American English or `de-de` for German.  |
| search term         | The search term for the templates you want to show in the view. For example, if you want templates about wunderlist, search `wunderlist` |
| number of templates | How many templates you want to show in the view |
| application id      | Send a mail to flowdev@service.microsoft.com to get a unique application ID |
| destination         | For now, the template details page is the only possible destination. Use `details` as the value |

For example, to show the top 4 templates about wunderlist in German you can do:

```
<iframe src="https://flow.microsoft.com/de-de/widgets/templates/?q=wunderlist&pagesize=4&appid=XXXXXXXXXXXXXX&destination=details"></iframe>
```

When your users click on the template they will be taken to Microsoft Flow and be able to create a flow. See the next section if you want to have the full experience work from inside of the app.

## Embed the management of flows ##

If you want your users to be able to create and manage flows directly from your web site or app without navigating to the flow portal, you can use the authenticated Flow SDK. 

### Include the JavaScript for the authenticated SDK ###
Include the flow sdk in your HTML code like this. You may also download, minify and package the SDK with your product. We will version the SDK in the coming months before GA.

```
<script src="https://flow.microsoft.com/content/msflowsdk.js" async defer></script>
```

### Create a container to contain the view ###
Add a HTML div with like this:

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

### Authentication against the SDK ###
For listing flows that the user have already authored and also to create flows from templates, you will need to provide an authToken from the AAD.

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
                    token: token // Get access token from your backend system
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
    <!-- this authHelper is only example only. Replace it with your own AAD library -->
    <script src="sdk/authHelper.js"></script>
    <script src="https://flow.microsoft.com/content/msflowsdk.js" asycn defer></script>
    <script>
        window.msFlowSdkLoaded = function() {
            var sdk = new MsFlowSdk({
                appId: '0BB97B4F1901437BB5D97B58AEDEDBDE',
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

                // this auth helper is only example only. replace it with your own login logic
                authHelper.getToken(requestParam.data.resource, authCallback);
            }
        }
    </script>
</body>
</html>
```
