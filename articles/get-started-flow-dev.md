<properties
    pageTitle="Start to build | Microsoft Flow"
    description="Create a custom API, share it, embed a flow, and do much more."
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
   ms.date="10/22/2016"
    ms.author="barathb"/>

# Start to build with Microsoft Flow #
Extend your application with Microsoft Flow in these ways, among others:

- create and connect to a custom API
- share that API with all users of Microsoft Flow
- embed the flow experience from within an app
- leverage all the developer APIs so that users can interact with Microsoft Flow in the best way for them

## Prerequisites ##
- An account on [flow.microsoft.com](https://flow.microsoft.com)

## Create a custom API ##
When you have a web service that you want to be able to automate with Microsoft Flow, you'll first need to build a custom API. By registering a custom API, you teach Microsoft Flow about the characteristics of your web API, including the authentication that it requires, the triggers and actions that it supports, and the parameters and outputs for each of those actions.

Follow [this tutorial](https://powerapps.microsoft.com/tutorials/register-custom-api/) to register a custom API. After you register it, you can share it inside of your organization so that others can help you test it.

## Share a custom API with all Microsoft Flow users ##
After you fully test your custom API, start the review process by sending this information to flowdev@service.microsoft.com:

- A Swagger file that represents your API and any authentication information
- An icon for your connector
- A description of your API
- Approximately 10 ideas for how your API could benefit other users through templates

After you submit this information, Microsoft will start to assess your API's function in Microsoft Flow and Microsoft PowerApps.

## Embed the flow experience in your website or app ##
Finally, you can embed Microsoft Flow from within your app to enable deep, in-context integration between your app and all the other services that Microsoft Flow supports. For example, you can:

- Browse all of the templates that relate to your service and let users select a template
- Manage the flows that users have related to your app

Follow [this tutorial](embed-flow-dev.md) for more information about how to embed Microsoft Flow within an app.
