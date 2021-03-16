---
title: Web automation | Microsoft Docs
description: Web automation Actions Reference
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

# 웹 자동화



브라우저에서 웹 애플리케이션 시작 및 관리

웹 자동화를 사용 하는 방법에 대한 더 많은 정보 보기 [클릭해서 이동](../automation-web.md)

|<!-- --> |
|-----|
|[웹 페이지에서 데이터 추출하기](#extractdata)|
|[웹 페이지에서 상세내역 가져오기](#getdetailsofwebpage)|
|[웹 페이지에서 요소 상세내역 가져오기](#getdetailsofelement)|
|[웹 페이지에서 스크린샷 찍기](#takescreenshotbase)|
|[웹 페이지에서 텍스트 필드 초점 맞추기](#focusbase)|
|[웹 페이지에서 텍스트 필드 채우기](#populatetextfieldbase)|
|[웹 페이지에서 체크박스 상태 설정하기](#setcheckboxstatebase)|
|[웹 페이지에서 라디오버튼 선택하기](#selectradiobuttonbase)|
|[웹 페이지에서 드롭박스 리스트 값 선택하기](#setdropdownlistvaluebase)|
|[웹 페이지에서 버튼 누르기](#pressbuttonbase)|
|[새 인터넷 익스플로러 실행하기](#launchinternetexplorerbase)|
|[새 파이어폭스 실행하기](#launchfirefoxbase)|
|[새 크롬 실행하기](#launchchromebase)|
|[새 엣지 실행하기](#launchedgebase)|
|[새 탭 만들기](#createnewtabbase)|
|[웹 페이지로 이동하기](#gotowebpagebase)|
|[웹 페이지 링크 클릭하기](#clickbase)|
|[웹 페이지에서 내려받기 링크 클릭하기](#clickdownloadlink)|
|[웹 페이지에서 자바스크립트 함수 실행하기](#executejavascript)|
|[웹 페이지에서 요소 위에 마우스 올려놓기](#hoveroverelement)|
|[웹 브라우저 닫기](#closewebbrowser)|

## 웹 데이터 추출
단일 값에서부터 테이블 또는 사용자가 지정하는 여러 데이터 부분에 이르기까지 웹 애플리케이션에서 데이터 추출
### <a name="extractdata"></a> 웹 페이지에서 데이터 추출하기
단일 값, 목록, 행 또는 표의 형태로 웹 페이지의 특정 부분에서 데이터 추출

이 작업 사용법에 대한 더 많은 정보 확인하러 가기 [클릭해서 이동](../automation-web.md#web-data-extraction)

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||웹 페이지에서 데이터를 추출 할 UI 요소를 선택|
|Extraction parameters|No|데이터 테이블||데이터를 추출 할 때 사용할 매개 변수. 추출 모드에 따라 다른 데이터를 허용함|
|Max web pages to process|No|숫자 값(Numeric value)||처리할 최대 웹 페이지 수|
|Pager CSS selector|No|텍스트 값(Text value)||페이저 CSS 선택자|
|Extraction mode|N/A|정의되지 않음, 단일 값, 직접 선택한 값, 리스트, 테이블, 전체 HTML 테이블|단일 값|웹 페이지에서 무엇을 추출할 지 지정|
|Use paging|N/A|부울 값(Boolean value)|False|페이징 할지 여부 지정|
|Get all web pages|N/A|부울 값(Boolean value)|False|모든 웹 페이지들을 가져올 지 여부를 지정|
|Store data mode|N/A|변수, 엑셀 스프레드시트|변수|추출 된 데이터를 변수에 저장할지 엑셀 스프레드시트에 저장할지 지정|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|ExcelInstance|엑셀 인스턴스|추출 된 데이터가 있는 엑셀 인스턴스. 이 인스턴스를 사용해 하고자 하는 엑셀 작업을 통해 해당 스프레드시트를 조작(또는 저장후 종료)|
|DataFromWebPage|데이터 테이블|단일 값, 리스트, 데이터 행 또는 데이터 테이블 형식의 추출된 데이터|


##### <a name="extractdata_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to extract data|데이터 추출 문제를 표시|
|Failed to launch Excel instance|엑셀 인스턴스 시작에 문제 있음을 표시|
|Failed to write values to Excel|엑셀에 값을 적어 넣는데 문제 있음을 표시|

### <a name="getdetailsofwebpage"></a> 웹 페이지에서 상세내역 가져오기
제목 또는 소스 텍스트와 같은 웹 페이지의 속성 가져 오기

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|Get|N/A|웹 페이지 설명, 웹 페이지 메타 키워드, 웹 페이지 제목, 웹 페이지 텍스트, 웹 페이지 소스, 웹 브라우저의 현재 URL 주소|웹 페이지 설명|웹 페이지에서 검색 할 정보를 선택|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|WebPageProperty|텍스트 값(Text value)|웹 페이지에서 가져온 상세 정보|


##### <a name="getdetailsofwebpage_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to get details of web page|지정된 웹 페이지의 세부 정보를 가져 오는 데 문제가 있음을 표시|
 ㅠ        
### <a name="getdetailsofelement"></a> 웹 페이지에서 요소 상세내역 가져오기
웹 페이지에서 요소의 속성 값 가져 오기

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||웹 페이지에서 데이터를 추출 할 UI 요소를 선택|
|Attribute name|Yes|텍스트 값(Text value)|자체 텍스트(Own Text)|가져올 값의 속성을 입력 또는 선택|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|AttributeValue|텍스트 값(Text value)|웹 요소의 속성 값|


##### <a name="getdetailsofelement_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to retrieve attribute of UI element on web page|웹 페이지 요소의 속성 가져오기에 발생한 문제를 표시|

### <a name="takescreenshotbase"></a> 웹 페이지에서 스크린샷 찍기
현재 브라우저에 표시된 웹 페이지 (또는 웹 페이지 요소)의 스크린 샷을 찍고 이미지를 파일 또는 클립 보드에 저장

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|Capture|N/A|전체 웹 페이지, 특정 요소|전체 웹 페이지|전체 웹 페이지를 캡처할지 아니면 특정 요소 만 캡처할지 지정|
|UI element|No|웹 컨트롤||캡처할 웹페이지상 요소를 선택|
|Save mode|N/A|클립보드, 파일|클립보드|이미지를 파일에 저장할지 또는 클립 보드에 저장할지 지정|
|Image file|No|파일||이미지 캡처를 저장할 파일의 전체 경로 설정|
|File format|N/A|BMP, EMF, EXIF, GIF, JPG, PNG, TIFF, WMF|BMP|이미지 파일 포맷 선택|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="takescreenshotbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|지정된 CSS 선택기가있는 웹 페이지 요소를 찾을 수 없음을 표시|
|Failed to save file|지정된 파일을 저장하는 데 문제가 있음을 표시|
|Failed to save in the clipboard|클립보드 저장에 문제가 있음을 표시|
|Failed to take screenshot|스크린 샷 찍기에 문제가 있음을 표시|

## 웹 서식 채우기
웹 애플리케이션에서 서식 채우기
### <a name="focusbase"></a> 웹 페이지에서 텍스트 필드 초점 맞추기
웹 페이지의 입력 요소에 초점을 맞추고 스크롤해서 볼 수 있게 함

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||웹 페이지에서 초점을 맞출 UI 요소를 선택|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|팝업 창이 열리면 할 것 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="focusbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|웹 페이지 요소에 지정된 CSS 선택자를 찾을 수 없다는 표시|
|Failed to set input focus on web page text field|지정된 웹 페이지 텍스트 필드에 입력 포커스를 설정하는 데 문제가 있음을 표시|

### <a name="populatetextfieldbase"></a> 웹 페이지에서 텍스트 필드 채우기
웹 페이지의 텍스트 필드를 지정된 텍스트로 채우기

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||채울 텍스트 필드를 선택|
|Text|No|암호화된 값||텍스트필드를 채울 텍스트 입력|
|Emulate typing|N/A|부울 값(Boolean value)|True|단순히 텍스트 상자의 값을 설정하여 텍스트 필드를 한 번에 채울지 또는 문자를 하나씩 전송하여 사용자 입력을 흉내낼 지 여부를 지정. 후자의 방법은 더 느리지만 일부 복잡한 웹 페이지에서 필요.|
|Unfocus text box after filling it|N/A|부울 값(Boolean value)|False|이 작업은 지정된 텍스트로 채운후 텍스트 상자의 초점을 해제할지 여부를 선택. 자동 완성 목록을 스크래핑하는 경우, 이 매개 변수는 "False"로 설정해야 함|
|Wait for page to load|N/A|부울 값(Boolean value)|True|텍스트 필드를 채운 후 새 웹 페이지가 완전히로드 될 때까지 대기할지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|텍스트 필드를 채운 후 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="populatetextfieldbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|웹 페이지 요소에 지정된 CSS 선택자를 찾을 수 없다는 표시|
|Failed to write on text field|지정된 텍스트 필드 입력에 문제가 있음을 표시|

### <a name="setcheckboxstatebase"></a> 웹 페이지에서 체크박스 상태 설정하기
웹 서식의 체크박스를 선택 또는 선택취소 하기

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||상태를 설정할 체크 박스 선택하기|
|Check box state|N/A|선택, 선택취소|선택|체크 박스 상태 선택하기|
|Wait for page to load|N/A|부울 값(Boolean value)|True|체크 박스 상태를 설정 한 후 새 웹 페이지가 완전히로드 될 때까지 대기할지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|체크 박스 상태를 설정 후 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="setcheckboxstatebase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|웹 페이지 요소에 지정된 CSS 선택자를 찾을 수 없다는 표시|
|Failed to set the state of the checkbox|지정된 체크 박스의 상태 설정에 문제가 있음 표시|

### <a name="selectradiobuttonbase"></a> 웹 페이지에서 라디오 버튼 선택하기
웹 페이지에서 라디오 버튼 선택하기 

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||선택할 라디오 버튼|
|Wait for page to load|N/A|부울 값(Boolean value)|True|라디오 버튼을 선택한 후 새 웹 페이지가 완전히로드 될 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|라디오 버튼 선택 후 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|

##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="selectradiobuttonbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|웹 페이지 요소에 지정된 CSS 선택자를 찾을 수 없다는 표시|
|Failed to select radio button|지정된 라디오 버튼 선택에 문제가 있음을 표시|

### <a name="setdropdownlistvaluebase"></a> 웹 페이지에서 드롭박스 리스트 값 선택하기
웹 서식에서 드롭다운 리스트에 대해 선택한 옵션을 설정하거나 삭제

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||값을 설정할 드롭다운 리스트 선택|
|Operation|N/A|모든 옵션 지우기, 이름으로 옵션 선택, 색인으로 옵션 선택|모든 옵션 지우기|값을 선택할지 드롭 다운 리스트에서 선택한 값을 지울지 선택|
|Option name(s)|No|텍스트 값 리스트||드롭 다운 리스트에서 선택할 하나 이상의 옵션(둘 이상인 경우 한 줄에 하나씩) 입력. 다중 옵션은 다중 선택 리스트로 작업 할 때만 활용. 리스트가 단일 선택인 경우, 지정된 첫번째 옵션만 사용|
|Option indices|No|숫자 값의 리스트||1 기반의 공백으로 구분된 리스트를 입력(예: 1 3 4)|
|Wait for page to load|N/A|부울 값(Boolean value)|True|드롭 다운 리스트 값을 설정한 후 새 웹 페이지가 완전히 실릴 때까지 대기할 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|드롭박스 리스트 설정 후 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="setdropdownlistvaluebase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|웹 페이지 요소에 지정된 CSS 선택자를 찾을 수 없다는 표시|
|Failed to set the selected option|선택한 드롭박스 리스트 옵션을 설정하는 데 문제가 있음을 표시|

### <a name="pressbuttonbase"></a> 웹 페이지에서 버튼 누르기
웹 페이지의 버튼 누르기

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||누를 버튼 선택|
|Wait for page to load|N/A|부울 값(Boolean value)|True|버튼을 누른 후 새 웹 페이지가 완전히 실릴 때까지 대기할 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|버튼을 누른 후 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="pressbuttonbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|웹 페이지 요소에 지정된 CSS 선택자를 찾을 수 없다는 표시|
|Failed to click on web page button|지정된 웹 페이지 버튼을 클릭하는 데 문제가 있음을 표시|

### <a name="launchinternetexplorerbase"></a> 새 인터넷 익스플로러 실행하기
웹 사이트 및 웹 애플리케이션 자동화를 위해 인터넷 익스플로러 새 인스턴스를 실행하거나 실행중인 인스턴스에 연결 

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|자동화 브라우저 실행, 새 인터넷 익스플로러 실행, 실행중인 인터넷 익스플로러 연결|자동화 브라우저 실행|자동화 브라우저 또는 인터넷 익스플로러의 새 인스턴스를 시작할지 아니면 기존 인스턴스에 연결할지 지정합니다.|
|Attach to Internet Explorer tab|N/A|이름 별, URL 별, 앞에 있는 창(window) 사용|이름 별|제목 별, URL 별로 인터넷 익스플로러 탭에 연결할지 아니면 맨 앞에 있는 창(window)으로 실행되는 인터넷 익스플로러의 활성 탭에 연결할지 지정|
|Initial URL|No|텍스트 값(Text value)||웹 브라우저가 실행될 때 방문 할 웹 사이트의 URL을 입력|
|Tab title|No|텍스트 값(Text value)||추가할 인터넷 익스플로러 탭의 제목(또는 그 일부)을 입력|
|Tab URL|No|텍스트 값(Text value)||추가할 인터넷 익스플로러 탭의 URL(또는 그 일부)을 입력|
|Window state|N/A|일반, 최대화, 최소화|일반|브라우저 실행시 창을 일반, 최대화된 상태의 최소화 등 여부를 지정|
|Clear cache|N/A|부울 값(Boolean value)|False|웹 브라우저를 시작한 직후 웹 브라우저의 전체 캐시를 지울지 여부를 지정|
|Clear cookies|N/A|부울 값(Boolean value)|False|웹 브라우저를 실행 한 직후 웹 브라우저에 저장된 모든 쿠키를 삭제할지 여부를 지정|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|초기 웹 페이지를 로드하는 동안 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|
|Custom user agent string|Yes|텍스트 값(Text value)||런타임 웹 도우미에 대한 맞춤형 사용자 에이전트 문자열을 지정. 이 필드가 비어있는 경우 런타임 웹 도우미는 기본적으로 컴퓨터에 설치된 인터넷 익스플로서의 사용자 에이전트 문자열을 사용.|

> [!NOTE]
> **Clear cache** 및 **Clear cookies** 옵션은 인터넷 옵션 메뉴에서 보호 모드로 실행이 비활성화 된 경우에만 의도 한대로 작동합니다.

##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|InternetExplorer|웹 브라우저 인스턴스|웹 자동화 작업에 사용할 인터넷 익스플로러 인스턴스|


##### <a name="launchinternetexplorerbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to launch Internet Explorer|인터넷 익스플로러 실행에 문제가 있음을 표시|
|Invalid URL|제공된 URL이 유효하지 않음을 표시|

### <a name="launchfirefoxbase"></a> 새 파이어폭스 실행하기
웹 사이트 및 웹 애플리케이션 자동화를 위해 파이어폭스 새 인스턴스를 실행하거나 실행중인 인스턴스에 연결

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|자동화 브라우저 실행, 새 파이어폭스 실행, 실행중인 파이어폭스 연결|자동화 브라우저 실행|자동화 브라우저 또는 파이어폭스의 새 인스턴스를 시작할지 아니면 기존 인스턴스에 연결할지 지정.|
|Attach to Firefox tab|N/A|이름 별, URL 별, 앞에 있는 창(window) 사용|이름 별|제목 별, URL 별로 파이어폭스 탭에 연결할지 아니면 맨 앞에 있는 창(window)으로 실행되는 파이어폭스의 활성 탭에 연결할지 지정|
|Initial URL|No|텍스트 값(Text value)||웹 브라우저가 실행될 때 방문 할 웹 사이트의 URL을 입력|
|Tab title|No|텍스트 값(Text value)||추가할 파이어폭스 탭의 제목(또는 그 일부)을 입력|
|Tab URL|No|텍스트 값(Text value)||추가할 파이어폭스 탭의 URL(또는 그 일부)을 입력|
|Window state|N/A|일반, 최대화, 최소화|일반|브라우저 실행시 창을 일반, 최대화된 상태의 최소화 등 여부를 지정|
|Clear cache|N/A|부울 값(Boolean value)|False|웹 브라우저를 시작한 직후 웹 브라우저의 전체 캐시를 지울지 여부를 지정|
|Clear cookies|N/A|부울 값(Boolean value)|False|웹 브라우저를 실행 한 직후 웹 브라우저에 저장된 모든 쿠키를 삭제할지 여부를 지정|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|초기 웹 페이지를 로드하는 동안 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|Browser|웹 브라우저 인스턴스|웹 자동화 작업에 사용할 파이어폭스 인스턴스|


##### <a name="launchfirefoxbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to launch Firefox|파이어폭스 실행에 문제가 있음을 표시|
|Invalid URL|제공된 URL이 유효하지 않음을 표시|

### <a name="launchchromebase"></a> 새 크롬 실행하기
웹 사이트 및 웹 애플리케이션 자동화를 위해 크롬 새 인스턴스를 실행하거나 실행중인 인스턴스에 연결

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|자동화 브라우저 실행, 새 크롬 실행, 실행중인 크롬 연결|자동화 브라우저 실행|자동화 브라우저 또는 크롬의 새 인스턴스를 시작할지 아니면 기존 인스턴스에 연결할지 지정.|
|Attach to Chrome tab|N/A|이름 별, URL 별, 앞에 있는 창(window) 사용|이름 별|제목 별, URL 별로 크롬 탭에 연결할지 아니면 맨 앞에 있는 창(window)으로 실행되는 크롬의 활성 탭에 연결할지 지정|
|Initial URL|No|텍스트 값(Text value)||웹 브라우저가 실행될 때 방문 할 웹 사이트의 URL을 입력|
|Tab title|No|텍스트 값(Text value)||추가할 크롬 탭의 제목(또는 그 일부)을 입력|
|Tab URL|No|텍스트 값(Text value)||추가할 크롬 탭의 URL(또는 그 일부)을 입력|
|Window state|N/A|일반, 최대화, 최소화|일반|브라우저 실행시 창을 일반, 최대화된 상태의 최소화 등 여부를 지정|
|Clear cache|N/A|부울 값(Boolean value)|False|웹 브라우저를 시작한 직후 웹 브라우저의 전체 캐시를 지울지 여부를 지정|
|Clear cookies|N/A|부울 값(Boolean value)|False|웹 브라우저를 실행 한 직후 웹 브라우저에 저장된 모든 쿠키를 삭제할지 여부를 지정|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|초기 웹 페이지를 로드하는 동안 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|Browser|웹 브라우저 인스턴스|웹 자동화 작업에 사용할 크롬 인스턴스|


##### <a name="launchchromebase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to launch Chrome|크롬 실행에 문제가 있음을 표시|
|Invalid URL|제공된 URL이 유효하지 않음을 표시|

### <a name="launchedgebase"></a> 새 엣지 실행하기
웹 사이트 및 웹 애플리케이션 자동화를 위해 엣지 새 인스턴스를 실행하거나 실행중인 인스턴스에 연결

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|자동화 브라우저 실행, 새 엣지 실행, 실행중인 엣지 연결|자동화 브라우저 실행|자동화 브라우저 또는 엣지의 새 인스턴스를 시작할지 아니면 기존 인스턴스에 연결할지 지정.|
|Attach to Edge tab|N/A|이름 별, URL 별, 앞에 있는 창(window) 사용|이름 별|제목 별, URL 별로 엣지 탭에 연결할지 아니면 맨 앞에 있는 창(window)으로 실행되는 엣지의 활성 탭에 연결할지 지정|
|Initial URL|No|텍스트 값(Text value)||웹 브라우저가 실행될 때 방문 할 웹 사이트의 URL을 입력|
|Tab title|No|텍스트 값(Text value)||추가할 엣지 탭의 제목(또는 그 일부)을 입력|
|Tab URL|No|텍스트 값(Text value)||추가할 엣지 탭의 URL(또는 그 일부)을 입력|
|Window state|N/A|일반, 최대화, 최소화|일반|브라우저 실행시 창을 일반, 최대화된 상태의 최소화 등 여부를 지정|
|Clear cache|N/A|부울 값(Boolean value)|False|웹 브라우저를 시작한 직후 웹 브라우저의 전체 캐시를 지울지 여부를 지정|
|Clear cookies|N/A|부울 값(Boolean value)|False|웹 브라우저를 실행 한 직후 웹 브라우저에 저장된 모든 쿠키를 삭제할지 여부를 지정|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|초기 웹 페이지를 로드하는 동안 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|Browser|웹 브라우저 인스턴스|웹 자동화 작업에 사용할 엣지 인스턴스|


##### <a name="launchedgebase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to launch Edge|엣지 실행에 문제가 있음을 표시|
|Invalid URL|제공된 URL이 유효하지 않음을 표시|

### <a name="createnewtabbase"></a> 새 탭 만들기
새 탭을 만들고 지정된 URL로 이동(엣지, 크롬, 파이어폭스에서 지원)

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|URL to navigate to|No|텍스트 값(Text value)||탐색할 URL 또는 URL이 포함된 변수를 입력|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|웹 페이지를 로드하는 동안 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|NewBrowser|웹 브라우저 인스턴스|웹 자동화 작업에 사용할 새 브라우저 인스턴스|


##### <a name="createnewtabbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Invalid URL|제공된 URL이 유효하지 않음을 표시|
|Failed to create a new tab|새 탭 만들기에 문제가 있음을 표시|

### <a name="gotowebpagebase"></a> 웹 페이지로 이동하기
웹 브라우저에서 새 페이지로 이동

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|Navigate|N/A|URL, 뒤로, 앞으로, 웹 페이지 다시 싣기|URL로|이동할 위치 지정|
|URL|No|텍스트 값(Text value)||이동할 URL 입력|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|웹 페이지를 로드하는 동안 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="gotowebpagebase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to navigate to web page|지정된 웹 페이지로 이동에 문제 있음을 표시|
|Invalid URL|제공된 URL이 유효하지 않음을 표시|

### <a name="clickbase"></a> 웹 페이지에서 링크 클릭하기
웹 페이지의 링크 또는 다른 요소를 클릭

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||클릭할 웹 피이지의 UI 요소를 선택|
|Wait for page to load|N/A|부울 값(Boolean value)|True|진행하기 전에 새 웹 페이지가 완전히 실릴 때까지 기다릴 지 여부를 지정|
|If a pop-up dialog appears|N/A|닫기, 버튼 누르기, 아무 것도 하지 않기|아무 것도 하지 않기|링크 클릭 후 팝업 대화 상자가 나타나는 경우 수행 할 작업 지정|
|Dialog button to press|Yes|텍스트 값(Text value)|OK|팝업 창이 열리면 해당 다이얼로그 창 닫기 버튼을 누름|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="clickbase_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Element with specified CSS selector not found|지정된 CSS 선택자가 있는 웹 페이지 요소를 찾을 수 없음을 표시|
|Failed to click UI element|지정된 요소를 클릭하는데 문제가 있음을 표시|

### <a name="clickdownloadlink"></a> 웹 페이지에서 내려받기 링크 클릭하기
웹 페이지에서 파일을 다운로드하는 링크를 클릭

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤||클릭할 웹 피이지의 UI 요소를 선택|
|Destination folder|No|폴더||다운로드 한 파일을 저장할 폴더의 전체 경로 또는 폴더를 포함하는 변수를 입력하거나 선택|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|DownloadedFile|파일|다운로드가 저장된 디스크의 파일. 해당 파일 경로는 웹 서버에서 제공 한 파일 이름을 더해 지정한 다운로드 폴더로 구성|


##### <a name="clickdownloadlink_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to download file|지정된 파일을 내려받는 데 문제가 있음을 표시|
|Element with specified CSS selector not found|지정된 CSS 선택자가 있는 웹 페이지 요소를 찾을 수 없음을 표시|
|Failed to click UI element|지정된 요소를 클릭하는 데 문제가 있음을 표시|
|Failed to save file|지정된 파일을 저장하는 데 문제가 있음을 표시|

### <a name="executejavascript"></a> 웹 페이지에서 자바스크립트 함수 실행하기
웹 페이지에서 JavaScript 함수를 실행하고 반환 된 결과를 획득

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|JavaScript function|Yes|Text value|function ExecuteScript() { /*your code here, return something (optionally); */ }|웹 페이지에서 실행할 JavaScript 함수를 입력|


##### 생성된 변수들
|인수(Argument)|형태(Type)|설명(Description)|
|-----|-----|-----|
|Result|텍스트 값(Text value)|자바스크립트 함수 실행 결과|


##### <a name="executejavascript_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to run JavaScript|자바스크립트 실행에 문제가 있음을 표시|

### <a name="hoveroverelement"></a> 웹 페이지에서 요소 위에 마우스 올려놓기
웹 페이지 요소 위에 마우스를 올려놓기

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|
|UI element|No|웹 컨트롤|웹 페이지에서 마우스를 올려놓을 UI 요소를 선택|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="hoveroverelement_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to hover over element|지정된 요소에 마우스 올려놓기에 실패했음을 표시|

### <a name="closewebbrowser"></a> 웹 브라우저 닫기
웹 브라우저 창을 닫기

##### 입력 매개변수(Parameters)
|인수(Argument)|선택사항(Optional)|받는 값(Accepts)|기본 값(Default Value)|설명(Description)|
|-----|-----|-----|-----|-----|
|Web browser instance|No|웹 브라우저 인스턴스||작업 할 웹 브라우저 인스턴스가 포함 된 변수를 입력하거나 선택|


##### 생성된 변수들
- 이 작업에서는 변수 생성이 없음

##### <a name="closewebbrowser_onerror"></a> 예외들
|예외|설명|
|-----|-----|
|Failed to close the web browser|웹 브라우저 닫는 데 문제 있음을 표시|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]