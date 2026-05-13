---
title: Power Platform actions
description: Create interactive automation experiences by using Power Platform actions to integrate desktop flows with Power Apps.
author: cochamos
ms.author: cochamos
ms.date: 05/13/2026
ms.topic: how-to
ms.service: power-automate
ms.subservice: desktop-flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run Power Apps (preview)

The **Run Power Apps** action launches an app directly from a desktop flow and establishes a communication channel between the two. By using this integration, desktop flows can natively call Power App experiences, pass inputs, and receive outputs. This approach enables rich native integration for attended automation scenarios instead of relying on UI-based automation.

With this capability, you can:

- Invoke an app directly from a desktop flow
- Call an app directly from a desktop flow.
- Pass inputs from the desktop flow into the app.
- Capture outputs from the app back into the flow.
- Trigger subflows from app events.

This enables scenarios, such as:

- Multi-step, dynamic guided forms for attended automation
- Modern app-based experiences replacing legacy custom forms
- Event-driven attended automation, where user actions dictate flow execution
- Modern cloud applications bridging legacy desktop automation

## Requirements and availability

- **Minimum Power Automate for desktop version:** 2.68 or later.
- **Cloud availability:** Available only in **public clouds**.

> [!NOTE]
> This feature is in preview and might change before general availability.

## Prerequisites

Before you start, make sure you have:

- Power Automate for desktop (PAD) **version 2.68 or later** installed
- Access to Power Apps in the same environment
- Desktop subflows you can call from the app
- Microsoft Edge **WebView2 Runtime** installed (required to display the Power App during runtime)

> [!IMPORTANT]
> - Create **local** subflows and define input/output variables in the subflow scope if needed.
> - Subflow names must start with a letter, contain only Latin characters, and have no spaces. Subflows that don't follow these naming rules aren't exposed in Power Apps Studio and aren't available for invocation. 

## Step 1: Create callable subflows in your desktop flow

1. Open your desktop flow in the PAD designer.
1. Create one or more **local** subflows.
1. (Optional) For each subflow, define:
   - **Input variables**: values the app passes into the subflow
   - **Output variables**: values the subflow returns to the app

> [!NOTE]
> You can also create subflows that don't require inputs or outputs. The app can invoke these subflows to execute logic without passing or returning data.
> Keep each subflow focused on a single operation (for example, look up data, validate input, write to a system).

## Step 2: Establish the authoring connection to Power Apps Studio

To expose your subflows in Power Apps Studio (so they appear as functions you can call), open the app through the PAD authoring bridge.

1. Add the **Run Power Apps (Preview)** action to your desktop flow.
1. In the action properties, either:
   - Select an existing app, or
   - Create a new app

> [!Note]
> If you create a new app: 
> - The **Power Automate for desktop bridge page opens automatically** in your default browser.
> - Save and publish the app in Power Apps designer.
> - Return to the action and select **Refresh**. 
> - Select your app from the dropdown.

1. Select **Open app**.

   Your default browser opens a **Power Automate for desktop** page that guides you through connecting to Power Apps Studio.

1. On the browser page, select **Open Designer**.

   A new browser tab opens with **Power Apps Studio**, with the selected app already open.

1. **Keep the Power Automate for desktop browser page open** until it shows that it's **connected**.

   If you close the page before the app finishes loading, you prevent establishing a connection between the desktop flow and the Power app.


## Step 3: Call desktop subflows from the Power App

After you establish the designer connection, Power Apps Studio shows a host object named `PowerAutomateDesktop`. This object exposes your desktop subflows as callable functions.

### Invocation pattern (general)

To call a desktop subflow from Power Apps:

- Use the `PowerAutomateDesktop` object.
- Call the subflow by its name.
- Pass inputs as function parameters.
- Access output values from the returned result.

General syntax:

```powerfx
PowerAutomateDesktop.SubflowName(input1, input2, ...).OutputVariableName;
```

### Example

In this example:

- The subflow is named `GetCustomerData`.
- It accepts a single input parameter. For example, `varCustomerId`.
- It returns a value through an output variable named `out_customer_data`, which is stored in the global variable `varResult`.

To call the subflow, pass the value of varCustomerId and store the returned output in the varResult global variable:

```powerfx
Set(customer_data_result, PowerAutomateDesktop.GetCustomerData(varCustomerId));
```

## Step 4: Return values to Power Apps

- Power Automate for desktop returns all values as strings. In Power Apps, cast these values to the appropriate type.
- When you call a desktop flow subflow, it returns **all output variables** as a single record value.
- You can access individual output variables as properties of that record.


### Example: Get and use output variables in Power Apps

```powerfx
Set(globalVariable, PowerAutomateDesktop.GetCustomerData(inputVariable))
```
This example stores all output variables from the subflow in `globalVariable`.

To access a specific output variable. For example, `out_var1`:

```powerfx
globalVariable.out_var1
```

### Return complex values 

If you need to return complex values (custom objects or lists), return them as output variables and parse them in Power Apps.

1. In the desktop subflow, build a custom object.
1. Return the custom object as an output variable.
1. In Power Apps, use `ParseJSON` to parse the returned value and access its properties.

```powerfx
Set(parsedValue, ParseJSON(globalVariable.out_customer_data))
```


> [!NOTE]
> Power Automate for desktop returns all values as strings. Before using these values in the app, cast them to the appropriate type (for example, use `Value` or `Boolean`).

### IntelliSense support

When you call desktop subflows in Power Apps, Power Apps Studio provides IntelliSense to help you discover and use available capabilities.

As you type in the formula bar:

- The `PowerAutomateDesktop` object shows available subflow names.
- Input parameters for the selected subflow are displayed in the correct order.
- Output variable names are suggested after the function call.

This support helps you:

- Quickly find available subflows.  
- Understand required inputs without referring back to the desktop flow.  
- Select valid output variables without memorizing their names.  

### Where you can call a subflow

Invoke subflows from action-capable properties, such as:

- A button's **:::no-loc text="OnSelect":::**.
- A control's event property (for example, **:::no-loc text="OnChange":::**) when appropriate for your app design.


## Runtime behavior

When the desktop flow runs and execution reaches **Run Power Apps**:

1. The app launches.
1. The app automatically establishes a communication channel.

The **Run Power Apps** action finishes when the user closes the Power Apps window or stops the flow manually.

## Limitations and considerations

- **Sequential execution:** The process handles subflow calls one at a time. Don't trigger a new call before the previous call finishes.
- **Publishing propagation:** After publishing changes to an app, updates might take some time to appear when launching the app again from Power Automate for desktop.
- **Sign-in prompts:** In some scenarios, users might be prompted to sign in when the app launches.

## Troubleshooting

### You can't see the **:::no-loc text="PowerAutomateDesktop":::** object in the Power Apps designer

- Make sure you use **Open app** in the PAD action. Then, select **Open Designer** in the browser and wait until the designer loads the app.
- Keep the PAD browser page open until it indicates the connection is established.

### I can't see my new or updated subflow in Power Apps Studio

- Reopen the app through **Run Power Apps > Open app > Open Designer** so the schema refreshes.


#### Changes to the Power App aren't reflected when running from Power Automate for desktop

- Make sure you **publish** your latest changes in Power Apps.  
- After publishing, wait a short period of time before running the app again, as updates might take some time to propagate and become available when launched from Power Automate for desktop. If you don't want to wait, you can relaunch the app by using the **Run Power Apps** action to immediately load the latest version.


#### The app doesn't appear during runtime

Power Apps renders by using the Microsoft Edge **:::no-loc text="WebView2 Runtime":::**.

- Ensure that **:::no-loc text="WebView2 Runtime":::** is installed on your machine. You can verify this by:
  - Checking the list of installed applications in Windows Settings (Apps > Installed apps), or  
  - Running the Power Automate for desktop troubleshooter  

- If it isn't installed, download and install it from [Microsoft Edge WebView2](https://developer.microsoft.com/microsoft-edge/webview2/#download-section).

  On the download page, select **Evergreen Bootstrapper** and run the installer.
