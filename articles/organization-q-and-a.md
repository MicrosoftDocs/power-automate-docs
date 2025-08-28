---
title: Power Automate sign-up FAQ
description: Get answers to common questions about licenses, administration, and how users can sign up to use Power Automate in your Microsoft 365 tenant.
author: PriyaKodukula
ms.author: angieandrews
ms.reviewer: angieandrews
contributors:
  - PriyaKodukula
  - v-aangie
ms.topic: faq
ms.date: 04/21/2023
---

# Power Automate sign-up FAQ

This article answers some common questions about how users in your organization can use Power Automate and how you can control the Power Automate service.

## Sign up for Power Automate

### What is Power Automate?

Power Automate is a public cloud service that helps you and your teams to set up automated workflows between your favorite apps and services. Power Automate allows you to synchronize, get notifications, collect data, and more.

### How can I sign up for Power Automate?

1. Open [Power Automate](https://make.powerautomate.com).
1. At the upper-right corner of the page, select **Try free**.
1. Enter your information.

[Sign up for Power Automate](sign-up-sign-in.md).

### What is the Power Automate free license?

The Power Automate free license is used only for tracking purposes. Enabling or disabling it has no effect on your ability to create flows. If you disable the Power Automate free license, it becomes enabled again when you sign in. This behavior is expected.

### Can I block another person from signing up for Power Automate?

Power Automate is a fully public cloud service. Everyone in the world can sign up and use it to automate their day-to-day tasks. There isn't a requirement that someone have or use a Microsoft 365 account to use Power Automate. For that reason, there's no way to block someone from using it.

If a person signs up for Power Automate who is outside your organization, they can't incur costs to your company. When an individual signs up for Power Automate, the relationship is between that individual and Microsoft. Many other cloud services from Microsoft, such as Bing, OneDrive, and Outlook.com, operate the same way. Your use of Power Automate doesn't imply that the service is provided by your organization.

A company can restrict the use of organization-only data inside of Power Automate through [data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention).

### How can people gain access to the paid features of Power Automate?

Individuals can gain access to the paid features of Power Automate in three ways:

1. They can individually sign up for a Power Automate trial license for 90 days at no cost.
2. You can assign a Power Automate license to them in the [Microsoft 365 admin center](https://admin.microsoft.com/).
3. They're assigned a Microsoft 365 and Dynamics 365 plan that includes access to Power Automate. For the list of Microsoft 365 and Dynamics 365 plans that include Power Automate capabilities, refer to the [Power Automate pricing page](https://make.powerautomate.com/pricing/).

### Can I block another person from using the paid features of Power Automate?

Any individual can try out the paid features of Power Automate for 90 days without incurring any costs. You can manage assignment of your organization's perpetual paid licenses in the Microsoft 365 admin portal.

As with the free offerings, if an individual signs up for the trial, the relationship is between the individual and Microsoft.

## Administrate Power Automate

### Why has the Power Automate icon appeared in the Microsoft 365 app launcher?

Power Automate is a fundamental part of the Microsoft 365 suite. It's enabled as a service as part of all Microsoft 365 SKUs. Because users everywhere in the world can use Power Automate, it appears in the app launcher for them.

### How do I remove Power Automate from the app launcher for my organization?

If a user was assigned a Power Automate license, unassign the user's license to remove the Power Automate icon from the app launcher. This action removes the Power Automate tile by default. A user may still choose to use Power Automate as an individual.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).
1. On the left side panel, select **Users** > **Active Users**.
1. Find and select the name of the user for whom you want to remove the license.
1. On the user details pane, select the **Licenses and Apps** tab.
1. Clear the license for Power Automate.
1. Select **Save changes**.

You can also [use PowerShell to remove licenses in bulk](/microsoft-365/enterprise/remove-licenses-from-user-accounts-with-microsoft-365-powershell) and [use PowerShell to disable access to services](/microsoft-365/enterprise/disable-access-to-services-with-microsoft-365-powershell).

> [!NOTE]
> This action removes the Power Automate tile by default. A user might still choose to use Power Automate as an individual.

### Why did 10,000 licenses for Power Automate show up in my Microsoft 365 tenant?

Any person can try out Power Automate for free. These licenses represent the available capacity for new Power Automate users in your tenant. There isn't a charge for these licenses.

If at least one user in your tenant has signed up for a **Microsoft Power Automate Free** license, 10,000 licenses (minus any assigned) are available under **Billing** > **Licenses** for your organization.

You can assign more licenses to users in the Microsoft 365 admin portal.

### Is this free? Will I be charged for these licenses?

No user can incur any cost to your organization without your express consent. Free and trial licenses can't cause any charges to your organization.

### I removed the Power Automate free license. Why can users still access it?

The Power Automate free license is included only for tracking purposes. It isn't possible to prevent another person from using Power Automate for individual purposes.

### Why can't I see all Power Automate licenses in the Microsoft 365 admin portal?

Users can use Power Automate either as individuals or as a part of their organization. Licenses at the organization level are always visible in the Microsoft 365 admin portal. However, if a user signs up for a trial as an individual, then their Microsoft 365 admin doesn't manage the trial and it doesn't show up in the portal.

### How does an individual find out what plan they are on?

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. At the upper-right corner of the page, select your profile picture.
1. Select **View account**.
1. Select the **Subscriptions** tile.
1. Under the **Licenses** section, search for **Power Automate**.

### Will Power Automate signup affect the identities in my organization?

If your organization already has a Microsoft 365 environment and all users in your organization have Microsoft 365 accounts, then identity management isn't affected.

If your organization already has a Microsoft 365 environment, but not all users in your organization have Microsoft 365 accounts, then we create a user in the tenant. We also assign licenses based on the user's work or school email address. The number of users you're managing at any time grows as users in your organization sign up for the service.

If your organization doesn't have a Microsoft 365 environment connected to your email domain, there's no change in how you manage identity. Users are added to a new, cloud-only user directory, and you can take over as the tenant admin and manage them.

### Power Automate created a tenant. How do I manage it?

First, join the tenant. Then, promote yourself to the admin role, if it hasn't already been claimed, by verifying domain ownership.

1. Sign up for Power Automate using an email address domain that matches the tenant domain you want to manage.

    For example, if Microsoft created the contoso.com tenant, then join the tenant with an email address that ends with @contoso.com.

1. Go to [https://admin.microsoft.com](https://admin.microsoft.com/Start?sku=flow_free).
1. Select the app launcher icon in the upper-left corner of the page, and then select **Admin**.
1. Read the instructions on the **Become the admin** page, and then select **Yes, I want to be the admin**.

   If this option doesn't appear, a Microsoft 365 administrator is already in place. An Office 365 administrator is already in place.

### If I have multiple domains, can I control the Microsoft 365 tenant that users are added to?

If you do nothing, a tenant is created for each user email domain and subdomain.

If you want all users to be in the same tenant regardless of their email domain, create a target tenant ahead of time or use an existing tenant. Add all the existing domains and subdomains that you want consolidated in that tenant. Then all the users with email addresses ending in those domains and subdomains automatically join the target tenant when they sign up.

> [!IMPORTANT]
> There isn't a supported automated way to move users across tenants. [Learn about adding users and domains to Microsoft 365](https://support.office.com/article/Add-your-users-and-domain-to-Office-365-ffdb2216-330d-4d73-832b-3e31bcb5b2a7).

### How can I restrict my users' ability to access my organization's business data?

Power Automate allows you to create data zones for business and nonbusiness data, as shown in the following screenshot. After you implement these [data loss prevention policies](prevent-data-loss.md), users can't design or run Power Automate flows that combine business and nonbusiness data.

There isn't a supported automated way to move users across tenants. To learn about adding domains to a single Office 365 tenant, go to [Add your users and domain to Office 365](https://support.office.com/article/Add-your-users-and-domain-to-Office-365-ffdb2216-330d-4d73-832b-3e31bcb5b2a7).

## Manage Power Automate RPA licenses

### How can I apply unattended RPA licenses to my flow?

1. The tenant admin must purchase or get a trial version of the unattended RPA add-on capacity for the tenant in the [Microsoft 365 admin portal](https://admin.microsoft.com/AdminPortal/Home#/catalog).

1. The environment admin must assign the available paid or trial unattended add-on capacities to a specific environment.

   :::image type="content" source="media/RPA-license/unattended-license-manage.png" alt-text="Screenshot of the Manage add-ons page in the Power Platform admin center, with highlighted fields.":::

1. Makers can now run unattended desktop flows in the environment that has the unattended capacity.

The unattended add-on is environment-specific. If you have multiple environments that need to run unattended RPA, you need to assign add-on capacity to each of them.

Also, if you need to run multiple unattended desktop flows in parallel in a single environment, you need to assign the right number of unattended add-ons to the environment to support the flow runs.

1. The tenant admin must purchase or get trial a version of the **Power Automate Process** plan (previously Power Automate Unattended RPA add-on) capacity for the tenant. The tenant admin can do this from the [Microsoft 365 admin portal](https://admin.microsoft.com/AdminPortal/Home#/catalog). Just search the purchase services page for the license.

1. The environment admin must assign the available (paid or trial) capacities to a specific environment.

   ![manage unattended license.](./media/RPA-license/assign-process-license-environment.png)

1. Makers can now run unattended desktop flows within the environment that has the Process license assigned. 

> [!NOTE]
> The Process license is environment-specific. So, if you have multiple environments that need to run unattended RPA, you need to assign licenes to each of them.
> You need to assign one Process license per machine that is used for unattended desktop flows. If you need to run multiple unattended desktop flows in parallel on a machine, you will also need to assign one Process license for each additional Desktop Flow you want to run concurrently on the machine.

### What are the prerequisites for using RPA?

- You must have an environment that has Microsoft Dataverse enabled.
- You must have a work or school account. You can't start a trial with a personal account.
- The admin needs a paid or trial attended plan or a per-flow plan to start an unattended trial.

### How can I check which license I'm using?

Press Ctrl+Alt+A in Power Automate to check your license status. There isn't a way to check license status in the user interface.
The admin needs a paid or trial Power Automate Premium (previously Power Automate per user with attended RPA) or a Power Automate Process plan (previously Power Automate per flow) before they can turn on to start an unattended trial.

### Can trials be disabled for a tenant?

Tenant admins can use PowerShell to disable all trial activations for a tenant.

### How can I start an unattended trial?

1. Select **Purchase services** in the Microsoft 365 admin center, and then search for  **Power Automate Process**.

1. Select **Power Automate unattended RPA add-on Trial**.

1. Select **Get free trial**.

### Assign unattended RPA add-on capacity to an environment

Only admins can assign unattended trial capacity. Assign add-on capacity to each environment that needs to run RPA unattended. Make sure you assign enough capacity if you intend to run desktop flows in parallel.

1. [Get the add-on](#how-can-i-start-an-unattended-trial).

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select **Power Automate Process plan**

1. Select **Get free trial**.

### Assign Power Automate Process plan (previously Power Automate process flow) capacity to an environment

Before you can assign capacity, such as trial licenses, you must [get the Process licences](#how-can-i-start-an-unattended-trial).

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select **Resources** > **Capacity** > **Manage**.

   ![Display the manage add-ons screen.](./media/rpa-license/manage-add-ons.png)

1. Select the environment to which you want to assign the Power Automate Process licenses, assign the capacity, and then select **Save**.

   ![Assign unattended license to environment.](./media/rpa-license/assign-process-license-environment.png)

> [!NOTE]
>
>- You'll need to assign capacity to each environment that needs to run unattended RPA.
>- You'll need to ensure you assign enough capacity if you'll run desktop flows in parallel.
>- Only admins can assign the capacity.


