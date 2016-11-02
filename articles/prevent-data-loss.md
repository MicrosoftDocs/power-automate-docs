<properties
    pageTitle="Data loss prevention (DLP) policies for Microsoft Flow| Microsoft Flow"
    description="Introduction to data loss prevention policies for Microsoft Flow."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="10/26/2016"
   ms.author="deonhe"/>


# Data loss prevention (DLP) policies 

## What is a data loss prevention policy? 
An organization's data is critical to its success. Its data needs to be readily available for decision-making but it needs to be protected so that it isn't shared with audiences that should not have access to it. To protect this data, Microsoft Flow (Flow) provides you with the ability to create and enforce policies that define which consumer services/connectors specific business data can be shared with. These policies that define how data can be shared are referred to as data loss prevention (DLP) policies.

##	Why create a DLP policy?
You would create DLP policy to clearly define which consumer services business data may be shared with. For example, an organization that uses Flow may not want its business data that's stored in SharePoint to be automatically published to its Twitter feed. To prevent this, you can create a DLP policy that blocks SharePoint data from being used as the source for tweets.

## Benefits of a DLP policy
- Ensures that data is managed in a uniform manner across the organization  
- Prevents important business data from being accidentally published to services such as social media sites.   

## Managing DLP policies
**Prerequisites**  
In order to create, edit, or delete DLP policies, the following items are required: 
- Either environment admin or tenant admin permissions. You can learn more about permissions in the [environments topic](./environments-overview-admin.md).  
- A [Flow P2 license](./billing-questions.md).  

##	Create a DLP policy
**Prerequisites**  
In order to create a DLP policy, you must have permissions to at least one environment.  

Follow these steps to create a DLP policy that prevents data that is stored in your company’s SharePoint from being published to Twitter:  
1. While on the Data Policies tab, select the **New policy** link:  
![Sign in](./media/prevent-data-loss/create-policy-1.png)    
2. Enter the name of the DLP policy as *Secure Data Access for Contoso* in the **Data Policy Name** label at the top of the page that opens:   
![Sign in](./media/prevent-data-loss/create-policy-2.png)  
3. Select the [environment](./environments-overview-admin.md) on the **Applies to** tab.  
**Note:** As an environment admin, you can create policies that apply to only a single environment. As a tenant admin, you can create a policy that applies to all environments, one or more selected environments, or all environments except a selected set:  
![Sign in](./media/prevent-data-loss/create-policy-3.png)  
4. Select the **Data groups** tab:  
![Sign in](./media/prevent-data-loss/create-policy-4.png)  
5. Select the **+ Add** link located inside the **Business data only** group box:    
![Sign in](./media/prevent-data-loss/create-policy-5.png)  
6. Select the **SharePoint** and **Salesforce** services from the **Add services** page:  
![Sign in](./media/prevent-data-loss/create-policy-6.png)  
7. Select the **Add services** button to add the services that are allowed to share business data:    
![Sign in](./media/prevent-data-loss/create-policy-7.png)  
8. Select **Save Policy**:  
![Sign in](./media/prevent-data-loss/create-policy-8.png)  
9. After a few moments, your new DLP policy will be displayed in the data loss prevention policies list:  
![Sign in](./media/prevent-data-loss/create-policy-9.png)  
10. **Optional** Send an email or other communication to your team, alerting them that a new DLP policy is now available.

Congratulations, you have now created a DLP policy that allows app to share data between SharePoint and Saleforce and blocks the sharing of data with any other services.  

## Data sharing violations

Assuming your admin has created the DLP policy outlined above, if a user creates a flow that shares data between Salesforce (which is in the **business data only** data group) and Twitter (which is in the ** no business data allowed** data group), the user will be informed that the flow is **suspended** due a conflict with your organization's [data loss prevention]() policy.  
![create flow](./media/prevent-data-loss/10.png)  

In this case, you have a few choices:

1. If you feel there is a valid business reason to share business data between SharePoint and Twitter, consult your administrator and convince her that the DLP policy should be changed.  
2. Edit your flow to comply with the DLP policy.  
3. Leave the flow in the suspended state until you decide what to do with it.  
If you want to modify an existing flow, you can easily find all your flows on the My flows tab after you log into Flow.  

##	Find a DLP policy
### Admins
Admins can use the search feature from the Admin center to find specific DLP policies.  

**NOTE** Admins should publish all DLP policies so that users in the organization are aware of the policies prior to creating flows.

### Makers
If you don't have admin permissions and you wish to learn more about the DLP policies in your organization, contact your administrator. You can also learn more from the [maker environments topic](./environments-overview-maker.md)  

**NOTE** Only admins can edit or delete DLP policies.  

##	Edit a DLP policy
1. Launch the Admin center by browsing to https://admin.flow.microsoft.com.  
2. In the Admin center that launches, select the **Data polices** link on the left side.  
![Sign in](./media/prevent-data-loss/2.png)  
3. Search the list of existing DLP policies and select the edit button next to the policy you intend to edit:  
![Sign in](./media/prevent-data-loss/3.png)  
4. Make the changes you wish to make. You can modify the environment or the services in the data groups, for example.  
5. Select **Save Policy** to save your changes:  
![Sign in](./media/prevent-data-loss/create-policy-8.png)  

Your policy has now been updated. You can confirm that the changes have been made to your policy by finding it in the data loss prevention policies list and reviewing its properties.   

**Note** DLP policies created by tenant admins can be viewed by environment admins but cannot be edited by environment admins.  


##	Delete a DLP policy
1. Launch the Admin center by browsing to https://admin.flow.microsoft.com.  
2. In the Admin center that launches, select the **Data polices** link on the left side.  
![Sign in](./media/prevent-data-loss/2.png)  
3. Search the list of existing DLP policies and select the delete button next to the policy you intend to delete:  
![Sign in](./media/prevent-data-loss/3-delete.png)  
4. Confirm that you really want to delete the policy by selecting the **Delete** button:  
![Sign in](./media/prevent-data-loss/4.png)  

Your policy has now been deleted. You can confirm that the policy is no longer listed in the data loss prevention policies list by selecting the **Data Policies** link on the left and reviewing the list of policies.   

## DLP policy permissions
Only tenant and environment admins can create and modify DLP policies. Learn more about permissions in the [environments](./environments-overview-admin.md) topic.  

## Next steps
- [Learn more about environments](./environments-overview-admin.md)  
- [Learn more about Microsoft Flow](./getting-started.md)  
- [Learn more about the admin center](./introduction-to-the-admin-center.md)  