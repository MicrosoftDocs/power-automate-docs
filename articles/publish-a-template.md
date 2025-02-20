---
title: Submit a cloud flow template to the Power Automate gallery
description: Submit your flow as a template so that other organizations can find it in the template gallery and use the flow that you created.
suite: flow
author: ShefaaliP
contributors:
  - ShefaaliP
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 11/15/2024
ms.author: spatankar
ms.reviewer: angieandrews
ms.custom: ignite-2024
search.audienceType: 
  - flowmaker
  - enduser
---

# Submit a template to the Power Automate gallery

Templates help you to create flows more easily, and to imagine additional scenarios that would benefit from a cloud flow.

1. On the left pane, select **My flows**.
1. Select and open a cloud flow you want to publish.
1. On the menu at the top, select **Export** > **Package (.zip)**.

    :::image type="content" source="media/publish-a-template/export.png" alt-text="Screenshot of the 'Export' and 'Package (.zip)' menu options.":::

1. Provide the following details for your connector template so the end user is able to search the right template:
    - Name
    - Description

1. To download the connector template files, select **Export**.

    :::image type="content" source="media/publish-a-template/export-package.png" alt-text="Screenshot of the Export package screen with the 'Export' button.":::

1. Upload the package to a storage blob and generate the [SAS URL](/azure/ai-services/translator/document-translation/how-to-guides/create-sas-tokens?tabs=Containers).

    Ensure that your SAS URI is valid for at least 15 days.

## Set up your Partner Center Seller account

This is a one-time process for creating a Seller account in Partner Center. Seller accounts go through a vetting process before they can publish offers through Partner Center.

If you already have a Seller account, you need to enroll in the [Microsoft 365 and Copilot program](/partner-center/marketplace/open-a-developer-account#create-a-partner-center-account-and-enroll-in-the-microsoft-365-and-copilot-program).

To create a new Seller account, follow these steps:  

1. If you have an existing developer account in Partner Center, use those same credentials to access Partner Center.

    If you don't have an account, then follow the steps in [Create a Microsoft AI Cloud Partner Program account in Partner Center](/partner-center/mpn-create-a-partner-center-account).

1. Ensure you have the valid email address configured in your Entra ID account. To configure the email ID, follow the steps in [Manage user profile info](/entra/fundamentals/how-to-manage-user-profile-info).

    > [!NOTE]
    > If the Email ID for the Entra account is missing, the certification request is auto-rejected.

1. Before you can publish, verify your account information. Learn more in [Verify your account information when you enroll in a new Partner Center program](/partner-center/verification-responses).

1. [Enroll in the Microsoft 365 and Copilot program](/partner-center/marketplace/open-a-developer-account#create-a-partner-center-account-and-enroll-in-the-microsoft-365-and-copilot-program).

## Submit your package for certification

1. Sign in to [Partner Center](https://partner.microsoft.com/dashboard/home).
1. Under the **Home** heading, select **Marketplace offers** card.
1. On the **Marketplace offers | Overview** page, select **Microsoft 365 and Copilot** program.
1. On the **Microsoft 365 and Copilot** page, select **New offer** > **Connectors & Agents in Microsoft Copilot Studio**.
1. In the **Name** field in the **New Connectors & Agents in Microsoft Copilot Studio** screen, enter a unique name for your offer.

    This name is used to help you identify your offer in Partner Center. We recommend that you include the name of your connector and associated AI enabled connector.

Next, you're taken to the **Product setup** page. You don't need to enter information here. The **Status** is marked as **Complete** to indicate there's nothing for you to do.

### Package your connector based templates

1. On the navigation bar to the left, select **Packages**.
1. On the **Packages** tab in the **SAS URI** field, enter the link to the SAS URI of your package containing the connector based template.
1. Ensure your package complies with Marketplace Policies for Power Platform listed in [5000 Power Platform Connectors](/legal/marketplace/certification-policies#5000-power-platform-connectors).
1. Select **Save draft**.

### Set properties

1. On the navigation bar to the left, select **Properties**.

1. On the **Properties** tab, do the following steps:
    1. In the **General Info** group, choose up to three (3) categories that your connector and/or AI enabled connector associates best with.
    1. In the **Legal and support info** group, you need to provide three (3) pieces of information.
        1. In the first field, you can either enter an HTTPS URL to your End User Licensing Agreement, or you can use the Microsoft commercial marketplace Standard Contract. We recommend that you use the Standard Contract.

           To choose the Standard Contract, select the checkbox.

        1. In the **Privacy policy link** field, enter the privacy link for your policies regarding the user's personal information.
        1. In the **Support document link** field, enter the support link for customers to refer to in case they have issues.
    1. Select **Save** to save your draft.

### Post-submission steps

1. After you submit your offer, wait 24 to 48 hours for Microsoft to review your offer.

    You can review the status of your offer as it is progressing through certification lifecycle. Inside your offer, go to the **Product overview** tab.

1. Within 48 hours, Microsoft updates the certification report in the **Product overview** tab.

    If your package passed the certification guidelines, you're asked to move to next stage. If it didn't pass, you're required to update the package based on the certification report and resubmit the package.

1. Once the certification is completed in the **Product overview** for your offer under **Publisher signoff**, select **Go live**.

### Wait for deployment

The Power Automate team verifies and *possibly modifies* your template. If the team approves your template, it appears in the gallery of templates for Power Automate. After your offer is live, we deploy your connector template across all products and regions within 48 hours.

> [!NOTE]
> - If you want to update your offer content in future, for example, you want to submit version upgrades to the connector template, follow the same rules: To initiate the update request, select the **Product overview** tab for your certified offer, and select the update present for the section you want to modify.
> - Templates are for use in the public gallery only. They aren't supported for private use.

[!INCLUDE[footer-include](includes/footer-banner.md)]
