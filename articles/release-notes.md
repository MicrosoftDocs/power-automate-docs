---
title: Release notes | Microsoft Docs
description: Common issues and what's new for Power Automate releases.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/04/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Release notes

>[!NOTE]
>Release plans are now tracked [here](/dynamics365/release-plans/).

## Top questions
1. My flow failed. How do I fix it?
   
   1. Identify the failure. Start by going to the notifications icon at the top of the web portal, or selecting the **Activity** tab in the mobile app. You should see your flow there, and you can select it.
   2. You are now looking at the flow details. Find the step with the red exclamation icon, and you should see the error message for your flow there.
   3. Depending on the error message, you should be able to **Edit** the flow and fix it. [Read more about how to fix common flow failures](fix-flow-failures.md).
2. How do I use an advanced condition or an expression?
   
   * Read about [adding conditions](add-condition.md).
   * If you want multiple cases in a cloud flow, select **Add condition** from inside of an existing condition.
   * Create an advanced expression by referencing [a function in Logic Apps](/rest/api/logic/definition-language).
3. How does licensing work with Office 365?
   
   * If you're an Office 365 user, you get full access through the Power Automate for Office 365 plan. For more information, see the [pricing plans for Power Automate](https://flow.microsoft.com/pricing/) .
   * If you're an administrator, see information about [licensing for Power Automate](organization-q-and-a.md), including with Office 365.

## Known issues
1. SharePoint lists on My Sites and that aren't of type *Custom List* aren't supported. To work around this issue, create a custom list on a standard SharePoint site.
2. File triggers won't fire for files being added inside of nested folders inside the folder you select.

## What's new

For information about new features released for Power Automate, visit:
- [2022 release wave 1 plan](/power-platform-release-plan/2022wave1/power-automate/planned-features) for new features releasing over the next few months.
- [Weekly release notes](/business-applications-release-notes/powerplatform/released-versions) for new features, fixes, and improvements released in the past few weeks.

### Release 2018-09-24

- **Admin access to help and support** - Open support tickets for Power Automate in the Power Platform admin center and provide additional details about your workflow failure.
- **Redesigned Power Automate Community** - Finding what you need just got easier in the Power Automate Community.
- **Improvements to the Microsoft Teams connector** - New triggers for Microsoft Teams so you can run a cloud flow when there are new messages in a channel.
- **More SharePoint actions** - There are new actions for moving files and more in the SharePoint connector.
- **New admin analytics reports** - Environment and Tenant wide analytics added to the Business Application Platform admin center.
- **Power Query integration** - A Power Query experience is being built that will allow makers to shape data mashups from SQL Server.

[Read more and ask questions](https://flow.microsoft.com/blog/support-tickets-teams-sharepoint/) about this release.

### Release 2018-08-31

- **Test your flow by using example data** - Use example data from connectors to test your flow as you build it from within the Power Automate designer. When you test your flow with example data, you confirm that the flow will run as expected when it's deployed to production.
- **Five new connectors** - We've added four new management connectors: Power Apps for App Makers, Power Platform for Admins, Power Apps for Admins, Power Automate for Admins, and Microsoft School Data Sync.

[Read more and ask questions](https://flow.microsoft.com/blog/test-data-management-connectors/) about this release.

### Release 2018-08-24

- **New calendar sync templates** - New calendar templates that copy events between Google Calendar and Office 365 or Outlook.com.
- **Multiple value support for SharePoint** - Read and write for multiple-value fields in SharePoint that are Choice, Person or Lookup types.
- **Send approvals on behalf of other users in your organization** - Send approvals on behalf of other users in your organization - for example, the person who uploaded the file in the SharePoint list, instead of the person who created the flow.
- **More button input types** - Buttons have two new input types: Number and Yes/No.
- **Connector updates** - A new NetDocuments connector, improvements to Azure connectors and more.

[Read more and ask questions](https://flow.microsoft.com/blog/button-types-more/) about this release.

### Release 2018-08-02

The Power Automate Preview program is the way to get early access to the upcoming functionality and updates for Power Automate. To get early access to the newest features, just create, and then use, an environment in the Preview region.

[Read more and ask questions](https://flow.microsoft.com/blog/flow-preview-program/) about this release.

### Release 2018-07-23

- **Build and run flows from Excel** - With the new **Flow** button (accessed from the ribbon’s **Data** tab), you can create and trigger automations from Power Automate on your table data in Excel. Automate data processing or the copying/importing of data.
- **Create a business process flow** - A business process flow is a new type of stateful, human-interactive flow based on Microsoft Dataverse. Use these new flows to define a set of stages and steps for people to follow. They can move forward and backward as needed.
- **Create a cloud flow for Microsoft To-Do in Outlook Web App** - If someone is \@mentioned in Outlook Web App, they’ll see a shortcut to create a cloud flow. This flow automatically creates tasks for the \@mentioned person in Microsoft To-Do, based on the content of the email.
- **SharePoint view support** - The SharePoint connector now supports selecting a specific SharePoint view on triggers and actions. This filters down the columns to just the fields that are in the selected view.
- **Four new connectors** - Added Azure IoT Central - a highly scalable IoT software-as-a-service (SaaS) solution - Survey 123, LMS365 and ProjectWise Design Integration.

[Read more and ask questions](https://flow.microsoft.com/blog/excel-bpf-todo-and-more/) about this release.

### Release 2018-06-29

- **Request for sign-off flow built into SharePoint** - When you select a file or item in SharePoint, you’ll see a new **Request for sign-off** flow. This flow doesn't require any configuration or setup, and sends a sign-off request with a single click.
- **Two new connectors** - Added Cloud Connect Studio and PoliteMail.
- **History and create page improvements** - We are refreshing the Run history list by including exact run times, and the create page by added a new walkthrough video.

[Read more and ask questions](https://flow.microsoft.com/blog/request-sign-off-four-connectors/) about this release.

### Release 2018-06-08

- **PowerShell Cmdlets** - Both flow makers, and tenant admins, can now use PowerShell to manage their Flows programmatically.
- **Improvements to the Teams Flow bot** - The Flow bot in Microsoft Teams can run flow buttons and describe your flows.
- **Three new connectors** - Added support for Marketo, ElasticOCR, and DynamicSignal. 
- **Additional Sharing Info** - Added additional information when you share -- or run shared -- flows, so you know exactly what permissions other people will receive.
- **Automatic trimming SharePoint URLs** - When you copy and paste a SharePoint URL in the browser it could contain additional text beyond the site, this text will be automatically removed so you can connect to just the site.
- **Documentation on GDPR requests** - We have created a comprehensive guide and toolset for enterprise organizations to handle Data Subject Rights requests.

[Read more and ask questions](https://flow.microsoft.com/blog/powershell-flow-bot-marketo/) about this release.

### Release 2018-05-21

- **Flows “owned by” SharePoint lists and libraries** - Flows that work with SharePoint lists and libraries can be shared with those lists or libraries. So, instead of being shared with individuals or groups, they’re shared with everyone who has access to the list. As users are added or removed from the list or library, their membership automatically changes accordingly.
- **Error details analytics** - A new embedded report that provides information about all of the errors that happen inside a cloud flow.
- **Share flows with Office 365 groups** - You can make an Office 365 modern group the owner of a cloud flow, and you can share button flows with Office 365 groups so anyone in the group can run the flow.
- **SharePoint connector improvements** - There are two new SharePoint connector capabilities: trigger flows when items or files are deleted and call any HTTP endpoint that the SharePoint REST API supports.
- **Two new connectors** - Added support for Azure Data Factory and MailParser

[Read more and ask questions](https://flow.microsoft.com/blog/share-with-sharepoint-office-365/) about this release.

### Release 2018-05-01

- **Rich text in Approval messages** - Use Markdown to format the approval details that you send.
- **Buttons with multiple selection inputs** - Build flow buttons that use a multiple selection list to collect more than one value at once.
- **Work with wider flows** - The Power Automate mobile app now supports landscape view and the web designer has a horizontal scrollbar.

[Read more and ask questions](https://flow.microsoft.com/blog/rich-approvals-text-and-multiselect/) about this release.

### Release 2018-04-12

- **Return data to Power Apps from a cloud flow** - Build flows that can be called from an app built with Power Apps, and return data back to the app. Use the visual drag-and-drop flow designer to build the logic you need for your apps. 
- **Add multiple records to array inputs** - Added a list builder into Power Automate that can be used for adding multiple attachments to an email, for example.
- **Test flows with previous run data** - Added a new Test flow button to the designer that lets you test your flow with trigger data from previous flow runs.
- **New workflow() fields** - You can now access environment name and flow display name with the workflow() expression.

[Read more and ask questions](https://flow.microsoft.com/blog/return-data-to-powerapps/) about this release.

### Release 2018-04-04

- **Approvals on Dataverse** - Modern approvals are built on the latest version of Dataverse. This means that you can build flows that read the status of the approvals you send or receive with the Microsoft Dataverse connector.
- **Find errors in apply to each** - Jump directly to errors in loops in the flow run view, even when there are hundreds of items in the loop.
- **Reassign approvals** - You can assign any approval you receive to another person in your organization to delegate the approval to them. 
- **Room lists** - The Office 365 Outlook connector added actions to get room data in your organization.
- **See details of flow buttons** - When you run a cloud flow that has been shared with you, you can now see all the actions that the flow uses.
- **United Kingdom region** - Environments can now be created to store their data in the United Kingdom.
- **Two new connectors** - Added support for AtBot Admin and Marketing Content Hub.
- **New documentation landing page** - Updated the documentation landing page to have content grouped by who you are: either a beginner, an intermediate user or an expert. 

[Read more and ask questions](https://flow.microsoft.com/blog/approvals-in-cds-and-seven-updates/) about this release.

### Release 2018-03-13

- **Approval history** - See all the approval requests you've sent out, including the responses, the comments that were sent, and the exact time they happened.
- **Four new connectors** - Added Excel Online (Business), Excel Online (OneDrive), Azure SQL Data Warehouse, and Pitney Bowes Tax Calculator.
- **Dynamic content tooltips** - Hover over dynamic content to see where it came from inside of actions, and preview expressions without opening the full expression editor.
- **Concurrency control** - Enable concurrency control to have a given flow have only one run at a time.
- **Exponential retry** - A new type of retry policy that spaces out retries exponentially over time.
- **Accessibility conformance** - Released new conformance documents that describe how Power Automate meet accessibility standards.

[Read more and ask questions](https://flow.microsoft.com/blog/approval-history-accessibility/) about this release.

### Release 2018-02-09

- **Gateway High Availability** - Create highly available clusters of on-premises data gateways, to keep connections up when single machines go down.
- **Improved Apply to each** - With Flow Plan 1 or Flow Plan 2 process up to 100,000 items in a single run and 50 actions in parallel in Apply to each loops. 

[Read more and ask questions](https://flow.microsoft.com/blog/gateway-ha-increased-apply-to-each/) about this release.

### Release 2018-01-29

- **Flow inside of Microsoft Teams** - From Teams, you can create and manage flows, review your received and sent approvals, and launch flows directly within the Teams desktop app or on teams.microsoft.com - [learn more here](https://flow.microsoft.com/blog/microsoft-flow-in-microsoft-teams/).
- **Shared edit notifications** - Whenever a cloud flow you own is changed by a co-worker, you'll get an email notification informing you who changed what flow.
- **New expressions** - Added two new sets of expressions: one to parse URLs and another to work with JSON objects.
- **Three new connectors** - This week there are two new Plumsail connectors: Plumsail SP and Plumsail Forms, and a new connector to kintone.

[Read more and ask questions](https://flow.microsoft.com/blog/shared-notifications-and-expressions/) about this release.

### Release 2018-01-17

- **Office 365 profile info** - We have added new actions to the Office 365 Users connector that work with user profiles and photos.
- **Append to string variables** - You can add to strings inside of loops to build up tables or other lists.
- **Infobip connector** - Infobip is a service that enables enterprise grade communication, including voice calls and triggering on inbound SMS.

[Read more and ask questions](https://flow.microsoft.com/blog/o365-profile-infobip/) about this release.

### Release 2017-12-20

Power Automate Analytics is now available in all Power Automate regions, meaning you can get more insight into the health of flows running within your environment.

[Read more and ask questions](https://flow.microsoft.com/blog/announcing-microsoft-flow-analytics/) about this release.


### Release 2017-12-14

- **Outlook connector improvements** - You can save an email as a ".eml" file, respond to calendar invitations automatically, and trigger flows when you are mentioned in an email thread.
- **Connections improvements** - Power Automate remembers your most recently used connections, and shows you all of the newly added connectors.
- **Five new connectors** - Added Azure Container Instances, Azure Kusto, Metatask, Microsoft To-Do, and Plumsail Documents.
- **HTTP improvements** - The HTTP action now supports chunked encoding.

[Read more and ask questions](https://flow.microsoft.com/blog/outlook-connector-more/) about this release.

### Release 2017-12-05

The Power Automate Launch Panel is now available in all regions. This panel allows you to add values to a cloud flow when you run it inside of your SharePoint list or document library.

[Read more and ask questions](https://flow.microsoft.com/blog/introducing-flow-launch-panel-in-sharepoint-lists-and-libraries/) about this release.


### Release 2017-11-28

- **Managed Metadata** - Read data from, and write into, columns in SharePoint that use the Managed Metadata (aka. Taxonomy) type.
- **Append to Arrays** - Add items to the end of arrays using a new Append to array variable action.
- **Tago** - A new connector to Tago, which provides easy connection of electronic devices with external data to drive smarter decisions using contextual analysis.
- **iPhone X** - A new version of the Power Automate app that uses the full screen on the iPhone X, and that has a speed improvement for image uploads.

[Read more and ask questions](https://flow.microsoft.com/blog/managed-metadata-tago/) about this release.

### Release 2017-11-09

- **OneDrive for Business integration** - There's [now a cloud flow button inside of OneDrive for Business](https://flow.microsoft.com/blog/microsoft-flow-integration-in-one-drive-for-business-and-new-connector-actions/) that can create or trigger flows on selected files or folders.
- **Planner triggers** - Start flows when a new task is created, when a task is assigned to you or when one is completed.
- **SharePoint attachments** - Work with attachments on SharePoint list items: list, download, add or delete attachments.
- **Flow management connector** - Create flows that automate the management of other flows in your environment (for example, add permissions to flows automatically).
- **Four new connectors** - Added Azure Custom Vision Service, D&B Optimizer, Enadoc, and Derdak SIGNL4. 
- **More connector actions** - Run SQL queries, get faster email triggers, use any method with HTTP with Azure AD, and more.

[Read more and ask questions](https://flow.microsoft.com/blog/planner-triggers-connector-improvements/) about this release.

### Release 2017-11-02

- **Audit Logging** - Power Automate audit events are now available in Office 365 Security & Compliance Center for all tenants.
- **Flow widget fixes** - Fixed an issue in the Power Automate mobile app that caused buttons to not load in the widget.

[Read more and ask questions](https://flow.microsoft.com/blog/security-and-compliance-center/) about this release.

### Release 2017-10-19

- **Nested apply to each** - You can add apply to each actions, filter and select in other apply to each container actions.
- **Date Time actions** - New actions for getting local times, adding, subtracting or formatting times.
- **Four new connectors** - Added Content Moderator, Docparser, Microsoft Kaizala and Pitney Bowes Data Validation.
- **Improved connection experience** - Notifications in the Power Automate portal when a connection is broken and richer connection details.
- **On-the-go collection** - A new template collection for [on-the-go workers](https://flow.microsoft.com/collections/onthego/).
- **Email address button inputs** - Collect email addresses from users when they run buttons.
- **File button inputs** - Get uploaded files, such as photos, from users when they run buttons.
- **First run and auto sign-in** - Improved first run experiences on the mobile app, including automatic sign-in.
- **Faster Microsoft Forms triggers** - Forms will trigger flows much more quickly than before (previously once an hour).
- **Button inputs across sessions** - Buttons triggered on your mobile phone will remember previous inputs.
- **Mobile activity feed** - Improved activity feed to include more detailed run summaries and troubleshooting details.

[Read more and ask questions](https://flow.microsoft.com/blog/nested-apply-to-each/) about this release.

### Release 2017-10-03

- **All must approve** - Require an approval request sent to more than one person to have everyone who received the request to approve it.
- **New OneDrive for Business actions** - Generate PDFs for files stored on OneDrive for Business and four other new actions.
- **Apache Impala connector** - Apache Impala (incubating) is the open source, native analytic database for Apache Hadoop.
- **Add flow descriptions** - Give your flows descriptions so when you share them so your co-workers can see a summary of the flow does.

[Read more and ask questions](https://flow.microsoft.com/blog/all-must-approve-and-onedrive/) about this release.

### Release 2017-09-25 - Q3 Update for Power Automate

- **Deeper SharePoint integration in First Release** - There are new "in-the-box" send for review flows and a Flow panel for collecting inputs when you run a cloud flow for first release tenants.
- **Dynamics 365 apps** - Power Automate is now integrated in the UI for Dynamics 365 apps such as Dynamics 365 Sales and Dynamics 365 Customer Service.
- **Microsoft Trust Center** - Power Automate is listed in the Microsoft Trust center, showing certifications like HIPAA, ISO and SOC.
- **Usage analytics** - Every flow has an embedded Power BI dashboard with basic usage analytics.
- **Audit Logging in First Release** - All flow management events are logged in the Office 365 Security and Compliance center for first release tenants.
- **Six new connectors** - Added LinkedIn, Office 365 Groups, Skype for Business, Adobe Sign, Bizzy, and Azure Log Analytics Data Collection.
- **SQL triggers** - Run flows when a new row is added or a row is updated in a SQL table.
- **On-prem custom connectors** - Custom connectors can now use the On-premises Data gateway to connect to internal endpoints on your network.

[Read more and ask questions](https://flow.microsoft.com/blog/q3-2017-update/) about this release.

### Release 2017-09-21

- **Download Flow History** - Download the run history of a cloud flow as a CSV file to open in Excel.
- **Advanced recurrence** - Build recurring schedules to trigger your flows, for example, only trigger on weekdays.
- **IntelliSense** - When typing in expressions, IntelliSense will provide suggestions for parameters.
- **Four new connectors** - Added connectors for Azure AD HTTP services, Amazon Redshift, Azure Event Grid Publish and FlowForma.
- **Sharing links** - A new action to generate sharable links for OneDrive files or Azure Storage Blobs.

[Read more and ask questions](https://flow.microsoft.com/blog/download-history-recurrence/) about this release.


### Release 2017-08-25
* **Document properties and more for SharePoint** - [Read and set SharePoint document library properties](https://flow.microsoft.com/blog/support-for-sharepoint-document-library-properties/), and use additional fields like links to the SharePoint item.
* **Flow collections** - Flow collections are a set of template collections organized by role or by vertical.
* **Button resharing** - When you share buttons with your co-workers they can reshare them with other people too.
* **Collect lists from buttons** - Define dropdowns of options for users to choose from when they tap the button.
* **Seven new connectors** - AWeber, Azure Log Analytics, Azure Tables, DocFusion365, Azure Event Grid, Azure Event Hubs, and StaffHub. 
* **Improvements to Slack and MySQL** - Create or join channels in Slack, and you can write to MySQL databases.

[Read more and ask questions](https://flow.microsoft.com/blog/button-updates-seven-connectors/) about this release.

### Release 2017-08-02
* **Write to Person, Choice and Lookup fields** - SharePoint's Create item and Update item [now support the ability to](https://flow.microsoft.com/blog/setting-sharepoint-s-person-choice-and-lookup-fields/) set Person, Choice, and Lookup fields.
* **More action settings** - Now there's more control over how triggers and actions run, including configuring retry policies and pagination.
* **Four new connectors** - You can now use Azure File Storage, Elastic Forms, Plivo, and Video Indexer.

[Read more and ask questions](https://flow.microsoft.com/blog/four-connector-action-settings/) about this release.

### Release 2017-07-27 - Q2 Update for Power Automate
* **Import and export** - Export and import flow solutions across environments or from test to production. 
* **Use expressions in actions** - Enter expressions in any action and get inline help with how to use them.
* **Grow up to Azure Logic Apps** - Save your flows as Azure Logic App resource that can be deployed through Visual Studio or the Azure portal.
* **Admin visibility** - Download Power Automate usage in your tenant to understand exactly where and how flows are being used.
* **Flows in Dynamics 365** - Use flows inside of Dynamics 365 for Operations & Financials, Business Edition.
* **Find scenarios more easily** - Browse everything that connector can do and then use any trigger as a jumping-off point for building flows.

[Read more and ask questions](https://flow.microsoft.com/blog/q2-2017-update/) about this release.

### Release 2017-07-13
* **Improved template publishing** - Publish any flow you create, along with its categories, to the public gallery.
* **Get events on your Outlook Calendar** - A new action to return all events between two times on your calendar.
* **New mobile functionality** - Run flows on demand and resubmit failed runs in the mobile app.
* **Dynamic dropdowns in Custom connectors** - Build dynamic dropdowns, polling triggers and test your custom connectors.

[Read more and ask questions](https://flow.microsoft.com/blog/publishing-and-custom-connectors/) about this release.

### Release 2017-06-28
* **Update your language settings** - You can customize both the Language and Region that Power Automate uses through the Settings menu.
* **Five new connectors** - Added support for Adobe Creative Cloud, Bing Maps, Bing Search, JotForm and Freshservice.
* **Configure timeouts** - Change the time long-running actions, such as approvals, run before they "timeout" and the flow continues.
* **Include comments in Outlook for approvals** - When you receive an approval request you can provide comments without ever leaving Outlook.
* **Custom connector brand colors** - You can now enter a color for your Custom Connectors that will be used for the backgrounds.
* **Save As for team flows** - Make copies of any flows, including Team flows
* **Delete flow information** - When you delete a cloud flow, you'll be shown the list of all pending runs for that flow.
* **Filtering on the Connectors page** - Search for the connectors you want on the Connectors page, and filter by type of connector.

[Read more and ask questions](https://flow.microsoft.com/blog/language-settings-3-connectors/) about this release.

### Release 2017-06-19
You can now view the status of all of the pending approval requests you have sent. Additionally, you can browse and act on all your pending approvals directly from your mobile device.

[Read more and ask questions](https://flow.microsoft.com/blog/sent-requests-flow-mobile/) about this release.

### Release 2017-06-15
* **Content conversion** -  A new connector that can convert HTML content to plain text, useful for handling HTML formatted emails.
* **Three new database connectors** - Added read-only support for MySQL, PostgreSQL and Teradata. These connectors connect via the On-premises data gateway.
* **Three other connectors** - Connect to Azure Application Insights, Calendly and Teamwork Projects.
* **Better visualization for error handling** - Steps that run after errors are now shown with red dotted arrows so you can easily identify them.
* **Run details pane** - When a cloud flow fails there is now a new right-hand pane that contains some helpful steps for how to correct your flow.

[Read more and ask questions](https://flow.microsoft.com/blog/seven-connectors-and-html/) about this release.

### Release 2017-06-04
* **GA for Windows Phone** - [The Power Automate mobile app has been released to General Availability for Windows Phone](https://flow.microsoft.com/blog/announcing-flow-windows-phone-app/).
* **Emails on flow failures** - Get notified via email when you have a cloud flow that fails. These failure emails will only be sent out once a week, and can be turned on or off by the user.
* **Select action for tables** -  Use the new Select action to change the set of columns that will be included in tables.
* **Microsoft Forms connector** -  Microsoft Forms is a new part of Office 365 Education that allows teachers and students to create custom quizzes quickly and easily, surveys, questionnaires, registrations and more.
* **Office 365 Enterprise K1 plan** - Power Apps and Power Automate are now included with the Office 365 Enterprise K1 plan with certain quotas.
* **HTTP headers are easier** - Just like the Select action you can provide a header name and header value by just filling out the text boxes on the action.

[Read more and ask questions](https://flow.microsoft.com/blog/microsoft-forms-tables-flow-failures/) about this release.

### Release 2017-05-23
* **Microsoft Teams connector** - [Microsoft Teams](https://flow.microsoft.com/blog/introducing-the-microsoft-teams-connector-for-flow/) is a chat-based workspace in Office 365 that brings together people, conversations and content – along with the tools that teams need, so they can easily collaborate to achieve more.
* **Widgets on iOS and Android** - Power Automate widgets are button shortcuts that provide you an easier and faster way for button triggering straight from your home screen.
* **Create "error handling" steps** -  Define one or more steps to run after an action fails. For example, get a notification immediately if your flow fails to create a row in Dynamics 365.
* **Integer and float variables** -  Initialize and increment or decrement counters inside of a cloud flow run to count how many times a certain set of logic runs.
* **Flow details page** - When you select a cloud flow in your **My flows** list, you'll see a page with details about that flow, such as who has access and the run history.
* **Flow run quotas for admins** - Administrators can now monitor flow run usage across an organization against the common company run quota and get a quota breakdown to understand what licenses contribute to their quota.
* **HTTP request trigger improvements** - Use different HTTP methods, and add path segments for the Request trigger.
* **Two partner connectors** - Power Automate can now connect to Parserr, an email-parsing service, and Cognito Forms, an online-forms service.

[Read more and ask questions](https://flow.microsoft.com/blog/error-handling/) about this release.

### Release 2017-05-12
* **SharePoint Document Libraries integration** - You can select any file in a document library and kick off a cloud flow, for example to send it to your manager for approval, [and much more](https://flow.microsoft.com/blog/flow-in-spo-document-libraries/).
* **Microsoft Planner connector** - Microsoft Planner lets you easily bring together teams, tasks, documents, and conversations for better results.
* **Admin view of licenses** - Administrators can see all of the Power Automate and Power Apps licenses (both trial and paid) in the Power Automate admin center.
* **Power Apps Community Plan** -  The Power Apps Community plan is a free plan for individuals to explore, learn, and build skills for Power Apps, Power Automate, and Dataverse.

[Read more and ask questions](https://flow.microsoft.com/blog/planner-community-and-licenses/) about this release.

### Release 2017-05-09
* **Azure AD connector** - There is a new connector for performing administrator actions from Power Automate, including creating users or adding them to groups.
* **Office 365 Outlook improvements** - Flows can now be triggered by Shared Mailboxes and send mail to a Shared Mailbox. They can also set or read automatic replies.
* **Available in Canada** - You can now create your flows in Canada.
* **Create custom API webhooks** - Custom connector developers can now add triggers to their custom APIs with webhooks.
* **Manage flow owners in the admin center** - Environment administrators can manage flow owners in the Power Automate admin center.
* **Connector documentation reference** -  We now have a [full connector reference on docs.microsoft.com](/Connectors/).
* **Two partner services** - Two new partner services were released: Nexmo and Paylocity.

[Read more and ask questions](https://flow.microsoft.com/blog/canada-mailboxes-aad) about this release.

### Release 2017-04-27
* **Build flows with parallel steps** - Create flows with parallel execution: meaning you can have two or more steps that run at exactly the same time.
* **Five new services supported** - Five new services: Approvals, Benchmark Email, Capsule CRM, LiveChat, and Outlook Customer Manager.
* **Monitor retries for actions** - Power Automate will retry when there are failures with services. Now see how many automatic retries occurred and the details of what happened.

[Read more and ask questions](https://flow.microsoft.com/blog/parallel-actions/) about this release.

### Release 2017-04-17 - Q1 Update for Power Automate
* **Modern approval experiences** - Create workflows where approvers can approve securely from inside the Power Automate mobile app or the unified approvals center on the Power Automate website.
* **Team flows general availability** - Multiple people can own and manage a cloud flow together with team flows, which are now generally available.
* **Build connectors for Power Automate** - Anyone can submit their own Power Automate connector for free for the rest of the world to use.
* **A "diet" designer** - For certain templates, a new version of the designer presents just the fields that are required to create a cloud flow, which simplifies the experience.

[Read more and ask questions](https://flow.microsoft.com/blog/q1-2017-update/) about this release.

### Release 2017-04-11
* **New actions to build tables and lists** - New Create HTML Table, Create CSV Table and Join actions that can process lists of items (instead of the previous Apply-to-each only).
* **Insert steps anywhere** - You can now insert a new step anywhere in the workflow without needing to drag-and-drop.
* **Four new services** - Power Automate now supports 10 to 8 Scheduling, Act!, Inoreader and the Computer Vision API. With the Computer Vision API you can process images to get the text content (known as OCR), or automatically tag images based on their content.

[Read more and ask questions](https://flow.microsoft.com/blog/html-tables-csvs-computer-vision/) about this release.

### Release 2017-04-03
* **Windows Phone Beta** - The Windows Phone App beta program is available to get a preview of the app on your Windows Phone. [Read more](https://flow.microsoft.com/blog/windows-phone-app-beta-is-now-available/).
* **Muhimbi PDF** - You can now convert Microsoft Word files to PDF, add watermarks, merge documents and more with Muhimbi PDF. [Read more](https://flow.microsoft.com/blog/convert-files-using-muhimbi/).
* **Trigger flows from physical buttons** - Announcing partnerships with two of the leading products in the physical button space: Flic by Shortcut Labs, and Bttn by The Button Corporation. [Read more](https://flow.microsoft.com/blog/physical-buttons/)

### Release 2017-03-22
* **Make a copy of your flow** - You can now make a copy of your flow to work on draft versions or duplicate a cloud flow that you've created in the past.
* **Two new services** - Adding support for Toodledo - manage your to-do list by creating and updating tasks, and Zendesk, which provides a customer service and support ticketing platform.

[Read more and ask questions](https://flow.microsoft.com/blog/make-a-copy/) about this release.

### Release 2017-03-15
* **Share buttons with co-workers** - You can now share flow buttons with other people, making it easy for any business user to perform quick tasks.
* **Trigger buttons from the home screen** - Shortcuts to flow buttons from the home and lock screens of mobile devices make it quicker than ever to trigger a cloud flow.
* **Team flows in the Power Automate app** - You can now see the flows that have other owners in the Power Automate app for iOS or Android.

[Read more and ask questions](https://flow.microsoft.com/blog/button-sharing/) about this release.

### Release 2017-03-10
* **Improved custom connector experience** - You can now use a Postman collection to create a custom connector, and edit, add, and test actions.
* **Two new services** - Added Power Apps Notifications and PivotalTracker support.

[Read more and ask questions](https://flow.microsoft.com/blog/new-updates-custom-api/) about this release.

### Release 2017-02-27
* **Trigger your flow buttons** - You can now trigger flow buttons right from Power Automate. When looking at your list of flows, simply select the "..." menu and choose the Run now command.
* **Five new services** - Added Oracle Database, Intercom, FreshBooks, LeanKit and WebMerge support.

[Read more and ask questions](https://flow.microsoft.com/blog/trigger-flow-buttons-web/) about this release.

### Release 2017-02-21
* **View environment flows** - Environment administrators can now view the full list of all the flows inside a given environment, as well as enable, disable or delete flows.
* **Two new services** - Added Azure Automation and Basecamp 2 support.

[Read more and ask questions](https://flow.microsoft.com/blog/managing-flow-resources-in-the-admin-center/) about this release.

### Release 2017-02-16
* **Five new services** - Added support for Azure Data Lake, Bitbucket (a web based hosting service for projects that use GIT revision control), Eventbrite, Infusionsoft and Pipedrive.
* **Custom HTTP authentication** - In the flow designer it's now possible to use authentication with custom HTTP endpoints.
* **Parse JSON messages** - You can parse JSON data from the HTTP Request trigger or that's returned from the HTTP action.
* **Flow run filtering** - Improved filtering for flow runs, with more specific options including seeing Running flows or Cancelled runs.

[Read more and ask questions](https://flow.microsoft.com/blog/managing-flow-resources-in-the-admin-center/) about this release.

### Release 2017-02-06
* **Team flows** - Team flows make it possible for multiple people to own and manage a cloud flow together, and, if someone leaves an organization, the flows they created can continue to run.
* **Sharing custom connectors** - custom connectors, like team flows, can be shared and collectively managed inside an organization.
* **Gmail and LUIS support** - Connect to Gmail and Azure Cognitive Services' Language Understanding Intelligent Service.

[Read more and ask questions](https://flow.microsoft.com/blog/team-flows/) about this release.

### Release 2017-01-30
* **Flow button inputs** - Flow buttons can now receive user inputs at run time, so flow authors can define information that's passed in when the button is tapped.
* **Outlook Tasks and HelloSign** - Outlook Tasks service lets you manage tasks, and HelloSign enables secure electronic signatures.

[Read more and ask questions](https://flow.microsoft.com/blog/button-user-inputs/) about this release.

### Release 2017-01-23
* **Search by service** - Browse by service when you add a trigger or action to see all the actions for each service.
* **Switch case** - Add Switch blocks to have several branches of parallel logic.
* **More email actions** - New functionality in the Office 365 Outlook and Outlook.com services to work with flagged mails.
* **Five new services** - Connect to Local or Network File Systems, the payment service Stripe, IBM Informix, IBM DB2, and UserVoice.

[Read more and ask questions](https://flow.microsoft.com/blog/search-by-service/) about this release.

### Release 2017-01-14
* **Resubmit runs** - If a cloud flow failed and you want to try to fix it and run again, you can resubmit the failed run.
* **Cancel runs** - When a cloud flow gets stuck, you can now explicitly cancel the run.
* **Two new services** - Added support for GoToTraining and GoToWebinar.
* **Mobile links** - You can share templates right from the mobile app, and we've added a quick download link for the apps at the top of the website.

[Read more and ask questions](https://flow.microsoft.com/blog/managing-runs/) about this release.

### Release 2016-12-29
Power Automate now supports DocuSign, to handle eSignatures and Digital Transaction Management; SurveyMonkey, for web-based surveys; and the OneNote note-taking app (business accounts only).

[Read more and ask questions](https://flow.microsoft.com/blog/final-2016-services/) about this release.

### Release 2016-12-20
* **Run now** - You can now fire off a recurring trigger on demand - for example, if you have a scheduled report every day, but you need the report to run **now** too.
* **Six new services** - Build flows that connect to MSN Weather, Medium, Google Contacts, Buffer, Harvest, and TypeForm.

[Read more and ask questions](https://flow.microsoft.com/blog/run-now-and-six-more-services/) about this release.

### Release 2016-12-14
You can now leverage valuable information when triggering a button flow, such as from where the button was triggered, by whom, at what time, and more.

[Read more and ask questions](https://flow.microsoft.com/blog/button-trigger-tokens/) about this release.

### Release 2016-12-06
* **Introducing Guided Learning** - Get started with a sequenced collection of courses that pair videos with documentation to help you understand the extensive and powerful capabilities of Power Automate.
* **Two new services** - Flows can now use Freshdesk, a customer support solution, and GoToMeeting, an online meeting tool.
* **HTTP Webhook support** - A flow can now be an endpoint for webhooks that will automatically register and unregister itself.

[Read more and ask questions](https://flow.microsoft.com/blog/guided-learning-and-two-services/) about this release.

### Release 2016-11-23
* **Power BI alert support in Flow** - Turn insights into action by triggering flows from Power BI data alerts.
* **Mobile application improvements** - Added the ability to create flows from blank, in addition to the already existing experience of creation from templates. We also improved performance when viewing flow runs.
* **Eight new services** - You can now connect to Azure Resource Manager, Azure Queues, Chatter, Disqus, Azure Cosmos DB, Cognitive Services Face API, HipChat, and Wordpress.

[Read more and ask questions](https://flow.microsoft.com/blog/power-bi-and-eight-other-services/) about this release.

### Release 2016-11-15
* **Power Automate Partner Program** - Power Automate now has a certified partner program to make connections and take advantage of different company’s talents and experience with Power Automate around the world.
* **Six new services** - We're also releasing six services this week: Asana, Campfire, EasyRedmine, JIRA, Redmine, and Vimeo.

[Read more and ask questions](https://flow.microsoft.com/blog/partner-program-six-new-services/) about this release.

### Release 2016-10-31 - General Availability
* **Pricing and licensing** - Now available in both Free and paid plans, as well as included in Office 365 and Dynamics 365.
* **Power Automate admin center** - Enterprise-ready with the new admin center. In the admin center you can manage the environments inside the organization.
* **Data loss prevention policies** - Administrators can create data loss prevention policies to control the flow of data between services.
* **Android availability** - The Power Automate phone app is now available for both iOS and Android. The app enables you to get notifications, monitor activity, and start flows with the tap of a button.
* **New designer experiences** - You can now search over the dynamic content passed from step to step, making it much quicker to reference the data you want to.

[Read more and ask questions](https://flow.microsoft.com/blog/announcing-ga/) about this release.

### Release 2016-10-26
* **Button flows** - There are countless operations we wish we could trigger anytime and anywhere. Now, with Button Flows, you can get those done at just a click of a button, from your mobile device.
* **Announcing environments** - Environments are distinct spaces to store and manage your organization's flows. Environments are geo-located, which means that the flows, apps and business data that lives within an environment will be in the region where the environment is located.
* **Six new services** - Adding support for Bit.ly, Cognitive Services Text Analytics, Dynamics NAV, Dynamics 365 for Financials, Instapaper, and Pinterest.

[Read more and ask questions](https://flow.microsoft.com/blog/environments-for-makers/) about this release.

### Release 2016-10-16
* **Custom connectors support more authentication types** - Custom connectors now support API Key authentication and can authenticate against any service that supports the full OAuth 2.0 specification.
* **Three new services supported** -  We've added support for Basecamp 3, Blogger and PagerDuty.
* **Designer improvements** - Improved performance, you can now update and repair your connections right from the "..." menu for every action, and we have added a new step called Terminate that you can use to end a cloud flow's run.

[Read more and ask questions](https://flow.microsoft.com/blog/early-october-updates/) about this release.

### Release 2016-09-25
Flow creation now available from your mobile phones. Browse our rich template gallery, navigate through our services list, or select a template category to drill into. [Read more and ask questions](https://flow.microsoft.com/blog/mobile-creation/) about this release.

### Release 2016-09-22
* **Microsoft Graph People Picker** - A new Microsoft Graph people picker is integrated directly into the Power Automate UI to help you choose the right contact or email address.
* **Microsoft Dynamics AX support** -  From inside your flows you can now take action on your Dynamics AX Online operations data, from creating new records to querying for data.
* **Two new services from partners** - Now use appFigures or Insightly from your flows.

[Read more and ask questions](https://flow.microsoft.com/blog/more-september-updates/) about this release.

### Release 2016-09-14
* **Embedding in your web site or app** - Developers can now embed Power Automate right into their apps or web sites to give their users a simple way to automate their personal or professional tasks.
* **Use a cloud flow as an HTTP endpoint** -  Now you can use a cloud flow itself as an HTTP API. There is a trigger called Request inside of flow, and you can choose to respond to the incoming request by adding a Response card.
* **Todoist support** - Todoist gives you perspective over all your projects, at work and at home.

[Read more and ask questions](https://flow.microsoft.com/blog/extend-web-site-application/) about this release.

### Release 2016-09-01
Power Automate now available for everyone - we initially opened up the preview to only email addresses provided by your work or school, like those used with Office 365 Business or Office 365 Enterprise. Today, we are announcing that the preview is officially available, free to use, for all users, no matter what email you may have. [Read more and ask questions](https://flow.microsoft.com/blog/available-for-everyone/) about this release.

### Release 2016-08-31
* **Nested conditionals** - Now you can add a second (or third, etc…) condition inside of another.
* **Apply to each** -  An apply to each loop makes it possible to control the list that you repeat over.
* **Do-until** - A do-until loop allows you to repeat a step until a certain condition is met.
* **Filter arrays** - There is a single native filter step that can make sure that every item in the list matches some expression that you define.
* **Compose string variables** -  You can now compose a string variable.
* **Scopes** - Scopes are a simple way to group two or more actions together.

[Read more and ask questions](https://flow.microsoft.com/blog/build-advanced-flows/) about this release.

### Release 2016-08-27
* **Comments on steps** - Comments make it easy to annotate each individual action with notes so that you can easily remember what the flow needs
* **Smartsheet support** -  This week we added support to connect to Smartsheet. Smartsheet is a service that makes it easy to collaborate on sheets in the cloud.
* **UI refinements when authoring flows** - We have made the flow name front-and-center and moved the save button to the top of the page for easy access.

[Read more and ask questions](https://flow.microsoft.com/blog/add-comments-smartsheet/) about this release.

### Release 2016-08-18
You can now preview the new SharePoint Online modern lists experience that includes the Power Automate integration. [Read more and ask questions](https://flow.microsoft.com/blog/microsoft-flow-integration-with-sharepoint-modern-lists-preview/) about this release.

### Release 2016-08-13
* **Visual Studio Team Services** - With Power Automate, you can now connect VSTS to a wide variety of services such as O365 Email, Slack, and Trello.
* **Enhancements to SharePoint** -  SharePoint lists support a range of data types from simple objects like Single lines of text and Date and Time to complex objects such as Person or Group, Lookup, and Choice.
* **Test O365 Outlook Connections** - Whenever you create a new O365 Outlook connection, we will now test it to make sure you’re ready to use it.
* **Boolean Control** - We’ve also added a boolean control to clarify which values you should enter for boolean input fields, such as Has Attachments in the When a new email arrives trigger.

[Read more and ask questions](https://flow.microsoft.com/blog/visual-studio-team-services-enhancements-to-sharepoint-and-o365-outlook-and-boolean-control/) about this release.

### Release 2016-08-08
Public preview of Dataverse integrated in Power Automate. [Read more and ask questions](https://flow.microsoft.com/blog/flow-and-common-data-model/) about this release.

### Release 2016-08-05
* **SharePoint On-Premises** - Just like with SharePoint Online, you can create flows around your SharePoint on-premises lists and doc libraries either using pre-defined templates or by building them from scratch.
* **Info-bubbles in the designer** - In order to elaborate on the capabilities of each trigger and action, we’ve added info-bubbles above each step of your flow.

[Read more and ask questions](https://flow.microsoft.com/blog/sharepoint-on-premises-and-info-bubbles-2/) about this release.

### Release 2016-07-15
* **Four new services added** - Connect to Google Calendar, Google Tasks, YouTube and SparkPost.
* **Rename your actions** -  Now, you can tell these different actions apart by renaming them.
* **Delay for different periods of time** -  You can now select any number of Seconds, Minutes, Hours or Days.
* **Easier to use folder browser** - We've simplified the folder browser - now selecting on the left will choose that folder, and selecting on the right will open that folder so you can choose the subfolders inside.

[Read more and ask questions](https://flow.microsoft.com/blog/new-google-services-rename-more/) about this release.

### Release 2016-07-08
On-premises connectivity for Power Automate using the on-premises data gateway. This allows you to establish secured connections to SQL Server and integrate them with your flows. [Read more and ask questions](https://flow.microsoft.com/blog/on-premises-data-gateway/) about this release.

### Release 2016-07-02
* **Google Sheets support** - In the past, we have had both the ability to use Excel, as well as Google Drive, but this week we are adding native Google Sheets support.
* **Get started more quickly from templates** - We have also made some optimizations to the way you can start from templates. Now, you can select what accounts you want to use for a template right inline on the template page.
* **No expiring authorization for SharePoint and Office 365** -  Now, Power Automate will automatically renew your access to Azure Active Directory-based services, so all of your flows will continue working across password changes.

[Read more and ask questions](https://flow.microsoft.com/blog/more-june-updates/) about this release.

### Release 2016-06-20
* **Introducing the new mobile app for Power Automate** - Today, we are pleased to introduce another major piece of our offering: a mobile app now available for download on iOS (soon also on Android) that gives you the power to manage, track, and explore your automated workflows anytime and anywhere.  
* **Single sign-on** - We've implemented single sign-on that allows you to authenticate to Power Automate with other Microsoft services like Office 365.

[Read more and ask questions](https://flow.microsoft.com/blog/welcome-to-flow-now-more-mobile/) about this release.

### Release 2016-06-18
* **New Mail service** - You can now send emails directly from Power Automate, without needing to connect to your personal or work email accounts inside of Power Automate.
* **Notifications in the portal** - Now, you'll see Notifications at the top of the portal whenever something is broken with your flows.
* **All Activity in the portal** - You can now see activity across all of your flows by clicking the new Activity tab in the flow website.

[Read more and ask questions](https://flow.microsoft.com/blog/mail-and-all-activity/) about this release.

### Release 2016-05-27
* **Browse templates by service** - There is a now a way to see all of the services that we support (without having to log in). From this page you can see a description of each of the services, and check out the templates that we have for that service.
* **Create and use your custom connectors** - Just like you can create custom connectors in Power Apps, you can also connect to your own APIs right at flow.microsoft.com:
* **Test your flows before finishing** - Whenever you save a cloud flow you can now see the results of the flow run live in the page, if you perform the starting action.

[Read more and ask questions](https://flow.microsoft.com/blog/may-updates-to-microsoft-flow/) about this release.

### Release 2016-05-07
Added two new services: Microsoft Project Online and Mandrill by Mailchimp. [Read more and ask questions](https://flow.microsoft.com/blog/announcing-microsoft-flow-webinars/) about this release.

### Release 2016-04-27 - Public Preview
If you used Logic flows as part of [Microsoft Power Apps](https://powerapps.microsoft.com), the Power Automate Preview release offers several new features:

* You can now browse a gallery of dozens of templates and sort by Popularity, Name, or Date published.
* You can [publish your own templates](publish-a-template.md) into the gallery after you customize a cloud flow.
* You can see the history for every check and run of your flow.
* When you save a cloud flow, you can [watch it in action immediately](see-a-flow-run.md) by just performing the trigger action.
* We have a [new community](https://go.microsoft.com/fwlink/?LinkID=787467) for you to discuss Power Automate or [submit your ideas](https://go.microsoft.com/fwlink/?LinkID=787474).

>[!NOTE]
>Release plans are now tracked [here](/dynamics365/release-plans/).

## Next steps
If you have any issues not already covered in these release notes or in the [FAQ](frequently-asked-questions.yml), please [join our community](https://go.microsoft.com/fwlink/?LinkID=787467) to ask questions, or [contact support](https://go.microsoft.com/fwlink/?LinkID=787479).



[!INCLUDE[footer-include](includes/footer-banner.md)]
