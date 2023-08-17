---
title: Introduction to use ALM for Desktop Flows
description: This section describes how to set up your ALM for Desktop Flows.
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
---

# Configure ALM for Desktop Flow
We cover how to set up a healthy ALM (Application Lifecycle Management) strategy for your Desktop Flows.

We recommend taking advantages of [Power Platform ALM resources](/power-platform/alm/).

Follow the list of tasks to properly configured and use your ALM with your Desktop Flow and Cloud Flow. To benefit from the latest feature of Desktop Flow, we recommend following those steps on an environment with [schema v2 activated](/power-automate/desktop-flows/schema).


| Task  |  Description  | Links |
|-------|---------------|-------|
|1. Set up your DevOps project | Create your Azure DevOps or GitHub repository | [Continuous integration](/power-platform/alm/basics-alm#continuous-integration-and-deployment) <br> [Create a project](/azure/devops/pipelines/get-started/pipelines-sign-up#create-a-project) |
| 2. Create and configure a service principal | How to create a Service Principal in Azure and link it to your environment as an Application User | [Configure service connection using Service Principal](/power-platform/alm/devops-build-tools#configure-service-connections-using-a-service-principal)
| 3. Create a solution with Cloud Flow, Desktop Flow and connection reference | Learn how to create and add your Cloud Flow, Desktop Flow and connection reference to your solution. | [Create a solution and a publisher](/power-platform/alm/solution-concepts-alm#solution-lifecycle) <br> [Add Desktop Flow, Cloud Flow and connection reference](./alm-solution.md)|
| 4. Configure ADO pipeline to export and commit into repository | Learn how to set up your ADO pipeline to export and commit changes into your repository. | [Build pipeline](/power-platform/alm/devops-build-tool-tasks#build-pipeline-export-solution-from-development)|
| 5. Diff your changes | Learn how to compare changes between two versions of your solution | [Use AzureDevOps to see diff](./alm-diff.md) |
| 6. Share a machine with a Service Principal and create a connection | Learn how to share a machine with a Service Principal and create a connection to the machine | [Share a machine with a Service Principal and create a connection](./alm-connection.md)|
| 7. Create setting file and configure connection reference | Learn how to create a setting file for your deployment and set the connection id used by the connection reference. | [Prepopulate connection references for automated deployment](/power-platform/alm/conn-ref-env-variables-build-tools)
| 8. Build and deploy | Learn how to build your application and deploy it | [Build your solution](/power-platform/alm/devops-build-tool-tasks#build-pipeline-build-a-managed-solution) <br> [Deploy your solution](/power-platform/alm/devops-build-tool-tasks#release-pipeline-deploy-to-a-production-environment-prod)|