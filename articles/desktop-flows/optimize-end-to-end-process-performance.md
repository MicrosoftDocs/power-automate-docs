---
title: Optimize end-to-end process performance
description: Learn how to distribute workloads dynamically using machine groups and hosted machine groups in Power Automate for improved automation efficiency.
# customer intent: As a Power Automate user, I want to distribute workloads dynamically using machine groups so that I can improve automation efficiency.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 04/29/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
---

# Optimize end-to-end process performance

To maximize automation efficiency in Power Automate, optimize how workloads are distributed and managed. This article explores strategies to improve end-to-end process performance, including using machine groups, hosted machine groups, work queues, reusable components, and process mining. Implementing these best practices enhances scalability, reduces operational overhead, and ensures seamless automation execution.

## Use machine groups to distribute your workload

**Machine groups** allow you to group multiple machines together to help distribute your automation workload dynamically.

- Assign a desktop flow to a machine group so that it's automatically queued when triggered to run. When a machine in the group becomes available, Power Automate assigns the next available desktop flow to it.

- In a cloud flow, consider using parallel branches of the **Run a flow built with Power Automate for desktop** cloud action to run multiple desktop flows/desktop flow instances in multiple machines/machine groups concurrently.

- In a desktop flow connection, use a [machine mapping credential](/power-automate/desktop-flows/create-machine-mapping) to sign in to each machine in the group with a dedicated credential.

## Use hosted machine groups to scale workloads automatically

**Hosted machine groups** use Microsoft hosted infrastructure running in Azure and offer several benefits over traditional machine groups. Here are some key advantages:

- Automatic Scaling – they scale automatically based on demand, reducing the need for manual intervention to add or remove machines.
- Dynamic load balancing - flows are allocated dynamically based on the workload.
- Maintenance-free - Microsoft manages the infrastructure, including updates and maintenance, freeing up your IT resources.
- High availability – they're designed to be highly available, ensuring that your automations run smoothly without interruptions.
- Redundancy - built-in redundancy helps prevent downtime and ensures continuous operation.
- Reduced overhead - lower operational costs due to reduced need for hardware and maintenance.

:::image type="content" source="media/optimize-end-to-end-process-performance/hosted-machine.png" alt-text="Screenshot showing the configuration and benefits of hosted machine groups in Power Automate." lightbox = "media/optimize-end-to-end-process-performance/hosted-machine.png":::



## Utilize machines effectively

- Keep track of the resource usage of each machine that runs desktop flows, such as CPU, memory, and network bandwidth. If your flow is resource-intensive, consider optimizing resource allocation or scaling the workload to additional machines with (hosted) machine groups.

- [Run multiple desktop flows concurrently](/power-automate/desktop-flows/run-desktop-flows-concurrently) on a single Windows Server machine.

- Consider [reusing the Windows session of unattended desktop flows](/power-automate/desktop-flows/run-unattended-desktop-flows#reuse-a-windows-session-in-unattended-mode), so that the flows don’t have to sign out and sign in again for every run.

- For attended scenarios, [run desktop flows in picture-in-picture](/power-automate/desktop-flows/run-desktop-flows-pip) so that you can continue working on your machine while the automation is running in parallel.

## Optimize task allocation with work queues

Use work queues to manage a list of work items that need to be completed in a particular order. Each work item contains some properties such as its name, priority, expiration date, status, and the actual value to be processed.

:::image type="content" source="media/optimize-end-to-end-process-performance/work-queues.png" alt-text="Screenshot of a work queue interface showing various properties such as name, priority, and status.":::

Work queues are useful for:

- Storing process-relevant data

- Decoupling complex processes and automations, allowing them to communicate asynchronously.

- Ensuring that important work is completed on time, regardless of the complexity of the process or the size of the automation they're being used for.

## Create reusable components

Reuse desktop flows’ related components, like child desktop flows, UI elements, and custom actions within an environment.

- Desktop flows which are shared among users within an environment are visible in Power Automate for desktop console’s **Shared with me** tab, and in Power Automate portal’s **My flows > Desktop flows** page, by filtering the **Access** column with the **Shared with me** value. To trigger a shared desktop flow and reuse it from other desktop flows, use the **Run desktop flow** action. Learn more about [sharing desktop flows](/power-automate/desktop-flows/manage#share-desktop-flows) and the [Run desktop flow action](/power-automate/desktop-flows/actions-reference/runflow).

- UI elements collections provide control and central management over groups of UI elements, which can be shared across multiple users and imported in multiple desktop flows. Hence, in case of an application update, the UI elements collection only needs a one-time adjustment, and all desktop flows referencing this collection in the same environment should reflect that change automatically. Learn more about [UI elements collections](/power-automate/desktop-flows/ui-elements-collections).

- Create custom actions to compose a sequence of steps or functions into a new reusable action. Custom actions are created using the Power Automate for desktop actions SDK, which provides a set of APIs that allow makers to create custom actions using .NET language C#. Learn more about [custom actions](/power-automate/desktop-flows/custom-actions).

## Analyze flow run history with Process mining

Use [Process mining](/power-automate/process-advisor-overview) with the [Desktop flows template](/power-automate/process-mining-templates#desktop-flows-template) to analyze the run history of a desktop flow and optimize its performance. The Desktop flows template can identify potential issues, such as errors or inefficiencies, and provide recommendations for improvement.


## Related information 

- [Manage machine groups and trigger flows to run on them](/power-automate/desktop-flows/manage-machine-groups).
- [Hosted machines and hosted machine groups](/power-automate/desktop-flows/hosted-rpa-overview). 
- [Work queues](/power-automate/desktop-flows/work-queues).
- [Additional best practices](/power-automate/desktop-flows/run-desktop-flows-best-practices) for running desktop flows and distributing the workload.