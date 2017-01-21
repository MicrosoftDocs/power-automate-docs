<properties
	pageTitle="Release notes | Microsoft Flow"
	description="Common issues and what's new for Microsoft Flow releases"
	services=""
	suite="flow"
	documentationCenter="na"
	authors="stepsic-microsoft-com"
	manager="anneta"
	editor=""
	tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="01/17/2017"
   ms.author="stepsic"/>

# Release notes #

## Top questions ##

1. My flow failed. How do I fix it?

	1. Identify the failure. Start by going to the notifications icon at the top of the web portal, or selecting the **Activity** tab in the mobile app. You should see your flow there, and you can select it.
	- You are now looking at the flow details. Find the step with the red exclamation icon and you should see the error message for your flow there.
	- Depending on the error message, you should be able to **Edit** the flow and fix it. [Read more here about how to fix common flow failures](fix-flow-failures.md).

1. How do I use an advanced condition or a formula?
	- Read about [adding conditions](add-a-condition.md).
	- If you want multiple cases in a flow, click or tap **Add condition** from inside of an existing condition.
	- Create an advanced formula by referencing [a function in Logic Apps](https://docs.microsoft.com/rest/api/logic/definition-language).

1. How does licensing work with Office 365?
	- If you're an Office 365 user, you get full access through the Flow for Office 365 plan. For more information, see the [pricing plans for Microsoft Flow](https://flow.microsoft.com/pricing/) .
	- If you're an administrator, see information about [licensing for Microsoft Flow](organization-q-and-a.md), including with Office 365.

## Known issues and resolutions ##
1. Flows created during preview that use the Microsoft Common Data Service:
	- Have been moved to an environment dedicated to that database. Select the environment for that database in the top-right of the screen. [Learn more](environments-overview-maker.md).
	- In the flow designer, these flows will display a long string of numbers and letters in any actions that use it. Your flow should continue to function as you expect.

1. SharePoint lists on My Sites and that aren't of type *Custom List* aren't supported. To work around this issue, create a custom list on a standard SharePoint site.

1. SQL stored procedures can't be run on on-premises SQL Servers. Only SQL Azure supports stored procedures at this time.

1. Do-until cards have rendering errors that make it difficult to reference content from arrays.

1. Document Metadata isn't returned from triggers on SharePoint document libraries.

1. Flows can't write to Lookup, Choice, People and Groups, and Taxonomy fields in SharePoint lists. We recommend using a simple string field until this is corrected.

1. File triggers won't fire for files being added inside of nested folders inside the folder you select.

## What's new ##

### Release 2017-01-14

- **Resubmit runs** - If a flow failed and you want to try to fix it and run again, you can resubmit the failed run.
- **Cancel runs** - When a flow gets stuck, you can now explicitly cancel the run.
- **Two new services** - Added support for GoToTraining and GoToWebinar.
- **Mobile links** - You can share templates right from the mobile app, and we've added a quick download link for the apps at the top of the website.

[Read more and ask questions](https://flow.microsoft.com/blog/managing-runs/) about this release.

### Release 2016-12-29

Microsoft Flow now supports DocuSign, to handle eSignatures and Digital Transaction Management; SurveyMonkey, for web-based surveys; and the OneNote note-taking app (business accounts only).

[Read more and ask questions](https://flow.microsoft.com/blog/final-2016-services/) about this release.

### Release 2016-12-20

- **Run now** - You can now fire off a recurring trigger on demand - for example, if you have a scheduled report every day, but you need the report to run **now** too.
- **Six new services** - Build flows that connect to MSN Weather, Medium, Google Contacts, Buffer, Harvest, and TypeForm.

[Read more and ask questions](https://flow.microsoft.com/blog/run-now-and-six-more-services/) about this release.

### Release 2016-12-14

You can now leverage valuable information when triggering a button flow, such as from where the button was triggered, by whom, at what time, and more.

[Read more and ask questions](https://flow.microsoft.com/blog/button-trigger-tokens/) about this release.

### Release 2016-12-06

- **Introducing Guided Learning** - Get started with a sequenced collection of courses that pair videos with documentation to help you understand the extensive and powerful capabilities of Microsoft Flow.
- **Two new services** - Flows can now use Freshdesk, a customer support solution, and GoToMeeting, an online meeting tool.
- **HTTP Webhook support** - A flow can now be an endpoint for webhooks that will automatically register and unregister itself.

[Read more and ask questions](https://flow.microsoft.com/blog/guided-learning-and-two-services/) about this release.

### Release 2016-11-23

- **Power BI alert support in Flow** - Turn insights into action by triggering flows from Power BI data alerts.
- **Mobile application improvements** - Added the ability to create flows from blank, in addition to the already existing experience of creation from templates. We also improved performance when viewing flow runs.
- **Eight new services** - You can now connect to Azure Resource Manager, Azure Queues, Chatter, Disqus, Azure DocumentDB, Cognitive Services Face API, HipChat, and Wordpress.

[Read more and ask questions](https://flow.microsoft.com/blog/power-bi-and-eight-other-services/) about this release.

### Release 2016-11-15

- **Microsoft Flow Partner Program** - Microsoft Flow now has a certified partner program to make connections and take advantage of different company’s talents and experience with Microsoft Flow around the world.
- **Six new services** - We're also releasing six services this week: Asana, Campfire, EasyRedmine, JIRA, Redmine, and Vimeo.

[Read more and ask questions](https://flow.microsoft.com/blog/partner-program-six-new-services/) about this release.

### Release 2016-10-31 - General Availability

- **Pricing and licensing** - Now available in both Free and paid plans, as well as included in Office 365 and Dynamics 365.
- **Microsoft Flow Admin Center** - Enterprise-ready with the new Admin Center. In the Admin Center you can manage the environments inside the organization.
- **Data loss prevention policies** - Administrators can create data loss prevention policies to control the flow of data between services.
- **Android availability** - The Microsoft Flow phone app is now available for both iOS and Android. The app enables you to get notifications, monitor activity, and start flows with the tap of a button.
- **New designer experiences** - You can now search over the dynamic content passed from step to step, making it much quicker to reference the data you want to.

[Read more and ask questions](https://flow.microsoft.com/blog/announcing-ga/) about this release.


### Release 2016-10-26 ##

- **Button flows** - There are countless operations we wish we could trigger anytime and anywhere. Now, with Button Flows, you can get those done at just a click of a button, from your mobile device.
- **Announcing environments** - Environments are distinct spaces to store and manage your organization's flows. Environments are geo-located, which means that the flows, apps and business data that lives within an environment will be in the region where the environment is located.
- **Six new services** - Adding support for Bit.ly, Cognitive Services Text Analytics, Dynamics NAV, Dynamics 365 for Financials, Instapaper, and Pinterest.

[Read more and ask questions](https://flow.microsoft.com/blog/environments-for-makers/) about this release.

### Release 2016-10-16 ###

- **Custom APIs support more authentication types** - Custom APIs now support API Key authentication and can authenticate against any service that supports the full OAuth 2.0 specification.
- **Three new services supported** -  We've added support for Basecamp 3, Blogger and PagerDuty.
- **Designer improvements** - Improved performance, you can now update and repair your connections right from the "..." menu for every action, and we have added a new step called Terminate that you can use to end a flow's run.

[Read more and ask questions](https://flow.microsoft.com/blog/early-october-updates/) about this release.

### Release 2016-09-25 ###

Flow creation now available from your mobile phones. Browse our rich template gallery, navigate through our services list, or select a template category to drill into. [Read more and ask questions](https://flow.microsoft.com/blog/mobile-creation/) about this release.

### Release 2016-09-22 ###

- **Microsoft Graph People Picker** - A new Microsoft Graph people picker is integrated directly into the Microsoft Flow UI to help you choose the right contact or email address.
- **Microsoft Dynamics AX support** -  From inside your flows you can now take action on your Dynamics AX Online operations data, from creating new records to querying for data.
- **Two new services from partners** - Now use appFigures or Insightly from your flows.

[Read more and ask questions](https://flow.microsoft.com/blog/more-september-updates/) about this release.

### Release 2016-09-14 ###

- **Embedding in your web site or app** - Developers can now embed Microsoft Flow right into their apps or web sites to give their users a simple way to automate their personal or professional tasks.
- **Use a flow as an HTTP endpoint** -  Now you can use a flow itself as an HTTP API. There is a trigger called Request inside of flow, and you can choose to respond to the incoming request by adding a Response card.
- **Todoist support** - Todoist gives you perspective over all your projects, at work and at home.

[Read more and ask questions](https://flow.microsoft.com/blog/extend-web-site-application/) about this release.

### Release 2016-09-01 ###

Microsoft Flow now available for everyone - we initially opened up the preview to only email addresses provided by your work or school, like those used with Office 365 Business or Office 365 Enterprise. Today, we are announcing that the preview is officially available, free to use, for all users, no matter what email you may have. [Read more and ask questions](https://flow.microsoft.com/blog/available-for-everyone/) about this release.

### Release 2016-08-31 ###

- **Nested conditionals** - Now you can add a second (or third, etc…) condition inside of another.
- **Apply to each** -  An apply to each loop makes it possible to control the list that you repeat over.
- **Do-until** - A do-until loop allows you to repeat a step until a certain condition is met.
- **Filter arrays** - There is a single native filter step that can make sure that every item in the list matches some expression that you define.
- **Compose string variables** -  You can now compose a string variable.
- **Scopes** - Scopes are a simple way to group two or more actions together.

[Read more and ask questions](https://flow.microsoft.com/blog/build-advanced-flows/) about this release.

### Release 2016-08-27 ###

- **Comments on steps** - Comments make it easy to annotate each individual action with notes so that you can easily remember what the flow needs
- **Smartsheet support** -  This week we added support to connect to Smartsheet. Smartsheet is a service that makes it easy to collaborate on sheets in the cloud.
- **UI refinements when authoring flows** - We have made the flow name front-and-center and moved the save button to the top of the page for easy access.

[Read more and ask questions](https://flow.microsoft.com/blog/add-comments-smartsheet/) about this release.

### Release 2016-08-18 ###

You can now preview the new SharePoint Online modern lists experience that includes the Microsoft Flow integration. [Read more and ask questions](https://flow.microsoft.com/blog/microsoft-flow-integration-with-sharepoint-modern-lists-preview/) about this release.

### Release 2016-08-13 ###

- **Visual Studio Team Services** - With Flow, you can now connect VSTS to a wide variety of services such as O365 Email, Slack, Trello, and Wunderlist.
- **Enhancements to SharePoint** -  SharePoint lists support a range of data types from simple objects like Single lines of text and Date and Time to complex objects such as Person or Group, Lookup, and Choice.
- **Test O365 Outlook Connections** - Whenever you create a new O365 Outlook connection, we will now test it to make sure you’re ready to use it.
- **Boolean Control** - We’ve also added a boolean control to clarify which values you should enter for boolean input fields, such as Has Attachments in the When a new email arrives trigger.

[Read more and ask questions](https://flow.microsoft.com/blog/visual-studio-team-services-enhancements-to-sharepoint-and-o365-outlook-and-boolean-control/) about this release.

### Release 2016-08-08 ###

Public preview of the Microsoft Common Data Service integrated in Microsoft Flow. [Read more and ask questions](https://flow.microsoft.com/blog/flow-and-common-data-model/) about this release.

### Release 2016-08-05 ###

- **SharePoint On-Premises** - Just like with SharePoint Online, you can create flows around your SharePoint on-premises lists and doc libraries either using pre-defined templates or by building them from scratch.
- **Info-bubbles in the designer** - In order to elaborate on the capabilities of each trigger and action, we’ve added info-bubbles above each step of your flow.

[Read more and ask questions](https://flow.microsoft.com/blog/sharepoint-on-premises-and-info-bubbles-2/) about this release.

### Release 2016-07-15 ###

- **Four new services added** - Connect to Google Calendar, Google Tasks, YouTube and SparkPost.
- **Rename your actions** -  Now, you can tell these different actions apart by renaming them.
- **Delay for different periods of time** -  You can now select any number of Seconds, Minutes, Hours or Days.
- **Easier to use folder browser** - We've simplified the folder browser - now selecting on the left will choose that folder, and selecting on the right will open that folder so you can choose the subfolders inside.

[Read more and ask questions](https://flow.microsoft.com/blog/new-google-services-rename-more/) about this release.

### Release 2016-07-08 ###

On-premises connectivity for Microsoft Flow using the on-premises data gateway. This allows you to establish secured connections to SQL Server and integrate them with your flows. [Read more and ask questions](https://flow.microsoft.com/blog/on-premises-data-gateway/) about this release.

### Release 2016-07-02 ###

- **Google Sheets support** - In the past, we have had both the ability to use Excel, as well as Google Drive, but this week we are adding native Google Sheets support.
- **Get started more quickly from templates** - We have also made some optimizations to the way you can start from templates. Now, you can select what accounts you want to use for a template right inline on the template page.
- **No expiring authorization for SharePoint and Office 365** -  Now, Microsoft Flow will automatically renew your access to Azure Active Directory-based services, so all of your flows will continue working across password changes.

[Read more and ask questions](https://flow.microsoft.com/blog/more-june-updates/) about this release.

### Release 2016-06-20 ###

- **Introducing the new mobile app for Microsoft Flow** - Today, we are pleased to introduce another major piece of our offering: a mobile app now available for download on iOS (soon also on Android) that gives you the power to manage, track, and explore your automated workflows anytime and anywhere.  
- **Single sign-on** - We've implemented single sign-on that allows you to authenticate to Microsoft Flow with other Microsoft services like Office 365.

[Read more and ask questions](https://flow.microsoft.com/blog/welcome-to-flow-now-more-mobile/) about this release.

### Release 2016-06-18 ###

- **New Mail service** - You can now send emails directly from Microsoft Flow, without needing to connect to your personal or work email accounts inside of Microsoft Flow.
- **Notifications in the portal** - Now, you'll see Notifications at the top of the portal whenever something is broken with your flows.
- **All Activity in the portal** - You can now see activity across all of your flows by clicking the new Activity tab in the flow website.

[Read more and ask questions](https://flow.microsoft.com/blog/mail-and-all-activity/) about this release.

### Release 2016-05-27 ###

- **Browse templates by service** - There is a now a way to see all of the services that we support (without having to log in). From this page you can see a description of each of the services, and check out the templates that we have for that service.
- **Create and use your custom APIs** - Just like you can create custom APIs in PowerApps, you can also connect to your own APIs right at flow.microsoft.com:
- **Test your flows before finishing** - Whenever you save a flow you can now see the results of the flow run live in the page, if you perform the starting action.

[Read more and ask questions](https://flow.microsoft.com/blog/may-updates-to-microsoft-flow/) about this release.

### Release 2016-05-07 ###

Added two new services: Microsoft Project Online and Mandrill by Mailchimp. [Read more and ask questions](https://flow.microsoft.com/blog/announcing-microsoft-flow-webinars/) about this release.

### Release 2016-04-27 - Public Preview ###

If you used Logic flows as part of [Microsoft PowerApps](https://powerapps.microsoft.com), the Microsoft Flow Preview release offers several new features:

- You can now browse a gallery of dozens of templates and sort by Popularity, Name, or Date published.
- You can [publish your own templates](publish-a-template.md) into the gallery after you customize a flow.

- You can see the history for every check and run of your flow.
- When you save a flow, you can [watch it in action immediately](see-a-flow-run.md) by just performing the trigger action.
- We have a [new community](http://go.microsoft.com/fwlink/?LinkID=787467) for you to discuss Flow or [submit your ideas](https://go.microsoft.com/fwlink/?LinkID=787474).

## Next steps ##
If you have any issues not already covered in these release notes or in the [FAQ](frequently-asked-questions.md), please [join our community](http://go.microsoft.com/fwlink/?LinkID=787467) to ask questions, or [contact support](http://go.microsoft.com/fwlink/?LinkID=787479).
