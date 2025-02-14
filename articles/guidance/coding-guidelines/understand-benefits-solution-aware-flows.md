---
title: Understand the benefits of using solution-aware cloud flows
description: Learn how solution-aware cloud flows enhance portability and management. Explore their role in robust ALM practices.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/04/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Understand the benefits of using solution-aware cloud flows

Cloud flows that are created within or added to a [solution](/power-platform/alm/solution-concepts-alm) are known as solution-aware cloud flows, or simply solution cloud flows. These flows are designed to be portable and manageable and easy to move between environments. This capability supports robust Application Lifecycle Management (ALM) practices. Additionally, you can add multiple flows to a single solution, enhancing organization and management.

Non-solution cloud flows are flows that are created outside the solutions. Their deployment needs to be managed individually.

Learn more:

- [Create a cloud flow in a solution](../../create-flow-solution.md)
- [Known limitations](/power-apps/maker/data-platform/solutions-overview#known-limitations) 


## Connection references vs connections

*Connection references* and *connections* refer to different aspects of how flows interact with external services and data sources. Understanding the distinction between these two terms is important for effectively managing and deploying flows, particularly within the context of solution-aware and non-solution-aware cloud flows.

### Connections (non-solution cloud flows)

Connections are configurations that establish a link between Power Automate and external services, such as Office 365, SharePoint, Dynamics 365, SQL, or any other connector. A connection includes authentication details (like API keys, OAuth tokens, or user credentials) required to access the external service.

When you create a flow, you need to create or select a connection to the service you want to interact with. Connections are user specific, meaning they're tied to the credentials of the user who creates them.

:::image type="content" source="media/flow-connections.png" alt-text="Screenshot of flow connections on the Flow Details page." lightbox="media/flow-connections.png":::

If you change a connection for a cloud flow, every action associated with the connection needs to be updated.

### Connection references (solution-aware cloud flows)

Connection references are pointers used within flows to refer to specific connections. They allow flows to be more portable and manageable, especially when moving flows between different environments.

Connection references are an abstraction layer that simplifies the management of connections within a Power Platform solution. They act as placeholders or pointers to actual connections, making it easier to manage and update connections in solution-aware scenarios.

:::image type="content" source="media/flow-connectionreference.png" alt-text="Screenshot of flow connection references on the Flow Details page." lightbox="media/flow-connectionreference.png":::

Connection references are used in solution-aware cloud flows, which are part of a broader Power Platform solution; for example, solutions integrated with Power Apps, Dataverse, or other components. They enable the separation of the flow's design from the specific user connections, facilitating easier deployment and updates across different environments (development, testing, production).

Because connection references are a wrapper for connections, when you need to update a connection for actions within a solution aware cloud flow, only the connection reference needs to be updated. All the actions within the flow automatically refer to the updated connection in the connection reference.

## Other benefits of solution-aware cloud flows

Solution-aware cloud flows offer distinct benefits that enhance portability, management, and deployment of flows across different environments.

### Flow versioning

[Flow versioning](/power-automate/drafts-versioning) is available only to solution-aware cloud flows. Users can create drafts of flows as they evolve the flow logic and publish once complete. Versioning information, such as metadata of a flow, is stored in Dataverse.

Versioning allows the flow maker to keep track of changes, revert to previous versions if necessary, and ensure that flows are stable and reliable.

:::image type="content" source="media/flow-versioning.png" alt-text="Screenshot of a cloud flow version history." lightbox="media/flow-versioning.png":::

### Environment variable support

Only solution aware cloud flows (ALM-friendly) support the use of environment variables.

[Environment variables](/power-apps/maker/data-platform/environmentvariables) enable the basic application lifecycle management (ALM) scenario of moving a cloud flow between Power Platform environments. In this scenario, the cloud flow stays exactly the same except for a few key external references (such as tables, connections, and keys) that are different between the source environment and the destination environment. The cloud flow requires the structure of the tables or connections to be exactly the same between the source and the destination environments, with some differences. Environment variables allow you to specify which of these different external references should be updated as the cloud flow is moved across environments.

### No limit on the number of flows owned by a user

With non-solution cloud flows, a user can own a maximum of 600 flows. This limit doesn't apply to flows created within solutions.

Learn more: [Limits and configuration](../../limits-and-config.md)

### Cloud flow run history in Dataverse

With cloud flow run history in Dataverse, you can apply the extensibility of [Dataverse](/power-apps/maker/data-platform/) to track the results of your cloud flow executions at scale.

Only solution aware cloud flows, with their definitions in Dataverse, can have their run history stored in Dataverse.

Each cloud flow execution has an entry in the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) table. This feature uses Dataverse's nonrelational database, [elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables), to store the cloud flow run history.

Cloud flow run history in Dataverse is used by the [Automation center](/power-automate/automation-center-overview) to provide comprehensive monitoring and troubleshooting experiences for automation processes across Power Automate.

By default, flow run data is stored for 28 days (2,419,200 seconds). You can modify how long executions are stored by updating the [Time to live (in seconds) for the flow run in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) in a Dataverse environment. Depending on your environment's storage capacity, you can adjust the length of storage for these run records.

Learn more: [Manage cloud flow run history in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata)

### Pipeline support for deployment

[Pipelines in Power Platform](/power-platform/alm/pipelines) enable you to easily deploy solutions to test and production environments. Once pipelines are in place, makers can initiate deployments directly from their development environments. 

## ALM best practices for Power Automate

Application Lifecycle Management enables organizations to safely move artifacts within a solution across environments such as development, test, and production.

Note these key differences when working with solutions in Power Automate:

- **Unmanaged solutions** are fully editable and allow developers to modify and customize the components within a solution. 

- **Managed solutions** are sealed and don't allow any modifications once deployed to target environments. 

The rest of this section describes best practices for moving solutions and cloud flows across different environments.

### Solutions best practices

Solutions can be used as a logical boundary to keep related flows together. Consider keeping parent and child flows together in one solution, as they can use the same connection reference. 

Environment variables allow you to dynamically change configurations across different environments (for example, development, staging, production) without modifying the code. These variables act as placeholders for data that can be set or updated externally, making it easier to manage and deploy the application.

[Azure Key Vault](/azure/key-vault/) securely stores sensitive information like secrets, keys, and certificates. Integrating Azure Key Vault with Power Automate ensures that sensitive data is stored and retrieved securely. This integration allows Power Automate to access the secrets directly from Azure Key Vault, reducing the risk of exposure and enhancing the overall security posture of the application.

### Deployment best practices

Ensure safe ALM by not allowing any unmanaged customizations in the test and production environments by deploying only managed solutions. 

Edit flows only in a development environment, then move them to test and production environments. In production environments, ensure that service principals own flows.

Ensure all changes to production environments go through ALM processes.

### Use pipelines for deployment

[Pipelines](/power-platform/alm/pipelines) offer numerous advantages for managing and deploying solutions within your organization:

- **Streamlined Application Lifecycle Management**: Pipelines automate and simplify the ALM process, making it easier to manage solution development, testing, and deployment. Pipelines reduce the effort and domain knowledge required to implement effective ALM practices.

- **Centralized management**: Administrators can centrally govern both citizen-led and pro-dev-led projects, ensuring consistent and secure deployment practices across the organization. This centralized approach helps maintain control and oversight. 

- **Improved productivity**: By automating deployment processes, pipelines significantly enhance productivity for makers, developers, and admins. Solutions can be delivered faster and with higher quality.

- **Cost efficiency**: Pipelines reduce the total cost of ownership by minimizing the manual effort required for deployment and ongoing maintenance, leading to cost savings and more efficient resource utilization.

- **Enhanced compliance and security**: Pipelines support secure production environments with approval-based delegated deployments. They also provide out-of-the-box analytics and audit logs, ensuring compliance and security throughout the deployment process.

Additionally, pipelines can be customized to meet the unique needs of your organization. Here are some ways to extend pipelines:

- **Custom approvals**: Ensure that deployments meet specific business requirements before proceeding by adding custom approval steps to your pipelines.

- **Service principal deployments**: Use service principals for deployments to maintain security and control, allowing makers to request deployments without needing elevated access within target environments.

- **Integration with DevOps tools**: Enhance your continuous integration/continuous delivery (CI/CD) processes by integrating pipelines with tools like Azure DevOps and GitHub. This integration allows seamless management and deployment of solutions.

- **Custom business logic**: Execute specific business logic by inserting custom steps into the pipeline progression, such as pre-export validation, predeployment checks, and other custom actions.

Learn more: 

- [Overview of pipelines in Power Platform](/power-platform/alm/pipelines)
- [Extend pipelines in Power Platform](/power-platform/alm/extend-pipelines)
