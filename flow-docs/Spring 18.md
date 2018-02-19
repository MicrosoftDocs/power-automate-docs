## Flow ##
Microsoft is modernizing business processes across productivity, CRM and ERP applications – and it is now easier for every business (and business function) to transform how people work. Microsoft Flow, Microsoft’s workflow and business process management platform, is core to the success of this mission. It is the connective glue that’s used by end-users and app developers alike for digital transformation, no matter what application they are using. Flow, along with PowerApps and Power BI, makes up the Business application platform – which, with millions of active users, enjoys broad usage in enterprises worldwide. With the Spring '18 release, Flow has taken a huge step forward in terms of business process capacities and rich integration with existing business data and applications.

- **Failure Emails with Guided Repair** - If a flow fails, you can now get detailed repair recommendations right to your inbox. These steps will link you directly to what you need to fix the most common failures, step-by-step.
- **GDPR Compliance** - To support the EU's General Data Protection Regulation (GDPR), administrators can now submit Export or Delete requests for Flow users.
- **Test Flows with Sample Data** - Creating a flows may require some trial and error during the development process. You can now test out your flows as you are building them out, to give you the confidence that your flow will run as expected.
- **Return Data to PowerApps from Flows** - Build flows that can be called from a PowerApp and return back data to the PowerApp. This means you can leverage the easy drag-and-drop Flow designer to build any logic you want for your apps.
- **Common Data Service Upgrade Support** - Upgrade your flows to use the latest version of the Common Data Service. This new version has richer server-side capabilities including Row Level Security and Business Rules.
- **Access Modern Approvals in CDS** - Your modern Approvals data in Flow is built on the latest version of the Common Data Service. This means you can build flows that trigger on or read the status of the Approvals you send or receive.
- **Request for Sign-off Flow Built in to SharePoint** - When you select a File or Item in SharePoint you will see a new Request for Sign-off flow. This Flow doesn't require any configuration or set up and sends a Sign-off request in just one click.
- **Customize SharePoint Content Approvals via Flow** - When you enable Content Approvals for modern pages in SharePoint an approval flow will automatically be created. No configuration is required, but you can use the Flow designer to tailor the approval process to your business needs.
- **Flows "Owned by" SharePoint Lists and Libraries** - Flows that work with SharePoint Lists (and Libraries) can now be “Owned by” those lists, meaning that instead of being managed by individuals, they can be managed the owners of the list itself.
- **Build and Run Flows inside Excel** - With the new Flow button the data tab in the ribbon, you can create and trigger automation based on Flow from inside Excel. This automation can be used for data processing, copying or importing data.
- **Quick Access to Help and Support** - Open support tickets right in context of an issue they are encountering in Flow, such as when your workflow is failing. Microsoft support engineers can be automatically be provided with details of the failure for quicker resolution.
- **Create a Flow for ToDo in Outlook Web App** - If you are @mentioned in Outlook Web App you will see a shortcut to create a Flow. This Flow will automatically create tasks for you in Microsoft ToDo based on the content of the email.
- **Create Business Process Flows** - A business process flow is a new type of stateful, human-interactive flow, based on the Common Data Service. Use these new flows to define a set of steps for people to follow. They can also go both forward and backward as needed. 
- **Business Process Flow Entity Customization** - Business process flow entities can appear in the system so that entity record data can be made available in grids, views, charts, and dashboards.
- **Add Actions to Business Process Flows** - You can add an explicit button to a business process flow. This button can trigger any action or workflow you define to run processes on your data.

### Spring '18 Quick Summary ###

| April '18 | General Availability |
| --- | --- |
|   | Failure Emails with Guided Repair |
|   | GDPR Compliance |
|   | Test Flows with Sample Data |
|   |  [Return Data to PowerApps from Flows](#return-data-to-powerapps-from-flows) | 
|   | Common Data Service Upgrade Support |
|   | Access Modern Approvals in CDS |
|   | Request for Sign-off Flow Built in to SharePoint |
|   | Customize SharePoint Content Approvals via Flow |
|   | Flows "Owned by" SharePoint Lists and Libraries |
|   | Build and Run Flows inside Excel |
|   | Quick Access to Help and Support |
|   | Create a Flow for ToDo in Outlook Web App |
|   | Create Business Process Flows |
|   |  [Business Process Flow Entity Customization](#business-process-flow-entity-customization) | 
|   |  [Add Actions to Business Process Flows](#add-actions-to-business-process-flows) | 

### Return Data to PowerApps from Flows ###
You can use Microsoft Flow to create logic that performs one or more tasks when an event occurs in an app. For example, configure a button so that, when a user selects it, an item is created in a SharePoint list, an email or meeting request is sent, a file is added to the cloud, or all of these. In addition, you can use a flow to return data to the PowerApps. For example, configure a flow that retrieves data from a web endpoint or a SQL server, and then processes that data using Flow's built-in actions. You can configure any control in the app to start the flow, which continues to run even if you close PowerApps.

To set up a flow that you call from a PowerApp and return data to, first set up your flow using the **PowerApps** trigger.

![Respond to PowerApps.](https://procsi.blob.core.windows.net/blog-images/RespondToPowerApps.png)

Once you have built your flow and collected all the data you need, add the **Respond to PowerApps** action. Inside this action, you can define the output fields that you want to provide to the PowerApp. You can name each field, and, select **Add Dynamic Content** to pass in data from the actions in the Flow.

Finally, you will add your flow to the PowerApp. Select the control that you want to run your flow from, and on the **Action** tab in the ribbon select **Flow**. You'll see a list of all the Flows you have defined and can select the one you just created. Selecting this flow will add it to the formula bar, and you can both pass parameters to the flow, as well as use a formula to use any of the data returned by the flow.

![Call the flow from your app.](https://procsi.blob.core.windows.net/blog-images/UseFlowInPowerApps.png)

### Business Process Flow Entity Customization ###
With business processes flows available as an entity in the Common Data Service, you can use advanced finds, views, charts, and dashboards sourced from business process flow data for a given entity, such as a lead or opportunity. Makers can create custom business process flow grids, views, charts, and dashboards similar to those created with any other entity.

Business process flows, such as **Lead To Opportunity Sales Process**, appear as a customizable entity in Solution Explorer.

![Solution Explorer with lead-to-opportunity process entity](https://github.com/MicrosoftDocs/dynamics-365-customer-engagement-pr/raw/JimHoltzNov6/ce/customize/media/bpf-lead-solution-explorer.png)

Several default views are available that you can view as a chart, such as the **Active Opportunity Sales Process** view. 

![Active Opportunity Sales Process view](https://github.com/MicrosoftDocs/dynamics-365-customer-engagement-pr/raw/JimHoltzNov6/ce/customize/media/bpf-default-view.png)

Currently, you can’t create custom forms for entities based on a business process flow.

### Add Actions to Business Process Flows ###
Suppose that, as part of the opportunity qualification process, the Contoso organization requires all opportunities to be reviewed by a designated reviewer. Subsequently, the Contoso organization created an action that: 

- Creates a task record that is assigned to the opportunity reviewer. 
- Appends “Ready for review” to the opportunity topic. 

Additionally, Contoso needs to be able to run these actions on demand. To integrate these tasks into the opportunity qualification process, the actions must appear on the opportunity business process flow. To enable this functionality, select **As a Business Process Flow action step**.

![Available to run as a business process flow.](https://review.docs.microsoft.com/en-us/dynamics365/customer-engagement/customize/media/action-available-to-run.png)

Next, the Action Step is added to Contoso’s opportunity business process flow. Then the process flow is validated and updated.

![Action added to the opportunity Business Process Flow.](https://review.docs.microsoft.com/en-us/dynamics365/customer-engagement/customize/media/add-action-to-bpf.png)

Now, members of Contoso’s salesforce can kick-off the action from the **Opportunity Qualify** business process step, on demand, by selecting **Execute**.

![Execute action.](https://review.docs.microsoft.com/en-us/dynamics365/customer-engagement/customize/media/action-execute.png)

 - To be able to execute an action or workflow on demand, the business process flow must include an Action Step. If the Action Step runs a workflow, the workflow must be configured to run on demand.
 - The entity associated with the action or workflow must be the same as the entity associated with the business process flow.
