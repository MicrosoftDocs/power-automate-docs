---
title: Add OAuth authentication for HTTP request triggers
description: Learn about authentication parameters for HTTP request triggers.
author: rakrish84
contributors:
  - rakrish84
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 09/18/2023
ms.author: rakrish
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType: 
  - flowmaker
---

# Add OAuth authentication for HTTP request triggers

You can use the **When an HTTP request is received** trigger to trigger workflows by sending a request to an HTTP request to the endpoint generated from the flow. You can restrict what users can trigger in this workflow by ensuring that only authenticated users can trigger this workflow.

> [!NOTE]
> This feature is being rolled out and might not be available in your region yet.

## Choose an authentication parameter

The trigger has three modes for the authentication parameter:

1. **Any user in my tenant**: Ensures that any user in the same tenant as the maker is able to trigger this workflow. This is the default setting for any new flows.
1. **Specific users in my tenant**: Ensures that only specific user IDs from the same tenant can only trigger this workflow. You can provide email addresses of the specific users in the **Allowed users** field. You can also provide object IDs of service principal users if you intend to use this flow to be triggered only by SPN (service principal name) users.
1. **Anyone**: Legacy setting for this trigger that has open access without any additional authentication support. Anyone can trigger this workflow if they have access to the URL and the associated JSON schema.

> [!NOTE]
> If you select the **Specific users in my tenant** option and leave the allowed users blank, the authentication scope is limited to the tenant. This means any user in the tenant can trigger this workflow.

If you're restricting the workflow to be triggered only by authenticated users, you need to ensure that the HTTP request contains the correct claims (for example, tenant id, user id, or object id).

## View the parameter in the designer

Depending on whether you're using the classic cloud flows designer or the new cloud flows designer with Copilot, the parameter appears in a different location. To identify which designer you’re using, go to the **Note** section in [Understand the new cloud flows designer with Copilot (preview)](flows-designer.md).

If you're using the classic cloud flows designer, the parameter shows on the card.

:::image type="content" source="./media/oauth-authentication/classic-oauth-parameter.png" alt-text="Screenshot of who can trigger the cloud flow in the classic designer.":::

If you're using the new cloud flows designer with Copilot, the parameter shows on the configuration panel to the left.

:::image type="content" source="./media/oauth-authentication/v3-oauth-parameter.png" alt-text="Screenshot of who can trigger the cloud flow in the designer with Copilot.":::

### See also

[Overview of the Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-overview)

