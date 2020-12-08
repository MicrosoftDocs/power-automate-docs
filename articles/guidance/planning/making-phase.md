---
title: Making phase for Power Automate projects | Microsoft Docs
description: The next step is to set up the automation. This article lists the relevant documentation to help you do so.
author: taiki-yoshida
ms.service: flow
ms.topic: conceptual
ms.custom: guidance
ms.date: 12/05/2020
ms.author: tayoshi
ms.reviewer: kathyos

---

# Making phase

You have now planned and designed how you'd like to automate your process.
The next step is to set up the automation.

## Basic steps for Power Automate flows

1.  Specify an event or trigger to start the flow with
    [connectors](https://docs.microsoft.com/connectors/). Based on the way you
    want to trigger the automation, you'll specify what event you want to use
    to trigger your Power Automate flow.

2.  [Add actions](../../multi-step-logic-flow.md) and [conditions](../../add-condition.md).

More information: [Create a flow from a template in Power Automate](../../get-started-logic-template.md)

## Basic steps for desktop UI flows

1.  Define and set up the inputs based on what you've identified in the
    design phase.

2.  Record steps in the [UI flow recorder](../../ui-flows/create-desktop.md).

3.  Define and set up the outputs based on what you've identified in the
    design phase.

4.  Test your recording.

## Basic steps for web UI flows

1.  Define and set up the inputs based on what you've identified in the design phase.

2.  Record steps and define outputs in [Selenium IDE](../../ui-flows/create-web.md).

3.  Set up the outputs based on what you've identified in the design phase.

4.  Test your recording.

## Basic steps for Power Automate Desktop 

1.  Create a new UI flow in Power Automate Desktop.

2.  Add actions and set up configuration from [Power Automate Desktop](../../ui-flows/desktop/introduction.md).

3.  Define inputs and outputs.

4.  Test the created UI flow you created.

5.  Set up triggers and links between API flows to Power Automate Desktop.
