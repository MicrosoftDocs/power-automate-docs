---
title: Overview of SAP integration with Microsoft Power Platform (preview)
description: Learn how SAP integration with Microsoft Power Platform is improved with a prebuilt solution that works with enhanced connection features
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
ms.topic: overview
ms.date: 03/31/2023

---

# Overview of SAP integration with Power Platform

SAP ERP is a centralized system of record that facilitates the management of data and business processes between many departments within an organization. SAP ERP, developed by SAP SE, serves as the primary enterprise resource planning application for many businesses worldwide.

The improved version of SAP integration with Microsoft Power Platform is built on a broad set of new functionality designed to make it easier for organizations that rely on SAP to digitally transform and automate their business processes. The enhancements include:

- Updated SAP ERP connector
- Advanced SAP system connection support
- Updated on-premises data gateway
- New Azure Logic Apps functions
- Prebuilt SAP Integration solution

> [!IMPORTANT]
>
> - Effective December 2022, [SAP ERP connector capabilities](/connectors/saperp/) are generally available.
> - This prebuilt solution is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

## Advanced SAP system connection support

Many enterprise organizations need to use advanced connection parameters to govern user sessions. SAP integration with Power Platform now supports:

- Message servers that support load balancing between multiple SAP systems.
- Advanced SSO configurations.

Your SAP system's connection parameters are set up by following the established guidance:

- The JSON string template inside the solution's environment variable value field.
- The SAP property guidance table.

Learn more at [Create an environment variable with SAP connection parameters](env-variables-connection-refs.md).

## Updated on-premises data gateway

The on-premises data gateway acts as a bridge that provides secure data transfer between your on-premises SAP data and Microsoft's cloud services that include the Power Platform and Azure Logic Apps.

The most recent version of the on-premises data gateway handles two SAP integration requirements:

- Backward compatibility: Customers using the prior version of the SAP connector can still run their flows.
- Enhanced SSO: Kerberos delegation now ensures that SSO is a seamless experience between Power Apps, Power Automate, and SAP.

Learn more at [On-premises data gateway documentation](/data-integration/gateway/).

## New Logic Apps functions

Power Automate's expression language is based on Logic Apps functions. New functions have been added to enable more efficient processing of SAP data.

| Logic Apps function | Description |
|-|-|
| [isInt](/azure/logic-apps/workflow-definition-language-functions-reference#isint) | Returns true if a data attribute in an integer. This allows flow makers to determine if leading zeroes should be added to SAP data before sending to SAP APIs, or to remove from SAP data after retrieving records from SAP.   |
| [chunk](/azure/logic-apps/workflow-definition-language-functions-reference#chunk)   | Splits text areas, long string, or file contents into an array of fixed length strings for SAP's APIs.     |
| [sort](/azure/logic-apps/workflow-definition-language-functions-reference#sort)   | Sorts an array of objects by a key found in each object.  |
| [reverse](/azure/logic-apps/workflow-definition-language-functions-reference#reverse)  | Reverse-sorts an array of objects by a key found in each object. |
| [dateDifference](/azure/logic-apps/workflow-definition-language-functions-reference#datedifference)  | Determines the difference between two dates and returns in the time unit specified in the function. This is especially useful for customers who use time-based billing. |
| [isFloat](/azure/logic-apps/workflow-definition-language-functions-reference#isfloat)  | There's a unique edge case where some SAP APIs return currency strings in a user's localized format, which causes problems for mathematical operations. This function combined with float() removes the formatting so that mathematical operations are performed correctly. |
| [parseDateTime](/azure/logic-apps/workflow-definition-language-functions-reference#parsedatetime)   | Converts the string representation of a timestamp to a standard ISO 8601 format. The output of this function can be used reliably to do additional operations on the timestamp like the functions defined in date and time functions.    |
| [formatDateTime](/azure/logic-apps/workflow-definition-language-functions-reference#formatdatetime)  | A new optional parameter locale has been added to the existing **formatDateTime**. If not specified, the default locale is used.    |
| [nthIndexOf](/azure/logic-apps/workflow-definition-language-functions-reference#nthindexof)  | Allows finding the **nth** occurrence of a substring.    |
| [slice](/azure/logic-apps/workflow-definition-language-functions-reference#slice)  | Provides a new way to extract a substring. The existing function substring already allows such capability by providing start index and length. |

Learn more at [Azure Logic Apps documentation](/azure/logic-apps/).

## Updated SAP ERP connector

The SAP ERP connector for Power Automate and Power Apps allows you to invoke RFC and BAPI functions through the on-premises data gateway. The following improvements have been made to the SAP ERP connector:

- Incorporates advanced connections
- Loads large APIs
- Unifies Logic Apps and Power Automate connectors
- Special action for RFC_READ_TABLE with parsing
- Higher rate limits on the operations per second

Learn more at [SAP ERP connector](/connectors/saperp/).

## Prebuilt SAP Integration solution

:::image type="content" source="media/overview/sales-orders-page.png" alt-text="Power App display of sales order page that is part of the sales module.":::

The prebuilt SAP Integration solution is a set of Power Platform components that work together to communicate with SAP ECC or SAP S/4HANA systems. The prebuilt solution contains the following components:

- Power Automate flows
- Power Apps templates
- More components and new technical features

The Power Automate flows automate the business rules behind the scenes while the Power Apps simplify the view of SAP ERP's core business functions:

- Order to Cash
- Procure to Pay
- Record to Report
- Make to Stock and Make to Order

> [!IMPORTANT]
> In preview, the focus is on testing the Order to Cash and Procure to Pay business processes.

## What value will SAP integration add?

SAP integration with Power Platform will help your organization:

- Reduce errors
- Accelerate automation
- Gain intelligent insights
- Enhance employee productivity and collaboration

## Get started

1. Join the [Power Platform Community](https://powerusers.microsoft.com/) site. Ask questions, get helpful guidance, and share feedback about your organization's experience setting up and using the SAP Integration solution.

1. Assemble a team of IT administrators to [set up the SAP ERP integration with Power Platform](set-up-prepare.md).

1. Review and establish the necessary prerequisites before setting up SAP integration with Power Platform.

## Next steps

[Set up SAP integration with Power Platform (preview).](set-up-prepare.md)

### See also

- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Create an environment variable with SAP connection parameters (preview)](env-variables-connection-refs.md)
- [On-premises data gateway documentation](/data-integration/gateway/)
- [Azure Logic Apps documentation](/azure/logic-apps/)
