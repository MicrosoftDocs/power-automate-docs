---
title: Web | Microsoft Docs
description: Web Actions Reference
author: mariosleon
ms.service: power-automate
ms.topic: article
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Web(웹)



웹 애플리케이션 및 서비스와 직접 통신하기

웹 액션을 사용 하는 방법에 대한 더 많은 정보 보기 [클릭해서 이동](../automation-web.md)


|<!-- --> |
|-----|
|[웹에서 내려받기](#downloadfromweb)|
|[웹 서비스 호출](#invokewebservicebase)|

### <a name="downloadfromweb"></a> 웹에서 내려받기
웹에서 텍스트 또는 파일을 내려받아 저장 하기

##### 매개변수(Parameters) 입력
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|URL|No|텍스트 값(Text value)||웹 페이지 또는 파일의 URL|
|Method|N/A|GET, POST|GET|웹 사이트에서 정보를 가져오는 방법을 지정. 필요한 모든 정보가 URL에 있을 때 GET을 사용하고, 추가 정보 (암호 등)를 입력하려면 POST를 사용.|
|Post parameters|No|데이터 테이블||두 개의 열이있는 데이터 테이블 형식의 POST 매개 변수|
|Save response|N/A|(웹 페이지 용) 텍스트를 변수에 가져오고, (파일 용) 디스크에 저장|(웹 페이지 용) 텍스트를 변수에 가져오기|반환된 데이터 저장 방법을 구체화|
|File name|N/A|원본 파일 이름 유지 (대상 폴더 만 지정), 전체 경로 지정 (대상 폴더 + 사용자 지정 파일 이름)|원본 파일 이름 유지 (대상 폴더 만 지정)|다운로드 한 파일의 원래 파일 이름을 유지할지 또는 새 이름을 지정할지 특정|
|Destination folder|No|폴더||웹 서버에서 반환 된 파일이 저장 될 폴더|
|Destination file path|No|파일||웹 서버에서 반환 된 파일이 저장 될 전체 경로 (폴더와 파일 이름)|
|Connection timeout|Yes|숫자 값(Numeric Value)|30|포기하기 전, 서버와의 연결 설정을 위해 에이전트가 기다려야하는 시간 (초)|
|Follow redirection|N/A|부울 값(Boolean value)|True|웹 서버가 다른 웹 페이지 또는 웹 사이트로 리디렉션하도록 허용할지 여부를 지정|
|Clear cookies|N/A|부울 값(Boolean value)|False|이번 자동화 작업 동안 유사한 작업으로 생성 된 모든 쿠키를 삭제할지 여부를 지정|
|User agent|Yes|텍스트 값(Text Value)|Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20100312 Firefox/3.6|표시 할 브라우저 ID를 지정. 일부 웹 서버는 브라우저 ID를 선택하지 않으면 접속을 허용하지 않을 수 있음|
|Encoding|N/A|Auto - detect, IBM037 : IBM EBCDIC (US-Canada), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ASMO-708 : Arabic (ASMO 708), DOS-720 : Arabic (DOS), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM00858 : OEM Multilingual Latin I, IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), DOS-862 : Hebrew (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), cp866 : Cyrillic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), windows-874 : Thai (Windows), cp875 : IBM EBCDIC (Greek Modern), shift_jis : Japanese (Shift-JIS), gb2312 : Chinese Simplified (GB2312), ks_c_5601-1987 : Korean, big5 : Chinese Traditional (Big5), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), Johab : Korean (Johab), macintosh : Western European (Mac), x-mac-japanese : Japanese (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-korean : Korean (Mac), x-mac-arabic : Arabic (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-greek : Greek (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-romanian : Romanian (Mac), x-mac-ukrainian : Ukrainian (Mac), x-mac-thai : Thai (Mac), x-mac-ce : Central European (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-turkish : Turkish (Mac), x-mac-croatian : Croatian (Mac), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), x-Chinese-CNS : Chinese Traditional (CNS), x-cp20001 : TCA Taiwan, x-Chinese-Eten : Chinese Traditional (Eten), x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Swedish : Swedish (IA5), x-IA5-Norwegian : Norwegian (IA5), us-ascii : US-ASCII, x-cp20261 : T.61, x-cp20269 : ISO-6937, IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), IBM-Thai : IBM EBCDIC (Thai), koi8-r : Cyrillic (KOI8-R), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), IBM00924 : IBM Latin-1, EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), koi8-u : Cyrillic (KOI8-U), iso-8859-1 : Western European (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-9 : Turkish (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), x-Europa : Europa, iso-8859-8-i : Hebrew (ISO-Logical), iso-2022-jp : Japanese (JIS), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), x-cp50227 : Chinese Simplified (ISO-2022), euc-jp : Japanese (EUC), EUC-CN : Chinese Simplified (EUC), euc-kr : Korean (EUC), hz-gb-2312 : Chinese Simplified (HZ), GB18030 : Chinese Simplified (GB18030), x-iscii-de : ISCII Devanagari, x-iscii-be : ISCII Bengali, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-iscii-as : ISCII Assamese, x-iscii-or : ISCII Oriya, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-gu : ISCII Gujarati, x-iscii-pa : ISCII Punjabi, utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8)|자동감지(Auto - detect)|웹 페이지에 사용되는 인코딩. 자동 감지 옵션을 선택하면 사용할 인코딩이 웹 서버에서 지정|
|Accept untrusted certificates|N/A|부울 값(Boolean value)|False|신뢰할 수없는 인증서 허용 여부 지정|
|Use credentials|N/A|부울 값(Boolean value)|False|웹 서버에 인증이 필요한지 여부를 지정. 이 속성은 HTTP 인증 (즉, 브라우저에 사용자 이름과 암호를 묻는 팝업 창이 표시되는 경우)과 관련 됨|
|User name|No|텍스트 값(Text value)||웹 서버의 사용자 이름|
|Password|No|암호화된 값(Encrypted value)||웹 서버의 비밀번호|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|DownloadedFile|파일|내려받은 파일|
|WebPageText|텍스트 값(Text value)|웹 페이지 텍스트|


##### <a name="downloadfromweb_onerror"></a> 예외들
|예외|설명(Description)|
|-----|-----|
|Directory doesn't exist|요청된 디렉토리가 없음을 표시|
|Download from web error|웹에서 내려받기에 문제가 있음을 표시|

### <a name="invokewebservicebase"></a> 웹 서비스 호출
데이터를 보내 웹 서비스를 호출하고 웹 서비스에서 응답을 가져 옴

##### 매개변수(Parameters) 입력
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|URL|No|텍스트 값(Text value)||웹 서비스 URL|
|Method|N/A|GET, POST, CONNECT, HEAD, PUT, DELETE, OPTIONS, TRACE, PATCH|GET|웹 서비스 호출에 사용되는 HTTP 메소드|
|Accept|Yes|텍스트 값(Text value)|application/xml|웹 서비스 응답에 허용되는 콘텐츠 유형|
|Content type|Yes|텍스트 값(Text value)|application/xml|웹 서비스로 보낼 요청의 콘텐츠 유형|
|Custom headers|Yes|텍스트 값(Text value)||웹 서비스로 보낼 요청에 포함될 사용자 정의 헤더|
|Request body|Yes|텍스트 값(Text value)||웹 서비스로 보낼 요청 본문|
|Save response|N/A|(웹 페이지 용) 텍스트를 변수에 가져오고, (파일 용) 디스크에 저장|(웹 페이지 용) 텍스트를 변수에 가져오기|반환된 데이터 저장 방법을 구체화|
|File name|N/A|원본 파일 이름 유지 (대상 폴더 만 지정), 전체 경로 지정 (대상 폴더 + 사용자 지정 파일 이름)|원본 파일 이름 유지 (대상 폴더 만 지정)|다운로드 한 파일의 원래 파일 이름을 유지할지 또는 새 이름을 지정할지 특정|
|Destination folder|No|폴더||웹 서버에서 반환 된 파일이 저장 될 폴더|
|Destination file path|No|파일||웹 서버에서 반환 된 파일이 저장 될 전체 경로 (폴더와 파일 이름)|
|Connection timeout|Yes|숫자 값(Numeric Value)|30|포기하기 전, 서버와의 연결 설정을 위해 에이전트가 기다려야하는 시간 (초)|
|Follow redirection|N/A|부울 값(Boolean value)|True|웹 서버가 다른 웹 페이지 또는 웹 사이트로 리디렉션하도록 허용할지 여부를 지정|
|Clear cookies|N/A|부울 값(Boolean value)|False|이번 자동화 작업 동안 유사한 작업으로 생성 된 모든 쿠키를 삭제할지 여부를 지정|
|Fail on error status|N/A|부울 값(Boolean value)|False|호출 된 웹 서비스의 응답이 오류로 표시될 경우 정상적인 응답인 것처럼 처리(모든 예외를 제외 처리)할 지 아니면 관련 예외를 발생할 지 여부|
|Encode request body|N/A|부울 값(Boolean value)|True|호출하기 전에 요청 본문을 URL 인코딩해야하는지 여부를 지정|
|User agent|Yes|텍스트 값(Text Value)|Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20100312 Firefox/3.6|표시 할 브라우저 ID를 지정. 일부 웹 서버는 브라우저 ID를 선택하지 않으면 접속을 허용하지 않을 수 있음|
|Encoding|N/A|Auto - detect, IBM037 : IBM EBCDIC (US-Canada), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ASMO-708 : Arabic (ASMO 708), DOS-720 : Arabic (DOS), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM00858 : OEM Multilingual Latin I, IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), DOS-862 : Hebrew (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), cp866 : Cyrillic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), windows-874 : Thai (Windows), cp875 : IBM EBCDIC (Greek Modern), shift_jis : Japanese (Shift-JIS), gb2312 : Chinese Simplified (GB2312), ks_c_5601-1987 : Korean, big5 : Chinese Traditional (Big5), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), Johab : Korean (Johab), macintosh : Western European (Mac), x-mac-japanese : Japanese (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-korean : Korean (Mac), x-mac-arabic : Arabic (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-greek : Greek (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-romanian : Romanian (Mac), x-mac-ukrainian : Ukrainian (Mac), x-mac-thai : Thai (Mac), x-mac-ce : Central European (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-turkish : Turkish (Mac), x-mac-croatian : Croatian (Mac), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), x-Chinese-CNS : Chinese Traditional (CNS), x-cp20001 : TCA Taiwan, x-Chinese-Eten : Chinese Traditional (Eten), x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Swedish : Swedish (IA5), x-IA5-Norwegian : Norwegian (IA5), us-ascii : US-ASCII, x-cp20261 : T.61, x-cp20269 : ISO-6937, IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), IBM-Thai : IBM EBCDIC (Thai), koi8-r : Cyrillic (KOI8-R), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), IBM00924 : IBM Latin-1, EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), koi8-u : Cyrillic (KOI8-U), iso-8859-1 : Western European (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-9 : Turkish (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), x-Europa : Europa, iso-8859-8-i : Hebrew (ISO-Logical), iso-2022-jp : Japanese (JIS), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), x-cp50227 : Chinese Simplified (ISO-2022), euc-jp : Japanese (EUC), EUC-CN : Chinese Simplified (EUC), euc-kr : Korean (EUC), hz-gb-2312 : Chinese Simplified (HZ), GB18030 : Chinese Simplified (GB18030), x-iscii-de : ISCII Devanagari, x-iscii-be : ISCII Bengali, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-iscii-as : ISCII Assamese, x-iscii-or : ISCII Oriya, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-gu : ISCII Gujarati, x-iscii-pa : ISCII Punjabi, utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8)|Auto - detect|웹 서비스 응답에 사용되는 인코딩. 자동 감지 옵션을 선택하면 사용할 인코딩이 웹 서비스에 의해 지정|
|Accept untrusted certificates|N/A|부울 값(Boolean value)|False|신뢰할 수없는 인증서 허용 여부 지정|
|HTTP Authentication|N/A|부울 값(Boolean value)|False|웹 서버에 인증이 필요한지 여부를 지정. 이 속성은 HTTP 인증 (즉, 브라우저에 사용자 이름과 암호를 묻는 팝업 창이 표시되는 경우)과 관련 됨|
|User name|No|텍스트 값(Text value)||웹 서버의 사용자 이름|
|Password|No|암호화된 값(Encrypted value)||웹 서버의 비밀번호|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|WebServiceResponseHeaders|텍스트 값들의 리스트|응답의 HTTP 헤더|
|DownloadedFile|파일|내려받은 파일|
|WebServiceResponse|텍스트 값(Text value)|웹 서비스 응답 텍스트|
|StatusCode|숫자 값(Numeric value)|반환된 상태 코드|


##### <a name="invokewebservicebase_onerror"></a> 예외
|예외|설명(Description)|
|-----|-----|
|Invoke web service error|웹 서비스 호출에 문제 있음을 표시|
|Directory doesn't exist|요청된 디렉토리가 없음을 표시|
|Invalid header in custom headers|일부 사용자 정의 헤더가 유효하지 않음을 표시|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]