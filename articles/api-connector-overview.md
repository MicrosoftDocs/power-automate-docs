# API Connector Certification Overview

An **API connector** is an OpenAPI (Swagger) based wrapper around a REST API that allows the underlying service to talk to [Microsoft Flow](https://ms.flow.microsoft.com/en-us/), [PowerApps](https://powerapps.microsoft.com/en-us/) and [Logic Apps](https://azure.microsoft.com/en-us/services/logic-apps/). It provides a way for users to connect their accounts and leverage a set of pre-built **triggers** and **actions** to build their apps and workflows.

**Independent software vendors (ISVs)** and **SaaS service owners** can build API connectors to enable a wide range of business and productivity scenarios for their users. A connector helps them to go beyond a definite set of integrations and increase the reach, discoverability and usage of their service.

## Requirements

To build and submit an API connector, your service must meet the following requirements:
- Business user scenario that fits well with Flow, PowerApps and Logic Apps
- Publicly available service with stable REST APIs

## Build your Connector

The first step to building an API Connector is to build a fully functional **Custom Connector**. A custom connector operates exactly like an API connector but it is limited in availability to its author and specific users within the author's tenant.

The general process to build a connector involves multiple steps:

![custom connector Authoring Steps](./media/api-connectors/authoring_steps.png)

[Learn more](api-connector-dev.md) about how to develop a custom connector.
 
## Submit for Certification

As part of our 3rd party certification process, Microsoft will review the connector before publishing.

This process validates the functionality of your connector in Flow and PowerApps, and checks for technical and content compliance.

[Learn more](api-connector-submission.md) about the process to submit your custom connector for certification and publishing.

## Support

For onboarding and development support, please email [condevhelp@microsoft.com](mailto:condevhelp@microsoft.com). This is actively monitored and managed. Developer queries and incidents will quickly find their way to the appropriate team.
