---
title: Understand when to integrate cloud flows with Power Apps
description: Learn when to integrate cloud flows with Power Apps
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/30/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Understand when to integrate cloud flows with Power Apps

There are a range of capabilities available through Power Platform that enable makers to create business logic for their Power Apps. This article describes the primary methods along with guidance to determine which one to use: 

## Power apps with Power Fx

Power Fx is the low code functional programming language shared by Excel and Power Platform. Combined with Power Platform connectors, makers can access data and create custom app logic. 

Power Fx supports the following characteristics:  

- **Live** - Canvas Power apps recalculate just like excel spreadsheets do. As the end user interacts with the app, Power Fx is in the background making data requests and keeping the state of the app up to date with dataverse.   

- **Delegation** - Power Fx automatically delegates what it can to the server. Functions such as Filter(), Lookup(), and Search() enable an app to access data using server side filtering, so that only relevant data is brought into the app to support the experience and functional logic. Where delegation isn't possible, functions execute in the local JavaScript context (that is, in the local browser). 

- **Optimized for dataverse** - Dataverse is the native data storage service for Power Apps and as such there are fewer layers involved in using Power Fx with dataverse (which means low latency access). In addition, Power Fx supports *many to one* and *one to many* relationships available in dataverse. 

- **Offline** - Dataverse data can be taken offline with a mobile player for use in the field. Changes on both sides are synced when reconnected. Business logic defined in the app is run even when offline. 

## Power Automate

A low code workflow service built on top of the Power Platform connector ecosystem. Power Automate adds the following capabilities when building Power Apps: 

- **Asynchronous** - A Power Automate cloud flow is inherently asynchronous.  This means that when a flow is initiated, it's using a queuing system to manage the various subtasks. The asynchronous nature of Power Automate means that it's well suited for longer running complex sequences of logic. 

- **Detailed logging** - All flows create a record of what happened when they executed, called the **Run History**. Logging provides traceability and ensures there's an auditing record for what happened and why. 

- **Multi-connector** - Although it's possible to create multi-connector Power Apps logic, due to the live nature of Power Apps, as you increase the number of connectors performance degrades. These complex multi-connector scenarios are a great place to use Power Automate which can offload these cases from live execution in the app.  

## Dataverse plugins with Power Fx

[Dataverse plugins](/power-apps/developer/data-platform/plug-ins) are a common way that professional developers write business logic. As a low code option, [Power Fx can now be used to create plugins](/power-apps/maker/data-platform/low-code-plug-ins-powerfx). It brings delegation and dataverse optimizations and these characteristics: 

- **In the transaction** - Power Fx plugins run in the dataverse transaction that is updating the database. Even if there's a problem updating a secondary table, all the changes are rolled back, always keeping the database in a consistent state.  

- **Error reporting** - Reporting an error all the way back to the end user in an app or flow is as simple as calling the Error() function. The end user sees the error as a result of their action, they can take immediate corrective action, and retry the operation. 

- **Common choke point** - There's no getting around the plugin. Common business logic can be written and maintained in one place for all apps, flows, and other Power Platform end points. 

- **Efficiency** - Plugins can make multiple connector and database calls in succession without the storage and networking overhead of each step if they were in a Power Automate flow. 

- **Increased security** - Dataverse virtual network support allows you to protect your outbound connections to resources within your private network. In this way, you can securely manage your egress traffic from the Power Platform according to your network policy. In addition, data can be insulated and protected from clients by wrapping access in a server-side plugin. 

## When to use what

Power Fx should be the primary method for creating business logic in Power Apps. However, like any tool, it has its strengths and limitations, and there are situations where using other tools might be more appropriate.

### Low latency use cases

If low latency in a Power App is the focus, the live nature of a Power Fx function means that you have the best ability to deliver low latency business logic via Power Fx. Achieving low latency depends significantly on the complexity of the task and size of the dataset involved. It's therefore important to highlight, that although you can achieve low latency through Power Fx, what you're trying to do and how it's been designed has a significant bearing on the performance realized. Learn more: [Performance considerations with Power Apps](https://www.microsoft.com/power-platform/blog/power-apps/performance-considerations-with-powerapps/). 

For common data access scenarios, dataverse combined with Power Fx is going to be the fastest approach. 

### Complex sequences and multi-connector

For complex sequences of actions involving multiple connectors, Power Automate serves as an asynchronous mechanism to offload processing from the Power App. This asynchronous nature allows the Power App to initiate a workflow and continue its operations without waiting for a response, enhancing the user experience.

### Centralized business logic

When business logic involves controlling changes to the database, such as validating data before adding a record, dataverse plugins combined with Power Fx are the recommended solution. This approach is unique because it integrates directly with the dataverse transaction, allowing errors to be communicated back to the user who initiated the change. This feedback mechanism enables users to correct and retry their actions, ensuring database consistency throughout the process. Plugins serve as a centralized control point, enforcing consistent business logic across all applications (both Canvas and Model-driven), flows, and other endpoints.

Additionally, similar to Power Automate, dataverse plugins with Power Fx provide a centralized location for defining custom actions that do not necessarily alter the database. This setup facilitates the sharing of Power Fx-based business logic across all Power Platform endpoints, promoting consistency and reusability.
