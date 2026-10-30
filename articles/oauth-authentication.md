---
title: Add OAuth authentication for HTTP request triggers
description: Learn about authentication parameters for HTTP request triggers.
author: radioblazer
contributors:
  - rakrish84
  - v-aangie
  - cyrilanderson
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 10/29/2026
ms.update-cycle: 180-days
ms.author: matow
ms.reviewer: cyanderson
ms.custom: bap-template
ms.collection: bap-ai-copilot
search.audienceType: 
  - flowmaker
---

# Add OAuth authentication for HTTP request triggers

Use the **When an HTTP request is received** trigger to start workflows by sending a request to the HTTP request endpoint generated from the flow. You can restrict this trigger to authenticated users.

## Choose an authentication parameter

The trigger has three modes for the authentication parameter:

1. **Any user in my tenant**: Ensures that any user in the same tenant as the maker can trigger this workflow.
1. **Specific users in my tenant**: Ensures that only specific user IDs from the same tenant can trigger this workflow. Enter email addresses of the specific users in the **Allowed users** field. You can also enter object IDs of service principal users if you intend to use this flow to be triggered only by SPN (service principal name) users.
1. **Anyone**: Legacy setting for this trigger that has open access without any additional authentication support. Anyone can trigger this workflow if they have access to the URL and the associated JSON schema.

> [!NOTE]
> If you select the **Specific users in my tenant** option and leave the allowed users blank, the authentication scope is limited to the tenant. This means any user in the tenant can trigger this workflow.

## Choose the claims for your HTTP request

If you restrict the workflow to be triggered only by authenticated users, ensure that the HTTP request contains the correct claims. The required claims are in the following list:

- `"aud":` audience of the flow service. This is where you find the audience values across different clouds. Learn more in [Audience values](#audience-values).
- `"iss":` Issuer of the requestor
- `"tid":` Tenant id of the requestor
- `"oid":` Object id of the requestor. Optional. This field is required only if you configured the trigger to restrict to specific users within the tenant.

You can check the claims of your request by pasting the bearer token within the authorization header at `https://jwt.io`. Learn more about extracting the tokens programmatically in [Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-overview).

### Audience values

The following table shows the audience values across different clouds. You must match the audience values exactly, including trailing slashes.

|Cloud type  |Audience value  |
|---------|---------|
|Public cloud    | `https://service.flow.microsoft.com/`    |
|Government Community Cloud (GCC)    | `https://gov.service.flow.microsoft.us/`        |
|Government Community Cloud High (GCCH)    | `https://high.service.flow.microsoft.us/`    |
|China     | `https://service.powerautomate.cn/`        |
|Department of Defense (DOD)   | `https://service.flow.appsplatform.us/`        |

## View the parameter in the designer

Depending on your designer version, parameters appear in different locations.

[!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

# [New designer](#tab/new-designer)

The parameter shows on the configuration panel to the left.

:::image type="content" source="./media/oauth-authentication/v3-oauth-parameter.png" alt-text="Screenshot of the HTTP request trigger's 'Who can trigger the flow?' parameter set to Specific users in my tenant in the new designer.":::

# [Classic designer](#tab/classic-designer)

The parameter appears on the card.

:::image type="content" source="./media/oauth-authentication/classic-oauth-parameter.png" alt-text="Screenshot of the Who can trigger the flow? dropdown in the HTTP request trigger in the classic designer.":::

---

## Related information

- [Overview of the Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-overview)
- [Regenerate the SAS key used in HTTP trigger flows](regenerate-sas-key.md)
