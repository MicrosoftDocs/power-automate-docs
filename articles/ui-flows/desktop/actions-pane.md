---
title: 작업과 작업창 | Microsoft Docs
description: 이 섹션은 흐름 디자이너에서 작업과 작업창에 대한 설명을 다룹니다.
author: olegmelnykov
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# 작업과 작업창 구성

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

흐름 디자이너를 열면, 창 왼편에 있는 작업창에서 모든 작업 그룹을 볼 수 있습니다.

![작업창 보기](./media/actions-pane/actions-pane.png)

특정 작업을 빨리 검색하려면 검색창에 작업 이름을 입력하세요. 일부 일치하는 결과도 검색이 가능합니다.

![작업창에서 찾기](./media/actions-pane/actions-search.png)

## 작업공간에 작업 추가하기

흐름 개발을 시작하려면, 작업을 선택후 더블클릭하시거나 끌어서(드래그해서) 작업공간에 이동하셔도 됩니다.

![작업 추가하기](./media/adding-actions/add-action.png)

작업 매개변수를 가진 대화 박스가 열립니다. 작업은 변수 이름과 같은 특정 매개변수와 기본 값을 갖고 있습니다. 다른 작업들은 시작하기 위해 사용자의 입력을 요구합니다. **저장(Save)**을 선택하면, 작업이 작업공간에 나타납니다.

![작업 속성](./media/adding-actions/action-properties.png)

## Configuring an action

Power Automate Desktop actions consist of two main segments:
- The input parameters - They have the form of text fields, drop-down menus, and  check boxes
- The produced variables - Automatically created variables

![Τhe parameters and the produced variables of the Copy folder action.](./media/configuring-actions/actions-parameteres-outputs.PNG)

The input parameters determine the way an action functions and the data it gets as input. The data can be hardcoded values or variables. 

To use a variable as a parameter, select the icon on the field's right side and pick the respective variable.

Each field can accept specific data types, such as numbers, text, or lists. If a value or variable of a wrong data type is used as an input, the action will throw an error. 

![The icon to select an input parameter in the action.](./media/configuring-actions/actions-parameteres.PNG)

The produced variables hold the outcomes of the action for later use. All the produced variables are displayed on the bottom part of the action's properties. 

Each produced variable has a data type defined by its data. You can see the data type of a variable in the **Variables** pane. Find more information about data types in the [respective article](variable-data-types.md).

In case a produced variable isn't needed for later use, select the icon on the left side of it and pick **Not needed**. 

![The option to disable a produced variable in the action.](./media/configuring-actions/actions-outputs.PNG)

## Configuring action exceptions

When an action throws an exception, the flow stops its execution by default. To configure a custom error handling behavior for an action, select the **On error** option in its properties.

![The on On error option in the action.](./media/configuring-actions-exceptions/on-error-option-action.PNG)

The dialog box first option is the **Retry action if an error occurs** checkbox, which makes the flow execute the action one more time after two seconds.

![The Retry action checkbox in the action.](./media/configuring-actions-exceptions/retry-action.PNG)

To continue the flow's execution, even if the retry option fails, select the **Continue flow run** option. Through the ​drop-down list, you can:

- **Go to next action**: Executes the following action in order.
- **Repeat action**: Repeats the action until it runs successfully. 
- **Go to label**: Continues the execution from a point defined by a **Label** action.

![The continue flow run option in the action.](./media/configuring-actions-exceptions/continue-flow-run.PNG)

Power Automate Desktop offers two additional error handling options. Select the **New rule** button to:
- **Set variable**: Sets the desired value to a specified variable.
- **Run subflow**: Executes a specified subflow. 

![The New rule option in the action.](./media/configuring-actions-exceptions/new-rule.PNG)

If different errors require different error handling behaviors, select the **Advanced** option and configure each possible error separately. 

## Enabling and disabling actions

To disable or enable an action, right-click on it and select **Disable action** or **Enable Action**, respectively. 

![The disable action option.](./media/enabling-disabling-actions/enable-disable-action.png)

Disabling an action allows you to remove it from the flow without erasing it. This feature is commonly applied to test different versions of a flow and decide which one is the most efficient. 

When an action is disabled, all variables defined in it are hidden from the **Variables** pane. If the hidden variables are used in other actions, the flow may throw an error. 

In the example below, two actions threw an error because they contain variables defined in a disabled action.

![An example in which disabling an action hides some varibales.](./media/enabling-disabling-actions/enable-disable-action-variables.png)
