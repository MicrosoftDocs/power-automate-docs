---
title: Cryptography actions reference
description: See all the available cryptography actions.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/09/2024
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Cryptography actions

**Cryptography** actions enable you to encrypt and decrypt plain text and text from files providing a key and an encoding format.

The **Encrypt text with AES** action encrypts a text using the AES algorithm and a user-specified encryption key. You can provide the encryption key directly or through a variable.

To encrypt the text of a file directly, use the **Encrypt from file with AES** action. This action works similarly to the **Encrypt text with AES** action but requires a source file instead of a text value.

:::image type="content" source="media/cryptography/encrypt-from-file-with-aes-action.png" alt-text="Screenshot of the Encrypt from file with AES action.":::

To decrypt a text, use the **Decrypt text with AES**, and enter the encrypted text and the encryption key previously used to encrypt it. To decrypt and store a text in a file, deploy the **Decrypt to file with AES** and specify a destination path.

:::image type="content" source="media/cryptography/decrypt-to-file-with-aes-action.png" alt-text="Screenshot of the Decrypt to file with AES action.":::

Apart from encryption and decryption, the **Cryptography** group of actions provides actions to hash values with and without a key. Like the encryption actions, you can hash values from files using the **Hash from file** and **Hash from file with key** actions.

:::image type="content" source="media/cryptography/hash-from-file-with-key-action.png" alt-text="Screenshot of the Hash from file with key action.":::

> [!IMPORTANT]
> Passwords entered in designated fields only work on the machine where they were initially set. This is due to the machine-specific encryption used for direct password inputs. If the flow is opened on a different machine, these passwords will not be valid and will need to be re-entered.

## <a name="encrypttextaction"></a> Encrypt text with AES

Encrypt a string with AES, using a key and a specified encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding of the text to encrypt|
|Text to encrypt|No|[Text value](../variable-data-types.md#text-value)||The text to encrypt|
|Encryption key|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The encryption key to use|
|Padding|N/A|None, PKCS7, Zeros, ANSIX923, ISO10126|PKCS7|The padding to use for the selected encryption algorithm|
|Key size|N/A|128 bits, 192 bits, 256 bits|256 bits|The size of the key in bits to use for the encryption|
|Use salt|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use salt for encryption. When this option is enabled,  the randomly generated salt becomes an output in the form of a base64 string.|
|Use initialization vector|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use an initialization vector. When this option is enabled, the randomly generated initialization vector becomes an output in the form of a base64 string|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|EncryptedText|[Text value](../variable-data-types.md#text-value)|The encrypted text for later processing|
|Salt|[Text value](../variable-data-types.md#text-value)|The randomly generated salt value for later processing|
|InitializationVector|[Text value](../variable-data-types.md#text-value)|The randomly generated initialization vector value for later processing|

### <a name="encrypttextaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to encrypt text|Indicates that an error occurred during encryption|

## <a name="decrypttextaction"></a> Decrypt text with AES

Decrypt a string with AES based on a specified key and an encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding for the decrypted text|
|Text to decrypt|No|[Text value](../variable-data-types.md#text-value)||The text to decrypt in the form of a base64 string|
|Decryption key|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The decryption key to use|
|Padding|N/A|None, PKCS7, Zeros, ANSIX923, ISO10126|PKCS7|The padding to use for the selected decryption algorithm|
|Key size|N/A|128 bits, 192 bits, 256 bits|256 bits|The size of the key in bits to use for the decryption|
|Use salt|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use salt for the decryption|
|Salt|No|[Text value](../variable-data-types.md#text-value)||The salt to use for decryption in the form of a base64 string|
|Use initialization vector|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use an initialization vector|
|Initialization vector|No|[Text value](../variable-data-types.md#text-value)||The initialization vector to use for decryption in the form of a base64 string|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|DecryptedText|[Text value](../variable-data-types.md#text-value)|The decrypted text for later processing|

### <a name="decrypttextaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to decrypt text|Indicates that an error occurred during decryption|

## <a name="encryptfromfileaction"></a> Encrypt from file with AES

Encrypt the contents of a file with AES, using a key and a specified encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding of the file to encrypt|
|File to encrypt|No|[File](../variable-data-types.md#files-and-folders)||The text file that stores the contents to encrypt|
|Encryption key|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The encryption key to use|
|Padding|N/A|None, PKCS7, Zeros, ANSIX923, ISO10126|PKCS7|The padding to use for the selected encryption algorithm|
|Key size|N/A|128 bits, 192 bits, 256 bits|256 bits|The size of the key in bits to use for the encryption|
|Use salt|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use salt for encryption. When this option is enabled,  the randomly generated salt becomes an output in the form of a base64 string.|
|Use initialization vector|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use an initialization vector. When this option is enabled, the randomly generated initialization vector becomes an output in the form of a base64 string|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|EncryptedText|[Text value](../variable-data-types.md#text-value)|The text of the encrypted file for later processing|
|Salt|[Text value](../variable-data-types.md#text-value)|The randomly generated salt value for later processing|
|InitializationVector|[Text value](../variable-data-types.md#text-value)|The randomly generated initialization vector value for later processing|

### <a name="encryptfromfileaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File not found|Indicates that the file doesn't exist|
|Failed to encrypt the contents of the file|Indicates that an error occurred while encrypting the contents of the file|

## <a name="decrypttofileaction"></a> Decrypt to file with AES

Decrypt a string to a file with AES based on a specified key and an encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding of the text to decrypt|
|Text to decrypt|No|[Text value](../variable-data-types.md#text-value)||The text to decrypt in the form of a base64 string|
|Decryption key|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The decryption key to use|
|Decrypt to file|No|[File](../variable-data-types.md#files-and-folders)||The file to save the decrypted text into|
|If file exists|N/A|Overwrite, Don't decrypt to file, Add sequential suffix|Add sequential suffix|Specifies what to do in case the destination file already exists|
|Padding|N/A|None, PKCS7, Zeros, ANSIX923, ISO10126|PKCS7|The padding to use for the selected decryption algorithm|
|Key size|N/A|128 bits, 192 bits, 256 bits|256 bits|The size of the key in bits to use for decryption|
|Use salt|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use salt for decryption|
|Salt|No|[Text value](../variable-data-types.md#text-value)||The salt to use for decryption in the form of a base64 string|
|Use initialization vector|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use an initialization vector. Enter the initialization vector in the form of a base64 string|
|Initialization vector|No|[Text value](../variable-data-types.md#text-value)||The initialization vector to use for decryption|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|DecryptedFile|[File](../variable-data-types.md#files-and-folders)|The decrypted file for later processing|

### <a name="decrypttofileaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to decrypt and store the contents to a file|Indicates that an error occurred while decrypting or storing the contents to the specified file|

## <a name="hashtext"></a> Hash text

Hash a string, using a specified algorithm and an encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Hash algorithm|N/A|SHA256, SHA384, SHA512|SHA256|The algorithm to use for hashing|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding of the text to hash|
|Text to hash|No|[Text value](../variable-data-types.md#text-value)||The text to hash|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|HashedText|[Text value](../variable-data-types.md#text-value)|The hashed text for later processing|

### <a name="hashtext_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to hash text|Indicates that an error occurred during hashing|

## <a name="hashfromfile"></a> Hash from file

Hash the contents of a file, using a specified algorithm and an encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Hash algorithm|N/A|SHA256, SHA384, SHA512|SHA256|The algorithm to use for hashing|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding of the file to hash|
|File to hash|No|[File](../variable-data-types.md#files-and-folders)||The file to hash the contents of|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|HashedText|[Text value](../variable-data-types.md#text-value)|The hashed text for later processing|

### <a name="hashfromfile_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File not found|Indicates that the file doesn't exist|
|Failed to hash the file|Indicates that an error occurred while hashing the contents of the file|

## <a name="hashtextwithkey"></a> Hash text with key

Hash a string with a key, using a specified algorithm and an encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Hash algorithm|N/A|HMAC SHA256, HMAC SHA384, HMAC SHA512|HMAC SHA256|The algorithm to use for hashing|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding of the text to hash|
|Text to hash|No|[Text value](../variable-data-types.md#text-value)||The text to hash|
|Hash key|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The key to hash the text with|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|HashedText|[Text value](../variable-data-types.md#text-value)|The hashed text for later processing|

### <a name="hashtextwithkey_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to hash text with key|Indicates that an error occurred during hashing with key|

## <a name="hashfromfilewithkey"></a> Hash from file with key

Hash the contents of a file with a key, using a specified algorithm and an encoding format.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Hash algorithm|N/A|HMAC SHA256, HMAC SHA384, HMAC SHA512|HMAC SHA256|The algorithm to use for hashing|
|Encoding|N/A|System default, ASCII, Unicode, Big-endian Unicode, UTF-8|Unicode|The encoding of the file to hash|
|File to hash|No|[File](../variable-data-types.md#files-and-folders)||The file to hash the contents of|
|Hash key|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The hash key to hash the text with|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|HashedText|[Text value](../variable-data-types.md#text-value)|The hashed text for later processing|

### <a name="hashfromfilewithkey_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File not found|Indicates that the file doesn't exist|
|Failed to hash the file with key|Indicates that an error occurred while hashing the contents of the file with the specified key|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
