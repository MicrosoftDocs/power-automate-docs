## Frequently Asked Questions

#### Requirements

###### If I am not an ISV, can I still build a connector?
To release a connector publicly, we require that you either own the underlying service or present explicit rights to use the APIs.

###### Can I build a connector without REST APIs ?
No. In order to build a custom connector, you are required to support stable HTTP REST APIs for your service.

###### What are the supported authentication types ?
We support the following standards of authentication:
  - OAuth2.0 (includes Azure Active Directory)
  - API Key
  - Basic Authentication

#### Triggers

###### Can I build triggers without Webhooks ? 
Custom connectors allow you to build Webhook based triggers only.
If you have a request for other forms of implementation, please contact [condevhelp@microsoft.com](mailto:condevhelp@microsoft.com) along with more details about your API.

#### Miscellaneous

###### My APIs use a dynamic host. How do I implement this in the OpenAPI ?
Custom connector feature in Flow does not support dynamic hosts. Please use a static host for development and testing purposes. During submission, request your Microsoft contact for more details about the dynamic implementation.

###### Do you support Postman Collection V2 ?
No, Postman V2 is currently unsupported.

###### Do you support OpenAPI 3.0 ?
No, OpenAPI 2.0 is currently the only supported version.