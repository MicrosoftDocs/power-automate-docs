---
title: Integrate cloud flows with Power Apps
description: Learn when to integrate cloud flows with Power Apps canvas and model-driven apps to enhance their business logic capabilities.
#customer intent: As a Power Apps user, I want to implement low-latency business logic so that my app performs efficiently.  
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
---

# Integrate cloud flows with Power Apps

Power Platform offers a range of capabilities that allow you to enhance the capabilities of the canvas apps and model-driven apps that you build in Power Apps. This article describes the primary methods and provides guidance on which one to use.

## Power Apps with Power Fx

Power Fx is the low-code functional programming language shared by Excel and Power Platform. Using Power Platform connectors, you can access data and create custom app logic.

Power Fx supports:  

- **Live**: Canvas Power Apps recalculate just like Excel spreadsheets do. As you interact with the app, Power Fx is in the background making data requests and keeping the state of the app up to date with Dataverse.

- **Delegation**: Power Fx automatically delegates what it can to the server. Functions such as `Filter()`, `Lookup()`, and `Search()` enable an app to access data using server-side filtering so that only relevant data is brought into the app to support the experience and functional logic. Where delegation isn't possible, functions execute in the local JavaScript context (that is, in the local browser).

- **Optimized for Dataverse**: Dataverse is the native data storage service for Power Apps and as such there are fewer layers involved in using Power Fx with Dataverse (low-latency access). In addition, Power Fx supports *many-to-one* and *one-to-many* relationships available in Dataverse.

- **Offline**: Dataverse data can be taken offline with a mobile player for use in the field. Changes on both sides are synced when reconnected. Business logic defined in the app is run even when offline. 

## Power Automate

With a low-code workflow service built on top of the Power Platform connector ecosystem, Power Automate adds the following capabilities when building Power Apps:

- **Asynchronous**: A Power Automate cloud flow is inherently asynchronous. When a flow is initiated, it uses a queuing system to manage the various subtasks. The asynchronous nature of Power Automate makes it well suited for longer-running complex sequences of logic.

- **Detailed logging**: All flows create a record of what happened when they executed, called the **Run History**. Logging provides traceability and ensures there's an audit record for what happened and why.

- **Multi-connector**: Although you can create multi-connector Power Apps logic, performance degrades as you increase the number of connectors due to the live nature of Power Apps. These complex multi-connector scenarios are a great place to use Power Automate, which offloads these cases from live execution in the app.

## Dataverse plug-ins with Power Fx

Many developers rely on [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) to write business logic. As a low-code option, [Power Fx can now be used to create plug-ins](/power-apps/maker/data-platform/low-code-plug-ins-powerfx). 

These plug-ins bring delegation and Dataverse optimizations:

- **In the transaction**: Power Fx plug-ins run in the Dataverse transaction that updates the database. If there's a problem updating a secondary table, all changes are rolled back, keeping the database in a consistent state.

- **Error reporting**: Reporting an error all the way back to the end user in an app or flow is as simple as calling the `Error()` function. The end user sees the error as a result of their action, takes immediate corrective action, and retries the operation.

- **Common choke point**: You can't avoid the plug-in. Common business logic is written and maintained in one place for all apps, flows, and other Power Platform endpoints.

- **Efficiency**: Plug-ins can make multiple connector and database calls in succession without the storage and networking overhead of multiple steps in a Power Automate flow.

- **Increased security**: Dataverse virtual network support allows you to protect your outbound connections to resources within your private network. In this way, you can securely manage your egress traffic from Power Platform according to your network policy. In addition, you can insulate and protect data from clients by wrapping access in a server-side plug-in. 

## When to use what

Power Fx should be the primary method for creating business logic in Power Apps. However, like any tool, it has strengths and limitations, and there are situations where using other tools might be more appropriate.

### Low latency use cases

If low latency in a Power App is the focus, the live nature of a Power Fx function means you have the best ability to deliver low latency business logic via Power Fx. Achieving low latency depends significantly on the complexity of the task and size of the dataset involved. It's important to highlight that although you can achieve low latency through Power Fx, what you're trying to do, and how it's designed, have a direct bearing on performance. Learn more in [Performance considerations with Power Apps](https://www.microsoft.com/en-us/power-platform/blog/power-apps/performance-considerations-with-powerapps/).

For common data access scenarios, Dataverse combined with Power Fx is the fastest approach.

### Complex sequences and multi-connector

For complex sequences of actions involving multiple connectors, Power Automate serves as an asynchronous mechanism to offload processing from the Power App. Its asynchronous nature enables the Power App to initiate a workflow and continue its operations without waiting for a response, directly enhancing the user experience.

### Centralized business logic

When business logic involves controlling changes to the database, such as validating data before adding a record, Dataverse plug-ins combined with Power Fx are the recommended solution. This approach is unique because it integrates directly with the Dataverse transaction, allowing errors to be communicated back to the user who initiated the change. This feedback mechanism lets users correct and retry their actions, ensuring database consistency throughout the process. Plug-ins serve as a centralized control point, enforcing consistent business logic across all applications (both canvas and model-driven), flows, and other endpoints.

Additionally, similar to Power Automate, Dataverse plug-ins with Power Fx provide a centralized location for defining custom actions that don't necessarily alter the database. This setup facilitates the sharing of Power Fx-based business logic across all Power Platform endpoints, promoting consistency and reusability.
