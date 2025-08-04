---
title: Create environment variables
description: Create environment variables and use them accross environments.
author: v-aangie
ms.author: angieandrews
ms.reviewer: angieandrews
ms.date: 08/04/2025
ms.topic: how-to
---
Using **environment variables** in **Power Automate** is a great way to
manage values that are used across multiple flows, especially when
you're working in **solutions**. They help you avoid hardcoding values
and make your flows more portable and easier to maintain.

Here’s a step-by-step guide on how to use environment variables in Power
Automate:

**🔧## Create Environment Variables**

Environment variables are created within a **solution**.

1.  Go to **Power Automate**.

2.  Click on **Solutions** in the left-hand menu.

3.  Open an existing solution or create a new one.

4.  Click **+ New** \> **More** \> **Environment variable**.

5.  Fill in the details:

    - **Display name**: A friendly name for the variable.

    - **Name**: The unique name used in code.

    - **Data type**: Choose from Text, JSON, Boolean, Number, etc.

    - **Default value**: The value used unless overridden.

    - **Current value**: Optional override for the current environment.

**\## Use Environment Variables in Flows**

Once created, you can reference environment variables in your flows.

1.  In your solution, create or open a **cloud flow**.

2.  When adding an action that requires a value (e.g., a URL, email
    address, or folder path), click the **dynamic content** panel.

3.  Search for and select your environment variable.

4.  It will be inserted as a dynamic value.

\## **Update Environment Variables**

You can update the **current value** of an environment variable without
changing the default. This is useful when deploying to different
environments (e.g., Dev, Test, Prod).

1.  Go to **Solutions** \> open your solution.

2.  Find the environment variable and click on it.

3.  Update the **Current Value** field.

4.  Save and publish.

\## **Deploying Across Environments**

When exporting/importing solutions:

- You can choose to **override** environment variable values during
  import.

- This allows you to maintain different values for different
  environments without modifying the flow logic.

**\## Related information**

**Best Practices**

\## Example

example of how to update/use an environment variable in a flow, or how
to structure one for a specific use case like API integration or
SharePoint paths.

**You said:**

Explain updating variables in different environments.

Updating **environment variables in different environments** is a key
part of managing **application lifecycle** in Power Platform. It allows
you to maintain the same logic in your flows, apps, or other components
while changing only the values that are environment-specific—like URLs,
credentials, or configuration settings.

Here’s how it works and how to manage it effectively:

**🔁How to Update Environment Variables in Different Environments**

**✅Step 1: Create Environment Variables in a Solution**

- Create your environment variables in a **solution** in
  your **Development** environment.

- Set the **default value** (optional) and **current value** (used at
  runtime).

**📦Step 2: Export the Solution**

- Export the solution from Development.

- Choose **Managed** or **Unmanaged** depending on your deployment
  strategy.

**📥Step 3: Import the Solution into Another Environment**

- Go to the **target environment** (e.g., Test or Production).

- Import the solution.

**🛠️Step 4: Set Environment Variable Values During Import**

During the import process:

- Power Platform will **prompt you** to provide values for each
  environment variable.

- You can **override** the default values with environment-specific
  ones.

For example:

| **Variable Name** | **Dev Value**          | **Prod Value**       |
|-------------------|------------------------|----------------------|
| API_Base_URL      | https://dev.api.com    | https://prod.api.com |
| SupportEmail      | devsupport@company.com | support@company.com  |

**🔄Step 5: Update Values Later (Optional)**

If you need to change the value after import:

1.  Go to **Solutions** in the target environment.

2.  Open the solution.

3.  Find the environment variable.

4.  Click **Edit** and update the **Current Value**.

5.  Save and publish.

**🧠Tips for Managing Environment Variables**

- Use **naming conventions** like ENV_API_URL or ENV_SupportEmail to
  make them easy to identify.

- Keep **default values** generic or blank if they should always be
  overridden.

- Use **JSON** type for structured data like configuration objects.

- Document the purpose of each variable for team clarity.

Would you like a downloadable checklist or template for managing
environment variables across environments?

**You said:**

Provide a checklist for managing variables.

Here's a **comprehensive checklist** for managing **Power Automate
environment variables** across environments like Development, Test, and
Production. This will help ensure consistency, reduce errors, and
streamline deployments.

**✅Environment Variable Management Checklist**

**🔹1. Planning & Naming**

-  Define the purpose of each environment variable (e.g., API URL,
  email, SharePoint site).

-  Use a consistent naming convention
  (e.g., ENV_API_URL, ENV_SupportEmail).

-  Document each variable’s purpose and expected values per environment.

**🔹2. Creation in Development**

-  Create environment variables **within a solution**.

-  Set a **default value** (optional, but helpful for Dev).

-  Set a **current value** for the Development environment.

-  Choose the correct **data type** (Text, JSON, Boolean, etc.).

-  Test flows using the environment variables to ensure they work as
  expected.

**🔹3. Exporting the Solution**

-  Export the solution as **Managed** or **Unmanaged** depending on your
  deployment strategy.

-  Ensure all environment variables are included in the solution.

-  Document which variables need to be updated in each environment.

**🔹4. Importing into Target Environment**

-  Import the solution into the target environment (Test, UAT, or Prod).

-  During import, **override environment variable values** with
  environment-specific ones.

-  Verify that all required variables have been set correctly.

**🔹5. Post-Import Validation**

-  Open the solution and verify the **current values** of environment
  variables.

-  Run test flows to confirm they are using the correct values.

-  Check for any hardcoded values that should be replaced with
  variables.

**🔹6. Maintenance & Updates**

-  Regularly review environment variables for accuracy and relevance.

-  Update **current values** directly in the environment when needed
  (e.g., endpoint changes).

-  Avoid changing **default values** unless necessary for all
  environments.

-  Keep documentation up to date with any changes.

How do I use a Power Automate environment variable in a cloud flow?

**Copilot said:**

**Copilot**

Using an **environment variable in a Power Automate cloud flow** is
straightforward once the variable is created within a **solution**.
Here's a step-by-step guide to help you integrate environment variables
into your flows:

**🔄How to Use Environment Variables in a Cloud Flow**

**✅Step 1: Create or Open a Solution**

Environment variables **must** be used within a solution.

1.  Go to **Power Automate**.

2.  Click **Solutions** in the left-hand menu.

3.  Open an existing solution or create a new one.

4.  If needed, create your environment variable:

    - Click **+ New** \> **More** \> **Environment variable**.

    - Set the **name**, **data type**, and **default/current values**.

**✅Step 2: Create or Edit a Cloud Flow in the Solution**

1.  Inside the solution, click **+ New** \> **Cloud flow**.

2.  Choose **Automated**, **Instant**, or **Scheduled** flow.

3.  Add your trigger and actions as usual.

**✅Step 3: Insert the Environment Variable into an Action**

1.  In any action (e.g., HTTP request, email, SharePoint, etc.), click
    into a field where you want to use the variable.

2.  Click **“Add dynamic content”**.

3.  Scroll or search for your environment variable by name.

4.  Click it to insert it into the field.

🔍 **Tip:** Environment variables appear under
the **Environment** section in the dynamic content panel.

**✅Step 4: Save and Test the Flow**

- Save your flow.

- Run a test to ensure the environment variable is being used correctly.

- If the variable is not resolving, double-check that:

  - The variable has a **current value** set.

  - The flow is part of the **same solution** as the variable.

**🧠 Example Use Cases**

| **Use Case**        | **Environment Variable** | **Example**                                                               |
|---------------------|--------------------------|---------------------------------------------------------------------------|
| API Integration     | API_Base_URL             | Used in an HTTP action to call https://dev.api.com orhttps://prod.api.com |
| Email Notifications | SupportEmail             | Used in a "Send an email" action to route messages to the correct team    |
| SharePoint          | SP_Site_URL              | Used in SharePoint actions to dynamically set the site URL                |

Would you like a quick demo flow example or a template you can import
and test?

**You said:**

yes

**Copilot said:**

**Copilot**

Great! Here's a **simple demo flow example** that shows how to use
an **environment variable** in a Power Automate **cloud flow**. This
example will use a **Text-type environment variable** to send an email
to a dynamic address.

**📄Demo Flow: Send an Email Using an Environment Variable**

**🔧Step 1: Create the Environment Variable**

1.  Go to **Solutions** in Power Automate.

2.  Open or create a solution.

3.  Click **+ New** \> **More** \> **Environment variable**.

4.  Set the following:

    - **Display Name**:Support Email

    - **Name**:ENV_SupportEmail

    - **Data Type**: Text

    - **Default Value**:support@yourcompany.com

    - **Current Value**: devsupport@yourcompany.com (for Dev
      environment)

**🧩Step 2: Create the Cloud Flow**

1.  In the same solution, click **+ New** \> **Cloud flow** \> **Instant
    cloud flow**.

2.  Name it something like Send Support Email.

3.  Choose the **Manually trigger a flow** trigger.

**✉️Step 3: Add the Email Action**

1.  Add a new step: **Outlook \> Send an email (V2)**.

2.  In the **To** field, click **Add dynamic content**.

3.  Scroll to the **Environment** section and select ENV_SupportEmail.

4.  Fill in the rest:

    - **Subject**:Test Email from Power Automate

    - **Body**:This is a test email sent using an environment variable.

**✅Step 4: Save and Test**

1.  Save the flow.

2.  Click **Test** \> **Manually** \> **Run flow**.

3.  Check the email inbox for the address set in the environment
    variable.

**📦 Want a Template?**

Since I can't directly upload files here, I can guide you to create this
manually or help you generate a **JSON export** of the solution
structure that you can import into Power Automate.

Would you like me to generate a **step-by-step JSON structure** or walk
you through exporting/importing a solution with this flow?

Generate JSON export for the flow.Guide me through manual creation.

Message Copilot

Researcher

AI-generated content may be incorrect

## How to Create Environment Variables in Power Automate

Environment variables in Power Automate allow you to store values—such
as email addresses, connection strings, or URLs—that can be reused
across flows and solutions. Here’s a step-by-step guide to manually
create environment variables:

1.  **Open Power Apps or Power Automate:**

2.  Go to Power Apps or Power Automate.

3.  Select the environment where you want to create the variable.

4.  **Navigate to Solutions:**

5.  In the left menu, select **Solutions**.

6.  Open an existing solution or create a new one by clicking **New
    solution** and filling in the required details.

7.  **Create Environment Variable:**

8.  Inside your solution, click **+ New** \> **More** \> **Environment
    variable**.

9.  Fill in the following fields:

10. **Name:** Enter a descriptive name (e.g., *EmailRecipient*).

11. **Display name:** This will be visible in your flows.

12. **Description:** (Optional) Add a note about what this variable is
    used for.

13. **Type:** Choose the appropriate type (e.g., *Text*, *Boolean*,
    *JSON*, etc.).

14. **Default value:** Enter the value you want to use as default (e.g.,
    the email address).

15. Click **Save**.

16. **Reference Environment Variable in Your Flow:**

17. When building or editing a flow inside the same solution, add a step
    where you want to use the value.

18. In the relevant field, click the dynamic content picker and select
    your environment variable.

19. **Save and Test:**

20. Save your flow and test it to ensure the environment variable works
    as expected.

Repeat these steps for each variable you need. Environment variables
help make your flows more portable and easier to manage across different
environments.
