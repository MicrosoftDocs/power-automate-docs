---
title: Active Directory | Microsoft Docs
description: Active Directory Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
ms.date: 09/30/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Active Directory

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Connect to an Active Directory server and perform operations

|<!-- --> |
|-----|
|[Create group](#creategroup)|
|[Get group info](#getgroupinfo)|
|[Get group members](#getgroupmembers)|
|[Modify group](#modifygroupaction)|
|[Create object](#createobject)|
|[Delete object](#deleteobject)|
|[Move object](#moveobject)|
|[Rename object](#renameobject)|
|[Create user](#createuser)|
|[Get user info](#getuserinfo)|
|[Modify user](#modifyuseraction)|
|[Unlock user](#unlockuser)|
|[Update user info](#updateuserinfo)|
|[Connect to server](#connecttoserveraction)|
|[Close connection](#closeconnection)|

## Group
Create, modify and get information about a group in an Active Directory server
### <a name="creategroup"></a> Create group
Creates a group in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Group name|No|Text value||The name of the newly created group|
|Location|Yes|Text value||The location that the group will be created in|
|Description|Yes|Text value||The description for the group|
|Group scope|N/A|Local, Global, Universal|Global|The scope of the group in the Active Directory|
|Group type|N/A|Security, Distribution|Security|The type of the group|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="creategroup_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Active Directory error|General Active Directory error|

### <a name="getgroupinfo"></a> Get group info
Gets information about a group from the Active Directory server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|GroupInfo|Group info|The group's info|


##### <a name="getgroupinfo_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

### <a name="getgroupmembers"></a> Get group members
Gets the members of a group in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|GroupMembers|List of Group members|The variable that holds the members of the group|


##### <a name="getgroupmembers_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

### <a name="modifygroupaction"></a> Modify group
Modifies a group in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|
|Operation|N/A|Rename group, Delete group, Add user, Remove user|Rename group|Select the operation to perform|
|New name|No|Text value||The new name for the group|
|User distinguished name|No|Text value||Specify the user's distinguished name|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="modifygroupaction_onerror"></a> Exceptions
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

## Object
Create or manipulate an object in an Active Directory server
### <a name="createobject"></a> Create object
Creates an object in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent Directory Entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Location|Yes|Text value||The location that the group will be created in|
|Object type|N/A|Computer, Organizational unit|Computer|The type of the object|
|Object name|No|Text value||The name of the newly created object|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="createobject_onerror"></a> Exceptions
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

### <a name="deleteobject"></a> Delete object
Deletes an object in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deleteobject_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

### <a name="moveobject"></a> Move object
Moves an object in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|
|Move to location|No|Text value||The location for the object to be moved to|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="moveobject_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

### <a name="renameobject"></a> Rename object
Renames an object in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|
|New name|No|Text value||Type the new name for the group|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="renameobject_onerror"></a> Exceptions
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

## User
Create, modify and get information about a user in an Active Directory server
### <a name="createuser"></a> Create user
Creates a user in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Location|Yes|Text value||The location that the group will be created in|
|First name|No|Text value||The first name of the user|
|Initials|Yes|Text value||The initials of the user|
|Last name|Yes|Text value||The last name of the user|
|Username|No|Text value||The username of the user|
|Password|No|Text value||The password of the user|
|Password never expires|N/A|Boolean value|False|Specify whether the password of the user will expire|
|Disabled account|N/A|Boolean value|False|Specify whether the account will be disabled|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="createuser_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object already exists|Indicates that an object with the specified name already exists in the Active Directory|
|Could not set or update password|Indicates a problem setting or updating the user's password|
|Active Directory error|General Active Directory error|

### <a name="getuserinfo"></a> Get user info
Gets a user's information in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|UserInfo|User info|The user's info|


##### <a name="getuserinfo_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

### <a name="modifyuseraction"></a> Modify user
Modify a user in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|
|Operation|N/A|Enable/disable user, Rename user, Delete user, Reset password|Enable/disable user|Select the operation to be performed|
|Enable user|N/A|Boolean value|False|Enable or disable the user|
|New name|No|Text value||Type the new name for the group|
|New password|No|Text value||Type the new password for the group|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="modifyuseraction_onerror"></a> Exceptions
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

### <a name="unlockuser"></a> Unlock user
Unlocks an Active Directory user

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished name|No|Text value||The distinguished name of the Active Directory entry|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="unlockuser_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Active Directory error|General Active Directory error|

### <a name="updateuserinfo"></a> Update user info
Updates a user's information in the Active Directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent directory entry|No|Active Directory entry||The parent entry of the Active Directory server|
|Distinguished Name|No|Text value||The distinguished name of the Active Directory entry|
|Display name|Yes|Text value||The display name of the user|
|First name|Yes|Text value||The first name of the user|
|Initials|Yes|Text value||The initials of the user|
|Last name|Yes|Text value||The last name of the user|
|Title|Yes|Text value||The title of the user|
|The of the user|Yes|Text value||The email of the user|
|The of the user|Yes|Text value||The company of the user|
|Telephone number|Yes|Text value||The telephone number of the user|
|Extension|Yes|Text value||The extension of the user|
|City|Yes|Text value||The city of the user|
|Postal code|Yes|Text value||The postal code of the user|
|State|Yes|Text value||The state of the user|
|Country|N/A|Afghanistan, Åland Islands, Albania, Algeria, American Samoa, Andorra, Angola, Anguilla, Antarctica, Antigua and Barbuda, Argentina, Armenia, Aruba, Australia, Austria, Azerbaijan, Bahamas, Bahrain, Bangladesh, Barbados, Belarus, Belgium, Belize, Benin, Bermuda, Bhutan, State of Bolivia Plurinational, Bonaire, Bosnia and Herzegovina, Botswana, Bouvet Island, Brazil, British Indian Ocean Territory, Brunei Darussalam, Bulgaria, Burkina Faso, Burundi, Cabo Verde, Cambodia, Cameroon, Canada, Cayman Islands, Central African Republic, Chad, Chile, China, Christmas Island, Cocos (Keeling) Islands, Colombia, Comoros, Congo, Democratic Republic of the Congo, Cook Islands, Costa Rica, Côte d'Ivoire, Croatia, Cuba, Curaçao, Cyprus, Czech Republic, Denmark, Djibouti, Dominica, Dominican Republic, Ecuador, Egypt, El Salvador, Equatorial Guinea, Eritrea, Estonia, Ethiopia, Falkland Islands (Malvinas), Faroe Islands, Fiji, Finland, France, French Guiana, French Polynesia, French Southern Territories, Gabon, Gambia, Georgia, Germany, Ghana, Gibraltar, Greece, Greenland, Grenada, Guadeloupe, Guam, Guatemala, Guernsey, Guinea, Guinea-Bissau, Guyana, Haiti, Heard Island and McDonald Islands, Holy See, Honduras, Hong Kong, Hungary, Iceland, India, Indonesia, Islamic Republic of Iran, Iraq, Ireland, Isle of Man, Israel, Italy, Jamaica, Japan, Jersey, Jordan, Kazakhstan, Kenya, Kiribati, Democratic Peoples Republic of Korea, Republic of Korea, Kuwait, Kyrgyzstan, Lao People's Democratic Republic, Latvia, Lebanon, Lesotho, Liberia, Libya, Liechtenstein, Lithuania, Luxembourg, Macao, Republic of Macedonia the former Yugoslav, Madagascar, Malawi, Malaysia, Maldives, Mali, Malta, Marshall Islands, Martinique, Mauritania, Mauritius, Mayotte, Mexico, Micronesia, Moldova, Monaco, Mongolia, Montenegro, Montserrat, Morocco, Mozambique, Myanmar, Namibia, Nauru, Nepal, Netherlands, New Caledonia, New Zealand, Nicaragua, Niger, Nigeria, Niue, Norfolk Island, Northern Mariana Islands, Norway, Oman, Pakistan, Palau, Palestine, Panama, Papua New Guinea, Paraguay, Peru, Philippines, Pitcairn, Poland, Portugal, Puerto Rico, Qatar, Réunion, Romania, Russia, Rwanda, Saint Barthélemy, Saint Helena, Saint Kitts and Nevis, Saint Lucia, Saint Martin (French part), Saint Pierre and Miquelon, Saint Vincent and the Grenadines, Samoa, San Marino, Sao Tome and Principe, Saudi Arabia, Senegal, Serbia, Seychelles, Sierra Leone, Singapore, Sint Maarten (Dutch part), Slovakia, Slovenia, Solomon Islands, Somalia, South Africa, South Georgia and the South Sandwich Islands, South Sudan, Spain, Sri Lanka, Sudan, Suriname, Svalbard and Jan Mayen, Swaziland, Sweden, Switzerland, Syrian Arab Republic, Taiwan, Tajikistan, Tanzania, Thailand, Timor-Leste, Togo, Tokelau, Tonga, Trinidad and Tobago, Tunisia, Turkey, Turkmenistan, Turks and Caicos Islands, Tuvalu, Uganda, Ukraine, United Arab Emirates, United Kingdom of Great Britain and Northern Ireland, United States of America, United States Minor Outlying Islands, Uruguay, Uzbekistan, Vanuatu, Bolivarian Republic of Venezuela, Vietnam, Virgin Islands (British), Virgin Islands (U.S.), Wallis and Futuna, Yemen, Zambia, Zimbabwe, None|None|The country of the user as a two-letter code (ISO 3166-1 alpha-2)|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="updateuserinfo_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Invalid operation|Indicates an invalid operation error|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Unauthorized access|Indicates that an authorization error occurred|
|Active Directory entry not found|Indicates that the Active Directory entry given isn't found on the Active Directory server|
|Object doesn't exist on server|Indicates that the object doesn't exist in the Active Directory server|
|Could not set or update password|Indicates a problem setting or updating the user's password|
|Active Directory error|General Active Directory error|

### <a name="connecttoserveraction"></a> Connect to server
Connects to an Active Directory server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|LDAP path|No|Text value||The LDAP path of the Active Directory server|
|Use authentication|N/A|Boolean value|False|Specify whether authentication is needed to connect to the server|
|Username|No|Text value||The user's username|
|Password|No|Text value||The user's password|
|Authentication type|N/A|None, Secure, Encryption, Secure sockets layer, Read-only server, Anonymous, Fast bind, Signing, Sealing, Delegation, Server bind|Secure|Specify the type of authentication to be used|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ParentDirectoryEntry|Active Directory entry|The parent of the Active Directory entry for use with later Active Directory actions|


##### <a name="connecttoserveraction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication error|Indicates an error with the user's authentication|
|Unauthorized access|Indicates that an authorization error occurred|
|The server isn't operational|Indicates that the Active Directory server isn't operational|
|Invalid operation|Indicates an invalid operation error|
|Active Directory error|General Active Directory error|

### <a name="closeconnection"></a> Close connection
Closes the connection with the Active Directory server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Parent Directory Entry|No|Active Directory entry||The parent entry of the Active Directory server|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="closeconnection_onerror"></a> Exceptions
- This action doesn't include any exceptions

