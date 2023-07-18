---
title: Power Automate sign-up FAQ
description: Learn common questions and their answers about licenses, administration, and users signing up for Power Automate in your Office 365 tenant.
services: ''
author: PriyaKodukula
contributors:
  - PriyaKodukula
  - v-aangie
ms.author: prkoduku
ms.reviewer: angieandrews
ms.topic: faq
ms.date: 04/21/2023
---

# Power Automate sign-up FAQ

This article describes how users in your organization can use Power Automate. It also describes how you can control the Power Automate service.

## Sign up for Power Automate

### What is Power Automate?

Power Automate is a public cloud service that helps you and your teams to set up automated workflows between your favorite apps and services. Power Automate allows you to synchronize, get notifications, collect data, and more.

### How can I sign up for Power Automate?

To complete the sign in process, do the following steps:

1. Open [Power Automate](https://make.powerautomate.com).
1. On the top right of the screen, select **Try free**.
1. Enter your information.

To learn more, go to [Sign up for Power Automate](sign-up-sign-in.md).

### What is the Power Automate free license?

The Power Automate free license is used only for tracking purposes. Enabling or disabling it has no effect on your ability to create flows. If you disable the Power Automate free license, it becomes enabled again when you log in. This is the expected behavior.

### Can I block another person from signing up for Power Automate?

Power Automate is a fully public cloud service. Everyone in the world can sign up and use it to automate their day-to-day tasks. To use Power Automate, there isn't a requirement that you have or use an Office 365 account. Because of this, there’s no mechanism at this time for you to block another person from using Power Automate.

If a person signs up for Power Automate, and you don't support them inside of your organization, they can't incur costs to your company. When an individual signs up for Power Automate, the relationship is between that individual and Microsoft. This is like many other cloud services from Microsoft, such as Bing, OneDrive, or Outlook.com. Your use of Power Automate doesn't imply that the service is provided by your organization.

A company can restrict the use of organization-only data inside of Power Automate through [Data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention).

### How can people gain access to the paid features of Power Automate?

Individuals can gain access to the paid features of Power Automate in three different ways:

1. They can individually sign up for a Power Automate trial license for 90 days at no cost.
2. You can assign a Power Automate license to them within the [Microsoft 365 admin center](https://admin.microsoft.com/).
3. The user has been assigned a Microsoft 365 and Dynamics 365 plans that includes access to Power Automate. For the list of Office 365 and Dynamics 365 plans that include Power Automate capabilities, go to [Power Automate pricing page](https://make.powerautomate.com/pricing/).

### Can I block another person from using the paid features of Power Automate?

Any individual can try out the paid features of Power Automate for 90 days, and incur no costs. However, you can fully manage the assignment of the perpetual paid licenses inside of your organization through the Office 365 admin portal.

As with the free offerings, if an individual signs up for the trial, that's a direct relationship between the individual and Microsoft. It isn't necessarily endorsed by your company.

## Administration of Power Automate

### Why has the Power Automate icon appeared in the Office 365 app launcher?

Power Automate is a fundamental part of the Office 365 suite. It's  enabled as a service as a part of all existing Office 365 SKUs. As users everywhere in the world can use Power Automate, it appears in the app launcher for them.

### How do I remove Power Automate from the app launcher for my organization?

If a user was assigned a Power Automate license, you can remove the license for that user with these steps. This will remove the Power Automate icon from the app launcher:

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).
1. On the left navigation bar, select **Users** > **Active Users**.
1. Find and select the name of the user for whom you want to remove the license.
1. On the user details pane, select the **Licenses and Apps** tab.
1. Uncheck the license for Power Automate.
1. At the bottom of the pane, select **Save changes**.

Bulk removal of licenses is also possible through PowerShell. To learn more, go to [Remove licenses from user accounts with Office 365 PowerShell](/microsoft-365/enterprise/remove-licenses-from-user-accounts-with-microsoft-365-powershell) and [Disable access to services with Office 365 PowerShell](/microsoft-365/enterprise/disable-access-to-services-with-microsoft-365-powershell).

>[!NOTE]
>This action removes the Power Automate tile by default. A user may still choose to use Power Automate as an individual.

### Why did 10,000 licenses for Power Automate show up in my Office 365 tenant?

Any person can try out Power Automate for free. These licenses represent the available capacity for new Power Automate users in your tenant. There isn't a charge for these licenses.

If at least one user in your tenant has signed up for a **Microsoft Power Automate Free** license, you'll see 10,000 licenses (minus any assigned) under **Billing** > **Licenses** for your organization.

You can assign additional licenses to users through the Office 365 admin portal.

### Is this free? Will I be charged for these licenses?

No user can incur any cost to your organization without your express consent. Free and trial licenses can't cause any charges to your organization.

### I removed the Power Automate free license and users can still access it.

The Power Automate free license is included only for tracking purposes. It isn't possible to prevent another person from using Power Automate for individual purposes.

### Why can't I see all Power Automate licenses in the Office 365 Admin portal?

Users can use Power Automate either as individuals or as a part of their organization. Licenses at the organization level will always be visible in the Office 365 portal. However, if a user signs up for a trial as an individual, then that isn't managed by their Office 365 admin and won't show up in the portal.

### How does an individual find out what plan they are on?

1. Sign into [Power Automate](https://make.powerautomate.com).
1. On the top right corner of the screen, select your profile picture.
1. Select **View account**.
1. Select the **Subscriptions** tile.
1. Under the **Licenses** section, search for **Power Automate**.

   You'll see the license that you have for Power Automate.

### Will Power Automate signup impact the identities in my organization?

If your organization already has an existing Office 365 environment and all users in your organization have Office 365 accounts, then identity management isn't impacted.

If your organization already has an existing Office 365 environment, but not all users in your organization have Office 365 accounts, then we create a user in the tenant. We'll also assign licenses based on the user’s work or school email address. This means that the number of users you're managing at any time will grow as users in your organization sign up for the service.

If your organization doesn't have an Office 365 environment connected to your email domain, there isn't a change in how you manage identity. Users will be added to a new, cloud-only user directory, and you'll have the option to take over as the tenant admin and manage them.

### A new tenant was created by Power Automate, how do I manage this?

If a new tenant was created by Power Automate, then you can claim and manage that tenant using the following steps:

1. Join the tenant by signing up for Power Automate using an email address domain that matches the tenant domain you want to manage. For example, if Microsoft created the contoso.com tenant, then join the tenant with an email address ending with @contoso.com.
1. Claim admin control by verifying domain ownership: once you're in the tenant, you can promote yourself to the admin role by verifying domain ownership. To do so, follow these steps:

   1. Go to [https://admin.microsoft.com](https://admin.microsoft.com/Start?sku=flow_free).
   1. Select the app launcher icon in the upper-left and choose Admin.
   1. Read the instructions on the **Become the admin** page, and then choose **Yes, I want to be the admin**.  

       >[!TIP]
       >If this option doesn’t appear, an Office 365 administrator is already in place.

### If I have multiple domains, can I control the Office 365 tenant that users are added to?

If you do nothing, a tenant is created for each user email domain and subdomain.

If you want all users to be in the same tenant regardless of their email address extensions, you can create a target tenant ahead of time or use an existing tenant. Add all the existing domains and subdomains that you want consolidated within that tenant. Then all the users with email addresses ending in those domains and subdomains automatically join the target tenant when they sign up.

>[!IMPORTANT]
>There isn't a supported automated way to move users across tenants. To learn about adding domains to a single Office 365 tenant, go to [Add your users and domain to Office 365](https://support.office.com/article/Add-your-users-and-domain-to-Office-365-ffdb2216-330d-4d73-832b-3e31bcb5b2a7).

### How can I restrict my users' ability to access my organization's business data?

Power Automate allows you to create data zones for business and non-business data, as shown below. Once these data loss prevention policies are implemented, users are prevented from designing or running Power Automate that combines business and non-business data. To learn more, go to [Data loss prevention (DLP) policies](prevent-data-loss.md).

  ![Data loss prevention image.](./media/organization-q-and-a/data-loss-prevention-policy.png "Data loss prevention image")

## Power Automate RPA license

### How can I apply unattended RPA licenses to my flow?

Follow these steps to apply unattended RPA licenses to your flows.

1. The tenant admin must purchase or get trial a version of the Power Automate Process add-on capacity for the tenant. The tenant admin can do this from the [Microsoft 365 admin portal](https://admin.microsoft.com/AdminPortal/Home#/catalog). Just search the purchase services page for the add-on.

   ![get unattended license.](./media/RPA-license/unattended-license-M365.JPG)

1. The environment admin must assign the available (paid or trial) unattended add-on capacities to a specific environment.

   ![manage unattended license.](./media/RPA-license/unattended-license-manage.png)

1. Makers can now run unattended desktop flows within the environment that has the unattended capacity. 

> [!NOTE]
> The unattended add-on is environment-specific. So, if you have multiple environments that need to run unattended RPA, you need to assign add-on capacity to each of them.
> Also if you need to run multiple unattended desktop flows in parallel in a single environment, you need to assign the right number of unattended add-ons to the environment to support the flow runs.

### What are the prerequisites for using RPA?

- An environment that has Dataverse enabled.
- You must have a work or school account. You can't start a trial with a personal account.
- The admin needs a paid or trial attended plan or a Power Automate Process plan before they can turn on to start an unattended trial.

### How can I check which license I'm currently using?

A user can press CTRL+ALT+A from Power Automate to check their license status.

>[!NOTE]
>There isn't a user interface available to check license status.


### Can trials be disabled for a tenant?

Yes. Tenant admins can use PowerShell to disable all trials activations for a tenant.

### How to start an unattended trial

1. Select **Purchase services** in the Microsoft 365 admin center, and then select **Add-ons**.

   ![Purchase add-on for licensing.](./media/rpa-license/purchase-services-add-ons.png)

1. Select **Power Automate Process add-on Trial**. 

   ![Add on trial selection.](./media/rpa-license/unattended-rpa-add-on-trial.png)

1. Select **Get free trial**.

   ![The free trial button.](./media/rpa-license/get-free-trial.png)

You'll now see that the unattended trial is now active in your list of add-ons.

   ![List of add-ons.](./media/rpa-license/list-add-ons.png)


### Assign Power Automate Process add-on capacity to an environment

Before you can assign add-ons, such as trial licenses, you must [get the add-ons](#how-to-start-an-unattended-trial).

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select **Resources** > **Capacity** > **Manage**.

   ![Display the manage add-ons screen.](./media/rpa-license/manage-add-ons.png)

1. Select the environment to which you want to assign the unattended RPA licenses, assign the capacity, and then select **Save**. 

   ![Assign unattended license to environment.](./media/rpa-license/assign-to-environment.png)

>[!NOTE]
>
>- You'll need to assign add-on capacity to each environment that needs to run RPA unattended.
>- You'll need to ensure you assign enough capacity if you'll run desktop flows in parallel.
>- Only admins can assign unattended trial capacity.


