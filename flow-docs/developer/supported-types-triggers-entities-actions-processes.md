---
title: "Supported types, triggers, entities, and actions for processes (Developer Guide for Dynamics 365 Customer Engagement) | MicrosoftDocs"
description: "The topic provides information about the supported types and entities for processes in Dynamics 365 Customer Engagement, supported triggers for workflows, entities that are supported for the CreateEntity activity, and supported actions for workflows. "
ms.custom: ""
ms.date: 10/31/2017
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: b2c14b32-e7da-4f9b-b7b1-659596c456ca
caps.latest.revision: 33
author: "KumarVivek"
ms.author: "kvivek"
manager: "amyla"
---
# Supported types, triggers, entities, and actions for processes

[!INCLUDE[](../includes/cc_applies_to_update_9_0_0.md)]

This topic provides information about the supported types and entities for processes in [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)] Customer Engagement, supported triggers for workflows, entities that are supported for the <xref:Microsoft.Xrm.Sdk.Workflow.Activities.CreateEntity> activity, and supported actions for workflows.  

<a name="bkmk_triggersWorkflows"></a>   
## Supported triggers for workflows  
 The following actions can be used to trigger a workflow automatically.  

|Request|Message|Trigger|  
|-------------|-------------|-------------|  
|<xref:Microsoft.Crm.Sdk.Messages.AssignRequest>|Assign|Record is assigned.|  
|<xref:Microsoft.Crm.Sdk.Messages.BookRequest>|Book|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.CancelContractRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.CancelSalesOrderRequest>|Cancel|Record status changes.|  
|<xref:Microsoft.Crm.Sdk.Messages.CloneContractRequest>|Clone|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.CloseIncidentRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.CloseQuoteRequest>|Close|Record status changes.|  
|<xref:Microsoft.Crm.Sdk.Messages.CompoundCreateRequest>|CompoundCreate|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.CompoundUpdateRequest>|CompoundUpdate|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.ConvertKitToProductRequest>|ConvertKitToProduct|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.ConvertQuoteToSalesOrderRequest>|ConvertProductToKit|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.ConvertQuoteToSalesOrderRequest>|ConvertQuoteToSalesOrder|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.ConvertSalesOrderToInvoiceRequest>|ConvertSalesOrderToInvoice|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.CopyCampaignRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.CopyMembersListRequest>|Copy|Record is created.|  
|<xref:Microsoft.Xrm.Sdk.Messages.CreateRequest>|Create|Record is created.|  
|<xref:Microsoft.Xrm.Sdk.Messages.DeleteRequest>|Delete|Record is deleted.|  
|<xref:Microsoft.Crm.Sdk.Messages.DeliverIncomingEmailRequest>|DeliverIncoming|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.DeliverPromoteEmailRequest>|DeliverPromote|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.FulfillSalesOrderRequest>|Fulfill|Record status changes.|  
|<xref:Microsoft.Crm.Sdk.Messages.GenerateInvoiceFromOpportunityRequest>|GenerateInvoiceFromOpportunity|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.GenerateQuoteFromOpportunityRequest>|GenerateQuoteFromOpportunity|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.GenerateSalesOrderFromOpportunityRequest>|GenerateSalesOrderFromOpportunity|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.GetInvoiceProductsFromOpportunityRequest>|GetInvoiceProductsFromOpportunity|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.GetQuoteProductsFromOpportunityRequest>|GetQuoteProductsFromOpportunity|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.GetSalesOrderProductsFromOpportunityRequest>|GetSalesOrderProductsFromOpportunity|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.LockInvoicePricingRequest>|LockInvoicePricing|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.LockSalesOrderPricingRequest>|LockSalesOrderPricing|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.LoseOpportunityRequest>|Lose|Record status changes.|  
|<xref:Microsoft.Crm.Sdk.Messages.MakeAvailableToOrganizationReportRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.MakeAvailableToOrganizationTemplateRequest>|MakeAvailableToOrganization|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.MakeUnavailableToOrganizationReportRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.MakeUnavailableToOrganizationTemplateRequest>|MakeUnavailableToOrganization|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.MergeRequest>|Merge|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.RemoveParentRequest>|RemoveParent|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.RenewContractRequest>|Renew|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.RescheduleRequest>|Reschedule|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.ReviseQuoteRequest>|Revise|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.SendBulkMailRequest>|SendBulkMail|Record status changes.|  
|<xref:Microsoft.Crm.Sdk.Messages.SendEmailFromTemplateRequest>|SendEmailFromTemplate|Record is created.|  
|<xref:Microsoft.Crm.Sdk.Messages.SendFaxRequest>|SendFax|Record status changes.|  
|<xref:Microsoft.Crm.Sdk.Messages.SetBusinessEquipmentRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.SetBusinessSystemUserRequest>|SetBusiness|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.SetParentBusinessUnitRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.SetParentSystemUserRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.SetParentTeamRequest>|SetParent|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|SetState|Record status changes.|  
|<xref:Microsoft.Crm.Sdk.Messages.UnlockInvoicePricingRequest>|UnlockInvoicePricing|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.UnlockSalesOrderPricingRequest>|UnlockSalesOrderPricing|Record is updated.|  
|<xref:Microsoft.Xrm.Sdk.Messages.UpdateRequest>|Update|Record is updated.|  
|<xref:Microsoft.Crm.Sdk.Messages.WinOpportunityRequest><br /><br /> <xref:Microsoft.Crm.Sdk.Messages.WinQuoteRequest>|Win|Record status changes.|  

<a name="bkmk_typesProcesses"></a>   
## Supported types for processes  
 This topic provides the supported types that you can use in your code for processes in[!INCLUDE[pn_dynamics_crm_online](../includes/pn-dynamics-crm-online.md)].  

### Microsoft .NET Framework 4.5.2  

|Namespace|Type name|  
|---------------|---------------|  
|System.Activities.Statements|AddToCollection\<T>|  
|System.Activities.Statements|Assign|  
|System.Activities.Statements|Catch\<TException>|  
|System.Activities.Statements|ClearCollection\<T>|  
|System.Activities.Statements|DoWhile|  
|System.Activities.Statements|ExistsInCollection\<T>|  
|System.Activities.Statements|ForEach\<T>|  
|System.Activities.Statements|If|  
|System.Activities.Statements|Interop|  
|System.Activities.Statements|InvokeMethod|  
|System.Activities.Statements|Persist|  
|System.Activities.Statements|RemoveFromCollection\<T>|  
|System.Activities.Statements|Rethrow|  
|System.Activities.Statements|Sequence|  
|System.Activities.Statements|Switch\<T>|  
|System.Activities.Statements|TerminateWorkflow|  
|System.Activities.Statements|Throw|  
|System.Activities.Statements|TryCatch|  
|System.Activities.Statements|While|  
|System.Activities.Statements|Receive|  
|System.Activities.Statements|Send|  
|System.ServiceModel.Activities.Presentation.Factories|SendAndReceiveReplyFactory|  

 For information about each type, see the following documentation for the respective namespaces:  

-   [System.Activities.Statements Namespace](https://msdn.microsoft.com/library/system.activities.statements.aspx)  

-   [System.ServiceModel.Activities Namespace](https://msdn.microsoft.com/library/system.servicemodel.activities.aspx)  

-   [System.ServiceModel.Activities.Presentation.Factories](https://msdn.microsoft.com/library/system.servicemodel.activities.presentation.factories.aspx)  

### [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)]  

|Namespace|Type name|  
|---------------|---------------|  
|<xref:Microsoft.Xrm.Sdk>|All types|  
|<xref:Microsoft.Xrm.Sdk.Workflow>|All types|  
|<xref:Microsoft.Xrm.Sdk.Workflow.Activities>|All types|  
|<xref:Microsoft.Crm.Sdk>|All types|  

<a name="bkmk_EntitiesProcess"></a>   
## Supported entities for processes  
 The following table lists the entities that can be used to trigger process execution or to create a record within a process by using the <xref:Microsoft.Xrm.Sdk.Workflow.Activities.CreateEntity> class. This list is determined by the <xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanTriggerWorkflow> property for each entity.  

|Entity name|Trigger a process|Used for CreateEntity|  
|-----------------|-----------------------|---------------------------|  
|Account|Yes|Yes|  
|Annotation|Yes|Yes|  
|Appointment|Yes|Yes|  
|BusinessUnit|Yes|No|  
|BusinessUnitNewsArticle|Yes|No|  
|Campaign|Yes|Yes|  
|CampaignActivity|Yes|Yes|  
|CampaignResponse|Yes|Yes|  
|Competitor|Yes|Yes|  
|Connection|Yes|Yes|  
|ConnectionRole|Yes|No|  
|ConstraintbasedGroup|Yes|No|  
|Contact|Yes|Yes|  
|Contract|Yes|Yes|  
|ContractDetail|Yes|No|  
|ContractTemplate|Yes|No|  
|CustomerAddress|Yes|No|  
|CustomerOpportunityRole|Yes|No|  
|CustomerRelationship|Yes|No|  
|Discount|Yes|No|  
|DiscountType|Yes|No|  
|Email|Yes|Yes|  
|Equipment|Yes|No|  
|Fax|Yes|Yes|  
|Goal|Yes|Yes|  
|Incident|Yes|Yes|  
|Invoice|Yes|Yes|  
|InvoiceDetail|Yes|No|  
|KbArticle|Yes|No|  
|KbArticleComment|Yes|No|  
|KbArticleTemplate|Yes|No|  
|Lead|Yes|Yes|  
|Letter|Yes|Yes|  
|List|Yes|Yes|  
|Metric|No|Yes|  
|MailMergeTemplate|Yes|No|  
|Opportunity|Yes|Yes|  
|OpportunityProduct|Yes|No|  
|PhoneCall|Yes|Yes|  
|PriceLevel|Yes|Yes|  
|ProcessSession|Yes|No|  
|Product|Yes|No|  
|ProductPriceLevel|Yes|No|  
|Queue|Yes|Yes|  
|QueueItem|No|Yes|  
|Quote|Yes|Yes|  
|QuoteDetail|Yes|No|  
|RecurringAppointmentMaster|Yes|Yes|  
|RollupField|No|Yes|  
|RelationshipRole|Yes|No|  
|Report|Yes|No|  
|SalesLiterature|Yes|Yes|  
|SalesLiteratureItem|Yes|No|  
|SalesOrder|Yes|Yes|  
|SalesOrderDetail|Yes|No|  
|Service|Yes|No|  
|ServiceAppointment|Yes|Yes|  
|SharePointDocumentLocation|Yes|Yes|  
|SharePointSite|Yes|Yes|  
|Site|Yes|Yes|  
|Subject|Yes|No|  
|SystemUser|Yes|Yes|  
|Task|Yes|Yes|  
|Team|Yes|No|  
|Template|Yes|No|  
|Territory|Yes|Yes|  
|TransactionCurrency|Yes|No|  

<a name="BKMK_Actions"></a>   
## Supported actions for processes  
 You can choose to perform following actions using workflows in [!INCLUDE[pn_dyn_365](../includes/pn-dyn-365.md)]. Use the `sdkmessage.workflowsdkstepenabled` attribute to find the list of supported actions available under a workflow step. You can use the following Web API query to retrieve the list of supported actions:  

```
[Organization URI]/api/data/v9.0/sdkmessages?$select=name&$filter=workflowsdkstepenabled%20eq%20true  
```  


|                Action                |                                                                                              Description                                                                                               |
|--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|              AddToQueue              |                                                                          <xref:Microsoft.Crm.Sdk.Messages.AddToQueueRequest>                                                                           |
|         AddUserToRecordTeam          |                                                                      <xref:Microsoft.Crm.Sdk.Messages.AddUserToRecordTeamRequest>                                                                      |
|           ApplyRoutingRule           |                                                                       <xref:Microsoft.Crm.Sdk.Messages.ApplyRoutingRuleRequest>                                                                        |
|         CalculateActualValue         |                                                                <xref:Microsoft.Crm.Sdk.Messages.CalculateActualValueOpportunityRequest>                                                                |
|           CloseOpportunity           |                                                                        <xref:Microsoft.Crm.Sdk.Messages.WinOpportunityRequest>                                                                         |
|   GetQuoteProductsFromOpportunity    |                                                                <xref:Microsoft.Crm.Sdk.Messages.GetQuoteProductsFromOpportunityRequest>                                                                |
| GetSalesOrderProductsFromOpportunity |                                                             <xref:Microsoft.Crm.Sdk.Messages.GetSalesOrderProductsFromOpportunityRequest>                                                              |
|          LockInvoicePricing          |                                                                      <xref:Microsoft.Crm.Sdk.Messages.LockInvoicePricingRequest>                                                                       |
|        LockSalesOrderPricing         |                                                                     <xref:Microsoft.Crm.Sdk.Messages.LockSalesOrderPricingRequest>                                                                     |
|             QualifyLead              |                                                                          <xref:Microsoft.Crm.Sdk.Messages.QualifyLeadRequest>                                                                          |
|       RemoveUserFromRecordTeam       |                                                                   <xref:Microsoft.Crm.Sdk.Messages.RemoveUserFromRecordTeamRequest>                                                                    |
|           ResolveIncident            |                                                                         <xref:Microsoft.Crm.Sdk.Messages.CloseIncidentRequest>                                                                         |
|             ResolveQuote             |                                                                          <xref:Microsoft.Crm.Sdk.Messages.CloseQuoteRequest>                                                                           |
|             ReviseQuote              |                                                                          <xref:Microsoft.Crm.Sdk.Messages.ReviseQuoteRequest>                                                                          |
|              SetProcess              |                                                                          <xref:Microsoft.Crm.Sdk.Messages.SetProcessRequest>                                                                           |
|           SetWordTemplate            | Custom action to create a word template. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Using Word templates in Dynamics 365](../admin/using-word-templates-dynamics-365.md) |
|         UnlockInvoicePricing         |                                                                     <xref:Microsoft.Crm.Sdk.Messages.UnlockInvoicePricingRequest>                                                                      |
|       UnlockSalesOrderPricing        |                                                                    <xref:Microsoft.Crm.Sdk.Messages.UnlockSalesOrderPricingRequest>                                                                    |

### See also  
 [Create your own actions](create-own-actions.md)   
 [Processes in Dynamics 365 (formerly Workflows)](automate-business-processes-customer-engagement.md)   
 [Custom workflow activities (workflow assemblies)](custom-workflow-activities-workflow-assemblies.md)   
 <xref:Microsoft.Xrm.Sdk.Workflow.Activities.CreateEntity>