<properties
   pageTitle="Creating a Document Conversion Flow | Microsoft Flow"
   description="Creating a Document Conversion Flow in Microsoft Flow"
   services=""
   suite="flow"
   documentationCenter="na"
   authors="v-brbene"
   manager="anneta"
   editor=""
   tags=""
   featuredVideoId="os33pHQ9jSU"
   courseDuration="4m"/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="07/05/2017"
   ms.author="v-brbene"/>

# Converting and Storing Documents using Microsoft Flow 

In this video, you’ll see how Contoso Flooring uses Microsoft Flow to automatically convert documents to a standard format and then store them in SharePoint Online for safekeeping in the cloud. You'll create a flow that detects when a new file has been added to a OneDrive for Business folder, and then converts that file to PDF and stores it to a SharePoint Online folder. 

## Prerequisites

For this scenario, you’ll need an account with **Muhimbi**, a PDF conversion service. If you don’t have a Muhimbi account already, you can sign up for a free 30-day trial by visiting the [Muhimbi home page](https://www.muhimbi.com) and selecting the free trial for **PDF Convertor for SharePoint Online**. Follow the instructions on that page for deploying the app through your SharePoint Online site. 

## Create the source and target folders
First, you need to create the source and target folders on OneDrive for Business and SharePoint Online. In OneDrive for Business, under **Files**, create a folder named **Finished Documents**. In SharePoint Online, in **Shared Documents**, create a folder named **PDF – Finished files**. 

![](./media/learning-create-pdf/onedrive-folder.png)


![](./media/learning-create-pdf/sharepoint-folder.png)

## Create the flow

In Microsoft Flow, click **My Flows**, and click **Create from blank**. 

![](./media/learning-create-pdf/create-blank-flow.png)

Search for **OneDrive**, click **OneDrive for Business**, and then select the trigger **OneDrive for Business - When a file is created**. In **Folder**, click the folder icon and select the **Finished Documents** folder that you created in the previous step. 

![](./media/learning-create-pdf/onedrive-trigger.png)

Click **New step**, and then select **Add an action**. 

![](./media/learning-create-pdf/new-action.png)

Search for **Muhimbi**, click the **Muhimbi** connector, and select the action **Muhimbi PDF – Convert document**.

![](./media/learning-create-pdf/muhimbi-action.png)

**Note**: At this point, you may be prompted by Flow to authenticate to Muhimbi. You will need to register Muhimbi using your **SharePoint tenant ID** in order for Flow to use the Muhimbi service. To find your tenant ID, click the **Settings** wheel icon in SharePoint Online, select **Site settings**, and under **Site Collection Administration**, click **Site collection app permissions**. Your tenant ID is the identifier that follows the “**@**” symbol in any of the app listings. 

![](./media/learning-create-pdf/tenant-id.png)

In the **Convert document** action, set the following values:
- **Source file name**: From the dynamic content list, select **File name**.
- **Source file content**: From the dynamic content list, select **File content**.
- **Output format**: From the dropdown, select **PDF**.

![](./media/learning-create-pdf/muhimbi-configuration.png)

So far, you’ve configured your flow with the following steps: 

1. The flow is triggered whenever a new file is added to a specific OneDrive for Business folder 
1. The Muhimbi service converts that file to PDF. 

For the final step, you’ll add an action that will move the PDF document to a SharePoint Online folder where the team can access it.  

Click **New step**, and then click **Add an action**.  Search for **SharePoint**, and select the **SharePoint – Create file** action. 

![](./media/learning-create-pdf/sharepoint-create-file.png)

In the **Create file** action, set the following values:
- **Site address**: The URL of your SharePoint site.  
- **Folder path**: Click the folder icon and navigate to the **PDF - Finished files** folder.
- **File name**: From the dynamic content list for **Convert document**, select **Base file name**, then add “**.pdf**” so it will be saved in SharePoint with the file extension. 
- **File content**: From the dynamic content list for **Convert document**, select **Processed file content**.

Click **Create flow** at the top of the page to save your work.


![](./media/learning-create-pdf/sharepoint-configure-file.png)

## Test the flow

  To test the flow, add a new file to your **Finished Documents** folder in OneDrive for Business. In Flow, click **My flows**, and then click the new flow to view the run history. By default, the flow is configured  to run every five minutes. After the flow runs, verify that the file was converted to PDF and saved to the SharePoint **PDF – Finished files** folder. 

![](./media/learning-create-pdf/test-the-flow.png)