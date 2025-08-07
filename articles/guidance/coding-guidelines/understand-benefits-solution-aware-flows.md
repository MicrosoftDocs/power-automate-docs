---
title: Understand the benefits of using solution-aware cloud flows
description: Learn how solution-aware cloud flows in Power Automate enhance portability, management, and deployment for a seamless flow development experience.
#customer intent: As a Power Automate user, I want to understand the benefits of using solution-aware versus non-solution cloud flows so that I can enhance flow portability and management.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 07/11/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/01/2025
---

# Understand the benefits of using solution-aware cloud flows

Solution-aware cloud flows offer important advantages over non-solution cloud flows, especially in terms of portability, management, and deployment. This article describes the benefits of using solution-aware cloud flows and how they can enhance your flow development experience.

## Cloud flows in solutions

In the context of Power Automate, a [*solution*](/power-platform/alm/solution-concepts-alm) is essentially a package that contains all the parts that are needed to build and run a flow. It includes the flow itself, any connections to other services (like SharePoint or SQL), and any other components that are necessary for the flow to work properly. Solutions help organize and manage these components in a way that makes it easier to develop, test, and deploy the flow. They're also the mechanism for implementing application lifecycle management (ALM).

Cloud flows that are created in or added to a solution are known as *solution-aware cloud flows*, or simply *solution cloud flows*. These flows are designed to be easy to move between environments, which supports robust ALM practices. You can add multiple flows to a solution. Learn more in [Create a cloud flow in a solution](../../create-flow-solution.md).

Non-solution cloud flows are flows that aren't part of a solution.

## Connections vs connection references

*Connection references* and *connections* refer to different aspects of how flows interact with external services and data sources. To manage and deploy flows effectively, especially in the context of solution-aware and non-solution cloud flows, you should understand the distinction between these terms.

- **Connections** establish a direct link between Power Automate and external services such as Office 365 and SharePoint to allow flows to perform actions on behalf of a user. If you change a connection in a cloud flow, every action that's associated with that connection needs to be updated.

  :::image type="content" source="media/flow-connections.png" alt-text="Screenshot of the Flow Details page in Power Automate, with three connections highlighted." lightbox="media/flow-connections.png":::

- **Connection references** are placeholders or shortcuts for connections. They make it easier to manage and move flows between environments (like development, testing, and production) by separating the flow's design from specific user connections. If you change a connection, you don't need to update every action in the flow. Instead, you update the connection reference, and everything stays connected.

  :::image type="content" source="media/flow-connectionreference.png" alt-text="Screenshot of the Flow Details page in Power Automate, with two connection references highlighted." lightbox="media/flow-connectionreference.png":::

  Consider keeping parent and child flows together in one solution, because they can use the same connection reference.

Connections are used in non-solution cloud flows. Connection references are used in solution-aware cloud flows. This distinction is important because connection references allow solution-aware cloud flows to be more portable and easier to manage across different environments.

> [!TIP]
> Connections include authentication details that are required for access to the external service. [Azure Key Vault](/azure/key-vault/) securely stores sensitive information like secrets, keys, and certificates. Integrating Azure Key Vault with Power Automate allows your flows to access secrets directly from Azure Key Vault, reducing the risk of exposure and enhancing your organization's overall security posture.

## Flow versioning

Makers of solution-aware cloud flows can create drafts of flows as they evolve the flow logic. [Flow versioning](/power-automate/drafts-versioning) allows the flow maker to keep track of changes and revert to a previous version if necessary. Versioning is available only for solution cloud flows.

:::image type="content" source="media/flow-versioning.png" alt-text="Screenshot of the Power Automate flow designer, showing the flow's version history.":::

## Environment variables

[Environment variables](/power-apps/maker/data-platform/environmentvariables) in solution-aware cloud flows act as placeholders for values that can change between environments (like development, testing, and production). They allow you to define values that are specific to a particular environment, such as connections and API keys. When you move a solution from one environment to another, you can update the environment variables to reflect the new environment's settings without needing to modify the flow itself.

Only solution-aware cloud flows support the use of environment variables.

## Unlimited flow ownership

You can own any number of solution-aware cloud flows. However, you can own a maximum of 600 non-solution flows. Learn more in [Limits of automated, scheduled, and instant flows](../../limits-and-config.md).

## Cloud flow run history in Dataverse

The run history of solution-aware cloud flows is stored in the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) table in [Dataverse](/power-apps/maker/data-platform/). This feature allows you to track the execution history of your cloud flows, including details about each run, such as start and end times, status, and any errors that occurred. This information is helpful for monitoring and troubleshooting your flows. It's also useful for auditing purposes, because it provides a record of all the runs that have occurred for a particular flow.

Cloud flow run history is available only for solution-aware cloud flows.

By default, flow run data is stored for 28 days, or 2,419,200 seconds. To change how long executions are stored, update [`FlowRunTimeToLiveInSeconds`](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) in the `Organization` table.

The [automation center](/power-automate/automation-center-overview) uses cloud flow run history in Dataverse to provide comprehensive monitoring and troubleshooting across Power Automate.

Learn more in [Manage cloud flow run history in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata).

## Pipeline support for deployment

[Pipelines in Power Platform](/power-platform/alm/pipelines) make it easy to deploy solutions and solution-aware cloud flows to test and production environments. Once pipelines are in place, makers can initiate deployments directly from their development environments.

Pipelines automate the deployment process, reducing the risk of human error, ensuring that all necessary components are included, and making deployments faster and more reliable. Pipelines also help enforce best practices by ensuring that all deployments follow a consistent process. This consistency is especially important in larger organizations where multiple teams might be working on different solutions and flows. Learn more in [Overview of pipelines in Power Platform](/power-platform/alm/pipelines).

You can customize pipelines to meet the unique needs of your organization. Here are some ways to extend pipelines:

- **Custom approvals**: Add custom approval steps to make sure that deployments meet specific business requirements before proceeding.

- **Service principal deployments**: Use service principals for deployments to maintain security and control, allowing makers to request deployments without needing elevated access in target environments.

- **Integration with DevOps tools**: Enhance your continuous integration/continuous delivery processes by integrating pipelines with tools like Azure DevOps Services and GitHub.

- **Custom business logic**: Execute specific business logic by inserting custom steps in the pipeline progression, such as pre-export validation or predeployment checks.

Learn more in [Extend pipelines in Power Platform](/power-platform/alm/extend-pipelines).

## ALM and managed and unmanaged solutions

Solutions are either *managed* or *unmanaged*. The distinction between the two is important for understanding how to work with them effectively.

- **Unmanaged solutions** are used for development and testing. They allow you to make changes to the components within the solution, such as adding or modifying flows and connections. Unmanaged solutions are typically used in development environments where you need to iterate on your designs.

- **Managed solutions** don't allow any modifications after they're deployed to an environment.

Here are some ALM best practices for using solutions in your deployments:

- To prevent unmanaged customizations in test and production environments, deploy only managed solutions.

- Edit flows only in a development environment, then move them to test and production environments.

- In production environments, make sure that service principals own all flows.

- Make sure that all changes to production environments go through ALM processes.
