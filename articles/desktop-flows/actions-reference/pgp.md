---
title: PGP cryptography reference for Power Automate for desktop
description: Learn about the available PGP cryptography automation actions in Power Automate for desktop flows.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/15/2026
ms.author: nimoutzo
ms.reviewer: ellenwehrle
contributors:
- ellenwehrle
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-ropc-nochange
---

# PGP Cryptography actions

The **PGP Cryptography** group of actions provides a set of tools for encrypting and decrypting files by using the OpenPGP (PGP) standard. 

By using these actions, you can protect sensitive files by encrypting them with a recipient's public key. You can also decrypt PGP-encrypted files by using the corresponding private key and passphrase. 

Use these actions to securely exchange files with external systems, business partners, and applications that support PGP encryption. 

The actions support industry-standard encryption algorithms, optional file compression, and ASCII armor output for text-based encrypted files.

## <a name="pgpencryptfileaction"></a> Encrypt file with PGP

Encrypts a file by using a PGP public key that you provide as a file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File to encrypt|No|File| |The full path to the file to encrypt.|
|Encrypted output file|No|File| |The full path where the encrypted file is saved.|
|Public key source|No|File, Text|File|Whether you provide the public key as a file path or as ASCII-armored text.|
|Public key file|No|File| |The path to the PGP public key file (.asc, .gpg, or .pgp).|
|Public key|No|Text| |The ASCII-armored PGP public key text (begins with -----BEGIN PGP PUBLIC KEY BLOCK-----).|
|Encryption algorithm|No|AES-128, AES-192, AES-256, Triple DES, CAST5|AES-256|The symmetric encryption algorithm to use.|
|Compression algorithm|No|None, ZIP, ZLIB, BZIP2|ZIP|The compression algorithm to apply before encryption.|
|ASCII armor|No|Boolean|False|Wraps the encrypted output in ASCII armor (text format starting with -----BEGIN PGP MESSAGE-----). When disabled, the output is raw binary data.|

### Variables produced

This action doesn't produce any variables.

### <a name="pgpencryptfileaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to encrypt file with PGP|Indicates a problem encrypting the specified file.|
|File not found|Indicates that the specified input file couldn't be found.|
|Key file not found|Indicates that the specified PGP key file couldn't be found.|
|Invalid PGP key|Indicates that the specified PGP key isn't valid or couldn't be parsed.|

## <a name="pgpdecryptfileaction"></a> Decrypt file with PGP

Decrypt a PGP-encrypted file using a private key and passphrase.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Encrypted file|No|File| |The full path to the PGP-encrypted file to decrypt.|
|Decrypted output file|No|File| |The full path where the decrypted file will be saved.|
|Private key source|No|File, Text|File|Whether the private key is provided as a file path or as ASCII-armored text.|
|Private key file|No|File| |The path to the PGP private key file (.asc, .gpg, or .pgp).|
|Private key|No|Text| |The ASCII-armored PGP private key text (begins with -----BEGIN PGP PUBLIC KEY BLOCK-----).|
|Passphrase|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)| |The passphrase protecting the private key. Leave empty if the key has no passphrase.|

### Variables produced

This action doesn't produce any variables.

### <a name="pgpdecryptfileaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to decrypt file with PGP|Indicates a problem decrypting the specified file.|
|File not found|Indicates that the specified encrypted file couldn't be found.|
|Key file not found|Indicates that the specified private key file couldn't be found.|
|Invalid PGP key|Indicates that the specified private key isn't valid or couldn't be parsed.|
|Incorrect passphrase|Indicates that the specified passphrase is incorrect for the selected private key.|
