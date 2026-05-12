---
title: Power Platform actions
description: Use Power Platform actions to integrate desktop flows with Power Apps and create interactive automation experiences.
author: cochamos
ms.author: cochamos
ms.date: 05/11/2026
ms.topic: how-to
ms.service: power-automate
ms.subservice: desktop-flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run Power App (preview)

The **Run Power App** action lets you launch a Power App directly from a desktop flow and establish a communication channel between the two. This integration allows desktop flows to natively invoke Power App experiences, pass inputs, and receive outputs, enabling rich native integration for attended automation scenarios instead of UI-based automation.

With this capability, you can:
- Invoke a Power App directly from a desktop flow
- Pass inputs from the desktop flow into the app
- Capture outputs from the app back into the flow
- Trigger subflows from app events
- Build dynamic, guided user experiences without relying on UI automation

This enables scenarios such as:
- Multistep, dynamic guided forms for attended automation
- Modern app-based experiences replacing legacy custom forms
- Event-driven attended automation, where user actions dictate flow execution
- Bridging legacy desktop automation with modern cloud applications 

## Requirements and availability

- **Minimum Power Automate for desktop version:** 2.68 or later.
- **Cloud availability:** Available only in **public clouds**.

> [!NOTE]
> This feature is in preview and may change before general availability.

## Prerequisites

Before you start, make sure you have:

- Power Automate for desktop (PAD) **version 2.68 or later** installed
- Access to Power Apps in the same environment
- Desktop subflows you can call from the app
- Microsoft Edge **WebView2 Runtime** installed (required to display the Power App during runtime)

> [!IMPORTANT]
> - Create **local** subflows and define input/output variables in the subflow scope if needed.
> - Subflow names must start with a letter, contain only Latin characters, and have no spaces; subflows that don’t follow these naming rules aren’t exposed in Power Apps Studio and won’t be available for invocation. 

## Step 1: Create callable subflows in your desktop flow

1. Open your desktop flow in the PAD designer
2. Create one or more **local** subflows
3. (Optional) For each subflow, define:
   - **Input variables**: values the app passes into the subflow
   - **Output variables**: values the subflow returns to the app

> [!NOTE]
> You can also create subflows that don’t require inputs or outputs. These subflows can be invoked from the app to execute logic without passing or returning data.
> Keep each subflow focused on a single operation (for example, look up data, validate input, write to a system).

## Step 2: Establish the authoring connection to Power Apps Studio

To expose your subflows in Power Apps Studio (so they appear as functions you can call), you must open the app through the PAD authoring bridge

1. Add the **Run Power App (Preview)** action to your desktop flow
2. In the action properties, either:
   - Select an existing Power App, or
   - Create a new Power App

> [!Note]
> If you create a new app: 
> - The **Power Automate for desktop bridge page opens automatically** in your default browser
> - Save and publish the app in Power Apps designer
> - Return to the action and select **Refresh** 
> - Select your app from the dropdown

3. Select **Open app**

   Your default browser opens a **Power Automate for desktop** page that guides you through connecting to Power Apps Studio

4. On the browser page, select **Open Designer**

   A new browser tab opens with **Power Apps Studio**, with the selected app already open

5. **Keep the Power Automate for desktop browser page open** until it shows that it is **connected**

   Closing the page before the app finishes loading will prevent establishing a connection between the desktop flow and the Power app


## Step 3: Call desktop subflows from the Power App

After the designer connection is established, Power Apps Studio shows a host object named **PowerAutomateDesktop**. This object exposes your desktop subflows as callable functions

### Invocation pattern (general)

To call a desktop subflow from Power Apps:

- Use the PowerAutomateDesktop object
- Call the subflow by its name
- Pass inputs as function parameters
- Access output values from the returned result

General syntax:

```powerfx
PowerAutomateDesktop.SubflowName(input1, input2, ...).OutputVariableName;
```

### Example

In this example:

- The subflow is named GetCustomerData
- It accepts a single input parameter (e.g. varCustomerId)
- It returns a value through an output variable named out_customer_data which is stored in the global variable varResult

To call the subflow, pass the value of varCustomerId and store the returned output in the varResult global variable:

```powerfx
Set(customer_data_result, PowerAutomateDesktop.GetCustomerData(varCustomerId));
```

## Step 4: Returning values to Power Apps

- All values returned from Power Automate for desktop are strings and must be cast in Power Apps to the appropriate type
- When you invoke a desktop flow subflow, it returns **all output variables** as a single record value
- You can access individual output variables as properties of that record


### Example: Get and use output variables in Power Apps

```powerfx
Set(globalVariable, PowerAutomateDesktop.GetCustomerData(inputVariable))
```
This stores all output variables from the subflow in globalVariable.

To access a specific output variable (for example, out_var1):
```powerfx
globalVariable.out_var1
```

### Return complex values 

If you need to return complex values (custom objects or lists), you can return them as output variables and parse them in Power Apps.

1. In the desktop subflow, build a custom object
2. Return the custom object as an output variable
3. In Power Apps, use ParseJSON to parse the returned value and access its properties

```powerfx
Set(parsedValue, ParseJSON(globalVariable.out_customer_data))
```


> [!NOTE]
> Values returned from Power Automate for desktop are strings. You can cast them (for example, using `Value`, or `Boolean`) before using them in the app.

### IntelliSense support

When you call desktop subflows in Power Apps, Power Apps Studio provides IntelliSense to help you discover and use available capabilities.

As you type in the formula bar:

- The **PowerAutomateDesktop** object shows available subflow names
- Input parameters for the selected subflow are displayed in the correct order
- Output variable names are suggested after the function call

This helps you:

- Quickly find available subflows  
- Understand required inputs without referring back to the desktop flow  
- Select valid output variables without memorizing their names  

### Where you can call a subflow

Invoke subflows from action-capable properties, such as:

- A button’s **OnSelect**
- A control’s event property (for example, **OnChange**) when appropriate for your app design


## Runtime behavior

When the desktop flow runs and execution reaches **Run Power App**:

1. The Power App launches.
2. A communication channel is established automatically

The **Run Power App** action completes when the user closes the Power App window or stops the flow manually

## Limitations and considerations

- **Sequential execution:** Subflow calls are processed one at a time. Avoid triggering a new call before the previous call completes
- **Publishing propagation:** After publishing changes to a Power App, updates might take some time to be reflected when launching again from PAD
- **Sign-in prompts:** In some scenarios, users may be prompted to sign in when the app launches

## Troubleshooting

### You can't see the PowerAutomateDesktop object in the Power Apps designer

- Ensure you used **Open app** in the PAD action, then selected **Open Designer** in the browser and wait until the designer loads the app
- Keep the Power Automate for desktop browser page open until it indicates the connection is established

### I can’t see my new/updated subflow in Power Apps Studio

- Re-open the app through **Run Power App > Open app > Open Designer** so the schema refreshes


#### Changes to the Power App aren’t reflected when running from Power Automate for desktop

- Make sure you have **published** your latest changes in Power Apps  
- After publishing, wait a short period of time before running the app again, as updates may take some time to propagate and become available when launched from Power Automate for desktop. If you don’t want to wait, you can relaunch the app using the **Run Power App** action to immediately load the latest version


#### The Power App doesn’t appear during runtime

The Power App is rendered using the Microsoft Edge **WebView2 Runtime**.

- Ensure that WebView2 Runtime is installed on your machine. You can verify this by:
  - Checking the list of installed applications in Windows Settings (Apps > Installed apps), or  
  - Running the Power Automate for desktop troubleshooter  

- If it isn’t installed, download and install it from [Microsoft Edge WebView2](https://developer.microsoft.com/microsoft-edge/webview2/#download-section)

  On the download page, select **Evergreen Bootstrapper** and run the installer
