---
title: Explore the Power Automate home page
description: Learn how to navigate the Power Automate home page.
author: kisubedi
contributors:
  - kisubedi
  - jamiemwork
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: get-started
ms.date: 07/11/2025
ms.update-cycle: 180-days
ms.author: kisubedi
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.collection:
  - get-started
  - bap-ai-copilot
ms.custom: sfi-image-nochange
---

# Explore the Power Automate home page

Power Automate allows you to optimize your business processes across your organization and automate repetitive tasks. This service helps you create automated workflows between your favorite apps and services to synchronize files, get notifications, collect data, and more.

The Power Automate home page offers you various options for creating your own flows and learning about the key features for Power Automate. You can get a quick sense of what's possible and how Power Automate can help your business.

If your organization has AI enabled, then it also includes Copilot features.

To learn more, select the links following the screenshot.

:::image type="content" source="media/getting-started/home-full-numbers.png" alt-text="Screenshot of the new look of the home screen.":::

Legend:

1. [Left navigation pane](#1--left-navigation-pane)
1. [Search](#2--search)
1. [Environment information and settings](#3--environment-information-and-settings)
1. [AI Copilot](#4---ai-copilot)
1. [Learning tools and more](#5--learning-tools-and-more)
1. [Ask a chatbot](#6---ask-a-chatbot)

## 1 – Left navigation pane

Find what you need with the left navigation pane. When you sign in to [Power Automate home page](https://make.powerautomate.com), the left navigation pane shows the following menu items:

:::image type="content" source="media/getting-started/left-nav-menu-num.png" alt-text="Screenshot of the left navigation menu.":::

Legend:

1. **Home**: Takes you to the Power Automate home page.

1. **Create**: Create flows by using Copilot, templates or build your own.

1. **Templates**: View and search for templates you can use to create flows.

1. **Learn**: Learn experience takes you to the Power Automate product documentation.

1. **My Flows**: If you created a flow, or someone else created one and shared it with you, you can view or edit it.

1. **Your most used pages**: When you first sign in, items such as **Approvals**, **Solutions**, **Process mining**, **AI models**, and **Desktop Flow Activity** appear in the left navigation menu by default. Use the **More** menu item to [unpin](#pin-and-unpin) any of these items and [pin](#pin-and-unpin) something else.

1. **More**: [Pin](#pin-and-unpin) your most used items to the left navigation pane, such as **Tables**, **Cloud flow activity**, **Connections**, and more.

1. **Power Platform**: Explore other Power Platform products.

### Pin and unpin

Pin your most used pages in the navigation pane so you can quickly access features that you use frequently. Links to other pages are available through the **More** menu item. When you pin an item, it appears in the middle section above **More**.

When you sign in, the left navigation pane contains **Templates**, **Approvals**, **Solutions**, **Process mining**, **AI models**, and **Desktop Flow Activity**. However, you can pin and unpin pages to customize it to your preference.

To pin or unpin an item from the left navigation pane, select **More**, and then select the ![Screenshot of the Pin icon.](media/getting-started/pin.png) pin button or ![Screenshot of the Unpin icon.](media/getting-started/unpin.png) unpin button.

You can also unpin an item by selecting the vertical ellipsis (**&vellip;**) next to the item > **Unpin**.

### Discover all

Select **Discover all** to see the **Discover** page on the left navigation pane.

:::image type="content" source="media/getting-started/discover-all.png" alt-text="Screenshot of all applications.":::

To keep it pinned, select the ![Screenshot of the Pin icon.](media/getting-started/pin.png) pin button.

### Move up or move down

When you have some pages pinned in the navigation pane, you can move them up or down.

To move a page up or down, select the vertical ellipsis (**&vellip;**) next to the menu item that you want to move, and then select **Move up** or **Move down**.

:::image type="content" source="media/getting-started/move.png" alt-text="Screenshot of options to move up or down.":::

### Power Platform

From the left navigation pane, select **Power Platform** to access Power Platform services such as Power Platform admin center, Power BI, and Power Apps.

:::image type="content" source="media/getting-started/power-platform.png" alt-text="Screenshot of Power Platform services.":::

## 2 – Search

Use the **Search** field at the top of the screen to create flows.

## 3 – Environment information and settings

View your environment information and settings.

### Choose an environment

Environments create boundaries between different types of work. For example, an organization might have separate environments for different departments. Many organizations use environments to separate flows that are still being developed from those that are ready for widespread use. You might have access to multiple environments or only one. If you have the appropriate permissions, you might even be able to create your own environments.

To verify which environment you're in, find the environment switcher near the right side of the header.

:::image type="content" source="media/getting-started/environment-picker.png" alt-text="Environment switcher.":::

With the environment selector, environments are grouped into two categories: **Build Flows** and **Other environments**. Select **Filter** to filter the list of environments by your role, data platform (Dataverse or none), and environment type, such as production or sandbox.

:::image type="content" source="media/getting-started/environments-list.png" alt-text="Environment selector to filter and select an environment.":::

Environments where you have either system administrator and/or system customizer security role membership appear under **Build flows.** The **Other environments** list displays environments where you have read-only permissions, and can access approvals.

> [!TIP]
> Hover over an environment in the list to view the details of the environment.

**Filter environments by role**

| **Filter role** | **Power Platform role or description** |
|-------------------------|-------------------------|
| Admin | System administrator<br /></br>Environment administrator |
| Maker with data access | System administrator<br /></br>System customizer |
| Maker without full data access | Environment maker (with or without Dataverse) |
| Run only user | User without maker-level access |

> [!NOTE]
> - To view the environment list in the environment switcher in Power Automate, you must have the Environment Maker, System Customizer, or System Administrator security role in the environment. For information about predefined security roles, see [Predefined security roles](/power-platform/admin/database-security#predefined-security-roles) in the Microsoft Power Platform admin guide.
> - Make sure that you're in the correct environment *before* you create a flow, an app, or a similar component. You can't easily move components from one environment to another.
> - Every member in an organization can access the [default environment](/power-platform/admin/environments-overview#the-default-environment). Like any environment, users can see flows where they have sufficient privileges to access a flow.
> - When you create a flow in one environment, you aren't able to see it from another environment.

Learn more in [Environments overview](/power-platform/admin/environments-overview).

#### FAQ about environments

**Why does Power Automate show different environments compared to Power Apps?**

Power Automate and Power Apps both show environments with administrator access and environment maker access.

Power Apps shows environments with app contributor access, when users without a maker-level security role assigned but with edit permission to at least one canvas app in the environment. Learn more in [Choose an environment in Power Apps](/power-apps/maker/canvas-apps/sign-in-to-power-apps#choose-an-environment).

Power Automate shows environments user can approve approvals. Users are granted read access to environments that have approvals.

Since approvals are frequently used in Power Automate, users could have read access to many environments.

**How do I get access to environments?**

You can view access in the Power Platform admin center, by logging in using an account with environment administrator permissions. If you don't have administrator privileges, contact your administrator to obtain access.

Once in admin center, select the **Users** and **Teams** options under the access panel, environment admin could find everyone/teams has access to the environment. Environment admin could also change the security roles for a particular user.

More information: [Manage environments in Power Platform admin center](/power-platform/admin/environments-overview#manage-environments-in-the-power-platform-admin-center).

### Settings

Select the gear icon to perform tasks such as identify your Power Automate licenses, and open the page where you can perform administrative tasks.

- **Admin Center**: Opens the Power Platform admin center.

- **View all Power Automate Settings**: View or update your language and time settings, notifications, or access directories.

- **View My Licenses**: View your licenses. Learn more in [Licensing overview for Microsoft Power Platform](/power-platform/admin/pricing-billing-skus).

- **Themes**: From the list of themes, select a theme for your organization.

- **Password**: Change your password.

- **Contact preferences**: Update your contact information.

:::image type="content" source="media/getting-started/settings.png" alt-text="Screenshot of Power Automate settings.":::

### Help

In the header, select the question mark icon to find more information about Power Automate.

:::image type="content" source="media/getting-started/help.png" alt-text="Screenshot of the Help icon.":::

Here are some examples of what you can find with the help feature:

- Find links to documentation.
- Browse the Power Automate training on Microsoft Learn.
- Access the Power Automate Community, where you can share information with users in other organizations.
- Get announcements on the newest features in the Power Automate blog.

## 4 - AI Copilot

If your organization has AI enabled, then you see **Start building your flow with Copilot** on the Power Automate Home screen.

:::image type="content" source="media/getting-started/copilot.png" alt-text="Screenshot of Copilot field.":::

Learn more in [Create your first cloud flow using Copilot](create-cloud-flow-using-copilot.md).

## 5 – Learning tools and more

The Home page gives you access to learning tools, videos, community forums, and more. Scroll down the screen to view all the product related tools.

Here's the list of the main categories:

- **Learning for every level:** Discover learning modules you can take to learn how to use Power Automate.

- **More to explore in Power Automate:** Discover all that Power Automate has to offer such as video how-tos and the Power Automate Community forum.

- **What's new:** Learn about upcoming events and new and updated product features.

## 6 - Ask a chatbot

Get contextual help while building your flow using the Power Platform virtual agent. To learn more, go to [Get contextual help with flows from the Microsoft Copilot Studio bot](contextual-help-bot.md).

## Related information

- [Training: Get started with Power Automate (module)](/training/modules/get-started-flows/)
- [Training: Automate a business process using Power Automate (learning path)](/training/paths/automate-process-power-automate/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
