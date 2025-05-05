---
title: Active Directory actions reference
description: See all the available Active Directory actions.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2022
ms.author: matp
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Active Directory actions

Active Directory actions require a connection to an Active Directory server. Establish the connection using the **Connect to server** action and an LDAP path. The LDAP path specifies the domain controllers and should have the following format:

```LDAP path
LDAP://DC=contoso,DC=demo
```

If you work with groups, objects, or users, you need to specify also their location. The **Location** field specifies the container and the domain controller, and should have the following format:  

```LDAP path
CN=Users,DC=contoso,DC=demo
```

After getting all the distinguished names using the **dsquery user** command, enter the distinguished name in the following format. For this example, the username is **nvarga**.  

```LDAP path
CN=nvarga,CN=Users,DC=contoso,DC=demo
```

If the container name contains a comma, you should enclose the name within double quotes. For example **CN=Varga, Norbert** should be:

```LDAP path
CN="Varga, Norbert",DC=contoso,DC=com
```

## <a name="creategroup"></a> Create group

Creates a group in the Active Directory.
> [!IMPORTANT]
> Make sure you that Power Automate for desktop is operating with elevated rights when executing a flow containing the **Create a group** action

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Group name|No|[Text value](../variable-data-types.md#text-value)||The name of the newly created group|
|Location|Yes|[Text value](../variable-data-types.md#text-value)||The location that the group will be created in|
|Description|Yes|[Text value](../variable-data-types.md#text-value)||The description for the group|
|Group scope|N/A|Local, Global, Universal|Global|The scope of the group in the Active Directory|
|Group type|N/A|Security, Distribution|Security|The type of the group|

### Variables produced

This action doesn't produce any variables.

### <a name="creategroup_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Active Directory error|General Active Directory error|

## <a name="getgroupinfo"></a> Get group info

Gets information about a group from the Active Directory server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|GroupInfo|[Group info](../variable-data-types.md#active-directory)|The group's info|

### <a name="getgroupinfo_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

## <a name="getgroupmembers"></a> Get group members

Gets the members of a group in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|GroupMembers|[List](../variable-data-types.md#list) of [Group members](../variable-data-types.md#active-directory)|The variable that holds the members of the group|

### <a name="getgroupmembers_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

## <a name="modifygroupaction"></a> Modify group

Modifies a group in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|
|Operation|N/A|Rename group, Delete group, Add user, Remove user|Rename group|Select the operation to perform|
|New name|No|[Text value](../variable-data-types.md#text-value)||The new name for the group|
|User distinguished name|No|[Text value](../variable-data-types.md#text-value)||Specify the user's distinguished name|

### Variables produced

This action doesn't produce any variables.

### <a name="modifygroupaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Active Directory error|General Active Directory error|

### <a name="modifygroupaction_example"></a> Example

The following example uses the **Modify group** action to add the user **nvarga** to the **RPATest** Active Directory group.  

:::image type="content" source="media\activedirectory\modify-ad-group-properties-exercise.png" alt-text="Screenshot of the Group action.":::

## <a name="createobject"></a> Create object

Creates an object in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Location|Yes|[Text value](../variable-data-types.md#text-value)||The location that the group will be created in|
|Object type|N/A|Computer, Organizational unit|Computer|The type of the object|
|Object name|No|[Text value](../variable-data-types.md#text-value)||The name of the newly created object|

### Variables produced

This action doesn't produce any variables.

### <a name="createobject_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Invalid attribute syntax|Indicates that a given attribute is invalid|
|Active Directory error|General Active Directory error|

## <a name="deleteobject"></a> Delete object

Deletes an object in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|

### Variables produced

This action doesn't produce any variables.

### <a name="deleteobject_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

## <a name="moveobject"></a> Move object

Moves an object in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|
|Move to location|No|[Text value](../variable-data-types.md#text-value)||The location for the object to be moved to|

### Variables produced

This action doesn't produce any variables.

### <a name="moveobject_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|
|Location can't be empty|Indicates that an Active Directory object location is empty|

## <a name="renameobject"></a> Rename object

Renames an object in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|
|New name|No|[Text value](../variable-data-types.md#text-value)||Type the new name for the group|

### Variables produced

This action doesn't produce any variables.

### <a name="renameobject_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Active Directory error|General Active Directory error|

## <a name="createuser"></a> Create user

Creates a user in the Active Directory.
> [!IMPORTANT]
> Make sure you that Power Automate for desktop is operating with elevated rights when executing a flow containing the **Create user** action

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Location|Yes|[Text value](../variable-data-types.md#text-value)||The location that the group will be created in|
|First name|No|[Text value](../variable-data-types.md#text-value)||The first name of the user|
|Initials|Yes|[Text value](../variable-data-types.md#text-value)||The initials of the user|
|Last name|Yes|[Text value](../variable-data-types.md#text-value)||The last name of the user|
|Username|No|[Text value](../variable-data-types.md#text-value)||The username of the user|
|Password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the user|
|Password never expires|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the password of the user will expire|
|Disabled account|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the account will be disabled|

### Variables produced

This action doesn't produce any variables.

### <a name="createuser_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Couldn't set or update password|Indicates a problem setting or updating the user's password|
|Active Directory error|General Active Directory error|

### <a name="createuser_example"></a> Example  

The following example creates a new user. The user's actual name is **Norbert Varga**, and the username is **nvarga**. The presented configurations create the user in the **Users** container and specify the extra controllers **contoso** and **demo**.
  
:::image type="content" source="media\activedirectory\create-ad-user-properties-exercise.png" alt-text="Screenshot of the Create User action.":::

## <a name="getuserinfo"></a> Get user info

Gets a user's information in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|UserInfo|[User info](../variable-data-types.md#active-directory)|The user's info|

### <a name="getuserinfo_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

## <a name="modifyuseraction"></a> Modify user

Modify a user in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|
|Operation|N/A|Enable/disable user, Rename user, Delete user, Reset password|Enable/disable user|Select the operation to be performed|
|Enable user|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Enable or disable the user|
|New name|No|[Text value](../variable-data-types.md#text-value)||Type the new name for the group|
|New password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||Type the new password for the group|

### Variables produced

This action doesn't produce any variables.

### <a name="modifyuseraction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Invalid attribute syntax|Indicates that a given attribute is invalid|
|Active Directory error|General Active Directory error|
|Couldn't set or update password|Indicates a problem setting or updating the user's password|

## <a name="unlockuser"></a> Unlock user

Unlocks an Active Directory user.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|

### Variables produced

This action doesn't produce any variables.

### <a name="unlockuser_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

## <a name="updateuserinfo"></a> Update user info

Updates a user's information in the Active Directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|
|Distinguished name|No|[Text value](../variable-data-types.md#text-value)||The distinguished name of the Active Directory entry|
|Display name|Yes|[Text value](../variable-data-types.md#text-value)||The display name of the user|
|First name|Yes|[Text value](../variable-data-types.md#text-value)||The first name of the user|
|Initials|Yes|[Text value](../variable-data-types.md#text-value)||The initials of the user|
|Last name|Yes|[Text value](../variable-data-types.md#text-value)||The last name of the user|
|Title|Yes|[Text value](../variable-data-types.md#text-value)||The title of the user|
|The email of the user|Yes|[Text value](../variable-data-types.md#text-value)||The email of the user|
|The company of the user|Yes|[Text value](../variable-data-types.md#text-value)||The company of the user|
|Telephone number|Yes|[Text value](../variable-data-types.md#text-value)||The telephone number of the user|
|Extension|Yes|[Text value](../variable-data-types.md#text-value)||The extension of the user|
|City|Yes|[Text value](../variable-data-types.md#text-value)||The city of the user|
|Postal code|Yes|[Text value](../variable-data-types.md#text-value)||The postal code of the user|
|State|Yes|[Text value](../variable-data-types.md#text-value)||The state of the user|
|Country|N/A|Afghanistan, Åland Islands, Albania, Algeria, American Samoa, Andorra, Angola, Anguilla, Antarctica, Antigua and Barbuda, Argentina, Armenia, Aruba, Australia, Austria, Azerbaijan, Bahamas, Bahrain, Bangladesh, Barbados, Belarus, Belgium, Belize, Benin, Bermuda, Bhutan, State of Bolivia Plurinational, Bonaire, Bosnia and Herzegovina, Botswana, Bouvet Island, Brazil, British Indian Ocean Territory, Brunei Darussalam, Bulgaria, Burkina Faso, Burundi, Cabo Verde, Cambodia, Cameroon, Canada, Cayman Islands, Central African Republic, Chad, Chile, China, Christmas Island, Cocos (Keeling) Islands, Colombia, Comoros, Congo, Democratic Republic of the Congo, Cook Islands, Costa Rica, Côte d'Ivoire, Croatia, Cuba, Curaçao, Cyprus, Czech Republic, Denmark, Djibouti, Dominica, Dominican Republic, Ecuador, Egypt, El Salvador, Equatorial Guinea, Eritrea, Estonia, Ethiopia, Falkland Islands, Faroe Islands, Fiji, Finland, France, French Guiana, French Polynesia, French Southern Territories, Gabon, Gambia, Georgia, Germany, Ghana, Gibraltar, Greece, Greenland, Grenada, Guadeloupe, Guam, Guatemala, Guernsey, Guinea, Guinea-Bissau, Guyana, Haiti, Heard Island and McDonald Islands, Holy See, Honduras, Hong Kong Special Administrative Region, Hungary, Iceland, India, Indonesia, Islamic Republic of Iran, Iraq, Ireland, Isle of Man, Israel, Italy, Jamaica, Japan, Jersey, Jordan, Kazakhstan, Kenya, Kiribati, Democratic Peoples Republic of Korea, Republic of Korea, Kuwait, Kyrgyzstan, Lao People's Democratic Republic, Latvia, Lebanon, Lesotho, Liberia, Libya, Liechtenstein, Lithuania, Luxembourg, Macao Special Administrative Region, North Macedonia, Madagascar, Malawi, Malaysia, Maldives, Mali, Malta, Marshall Islands, Martinique, Mauritania, Mauritius, Mayotte, Mexico, Micronesia, Moldova, Monaco, Mongolia, Montenegro, Montserrat, Morocco, Mozambique, Myanmar, Namibia, Nauru, Nepal, Netherlands, New Caledonia, New Zealand, Nicaragua, Niger, Nigeria, Niue, Norfolk Island, Northern Mariana Islands, Norway, Oman, Pakistan, Palau, Palestinian Authority, Panama, Papua New Guinea, Paraguay, Peru, Philippines, Pitcairn, Poland, Portugal, Puerto Rico, Qatar, Réunion, Romania, Russia, Rwanda, Saint Barthélemy, Saint Helena, Ascension, Tristan da Cunha, Saint Kitts and Nevis, Saint Lucia, Saint Martin (French part), Saint Pierre and Miquelon, Saint Vincent and the Grenadines, Samoa, San Marino, São Tomé and Príncipe, Saudi Arabia, Senegal, Serbia, Seychelles, Sierra Leone, Singapore, Sint Maarten (Dutch part), Slovakia, Slovenia, Solomon Islands, Somalia, South Africa, South Georgia and the South Sandwich Islands, South Sudan, Spain, Sri Lanka, Sudan, Suriname, Svalbard and Jan Mayen, Swaziland, Sweden, Switzerland, Syrian Arab Republic, Taiwan, Tajikistan, Tanzania, Thailand, Timor-Leste, Togo, Tokelau, Tonga, Trinidad and Tobago, Tunisia, Türkiye, Turkmenistan, Turks and Caicos Islands, Tuvalu, Uganda, Ukraine, United Arab Emirates, United Kingdom of Great Britain and Northern Ireland, United States of America, United States Minor Outlying Islands, Uruguay, Uzbekistan, Vanuatu, Bolivarian Republic of Venezuela, Vietnam, Virgin Islands (British), Virgin Islands (U.S.), Wallis and Futuna, Yemen, Zambia, Zimbabwe, None|None|The country of the user as a two-letter code (ISO 3166-1 alpha-2)|

### Variables produced

This action doesn't produce any variables.

### <a name="updateuserinfo_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Couldn't set or update password|Indicates a problem setting or updating the user's password|
|Active Directory error|General Active Directory error|

## <a name="connecttoserveraction"></a> Connect to server

Connects to an Active Directory server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|LDAP path|No|[Text value](../variable-data-types.md#text-value)||The LDAP path of the Active Directory server|
|Use authentication|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether authentication is needed to connect to the server|
|Username|No|[Text value](../variable-data-types.md#text-value)||The user's username|
|Password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The user's password|
|Authentication type|N/A|None, Secure, Encryption, Secure sockets layer, Read-only server, Anonymous, Fast bind, Signing, Sealing, Delegation, Server bind|Secure|Specify the type of authentication to be used|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ParentDirectoryEntry|[Active Directory entry](../variable-data-types.md#active-directory)|The parent of the Active Directory entry for use with later Active Directory actions|

### <a name="connecttoserveraction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Unauthorized access|Indicates that an authorization error occurred|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Invalid operation|Indicates an invalid operation error|
|Active Directory error|General Active Directory error|

## <a name="closeconnection"></a> Close connection

Closes the connection with the Active Directory server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|[Active Directory entry](../variable-data-types.md#active-directory)||The parent entry of the Active Directory server|

### Variables produced

This action doesn't produce any variables.

### <a name="closeconnection_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
