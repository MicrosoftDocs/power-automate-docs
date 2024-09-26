---
title: Regenerate the SAS key used in HTTP trigger flows
description: Learn how to regenerate the SAS key used in HTTP trigger flows in Power Automate.
suite: flow
author: samathur
contributors:
  - samathur
  - v-aangie
ms.author: samathur
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 09/26/2024
ms.collection: 
  - bap-ai-copilot
---

# Regenerate the SAS key used in HTTP trigger flows

This article provides instructions on how to regenerate the SAS key used in HTTP trigger flows in Power Automate. There are three main steps to follow:

- Identify the SAS string: To begin, open the flow in Power Automate Designer, copy the HTTP trigger URL, and note the current "sig=" value in the URL.
- Regenerate the SAS key: Use the browser's Developer Tools to create a request to regenerate the SAS key by modifying the request URL and Authorization Header, then construct a fetch command in a text editor.
- Execute and verify: Execute the fetch command in the browser's console, verify the key regeneration by checking the updated "sig=" value, and troubleshoot if necessary.

## Step 1: Identify the SAS string being used by your flow

1. Sign in to [Power Automate](https://flow.microsoft.com/).
1. Open the flow in the designer.
1. Copy the HTTP trigger URL.
 
    `https://<region>/workflows/<workflowid>/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=<value>`

1. Make a note of the URL string that starts with `sig=`.

    Once the key is regenerated, this value changes and serves as a confirmation that the execution of the following steps was successful.

## Step 2: Create the request to regenerate the string

This is a multi-step process that requires using the browser tools. We illustrate the steps using Microsoft Edge browser.

1. Navigate to the **Flow Details** page (not the designer page).
1. Open **Developer Tools** and navigate to the **Network** tab.
1. Select **Clear Network log**.
1. Select **Record Network log**.
1. Refresh the page by selecting **Ctrl** + **R**.
1. Filter the items with **api.flow** and select the request that starts with **runs?api-version=**.
    <!--[For Angie: Recording button, Clear log button, Request URL in General and Authorization Bearer token in Request Headers need to be highlighted for sub steps here 3 thru 9]-->

1. From the Network tab > Headers sub-tab, copy the Request URL to a text editor
1. Replace the word **runs** with **regenerateAccessKey**.
1. Also, from the Network tab > Headers sub-tab, copy the Authorization Header carefully making sure to not pick up the next header
1. Copy the following text in your text editor:

``` json
fetch('<regenerateAccessKeyUrl>', {
  method: 'POST',
  headers: {
    'Content-type': 'application/json; charset=UTF-8',
   'Authorization': '<Authentication Header>'
  }
})
.then(result => result.json())
.then(console.log)
```

11.	Replace  `<regenerateAccessKeyUrl>` in the fetch command with the request URL you constructed in Step 8 in your text editor.
12.	Replace `<regenerateAccessKeyUrl>` with the Authorization header you copied in Step 9 to your text editor.

You're now ready with the command to regenerate the key.

## Step 3: Execute the regenerate request

Follow the instructions to regenerate the key.

1. Copy the code snippet from Step 2 that you constructed in the text editor.
1. Navigate to the Console tab and paste the text here.
1. Select **Enter**.

 
[Note for Angie: we need to black out all the text in red except the fetch, method: POST and other lines in Yellow]

    You should see the command executing as “Promise Pending”.

1. Open the flow in Power Automate Designer and open the HTTP trigger action. The Post URL shouldn't have a different value for “sig=” than what was recorded in Step 1. 

You successfully refreshed the SAS key.

## Troubleshooting

- If you encounter an error executing the command, do make sure that the text in the command doesn't have any extra spacings and is well constructed.
- If the command execution returns **Rejected**, the key might still be updated successfully. It’s best to validate the flow URL to ensure the `sig=` value is indeed updated.

