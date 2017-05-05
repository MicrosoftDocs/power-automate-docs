<properties
	pageTitle="Register and use custom connectors | Microsoft Flow"
	description="Register and use custom connectors in Microsoft Flow, using Swagger and Postman."
	services=""
    suite="flow"
	documentationCenter=""
	authors="archnair"
	manager="anneta"
	editor=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="04/28/2017"
   ms.author="archanan"/>

# Register and use custom connectors in Microsoft Flow
Microsoft Flow enables you to build workflows with no code. But in some cases, you need to extend Microsoft Flow capabilites, and web services are a natual fit for this. Your flow can connect to a service, perform operations, and get data back. When you have a web service you want to connect to with Microsoft Flow, you register the service as a custom connector. This process enables Microsoft Flow to understand the characteristics of your web API, including the authentication that it requires, the operations that it supports, and the parameters and outputs for each of those operations.

In this topic, we'll look at the steps required to register and use a custom connector, and we'll use the Azure Cognitive Services [Text Analytics API](https://www.microsoft.com/cognitive-services/en-us/text-analytics-api). This API identifies the language, sentiment, and key phrases in text that you pass to it. Below is a graphic that shows the interaction between the service, the custom connector we create from it, and the app that calls the API.

{TODO: add graphic}

## Prerequisites

- A [Microsoft Flow account](https://flow.microsoft.com).
- An OpenAPI 2.0 (formerly known as Swagger) file in JSON format, a URL to an OpenAPI definition, or a Postman Collection for your API. If you don't have any of these, we'll provide guidance for you.
- An image to use as an icon for your custom connector (optional).

## Steps in the custom connector process

The custom connector process has several steps, which we describe briefly below. This article assumes you already have a RESTful API with some type of authenticated access, so we'll focus on steps 3-6 in the rest of the article. For an example of steps 1 and 2, see [Create a custom Web API for Microsoft Flow](customapi-web-api-tutorial.md).

1. **Build a RESTful API** in the language and platform of your choice. For Microsoft technologies, we recommend one of the following (but you can use any platform):

	- Azure Functions
	- Azure Web Apps
	- Azure API Apps

2. **Secure your API** using one of the following authentication mechanisms. You can allow unauthenticated access to your connectors, but we don't recommend it.

	- Azure Active Directory
	- OAuth 2.0 for specific services like Dropbox, Facebook, and SalesForce
	- Generic OAuth 2.0
	- API Key
	- Basic Authentication

3. **Describe your API** in one of two industry-standard ways, so that Microsoft Flow can connect to it.

	- An OpenAPI file
	- A Postman Collection

	You can also build an OpenAPI file in step 4 as part of the registration process.

4. **Register your custom connector** using a wizard in Microsoft Flow, where you specify an API description, security details, and other information.
5. **Use your custom connector** in an app. Create a connection to the connector in your app, and call any operations that the API provides, just like you call standard connections in Microsoft Flow.
6. **Share your custom connector** like you do other resources in Microsoft Flow. This step is optional, but it often makes sense to share custom connectors across multiple app creators.

## Describe your API

Assuming you have an API with some type of authenticated access, you need a way to describe the API so that Microsoft Flow can connect to it. To do this, you create an OpenAPI file or a Postman Collection – which you can do from _any_ REST API endpoint, including:

- Publicly available connectors. Some examples include [Spotify](https://developer.spotify.com/), [Uber](https://developer.uber.com/), [Slack](https://api.slack.com/), [Rackspace](http://docs.rackspace.com/), and more.
- An API that you create and deploy to any cloud hosting provider, including Azure, Amazon Web Services (AWS), Heroku, Google Cloud, and more.
- A custom line-of-business API deployed on your network as long as the API is exposed on the public internet.

OpenAPI 2.0 (formerly known as Swagger) and Postman Collections use different formats, but both are language-agnostic machine-readable documents that describe your API's operations and parameters:
- You can generate these documents using a variety of tools depending on the language and platform that your API is built on. See the [Text Analytics API documentation](https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/export?DocumentFormat=Swagger&ApiName=Azure) for an example of an OpenAPI file.
- If you don't already have an OpenAPI file for your API and don't want to create one, you can still easily create a custom connector by using a Postman Collection. See [Create a Postman Collection](postman-collection.md) for more information.
- Microsoft Flow ultimately uses OpenAPI behind the scenes, so a Postman Collection is parsed and translated into an OpenAPI definition file. 

**Note**: Your file size must be less than 1MB.


### Getting started with OpenAPI and Postman

- If you're new to OpenAPI, see [Getting Started with OpenAPI](http://swagger.io/getting-started/) on the swagger.io site.
- If you're new to Postman, install the [Postman app](https://www.getpostman.com/apps) from their site.
- If your API is built with Azure API Apps or Azure Functions, see [Exporting an Azure hosted API to Microsoft Flow and Microsoft Flow](https://docs.microsoft.com/azure/app-service/app-service-export-api-to-powerapps-and-flow) for more information.


## Register your custom connector

You will now use the OpenAPI file or Postman Collection to register your custom connector in Microsoft Flow.

1. In [flow.microsoft.com](https://flow.microsoft.com), in the top bar, select the gear to open the settings menu. Select the **Custom connectors** option.

	![Create custom connector](./media/register-custom-api/managecustomapi.png)  

2. Select **Create custom connector**.

	![Custom connector properties](./media/register-custom-api/newcustomapi.png)

3. In the **General** tab, choose how you want to create the custom connector.
	- Upload OpenAPI
	- Paste OpenAPI URL
	- Upload a Postman Collection V1

	![How to create custom connector](./media/register-custom-api/choosehowtocreate.png)

	Upload an icon for your custom connector. Description, Host, and Base URL fields are typically auto-populated with the information from the OpenAPI file. If they are not auto-populated, you can add information to those fields. Select **Continue**.

4. In the **Security** tab, enter any authentication properties. 

	![Authentication types](./media/register-custom-api/authenticationtypes.png)
	
	- The authentication type is auto-populated based on what is defined in your OpenAPI `securityDefinitions` object. Below is an OAuth2.0 example.
		
		```
		"securityDefinitions": {
			"AAD": {
			"type": "oauth2",
			"flow": "accessCode",
			"authorizationUrl": "https://login.windows.net/common/oauth2/authorize",
			"scopes": {}
			}
		},
		```

	- If the OpenAPI file does not use the `securityDefintions` object, then no additional values are needed.
	- When using a Postman Collection, authentication type is auto-populated only when using supported authentication types, such as OAuth 2.0 or Basic.
	- For an example of setting up Azure Active Directory (AAD) authenthication, see the "Set up Azure Active Directory authentication" section of [Create a custom Web API for Microsoft Flow](customapi-web-api-tutorial.md).

5. In the **Definitions** tab, all the operations defined in your OpenAPI file or Postman Collection, along with request and response values, are auto-populated. If all your required operations are defined, you can go to step 6 in the registration process without making changes on this screen.

	![Definition tab](./media/register-custom-api/definitiontab.png)

	If you want to edit existing actions or add new actions to your custom connector, continue reading below.

	1. If you want to add a new action that was not already in your OpenAPI file or Postman Collection, select **New action** in the left pane and fill in the **General** section with the name, description, and visibility of your operation.

	2. In the **Request** section, select **Import from sample** on the top right. In the form on the right, paste in a sample request. Sample requests are usually available in the API documentation, where you can get information to fill out the **Verb**, **Request URL**, **Headers**, and **Body** fields. See the [Text Analytics API documentation](https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c6) for an example.

		![Import from sample](./media/register-custom-api/importfromsample.png)

	3. Select **Import** to complete the request definition. Define the response in a similar way.

6. Once you have all your operations defined, select **Create** to create your custom connector.

7. Once you have created your custom connector, go to the **Test** tab to test the operations defined in the API. Choose a connection, and provide input parameters to test an operation.

	![Test custom connector](./media/register-custom-api/testcustomapi.png)

	If the call is successful, you get a valid response.

	![Test connector Response](./media/register-custom-api/testapiresponse.png)

## Use your custom connector

{TODO: Show connection to new API, then calling the API from an app to return the language of the text I pass.}

### Quota and throttling

- See the [Microsoft Flow Pricing](https://flow.microsoft.com/pricing/) page for details about custom connector creation quotas. Custom connectors that are shared with you don't count against this quota.
- For each connection created on a custom connector, users can make up to 500 requests per minute.

## Share your custom connector
Now that you have a custom connector, you can share it with other users in your organization (but not publicly using Microsoft Flow). Keep in mind that when you share an custom connector, others might start to depend on it, and deleting a custom connector deletes all the connections to the connector.

1. In [flow.microsoft.com](https://flow.microsoft.com), in the top bar, select the gear to open the settings menu. Select the **Custom connectors** option.

	![New connection](./media/register-custom-api/managecustomapi.png)

2. Select your connector, select **Share**, and then enter the users or groups to whom you want to grant access to your connector.  

	![Share custom connector](./media/register-custom-api/sharecustomapi.png)

3. Select **Save**.

## Next steps

[Learn how to create a Postman Collection](postman-collection.md)

[Learn about custom OpenAPI extensions](customapi-how-to-swagger.md).

[Use an ASP.NET Web API](customapi-web-api-tutorial.md).

[Register an Azure Resource Manager API](customapi-azure-resource-manager-tutorial.md).
