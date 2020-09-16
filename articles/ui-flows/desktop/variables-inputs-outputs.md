---
title: Input and output variables| Microsoft Docs
description: Input and output variables
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Input and output variables

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

**Power Automate Desktop** enables data exchange with the **Power Automate** platform through the input and output variables.

These variables are passed to and from **Power Automate Desktop**, allowing you to create sophisticated flows. Ιn **Power Automate**, any input variables will be added to the UI action as fields. More information about passing data between **Power Automate Desktop** and **Power Automate** can be found in the respective article (link to be added).

To create an input or output variable, select the **+**  button in the **Variables** pane and choose the respective option.

![The plus button in the Variables pane to create new input and output variables.](media\input-output-variables\create-input-output-variable.png)

  
In the **Add a new input variable** dialog, populate the following fields:
- **Variable type**: Defines if the variable is input or output.
- **Variable name**: The name of the variable in the flow.
- **Default value**: The default value when the flow runs from the Power Automate Desktop flow designer or the Power Automate Desktop console.
- **Data type**: The type of the variable, like number, text or datetime.
- **External name**: The name used outside the flow. The external name is the name that will appear in **Power Automate**.
- **Description**: A description of the variable. This field is mandatory and will appear in **Power Automate**.

![The Add a new input variable dialog](media\input-output-variables\Add-new-input-variable-window.png)

In case you've chosen to create an output variable, populate the following fields in the **Add a new output variable** dialog:
- **Variable type**: Defines if the variable is input or output.
- **Variable name**: The name of the variable in the flow.
- **External name**: The name used outside the flow. The external name is the name that will appear in **Power Automate**.
- **Description**: A description of the variable. This field is mandatory and will appear in **Power Automate**.

![The Add a new output variable dialog](media\input-output-variables\Add-new-output-variable-window.png)