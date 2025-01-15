---
title: Create a machine-credential mapping
description: Define a mapping between your machine(s) and your credential(s) that will be used in your desktop flow connection.
author: QuentinSele
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 01/16/2024
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a mapping between machine(s) and user account credential(s) (Preview)

This feature allows you to map user account credential(s) with your RPA machine(s).

## How does a mapping work 

A machine mapping is a type of credential that can be used in desktop flow connection to use specific credentials depending on the machine assigned.

1. Example 1: For a machine group that contains multiple machines, you can define for each machine which user account must be used to login
    > [!NOTE]
    > There is no restriction to map multiple credentials to the same machine.
    
2. Example 2: For a server, you can define all the user accounts that can execute your desktop flow.


## Availability 

Currently this feature isn't available for US Governement Clouds and China regions.

## Prerequisites

To create a mapping between machine(s) and credential(s), complete the following actions:
1. You need first to create your [credentials](create-cyberark-credential.md). These credentials must be defined as usable in **connection** to be selected in your mapping.

    > [!NOTE]
    > Currently, only CyberArk credentials can be used in a mapping.

2. You need to have machine(s) registered in this environment. If you haven't yet registered your machine, you can follow [these instructions](manage-machines.md).  
3. For CyberArk credentials, the machine(s) must be [configured with a CyberArk application](create-cyberark-credential.md).

## Create a machine mapping

1. From the left navigation, select **Credentials**.
1. Select **New** then select **Mapping credential per machine**.
1. In the wizard, define a credential name and a brief description, then select **Next**.
1. In the second step, first, define the default value of your mapping that will be used when an assigned machine has no mapped credential.
1. Then, for each machine, select one or several credentials to be used to login on machine.
   
    a. From the machine dropdown, select the machine you would like to apply the mapping to.

      > [!NOTE]
      > You can map a machine with multiple credentials.
      > Once a machine is mapped with credential(s), this machine cannot be selected for another mapping
      > You can map all your machines with credential(s) in the same machine mapping or define a mapping for each machine group.

    b. Then, from the credential dropdown, select the credential(s) you want to map to this machine

     > [!NOTE]
     > In the dropdown, you will only see credentials that are usable in **connections** and using CyberArk as a credential store

    :::image type="content" source="./media/manage-machines/Machine-credential.png" alt-text="Screenshot of create new credential store.":::

1. Once the mapping between a machine and credential(s) is done, you can see it in the list of mappings. The mapping can be edited (changing the credentials to be used) or deleted.
1. If you need to define a new mapping, select the button **Add new**
1. Once you completed the mappings, select **Save**

You can now use this mapping in a desktop flow connection. Instead of selecting a single credential, you can select this mapping.

During runtime (when the desktop flow is triggered), depending on which machine the flow has been assigned to run, the appropriate user account credential defined in your mapping will be used to connect on your machine.

## Limitations

1. During this preview phase, sharing of a mapping is not supported.
2. During this preview phase, machine mapping cannot use Azure Key Vault credentials.
3. Run detail page doesn't display the credential used in the credential mapping. You can retrieve the credential used in the table **flowsession** in the **credentials** field.



