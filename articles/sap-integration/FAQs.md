---
title: SAP integration with Microsoft Power Platform FAQ
description: Get answers to frequently asked questions about SAP integration with Microsoft Power Platform.
author: jongilman88
contributors:
  - EllenWehrle
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.author: jongilman
ms.reviewer: ellenwehrle
ms.subservice: power-automate-connections
ms.topic: FAQ
ms.date: 04/12/2023
ms.custom: bap-template
---

# SAP integration with Microsoft Power Platform FAQ

This article provides answers to some of the most frequently asked questions (FAQs) about SAP integration with Microsoft Power Platform.

## Versions and licensing

### What versions of SAP does the SAP ERP connector support?

The [SAP ERP connector](/connectors/saperp/) supports all SAP versions from R/3 (early 1990s) forward, including SAP ECC and SAP S4/HANA.

### What licensing is required to integrate SAP with Power Platform?

At a minimum, you need the following for each user:

- A Power Apps Premium license
- An SAP indirect named user license

If you already have SAP direct named user licenses, you can use them with Power Apps. It's worth noting, however, that SAP indirect named user licenses cost less than direct named user licenses.

### Will this work with other SAP core products like BW, SRM, and CRM?

Power Platform's SAP ERP connector works with any SAP product that runs on the NetWeaver stack.

### How can we connect to SAP's other products that have come through acquisition?

For products such as SuccessFactors, Ariba, Concur, and any other SAP product that doesn't run on the NetWeaver stack, you can use our custom REST and SOAP connectors.

### If we integrate Power Platform with SAP ECC and then upgrade to S4/HANA, will our integrations break?

We've had hundreds of customers upgrade from SAP ECC to S4/HANA without any issues. Some of the core data models do change in S4/HANA (customer, vendor, financial posting), but we've accounted for data model changes in our prebuilt Power Automate flows. Additionally, SAP ensures their published APIs are carried over to new versions.

## Data and integration

### How does Power Platform access SAP data?

The SAP ERP connector uses the message server to invoke APIs that create, read, and update SAP data. This traffic typically flows over port 33XX for single application servers or port 39XX for load-balanced connections, where XX is the system number of the SAP instance.

### Can Power Platform consume OData services in SAP?

The Open Data Protocol (OData) connector isn't available to the public yet. You can also create a custom connector in Power Automate to consume [OData services](/odata/).

### Can Power Platform access views in S4/HANA?

The SAP ERP connector can read Core Data Services views using the action _Read SAP Table with Parsing_.

### Can Power Platform access custom SAP tables (Z-tables)?

The SAP ERP connector can read custom tables using the action _Read SAP Table with Parsing_.

### What if SAP doesn't provide an API for a data object?

In this case, there are several options:

- [Intermediate Document (IDoc)](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/7b24a64d9d0941bda1afa753263d9e39/3854b753128eb44ce10000000a174cb4.html): We provide a generic API that can synchronously invoke an IDoc for any object type.
- [Batch input](https://help.sap.com/doc/saphelp_snc70/7.0/en-US/69/c250274ba111d189750000e8322d00/content.htm?no_cache=true#:~:text=Batch%20input%20is%20one%20of%20the%20primary%20ways,legacy%20system%20into%20a%20newly%20installed%20SAP%20system.): We have a generic API that can synchronously process a batch input recording.
- [Legacy System Migration Workbench (LSMW)](https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/4d/afeb6ad8f66d57e10000000a42189e/content.htm?no_cache=true): Power Automate can create a file that can be dropped on the SAP application server and processed in the transaction LSMW.
- [Custom Function Module](https://help.sap.com/doc/saphelp_nw75/7.5.5/en-US/c8/19764143b111d1896f0000e8322d00/content.htm?no_cache=true): A custom remote-enabled function module can be created in SAP and called by a Power Automate cloud flow.

### Will Power Platform affect the performance of our SAP system?

The SAP ERP connector runs on SAP's API layer, which typically has better system performance than running the same activity in the SAP GUI. As more users transition off the SAP GUI and to an external user interface like a canvas app, CPU consumption on the SAP servers drops significantly.

### Are there any performance bottlenecks in the SAP ERP connector?

Typically the bottleneck is in the SAP system itself. We can configure the number of concurrent API threads to match the session limits on your SAP servers. We can also arrange [clusters](/data-integration/gateway/service-gateway-install#add-another-gateway-to-create-a-cluster) for the on-premises data gateway.

### Can Power Automate flows be used by other applications like Dynamics 365 CRM?

The Power Automate flows that integrate with SAP can be triggered by your own custom applications or any software capable of REST integration.

### Will the SAP ERP connector work with non-UNICODE systems?

Yes.

### How are errors in SAP handled?

Errors are displayed to users in a canvas app using Power Apps in a similar fashion to SAP—red text with the details of the error that occurred. The canvas apps users can correct errors if they're data-related and resubmit their work to SAP.

### How are file attachments handled?

Power Automate can attach files to objects in SAP using [Generic Object Services (GOS)](https://help.sap.com/doc/saphelp_scm700_ehp01/7.0.1/en-US/1e/31a40415b711d4a39200a0c943858e/frameset.htm) and using [ArchiveLink](https://help.sap.com/docs/ABAP_PLATFORM_NEW/345ce26100fc4ba49fd3dc9b424495c4/4ce65a717e173ec6e10000000a42189b.html?q=ArchiveLink), based on your requirements.

## Security

### How is authentication performed?

Power Platform supports two of the three authentication methods for SAP:

1. Username/Password: A canvas app prompts a user for their SAP username and password, which are sent to SAP.
1. SSO (Kerberos): The On-premises Data Gateway requests a Kerberos ticket on behalf of the Power Apps user and this ticket is sent to SAP.
1. SSO (SAML/X.509): **NOT CURRENTLY SUPPORTED**. We plan to support SAML in the future. However, SAP can support both X.509 and Kerberos authentication on the same SAP instance.

### How do we make sure Power Apps users can't do things they can't do in SAP?

SAP's published APIs perform the same security checks that are performed in the SAP GUI. Also, Power Automate flows can be configured to query user authorization objects so that apps, fields, and buttons are conditionally hidden or revealed to match the user experience in SAP.

### How do we ensure traffic between Power Platform and SAP is encrypted?

We recommend using SAP's [Secure Network Communication (SNC)](https://help.sap.com/doc/saphelp_nw74/7.4.16/en-us/e6/56f466e99a11d1a5b00000e835363f/content.htm?no_cache=true), which is available through a connection setting when [configuring authentication](/power-automate/sap-integration/set-up-prepare#configure-authentication).

## Customization

### How does Power Platform handle custom fields in SAP?

The answer depends on where the custom fields reside in SAP:

- Appended to SAP-standard table: The fields are populated using Business Application Programming Interface (BAPI) Extension Structures in the Power Automate flows.
- Custom SAP table: The function modules updating these tables need to be remote-enabled to allow our SAP connector to invoke them.

### How easy is it to add custom fields to canvas apps?

Fields in canvas apps can easily be inserted and pasted in our WYSIWYG (What You See Is What You Get) editor.

### Can Power Platform call custom function modules?

If a function module is remote-enabled, our SAP connector can invoke it. However, SAP doesn't respond to a support ticket if your custom function module isn't working correctly, since it's your own code.

### How can Power Platform handle custom processes that we built in SAP because we had no other option?

Your custom database tables can be read using the _Read SAP Table with Parsing_ action for all read operations. For _create_ and _update_ operations, you need to remote-enable the custom function modules you use to maintain the data. After the function modules are remote-enabled, the SAP ERP connector can call them.

## Implementation and support

### Where can I get started?

Start with the documentation: [SAP integration](/power-automate/sap-integration/overview).

### Where can I get a demo SAP environment to test the SAP integration solutions?

You have a couple of options:

- [SAP Cloud Appliance Library](https://aka.ms/sap/cal). [Create your own SAP demo instances on Azure](/azure/sap/workloads/cal-s4h).
- [SandboxSAP](https://idesremote.com/). Be sure to select the add-on for RFCs/BAPIs to allow Power Automate to connect to their instances. Microsoft isn't affiliated with IDES Remote. Use these services at your own risk.

### Where do I turn if I get stuck with SAP integration with Power Platform?

Nearly all the issues you may encounter are due to overlooking a step or a prerequisite in the [SAP integration documentation](/power-automate/sap-integration/overview). If you're still having issues, you have a couple of options:

- Ask a question in our [Power Platform Community forum](https://powerusers.microsoft.com/).
- Send an email to [sap_ecc_powerapps@service.microsoft.com](mailto://sap_ecc_powerapps@service.microsoft.com).

### Do we need to install anything on our SAP servers to get Power Platform to work with SAP?

No.

### Do we need to install anything on our users' PCs for SAP integration with Power Platform?

No local installation is required. All canvas apps are accessed through a web browser.

### Is there anything we need to provision to set up SAP integration with Power Platform?

Provision a Windows virtual machine (VM) with at least 8 GB of RAM for the on-premises data gateway. The gateway acts as a proxy server to listen for requests from your Power Platform tenant and relay them to SAP. One Windows machine is sufficient for testing. You should deploy a cluster of Windows VMs to production to avoid single points of failure.

### How quickly can a canvas app on SAP be up and running?

Our prebuilt canvas apps can interact with your SAP system immediately. However, you'll likely want to modify our solution templates by adding your custom fields or SAP-standard fields that aren't included in our templates. Typically, you can have something ready for your business users to test in just a few weeks.

### Can we build mobile canvas apps on top of SAP?

You can build canvas apps using Power Apps for mobile devices. We also allow native canvas apps to be built on Power Platform as well.

### Can Fiori Apps coexist with Power Apps?

Fiori Apps can be embedded in canvas app menus and canvas apps can be embedded in the Fiori launchpad.
