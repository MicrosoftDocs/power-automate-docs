---
title: FAQ for generative actions in cloud flows
description: This FAQ provides information about the AI technology used in Power Automate generative actions, along with key considerations and details about how AI is used, how it was tested and evaluated, and any specific limitations.
ms.date: 12/18/2024
ms.custom: 
  - responsible-ai-faqs
ms.topic: article
author: HeatherOrt
ms.author: heortaol
ms.reviewer: angieandrews
---

# FAQ for generative actions in cloud flows

These frequently asked questions (FAQ) describe the AI impact of the generative actions feature in Power Automate.

## What are generative actions?

Generative actions are a new type of action that's authored, tested, and executed through an AI runtime. You specify only the intent of the automation and the AI chooses the right set of actions in the right order based on your input, context, and intent.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## What are capabilities of generative actions?

Generative actions simplify automation by reducing the need for detailed specifications, adapt to changing scenarios using AI intelligence, and handle complex tasks involving multiple steps and integrations.

- Generative actions can create a set plan for flow execution through natural language. Generative actions can simplify and accelerate the automation process by reducing the need for specifying the conditions and action sets to execute. It surfaces recommended inputs, outputs, and actions to complete the described task. The user is then asked to validate these recommendations before running the generative actions and is allowed to make any changes necessary.  

- Generative actions can adapt to changing scenarios and data sources by leveraging the AI runtime's intelligence and reasoning capabilities. Generative action can orchestrate actions within the flow based on reasoning over inputs and knowledge documents. It then executes the plan by filling in the required inputs for the flow.  

- Generative actions can handle complex and dynamic tasks that involve multiple steps, conditions, loops, branches, and integrations. Once it is complete it shares the actions it executed and the reasoning behind parameter filling.  

## What is the intended use of generative actions?

You can use generative action to intelligently orchestrate, and parameter fill actions within your flow. The generative action can act based on the defined inputs.  

## How was the generative actions feature evaluated? What metrics are used to measure performance?

The generative actions feature is evaluated for end-to-end quality at each step of the process. Quality is measured in terms of how well the system creates and executes a plan that successfully addresses the user prompt. We evaluate quality over various user queries, prompts, and actions. We also evaluate how well the system does at ignoring malicious content from users and authors, and how well the system avoids producing harmful content.

## What are the limitations of generative actions? How can users minimize the impact of generative action limitations when using the system?

For best results, make sure your generative action prompt includes high-quality descriptions. The generative action can only act on the inputs and reference document given, be sure that the content is complete for the best performance. The generative action can also only orchestrate the actions that were defined and authenticated.  

## What operational factors and settings allow for effective and responsible use of generative actions?

The generative actions feature is currently *English only*. Once you create a generative action, you can test the system to see how well it performs using test. You can run the test and manually trigger actions to understand how your generative action will perform. You can always edit or modify the prompt to change the way the generative action performs.

## What kinds of issues might arise when using generative actions?

Actions might not always work as intended. Errors might occur when preparing the input for the action or when generating a response based on the action's output. Your generative action might also call the wrong action during the orchestration of the given actions. To mitigate the risk of such errors, make sure you have high quality, relevant, and unambiguous descriptions configured for the actions. Also limit what actions the generative action might be able to use in the execution of the plan.

## What protections does Power Automate have in place for responsible AI?

There are many mitigation features in place to protect your flows. You can configure your generative action with a set of references and input values defined within your flow. Generative actions never take an action that isn't part of their plan. Generative actions respect organizations' Data Loss Prevention (DLP) policy. Any disallowed action for the flow is blocked in the generative action.  

In addition, we have classifiers that look at input to the system to detect harmful content and jailbreak attacks. According to our tests, these classifiers have a high success rate at blocking harmful content and jailbreak attacks, while also having high success at not blocking content that isn't harmful or a jailbreak attack. However, classifiers can't be perfect so there are risks of a generative action producing harmful content or responding to a jailbreak attack. These risks include cross-domain prompt injection attacks, where instructions could be added to the output of an action or a knowledge source that the generative action then tries to follow.

## Related information

[Create generative actions in cloud flows (preview)](create-generative-actions.md)

[!INCLUDE[footer-include](./includes/footer-banner.md)]