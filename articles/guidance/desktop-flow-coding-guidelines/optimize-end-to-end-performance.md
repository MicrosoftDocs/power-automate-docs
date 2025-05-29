---
title: Optimize end-to-end process performance
description: Learn how to distribute workloads dynamically using machine groups and hosted machine groups in Power Automate for improved automation efficiency.
# customer intent: As a Power Automate user, I want to distribute workloads dynamically using machine groups so that I can improve automation efficiency.
author: PetrosFeleskouras
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/29/2025
ms.author: pefelesk
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
---

# Optimize end-to-end process performance

To maximize automation efficiency in Power Automate, optimize how workloads are distributed and managed. This article explores strategies to improve end-to-end process performance: using machine groups, hosted machine groups, work queues, reusable components, and process mining. Implementing these best practices enhances scalability, reduces operational overhead, and ensures seamless automation execution.

## Use machine groups to distribute your workload

Machine groups allow you to group multiple machines together to help distribute your automation workload dynamically.

- Assign a desktop flow to a machine group so that it's automatically queued when triggered to run. When a machine in the group becomes available, Power Automate assigns the next available desktop flow to it.

- In a cloud flow, consider using parallel branches of the **Run a flow built with Power Automate for desktop** cloud action to run multiple desktop flows or desktop flow instances in multiple machines or machine groups concurrently.

- In a desktop flow connection, use a [machine mapping credential](../../desktop-flows/create-machine-mapping.md) to sign in to each machine in the group with a dedicated credential.

Learn how to [manage machine groups and trigger flows to run on them](../../desktop-flows/manage-machine-groups.md).

Review [additional best practices](../../desktop-flows/run-desktop-flows-best-practices.md) for running desktop flows and distributing workloads.

## Use hosted machine groups to scale workloads

Hosted machine groups use Microsoft hosted infrastructure running in Azure and offer several benefits over traditional machine groups.

- **Automatic scaling**: Hosted machine groups scale automatically based on demand, reducing the need for manual intervention to add or remove machines.
- **Dynamic load balancing**: Flows are allocated dynamically based on the workload.
- **Maintenance-free**: Microsoft manages the infrastructure, including updates and maintenance, freeing up IT resources.
- **High availability**: Hosted machine groups are designed to be highly available, ensuring automations run smoothly without interruptions.
- **Redundancy**: Built-in redundancy helps prevent downtime and ensures continuous operation.
- **Reduced overhead**: Operational costs are lower due to reduced need for hardware and maintenance.

:::image type="content" source="media/optimize-e2e/hosted-machine.png" alt-text="Screenshot of a page in a wizard to create a new hosted machine group." lightbox="media/optimize-e2e/hosted-machine.png":::

Learn more about [hosted machines and hosted machine groups](../../desktop-flows/hosted-rpa-overview.md).

## Use machines effectively

To ensure that your machines are used effectively, consider the following best practices.

- Track the resource usage of each machine that runs desktop flows, such as CPU, memory, and network bandwidth. If your flow is resource intensive, optimize resource allocation or scale the workload to additional machines with (hosted) machine groups.

- [Run multiple desktop flows concurrently](../../desktop-flows/run-desktop-flows-concurrently.md) on a single Windows Server machine.

- [Reuse the Windows session of unattended desktop flows](../../desktop-flows/run-unattended-desktop-flows.md#reuse-a-windows-session-in-unattended-mode) so the flows don't sign out and sign in again for every run.

- For attended scenarios, [run desktop flows in picture-in-picture](../../desktop-flows/run-desktop-flows-pip.md) so that you can continue working on your machine while the automation runs in parallel.

## Optimize task allocation with work queues

Use work queues to manage a list of work items that need to be completed in a specific order. Each work item has properties like name, priority, expiration date, status, and the actual value to process.

:::image type="content" source="media/optimize-e2e/work-queues.png" alt-text="Screenshot of a work queue interface showing various properties such as Name, Enqueue time, Status, Expires, and so on." lightbox="media/optimize-e2e/work-queues.png":::

Work queues are useful for:

- Storing process-relevant data.
- Decoupling complex processes and automations, allowing them to communicate asynchronously.
- Ensuring important work is completed on time, regardless of the complexity of the process or the automation size.

Learn more about [work queues](../../desktop-flows/work-queues.md).

## Create reusable components

Reuse desktop flows related components, like child desktop flows, UI elements, and custom actions within an environment.

- Desktop flows shared among users in an environment are visible in the Power Automate for desktop console's **Shared with me** tab and in the Power Automate portal's **My flows > Desktop flows** page. To view them, filter the **Access** column by the **Shared with me** value. To trigger a shared desktop flow and reuse it from other desktop flows, use the **Run desktop flow** action. Learn more about [sharing desktop flows](../../desktop-flows/manage.md#share-desktop-flows) and the [Run desktop flow action](../../desktop-flows/actions-reference/runflow.md).


- UI element collections let you control and manage groups of UI elements centrally. These collections can be shared across multiple users and imported into multiple desktop flows. When an application is updated, you only need to adjust the UI elements collection once. All desktop flows referencing this collection in the same environment automatically reflect the change. Learn more about [UI elements collections](../../desktop-flows/ui-elements-collections.md).  

- Create custom actions to combine steps or functions into a reusable action. Use the Power Automate for desktop actions SDK, which provides APIs for creating custom actions with the .NET language C#. Learn more about [custom actions](../../desktop-flows/custom-actions.md).

## Analyze flow run history with process mining

Use [process mining](/power-automate/process-advisor-overview) with the [Desktop flows template](/power-automate/process-mining-templates#desktop-flows-template) to analyze the run history of a desktop flow and optimize its performance. The Desktop flows template identifies potential issues, such as errors or inefficiencies, and provides recommendations for improvement.
