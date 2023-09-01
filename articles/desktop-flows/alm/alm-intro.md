---
title: Introduction to use ALM for desktop flows
description: This section describes how to set up your ALM for desktop flows.
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
---

# Configure ALM for desktop flows
We cover how to set up a healthy ALM (Application Lifecycle Management) strategy for your desktop flows.

We recommend taking advantages of [Power Platform ALM resources](/power-platform/alm/).

Follow the list of tasks below to setup your ALM strategy for cloud flows and desktop flows. To benefit from the latest features of desktop flows, we recommend following those steps in an environment with [schema v2 activated](/power-automate/desktop-flows/schema).


| Task  |  Description  | Links |
|-------|---------------|-------|
|1. Set up your DevOps project | Create your Azure DevOps or GitHub repository | [Continuous integration](/power-platform/alm/basics-alm#continuous-integration-and-deployment) <br> [Create a project](/azure/devops/pipelines/get-started/pipelines-sign-up#create-a-project) |
| 2. Create and configure a service principal | How to create a Service Principal in Azure and link it to your environment as an Application User | [Create a Service Principal](/power-automate/desktop-flows/machines-silent-registration) <br>[Configure service connection using Service Principal](/power-platform/alm/devops-build-tools#configure-service-connections-using-a-service-principal)
| 3. Create a solution with cloud flow, desktop flow and connection reference | Learn how to create and add your cloud flow, desktop flow and connection reference to your solution. | [Create a solution and a publisher](/power-platform/alm/solution-concepts-alm#solution-lifecycle) <br> [Add desktop flow, cloud flow and connection reference](./alm-solution.md)|
| 4. Configure an ADO pipeline to export and commit into your repository | Learn how to set up your ADO pipeline to export and commit changes into your repository. | [Build pipeline](/power-platform/alm/devops-build-tool-tasks#build-pipeline-export-solution-from-development)|
| 5. Review your changes | Learn how to compare changes between two versions of your solution | [Use AzureDevOps to see diff](./alm-diff.md) |
| 6. Share a machine with a Service Principal and create a connection | Learn how to share a machine with a Service Principal and create a connection to the machine | [Share a machine with a Service Principal and create a connection](./alm-connection.md)|
| 7. Create a setting file and configure connection references | Learn how to create a setting file for your deployment and set the connection id used by the connection reference. | [Prepopulate connection references for automated deployment](/power-platform/alm/conn-ref-env-variables-build-tools)
| 8. Build and deploy | Learn how to build your application and deploy it | [Build your solution](/power-platform/alm/devops-build-tool-tasks#build-pipeline-build-a-managed-solution) <br> [Deploy your solution](/power-platform/alm/devops-build-tool-tasks#release-pipeline-deploy-to-a-production-environment-prod)|