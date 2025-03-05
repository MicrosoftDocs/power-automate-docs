---
title: Add OAuth authentication for HTTP request triggers
description: Learn about authentication parameters for HTTP request triggers.
author: rakrish84
contributors:
  - rakrish84
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 09/04/2024
ms.author: rakrish
ms.reviewer: angieandrews
ms.custom: bap-template
ms.collection: bap-ai-copilot
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

## Choose the claims for your HTTP request

If you're restricting the workflow to be triggered only by authenticated users, you need to ensure that the HTTP request contains the correct claims. The required claims are in the following list:

- `"aud":` \<audience of the flow service>. This is where you find the audience values across different clouds. More information: [Audience values](#audience-values)
- `"iss":` \<Issuer of the requestor>
- `"tid":` \<tenant id of the requestor>
- `"oid":` \<object id of the requestor>. Optional. This field is required only if you have configured the trigger to restrict to specific users within the tenant.

You can check the claims of your request by pasting the bearer token within the authorization header at https://jwt.io. For more information on extracting the tokens programmatically, go to the [Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-overview).

### Audience values

The following table shows the audience values across different clouds:


|Cloud type  |Audience value  |
|---------|---------|
|Public cloud    | `https://service.flow.microsoft.com/`    |
|Government Community Cloud (GCC)    | `https://gov.service.flow.microsoft.us/`        |
|Government Community Cloud High (GCCH)    | `https://high.service.flow.microsoft.us/`    |
|China     | `https://service.powerautomate.cn/`        |
|Department of Defense (DOD)   | `https://service.flow.appsplatform.us/`        |

## View the parameter in the designer

Depending on your designer version, parameters appear in different locations.

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

# [Edit with Copilot](#tab
-copilot)

The parameter shows on the configuration panel to the left.

:::image type="content" source="./media/oauth-authentication/v3-oauth-parameter.png" alt-text="Screenshot of who can trigger the cloud flow in the designer with Copilot.":::

# [Classic designer](#tab/classic-designer)

The parameter shows on the card.

:::image type="content" source="./media/oauth-authentication/classic-oauth-parameter.png" alt-text="Screenshot of who can trigger the cloud flow in the classic designer.":::

---

## Related information

- [Overview of the Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-overview)
- [Regenerate the SAS key used in HTTP trigger flows](regenerate-sas-key.md)


