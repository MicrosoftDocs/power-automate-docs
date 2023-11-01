---
title: Environment setup for Approvals Kit
description: Learn how to setup Approvals Kit environments to facilitate workshops.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Environment setup

This section of the Power Platform Business Approvals kit focuses on creating isolated development environments for learners. 

## Prerequisites

- Complete the previous section [User setup](./user-setup.md), which explains how to create the Microsoft Entra ID users, groups, and assigned licenses.

## Create developer environments

To create the developer environment, use these steps to automate setup:

1. Create a developer environment for the learner.

1. Set the required environment settings.

1. Import the Creator Kit.

1. Import dependent solutions and components.

1. Import the Contoso Coffee Application from the Power Platform App in a day instructor download.

1. Install and set up the Approvals Kit.

1. Perform post-install steps of publishing applications and enabling flows.

## Single user setup (Bash Script)

1. Copy start script

```bash
cp ~/powercat-business-approvals-kit/Workshop/src/scripts/start.sh .
```

1. Enable execution of setup

```bash
chmod +x ~/setup.sh
```

1. Setup user

```bash
~/setup.sh adelev
```

1. Monitor the background task

```bash
tail -100 nohup.out
```

## Multiple user setup (Bash Script)

1. Create a new text file with users names on each new line

```bash
cat << \EOF > ~/users.txt
AdeleV
AlexW
AllanD
BrianJ
CameronW
ChristieC
DebraB
DiegoS
GradyA
IrvinS
IsaiahL
JohannaL
JoniS
LeeG
LidiaH
LynneR
MeganB
MiriamG
NestorW
PattiF
PradeepG
EOF 
```

1. Start setup for users passing in the name of the file containing users to set up

```bash
~/setup.sh ~/users.txt
```

```bash
tail -100 nohup.out
```
