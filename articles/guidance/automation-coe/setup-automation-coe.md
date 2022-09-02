---
title: Overview of the automation CoE setup guidance | Microsoft Docs
description: Overview of the automation CoE setup guidance.
suite: flow
documentationcenter: na
author: kathyos
manager: tapanm
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: kathyos
ms.reviewer: deonhe
---

# Setup Automation CoE Toolkit

## Setup Checklist

This is a checklist for initially setting up the Automation CoE Toolkit. **Use this checklist with the below docs.**

### Prerequisites

- Admin account with a premium license. <!--todo: link to the prem licenses-->
- An environment named **main**, for example, "orgname_Main"). <!--todo: this isn't clear, should the env be called "main" or must it have "main" in the name-->
- Configured Azure Key Vault.

### Import the main solution

- Import **AutomationCoEMain_x_x_x_x_managed** into your **main** environment.
- Provision the approvals solution (optional). <!--todo: what are the steps to do this?-->
- Confirm all flows in the solution are turned on.
- Assign security roles. <!--todo: assign these roles to whom?-->
- Share the apps with appropriate users. <!--todo: who are the "appropriate users--> 

### Import the satellite solution

- Create Azure AD app registration (Dataverse API) for each satellite.
- Define satellite environments (new or existing).
- Create application users in all satellite environments.
- Import AutomationCoESatellite_x_x_x_x_managed.
- Configure environment variables.
- Confirm all flows in the solution are enabled.
- Share the app with appropriate users. <!--todo: who are the "appropriate users--> 

### Define configuration data

<!--todo: this section is vague-->
- General data configured; ROI data configured; Console data configured
- Flow Exception Rules Framework

## Setup Main

>[!IMPORTANT]
>Perform all steps with the **Auto CoE Admin** account that's mentioned in the prerequisites.

### Import the main solution into the main environment

1. Create an environment in which to set up the CoE.
    1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
    2. Select Environments > + New, and then enter a name, type, and purpose.
    3. Select **Yes** to create the database, and then select **Next**.
    4. Keep sample apps and data set to **No**.
    5. Select **Save**.
1. Go to your new environment.
    1. Go to [flow.microsoft.com](https://flow.microsoft.com/).
    2. Go to the environment you just created in which the main solution will be imported. For this example, we're importing to the environment named **Contoso_Main**.

      ![A screenshot that displays the environments](media/c4670e71d1b2fd29fbae6676e1037f47.png)

1. On the left pane, select **Solutions**.
1. Select **Import**, and then **Browse**.
1. Select the Automation CoE main solution (**AutomationCoEMain_x_x_x_x_managed.zip**).
1. After the compressed (.zip) file loads, select **Next**.
1. Review the information, and then select **Next**.
1. Establish connections to activate your solution. If you create a new connection, you must select **Refresh**. You won't lose your import progress.
1. Select **Import**.

   The import process can take 5-10 minutes to complete.

1. After importation completes, verify that all the flows are **turned on** and share the apps with the appropriate users.

   ![Screenshot that shows all flows are turned on](media/b8dae15259f4d787c09136d5fb849526.png)

### Provision the approvals solution (optional)

This step is optional. The only reason for doing this step is to speed up the setup process.

In new environments, Power Automate approvals isn't configured by default. After Power Automate initiates an approval, the approvals solution gets created.

This process usually takes 5-10 minutes. So, we can easily do this step while the main solution is being imported.

1. Go to [flow.microsoft.com](https://flow.microsoft.com/).

   This is where the main solution is being imported.

1. Select the **My flows** tab on the left > **New flow** > **Instant cloud flow**.
1. Under the button trigger, add the **Start and wait for approval** action to the flow.
1. Fill in your details to trigger the flow.

   Here is an example of how you can configure the **Start and wait for approval** action.

   ![A screenshot that displays the start and wait for an approval action card configured.](media/234ccb521d34e82772e75c627ee0deab.png)

   [Learn more about Approvals Provisioning](https://support.microsoft.com/topic/power-automate-approvals-provisioning-overview-and-troubleshooting-2306313a-49fa-efde-c716-a34c573ec942).

### Assign security roles

Once the importation completes, assign security roles to members of the organization. The main solution comes with three security roles.

Review roles and assign roles based on responsibility.

- **Automation Project Admin** - Maintains the configuration data in the Automation CoE and maps automation projects to environments.
- **Automation Project Contributor** - Generates or requests new automation projects.
- **Automation Project Viewer** - The business process owner who approves or rejects automation project requests.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select your main environment.
1. Select **See all** under **Security roles** on the **Access** card.
   ![A screenshot that displays the see all link for security roles](media/3a5f46ffdae69744e5f820965b184d99.png).
1. Select the security role, and then add members to the security role.

### Sync environments

1. The main solution has a cloud flow called **Sync Environments**. Select this flow, and then trigger it if it hasn’t run.

1. Wait for the run to complete.

### Import the desktop flow actions csv

Next, we want to import all the desktop flow actions from the csv file into the **Desktop Flow Action** table.

This must be done for all environments to which the Automation CoE syncs, such as main and all satellites.

1. Open a browser, navigate to [Power Automate](https://flow.microsoft.com), and then sign in.
1. Navigate to your environment where the solution is installed.
1. Select the **Solutions** tab.
1. Find, and then select the **Automation CoE Main** solution**.
1. Select the **Desktop Flow Action** table.
1. Select the **Data** tab.
1. Select the **Data dropdown** near the top.
1. Under **Get data**, select **Get data from Excel**.

   ![A screenshot that shows the steps to select the option to get data from Excel](media/eca274b494bf842915ab6325ef61aa73.png)

1. After the popup opens, select the **Upload** button, and then upload the included Excel file (autocoe_desktopflowactions.csv).

   ![A screenshot that displays the upload button](media/de9f4d99e8237715d0c4f0e10b999905.png)

1. Wait for the **Mapping status** to show as successful.
1. Select **Import**.

   ![A screenshot that displays the mapping was successful and the import button](media/9b6a9bdb7c1ee0a5239c800f19f1048c.png)

1. After the import completes, verify that the data was imported.

   ![A screenshot that displays the importation was successful and data imported](media/d4386a5213a442f04f533c4dbd843273.png)

### Verify the Desktop Flow Actions

1. Under **Tables**, select the **Desktop Flow Action** table.
2. Verify there is data under the **Data** tab.

   ![A screenshot that displays the data is available.](media/e45e4cfc0dc1d875e8a6140b81a0f825.png)

## Setup satellites

### Create an Azure AD app registration to connect to Dataverse Web API

Use the following steps to create an app registration that will be used by flows in the satellite environment.

1. Sign in to [Azure](https://portal.azure.com/).
1. Go to **Azure Active Directory** > **App registrations**.
1. Select **New Registration**.
1. Enter a name (for example, Automation CoE Dataverse API), leave everything else, and the select **Register**.
1. In the **Overview tab**, select **Add an Application Id URI**.

   ![A screenshot that displays the application id](media/f589cd35a86eb9debd295ef1e66b998d.png)

1. Select **Set**, leave the default, and then select **Save**.

    ![A screenshot that displays set application id](media/e21d24f573f5401c4a9ea30f5e8a5954.png)

### Add a new client secret

1. Select **Certificates & secrets.**
1. Select **New client secret.**

   ![A screenshot that displays the steps to the new client secret button.](media/a6f25357bcaa11f0c49c91bb4f517ee7.png)

1. Enter description (for example, Auto CoE Dataverse), and then select appropriate expiry value.
1. Select **Add**.
1. Copy down the secret value that's generated.

   This secret will be added to **Azure Key Vault** in a later step.

1. Go back to the **Overview** tab and then copy down the following information.

    - Application (client) ID
    - Directory (tenant) ID

   ![A screenshot that displays the application and directory Ids](media/af0d7a6b6d83a55079039ddfd56ce531.png)

1. Next go to your Azure Key Vault, this is where we will store the values so that Power Automate can use them to call the Dataverse Web API.

### Create secrets for the client Id and tenant Id you copied earlier

1. Inside the **Secrets** tab, select **Generate/Import**.

   ![A screenshot that displays the Generate/Import button](media/48fe3244411a9db2a8385fab1c4e0520.png)

1. Use a descriptive name for each secret. Here are a few examples.

    - KVS-AutomationCoE-ClientID
    - KVS-AutomationCoE-TenantID
    - KVS-AutomationCoE-Secret

### Create a new environment or use an existing environment for your satellite

Microsoft recommends that you have the satellite solution imported inside your production environment. Follow the [steps to import the main solution](#import-the-main-solution-into-the-main-environment) if you create a new environment.

#### Create application user inside Dataverse (Per satellite Env)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select the satellite environment, and then select **Settings**.
1. Select Users + permissions > Application Users > New app user.
1. Select **Add an app**.

1. Select the app registration that was created in previous steps.
    >[!TIP]
    >Verify by AppID if you're unsure.

1. Select a business unit.
1. Add the **System Administrator** security role.
1. Select **Create**.

   Your application user displays after it's created.

   ![A screenshot that displays the](media/ee7ca5d1c4aa6ebc302fc2439e750652.png)

### Import the satellite solution into the satellite environment

1. Sign into [Power Automate](https://flow.microsoft.com).
1. Select your designated environment for the satellite solution.

   For this example, we're importing to the environment named **Contoso_Prod.**

1. On the left pane, select **Solutions**.
1. Select **Import**, and then **Browse**.
1. Select the Automation CoE satellite solution (**AutomationCoESatellite_x_x_x_x_managed.zip**).
1. When the compressed (.zip) file loads, select **Next**.
1. Review the information, and then select **Next**.
1. Establish connections to activate your solution. If you create a new connection, you must select **Refresh**. You won't lose your import progress.

### Configure environment variables

1. To get the information for the environment variables, open a new tab.
2. Navigate to the satellite environment from the [maker portal](https://make.powerapps.com).
3. Select the **Settings** in the top right nav bar > **Session details Developer resources**.

   ![A screenshot that displays the session details developer resources link](media/a22ea6e5f864bfbcfde3f76d82d4905d.png)

Next, we need to get the **URL path** for our **Azure Key Vault secrets**.

The Azure Key Vault secrets are using the new environment variable type. These environment variables need to be in the following format.
  
   ```azurecli
   /subscriptions/{Subscription ID}/resourceGroups/{Resource Group Name}/providers/Microsoft.KeyVault/vaults/{Key Vault Name}/secrets/{Secret Name}
   ```

Follow these steps to get the format.

1. Go to [Azure Portal](https://portal.azure.com/#home), navigate to your Key Vault with the secrets for your [App Registration](#create-an-azure-ad-app-registration-to-connect-to-dataverse-web-api).
1. Select the **Secrets** tab.
1. Copy the **URL**.

    ![A screenshot that displays the the secrets URL](media/7ff5dd01f7ae3ef988b5d70c817d531a.png)

1. Paste the URL into notepad.
1. Remove everything from **https://** to **/resource**.

   ![A screenshot that displays the the parts of the URL to remove](media/de7d37307607c10210a3d198898d1f40.png)

1. At the end of the URL, add **/{SecretName}**. Replace **{secretname}** with your **secret name**.

   ![A screenshot that displays where to add the secret name to the URL](media/f3a766841010d270450aaa0ec4c2ecf7.png)

1. Do this for all three Azure Key Vault secrets (Client ID, Client Secret, Tenant ID).
    See the example in the screenshot. These reference strings are needed for three environment variables.

   ![A screenshot that displays the environment variables](media/247d5b62089b726962d20f94ae46e062.png)

Use this information for the environment variables.

| **Environment variable name**         | **Description**                                                                                                                                                                                                                                                                                                                                                                                       |   |
|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---|
| AKV Client Id Secret                  | Azure Key Vault secret for client Id (application Id) from app registration: /subscriptions/{Subscription ID}/resourceGroups/{Resource Group Name}/providers/Microsoft.KeyVault/vaults/{Key Vault Name}/secrets/{Secret Name}                                                                                                                                                                         |   |
| AKV Client Secret Secret              | Azure Key Vault secret for secret from app Registration                                                                                                                                                                                                                                                                                                                                               |   |
| AKV Tenant Id Secret                  | Azure Key Vault secret for Tenant Id from app Registration                                                                                                                                                                                                                                                                                                                                            |   |
| Automation CoE Alert Email Recipient  | The email address where operational reports and alerts should be sent to, for this environment. **(**[See Exception Framework](#flow-exception-rules-framework)**)**                                                                                                                                                                                                                                  |   |
| Automation Project app Id             | Enter the **Automation Project** app Id of the Power Apps that is deployed with the main solution (main environment)                                                                                                                                                                                                                                                                                  |   |
| Desktop Flows Base URL                | Open a new tab > Navigate to [Power Automate](https://flow.microsoft.com/) . Select the environment where you’re installing the solution.                                                                                                                                                                                                             |   |
| Environment Id                        | Use **Session details** to find this value from current environment that you are importing into (satellite)                                                                                                                                                                                                                                                                                           |   |
| Environment Name                      | Display name of the current environment (satellite)                                                                                                                                                                                                                                                                                                                                                   |   |
| Environment Region                    | Region of the satellite. Can be found in the Power Platform admin center                                                                                                                                                                                                                                                                                                                              |   |
| Environment Unique Name               | Use **Session details** to find this value from the current environment that you are importing into (**satellite**) Also must add **.crm** to the end of the string. Example: unq08ed139e532b4edc8f38851fd1bb3279.crm. Please note that the extension 'crm', 'crm[x]' etc. is region dependent.                                                        |   |
|                                       | [See Datacenter regions](https://docs.microsoft.com/power-platform/admin/new-datacenter-regions)                                                                                                                                                                                                                                                                                                |   |
| \*Environment Unique Name of CoE Main | Use **Session details** to find this value **from Main**. Also must add **.crm** to the end of the string. For example: unq08ed139e532b4edc8f38851fd1bb3279.crm. Please note that the extension 'crm', 'crm[x]' etc. is region dependent.                                                                                                                  |   |
|                                       | [See Datacenter regions](https://docs.microsoft.com/power-platform/admin/new-datacenter-regions)                                                                                                                                                                                                                                                                                                |   |
| Environment URL                       | Open a new tab > navigate to [Power Platform admin center](https://microsoft.sharepoint.com/teams/AutomationCOE/Shared%20Documents/General/Releases/PAD%20DLP%20Impact%20Analysis/Docs/aka.ms/ppac).                                                                                                                                                  |   |
| Flow Session Trace Record Owner Id    | This is the UserID (guid) from the Users table inside the satellite environment for the admin account. Select Tables under Data on the left > User > Data > Change view to **"All columns"** Find the **Auto CoE Admin** account and copy the value under **User**. Flow User Id (guid):                                                                                                               |   |

   ![A screenshot that displays the](media/0423dee0f1c9b8a1fd5954076f55cac1.png)

   ![A screenshot that displays the](media/6327d7f0c907c05e8e5aa1231558de16.png)

1. Select **My flows** tab.
2. Copy the web address up to …environments/
3. You can also get the **environment id** from this URL too.

   ![A screenshot that displays the](media/ffc481c5614b1cad655d5a77c700d8b1.png)

1. Select your environment.
2. Right click Environment URL.
3. Copy link.

   ![A screenshot that displays the](media/bf599ca22a1005fec4f9e54d670f9194.png)

   ![A screenshot that displays the](media/19641b8ba68f89eed7250de48cb08092.png)

1. After all the environment variables have been configured, select **Import.**
2. Once solution has successfully imported, verify / turn on all the Flows.

   ![A screenshot that displays the](media/1e8049c3421d8842ea68ac4c0e523d2c.png)

1. **Share all apps** with appropriate users.

### Assign Security Roles

Once the import is complete, assign the roles below based on responsibility:

**Flow Session Exception Admin** – Admin role which provides full CRUD permissions to the Flow Session Exception data captured in the tables below:

- Flow Session Exception Rule Configuration
- Flow Session Exception

**Desktop Flow Definition Admin** – Role which provides full CRUD permissions to the tables below:

- Desktop Flow Action
- Desktop Flow Definition
- Desktop Flow DLP Impact Profile

1. Navigate to the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/).
2. Select your main environment.
3. Select See all Security roles under the Access card.

   ![A screenshot that displays the](media/3a5f46ffdae69744e5f820965b184d99.png)

1. Select the Security role > **Search for and assign roles defined above.**

### Assign Column security profiles

Inside the solution, there is a column security profile. This profile enables users to see the Script field inside the **Desktop Flow Definition table**. This
role should only be assigned to CoE Admins, due to the sensitive information that may be visible.

The script field is synced and stored inside the Desktop Flow Definition table by default. If you would like to **not** sync this information, follow the steps
[here (Disabling Sync of Script field](#disable-syncing-of-desktop-flow-script-optional)).

Otherwise follow the steps below.

To assign the Security profile:

1. Select the Column security profile **Desktop Flow Script Field Security**.
2. Under Members, select **Users**.
3. Select **Add**.
4. Once the popup opens, **search** for the user you want to assign this profile to.
5. Select the **checkbox** for the user.
6. Select **Select**, the user should show in the **Selected records** list.

   ![A screenshot that displays the](media/d0e2086c1fa809c62a5acc752bfe0063.png)

Select **Add**. (See example - Image Below)

Done, next we need to add

### Import Desktop Flow Actions csv

Next, we want to import all the **Desktop Flow Actions**, the hard work has been done, all that is needed is an import of an included csv file into the **Desktop
Flow Action** table.

1. Open a browser, navigate to <https://flow.microsoft.com> and sign-in with your account.
2. Navigate to your environment where the solution is installed.
3. Select **Solutions** tab.
4. Find and select **Automation CoE satellite** solution**.**
5. Select the table, **Desktop Flow Action**.
6. Select the **Data** tab.

   ![A screenshot that displays the](media/1b31a4a8b05e560b8e61541f44c30afa.png)

1. Select the **Data dropdown** near the top.
2. Under **Get data**, select **Get data from Excel**.

   ![A screenshot that displays the](media/c31e7c4832c9188716a0714697174120.png)

1. Once the popup opens, click the Upload button, and upload the included Excel file. 
    (autocoe_desktopflowactions.csv)

   ![A screenshot that displays the](media/e32a1f361c37064c9e3c26f87f4c4c27.png)

1. Wait for the **Mapping status** to show as successful.
2. Select **Import**.

   ![A screenshot that displays the](media/da42249cc5ac8097984b9b2e479975c8.png)

1. Once the import is complete, verify data has been imported.

   ![A screenshot that displays the](media/ee0e627cb50134bb9b12eb8bb95233da.png)

Verify the Desktop Flow Actions.

1. Under Tables, select the Desktop Flow Action table.
2. Under the Data tab verify there is data.

   ![A screenshot that displays the](media/cc6f5b88ab8fdb6ea2b28c036fca4d46.png)

### Disable Syncing of Desktop Flow Script (Optional)

By default, the Desktop Flow Definition Script is stored inside the Desktop Flow Definition table. This field could contain sensitive information.

**IMPORTANT – System Administrators and higher can view these tables and fields by default.**

In the environment where the solution is installed

1. Select the Solutions tab.
2. Select the Default Solution and click Environment Variables.
3. Find and select Store Extracted Script.

   ![A screenshot that displays the](media/91064410e1f9c4164ac3657402f2c8ce.png)

1. Under **Current value**, click **+New value**.
2. Change to **No**.
3. Select **Save**.

**Note** that changing any environment variables requires all flows that are using it, to be Turned off, and back on again to get the new value. [See
Limitations](#limitations).

Important: The script field is not synced back to main due to security. Everything is in place to sync the data back to main if needed by extending the
Automation CoE.

Setup Automation CoE Power BI dashboard
---------------------------------------

To launch the Power BI Dashboard for the Automation Center of Excellence, you will require the environment URL for your Main environment (Where **Automation
CoE Main** is installed).

To obtain the environment URL, navigate to the Power Platform Admin Center, go to Environments, select the environment, and note the Environment URL:

   ![A screenshot that displays the](media/75b28eea02490822c3f1f84e4c7a6c9d.png)

Enter the environment URL upon launching the Power BI template:

   ![A screenshot that displays the](media/f529bbf7be8fd410f24577bb914f3585.png)

#### Main Dashboard

The main Power BI dashboard has the following sections:

1. **Home** - Overview of key KPIs for the Automation CoE.

   ![A screenshot that displays the](media/d1618d1e40e6ea8c255bdf4d76911648.png)

1. **Project Backlog** - Details the Ideas/Projects submitted, status, and ranks based on Estimated Savings and Complexity

   ![A screenshot that displays the](media/911dbb5c5fc4547383038dff02f8897f.png)

1. **Business KPI** - Business details for Savings Realized, Efficiency, Hours Saved, and other business metrics

   ![A screenshot that displays the](media/9deb2fb334049b3ddca9f4776fd8ad0b.png)

1. **Goals** - Outlines savings and efficiency goals for the organization, and the status by Department and Project

   ![A screenshot that displays the](media/0365178b76c51543398ee3b5b45bba5e.png)

1. **ROI** - Overall ROI for the Projects implemented 

   ![A screenshot that displays the](media/e04475e89e3136d5fc84873d06f5e429.png)

1. **ROI Financials** - Information regarding ROI Actuals vs Estimates by Year, Quarter, and Month

   ![A screenshot that displays the](media/845e1b29d89ff2431f60e13656960524.png)

1. **Solutions** - Overview of Solutions in Production, Hours Saved, Error Rates, and Bot success KPIs

   ![A screenshot that displays the](media/da3524962ef85c40433f69a762c3ffbb.png)

1. **Machines** - Detailed information on Machine utilization and activity

   ![A screenshot that displays the](media/b4b902a7319fe518600896a0ba5b83f4.png)

1. **Flow Overview** - Summary of Flows Created, Runs, Status, and Top 10 Makers, Machines, and Flows

   ![A screenshot that displays the](media/288ff8ec71655f36b05136ccdd065f30.png)

1. **Flow Run Detail** - Detailed information on Flow Runs, durations, status, run modes, hosts, and errors.

   ![A screenshot that displays the](media/93661c6e0fea9d4727cece5162fff3f5.png)

1. **Run Performance** - Graphical display of run performance day over day

   ![A screenshot that displays the](media/0b3612fa15b68b4f6cd4b6deb6de30ae.png)

1. **Control Chart** - Overview of Flow processing time averages and operational performance within control points.

   ![A screenshot that displays the](media/c81be1455a2a486a8f34d5fb5bac6789.png)

1. **Flow Exceptions** – Enables you to filter by Date, Exception Rule, Cloud Flow Name, Desktop Flow Name, or Host Name

   ![A screenshot that displays the](media/3fc477111732768db0bc79ce4850166e.png)

1. **Flow Exceptions Tree Diagram –** Displays and allows you to drill into specific Flows organized into the following categories: Cloud Flow Name,
    Desktop Flow Name, Error Code, Error Message, Run Mode, or Host Name.

   ![A screenshot that displays the](media/931ae2e90c21bfd882edcbc8283a3503.png)

1. **Action Usage Analysis** – Just like the Power App but with added filters and an email owner button.

   ![A screenshot that displays the](media/e252ea3e2eab49b430a7fe7f77e1cbf2.png)

1. **Action Decomposition Tree Analysis** – Tree like diagram that shows how each action module or Flow related in a tree like diagram

   ![A screenshot that displays the](media/3efabd0d706b63c2287f34fbf93a44b1.png)

1. **ROI Calculations** - Contains examples on how calculations related to ROI and Efficiency are determined throughout the dashboards

   ![A screenshot that displays the](media/5821b46c21aaa93fe4b8627a11e49559.png)

Every detail page consists of:

- Filters (Department, Project, Solution)
- High-level statistics
- Useful visuals

#### ROI Calculations

Example data:

| **Cost Element**       | **Input** |
|------------------------|-----------|
| FTE Cost               | \$50/hr   |
| Time to Process (mins) | 60 mins   |
| Frequency              | Daily\*   |
| \# of FTEs to Process  | 1         |
| Error Rate (%)         | 10%       |
| \# of FTEs to Fix      | 1         |
| Time to Fix (mins)     | 25        |
| Overhead               | 15%       |

**\*Hourly = 2008, Daily = 251, Weekly = 52, Monthly = 12, Quarterly = 4**

#### ROI Calculation Formula

**Total Cost per Year** = Cost to Complete (per Year) + Cost to Remediate (per Year)

**Cost to Complete (per Year):**

((((FTE Cost/60) x \# of FTEs to Process) x Time to Process (mins)) x Frequency)

**Cost to Remediate (per Year):**

(((Frequency x (Error Rate/100)) x Time to Fix (mins)) x FTE Cost/60) x \# of FTEs to Fix))

**Full Formula:**

((((FTE Cost/60) x \# of FTEs to Process) x Time to Process (mins)) x Frequency) + (((Frequency x (Error Rate/100)) x Time to Fix (mins)) x FTE Cost/60) x \# of FTEs to Fix))

#### ROI Calculation Example

Summary of Cost Calculations:

| **Cost Element**                 | **Calculation**                                                                                      |
|----------------------------------|------------------------------------------------------------------------------------------------------|
| Cost to Complete (per Year)      | \$12,550 (((FTE Cost/60) x \# of FTEs to Process) x Time to Process) x Frequency                     |
| Cost to Remediate (per Year)     | \$522.92 ((Frequency x (Error Rate/100)) x Time to Fix (mins)) x ((FTE Cost/60) x \# of FTEs to Fix) |
| Cost to Remediate (per Instance) | \$20.83 (Cost to Remediate (per Year) / (Frequency x (Error Rate/100))                               |
| Total Cost per Year              | \$13,072.92 (Cost to Complete (per Year) + Cost to Remediate (per Year)                              |
| Total Cost per Month             | \$1,089.41 (Cost to Complete per Year / 12)                                                          |
| Cost per Instance                | \$52.08 (Cost to Complete per Year / Frequency)                                                      |

Summary of Savings per Instance for Bot:

| **Run Detail**            | **Total Savings** | **Description**                                 |
|---------------------------|-------------------|-------------------------------------------------|
| Successful Run, no errors | \$44.27           | Cost per Instance minus Overhead %              |
| Failure                   | \-\$28.65         | Cost to Remediate per Instance minus Overhead % |

Configure Automation CoE Toolkit
================================

#### Define configuration data

Using the Automation CoE Admin account, navigate to the Main environment. You want to open the app

**Automation Center**, this is where we configure how several aspects of the Automation CoE will function.

When the app opens, your left navigation should look like this:

   ![A screenshot that displays the](media/48d4db6f82e02dcd2d699b853064bcbc.png)

There are a few things we need to setup/configure when you first import the Toolkit.

First, we are going to add an Automation Goal. Follow these steps to add an Automation Goal.

1. Inside the Automation Center Select Corporate Goals tab.
2. Select + New
3. Fill in the required fields (Sample data provided below)

| **Field**                | **Value**                       |
|--------------------------|---------------------------------|
| Goal Name                | Cost Savings through Automation |
| Period From              | 11/1/2021                       |
| Period To                | 11/1/2022                       |
| Target Efficiency Gain % | 20                              |
| Target Total Savings     | 50000                           |

Select **Save & Close**.

Next, we will configure some configurations

These configurations are split into **3** sections

1. General - configurations that are related to resources and processes
2. ROI Calculation - configurations that will be used as a scoring metric to better determine estimated ROI and complexity of an Automation Project
3. Configuration - info pertaining to the Automation CoE Toolkit apps. Will be used to build a Console where users can launch related apps

#### Steps to configure general

Select **"Automation Center"** in the bottom navigation bar > Switch to **"Setup"**

#### Environments

1. Inside the environment tab select a satellite environment.
2. Change **Is Satellite Environment** to **Yes**.
3. Select **Save & Close.**
4. Do this for all your **Satellite environments** (DEV, TEST, PROD, Etc.)

   ![A screenshot that displays the](media/07a8a970def5d0e7a33b226305b05c7d.png)

#### Departments

1. Inside the department tab select **+ New**
2. Create as many departments as your organization may need. Here is a sample of the departments:

- Accounting
- Enterprise Integration
- Finance
- Human Resources
- Information Technology
- Logistics
- Operational Change Management
- Purchasing

#### Process Categories

1. Inside the process categories tab select **+ New**
2. Create top level categories that will have child categories (subcategories). Here is a sample:

- Artificial Intelligence
- Claims
- Invoicing
- Legacy System

#### Process Sub categories

1. Either inside the process sub categories tab or directly inside a Process category. You want to define sub processes that relate in some way.
2. Select **New Process Sub Category**.
3. Sample data is below
4. Artificial Intelligence

    - Forms Processing
    - Forms Validation

5. Claims

    - Return
    - Warranty

6. Invoicing

    - Internal
    - External
    - Other

7. Legacy System

    - Complex
    - No API
    - Other

#### Roles (App Roles)

These roles do not give access to anything, only used as lookups for the fallback record if needed.

1. Create the **Automation CoE Admin** account as the **CoE Owner**

| **Field**           | **Value**                 |
|---------------------|---------------------------|
| Display Name        | Anything (Auto CoE Owner) |
| Type                | **CoE Owner**             |
| User Principal Name | The email of the user     |

2. Create **CoE Admins** - At least 1 **CoE Admin** must be initialized to configure the **fallback**

| **Field**           | **Value**                 |
|---------------------|---------------------------|
| Display Name        | Anything (Auto CoE Admin) |
| Type                | **CoE Admin**             |
| User Principal Name | The email of the user     |

#### Base Configuration - Fallback

This table should only have 1 record defined. This record is used if any of the values that are needed to complete processing is null or not defined

1. Define 1 fallback record (See screenshot below for example)

   ![A screenshot that displays the](media/b51358ec1c7aa89bbcdf017c3e76cc98.png)

Steps to configure ROI calculation
----------------------------------

Still inside the **"Setup"** page you can find the ROI calculation configurations. These tables are used to calculate the complexity of each **Automation Project** (scores). Some values are also being used for estimated ROI and savings

#### Processing Frequency Scores

This table has a value and score for each record. Below are values that should be used, scores can be modified.

| **Value** | **Score** |
|-----------|-----------|
| Daily     | 12        |
| Hourly    | 18        |
| Monthly   | 3         |
| Quarterly | 1         |
| Weekly    | 5         |

#### Average Automation Steps Scores

This table can be fully customizable based on your organizations needs/process. Table is used to get the **Score** for the **Average Automation Steps** which is
inputted by the user when a new **Automation Project** is requested. Below are some examples, but more or less can be added.

| **Range**     | **Value From** | **Value To** | **Score** |
|---------------|----------------|--------------|-----------|
| \>= 1, \< 5   | 1              | 5            | 1         |
| \>= 250       | 250            | 999999999    | 10        |
| \>= 5, \< 250 | 5              | 250          | 5         |

#### Processing Peaks Scores

This table has a value and score for each record. Below are values that should be used, scores can be modified.

| **Value** | **Score** |
|-----------|-----------|
| daily     | 15        |
| hourly    | 20        |
| monthly   | 5         |
| quarterly | 2         |
| weekly    | 10        |

Configuration - Console
-----------------------

These tables are used by the **Automation Console** app, as well as the **Project Approval** automation.

| **Name**           | **App Description**                                           | **AppID / App Link**                                        |
|--------------------|---------------------------------------------------------------|-------------------------------------------------------------|
| Automation Project | Create and manage your automation projects                    | [See Below (Next page)](#how-to-get-canvas-app-urlid)       |
| Automation Center  | Manage and configure all aspects of your automation resources | [See Below (Next page)](#how-to-get-model-driven-app-urlid) |

#### How to get canvas app URL/ID

Inside the [Maker Portal](https://make.powerapps.com/)

1. Select **Apps** tab on the left navigation.
2. Select ... (more commands) on the app.
3. Select details.

   ![A screenshot that displays the](media/dd98466696afb5756f04f76d3f87b5b1.png)

#### How to get model driven app URL/ID

Inside the [Maker Portal](https://make.powerapps.com/)

1. Select **Apps** tab on the left navigation.
2. Select ... (more commands) on the app.
3. Select details.
4. Copy **AppID**.
5. Select the **Web Link**.
6. Select Properties.

7. Copy Unified Interface URL (Reference the screenshots below for the steps)

   ![A screenshot that displays the](media/89667581265544834f969251313d1015.png)

   ![A screenshot that displays the](media/053912393c43395267e57003ceffbec5.png)

   ![A screenshot that displays the](media/4bc735c5daa4a0f703d4a0cb1d60f91c.png)


<!-- todo: -->

<!-- > [!div class="nextstepaction"]
> [Next step: Core components for Power Automate RPA SAP GUI automation](core-components.md) -->
