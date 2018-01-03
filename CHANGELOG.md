PayPal Ruby SDK release notes
=============================

v1.7.2
------
  * Remove logging of unknown fields.
  * Fix issue with `require net/http` [#331](https://github.com/paypal/PayPal-Ruby-SDK/pull/331). Thanks Borzik.

v1.7.1
------
  * Use `NET` library to fetch webhook ceritifcate. Thanks Kramer.

v1.7.0
------
  * Add `invoice_address` field on Invoice's BillingInfo and ShippingInfo types [#322](https://github.com/paypal/PayPal-Ruby-SDK/pull/322) and [#326](https://github.com/paypal/PayPal-Ruby-SDK/pull/326).
  * Fix issue with capitalization for encType in Links attribute [#314](https://github.com/paypal/PayPal-Ruby-SDK/issues/314).

v1.6.1
------
  * Fix issue with wrong method declared for `WebhookEvent.find` and `WebHookEvent.all` [#270](https://github.com/paypal/PayPal-Ruby-SDK/pull/270) and [#306](https://github.com/paypal/PayPal-Ruby-SDK/pull/306).
  * Fix issue with invalid JSON handling. [#302](https://github.com/paypal/PayPal-Ruby-SDK/issues/302).
  * Fix issue with missing `ResourceInvalid` type [#298](https://github.com/paypal/PayPal-Ruby-SDK/issues/298).
  * Fix issue with `ErrorHash.convert` for nested hashes [#257](https://github.com/paypal/PayPal-Ruby-SDK/issues/257).
  * Update code to find PayPal approval redirect URL using relationship identifier instead of by method.

v1.6.0
------
  * Update Payments API for latest schema [#246](https://github.com/paypal/PayPal-Ruby-SDK/pull/246).
  * Changed no method found log to debug [#245](https://github.com/paypal/PayPal-Ruby-SDK/pull/245).

v1.5.0
------
  * Update Payments Experience API for latest schema [#242](https://github.com/paypal/PayPal-Ruby-SDK/pull/242).
  * Update Webhooks for latest schema [#238](https://github.com/paypal/PayPal-Ruby-SDK/pull/238).
  * Flatten error hashes [#240](https://github.com/paypal/PayPal-Ruby-SDK/pull/240).
  * Use SecureRandom instead of uuidtools [#237](https://github.com/paypal/PayPal-Ruby-SDK/pull/237).
  * Update Invoicing Templates for latest schema [#235](https://github.com/paypal/PayPal-Ruby-SDK/pull/235).
  * Update OpenID Connect signin URL [#225](https://github.com/paypal/PayPal-Ruby-SDK/pull/225).

v1.4.9
------
  * Use String.force_encoding to force conversion to UTF-8 [#220](https://github.com/paypal/PayPal-Ruby-SDK/pull/220).
  * Fix WebProfile GET/retrieve to return a WebProfile instance [#219](https://github.com/paypal/PayPal-Ruby-SDK/pull/219).

v1.4.8
------
  * Added (optional) exception raising on API errors [#216](https://github.com/paypal/PayPal-Ruby-SDK/pull/216).
  * Use UTF-8 as the character set when generating CRC32 checksum when validating webhook events [#215](https://github.com/paypal/PayPal-Ruby-SDK/pull/215).
  * Added Payment convenience methods [#212](https://github.com/paypal/PayPal-Ruby-SDK/pull/212).

v1.4.7
------
  * Enabled third party invoicing for all invoicing API operations [#209](https://github.com/paypal/PayPal-Ruby-SDK/pull/209).
  
v1.4.6
------
  * Enabled Third Party Invoicing [#204](https://github.com/paypal/PayPal-Ruby-SDK/pull/204).
  * Enable Passing Custom Headers [#197](https://github.com/paypal/PayPal-Ruby-SDK/pull/197).

v1.4.5
------
  * Log error responses in live mode [#192](https://github.com/paypal/PayPal-Ruby-SDK/pull/192).
  * Fixed patch_requests by Array in update method of CreditCard [#193](https://github.com/paypal/PayPal-Ruby-SDK/pull/193).

v1.4.4
------
  * Update on Invoicing API changes [#189](https://github.com/paypal/PayPal-Ruby-SDK/pull/189).

v1.4.3
------
  * Fix issue where uninitialized constant PayPal::SDK::Core::API::Merchant occurs for merchant-sdk-ruby issue [#184](https://github.com/paypal/PayPal-Ruby-SDK/issues/184).

v1.4.2
------
  * Fix test category [#178](https://github.com/paypal/PayPal-Ruby-SDK/issues/178).
  * Delete code irrelevant to REST APIs [#179](https://github.com/paypal/PayPal-Ruby-SDK/issues/179).
  * Fix OpenSSL::X509::StoreError: system lib error for webhook validation [#170](https://github.com/paypal/PayPal-Ruby-SDK/issues/170).
  * Fix incorrect warning message when using DEBUG logging on live [#182](https://github.com/paypal/PayPal-Ruby-SDK/pull/182).

v1.4.1
------
  * Fix Webhook common name verification.

v1.4.0
------
  * Fix CreditCard.update().
  * Payment API support.
  * Updated TLS warning message.

v1.3.4
------
  * Fix payment.update() [#163](https://github.com/paypal/PayPal-Ruby-SDK/issues/163).
  * Include openssl version in user-agent header.
  * Add TLS v1.2 support.

v1.3.3
------
  * Added failover for capturing debug ID.
  * Enabled verbose payload logging [#146](https://github.com/paypal/PayPal-Ruby-SDK/issues/146).
  * Removed `time_updated` field in agreement_transaction per [API change](https://developer.paypal.com/webapps/developer/docs/api/#agreementtransaction-object).
  * Removed `payment_details` field in invoice per [API change](https://developer.paypal.com/webapps/developer/docs/api/#invoice-object).
  * Added `payment_options` field to Transaction per [API change](https://developer.paypal.com/webapps/developer/docs/api/#transaction-object).
  * Added secure logging to avoid logging confidential data (e.g., credit card number).
 
v1.3.2
------
  * Fixed webprofile.create().
  * Fixed webprofile.get_list().
  * Updated webprofile test cases.

v1.3.1
------
  * Added CreditCard list() support.
  * Added request/response body debugging statements.
  * Fixed future payment support, moved sample code, and added docs [#137](https://github.com/paypal/PayPal-Ruby-SDK/issues/137).

v1.3.0 - June 30, 2015
----------------------
  * Added Webhook validation.

v1.2.2 - June 17, 2015
---------------------
  * Fixed NameError due to underscore in variable name.
  * Fixed Vault endpoints.

v1.2.1 - May 21, 2015
--------------------
  * Paypal-Debug-Id printed for any exception.

v1.2.0 - March 3, 2015
----------------------
  * Webhook management API support added.

v1.1.2 - March 3, 2015
----------------------
  * Updated payment data models.

v1.1.1 - February 5, 2015
-------------------------
  * Packaged paypal cert in gem.

v1.1.0 - February 4, 2015
------------------------
  * Added Payouts support.
  * Improved sample page layout.

v1.0.0 - January 27, 2015
-----------------------
  * Merged sdk-core-ruby with paypal-ruby-sdk.

v0.10.0 - January 7, 2015
------------------------
  * Added subscription (billing plan and agreement) support.

v0.9.1 - December 19, 2014
-------------------------
  * Separated out extended data types (future payment).

v0.9.0 - December 15, 2014
-------------------------
  * Added payment-experience (web profiles) support.
  * Added test execution guide.

v0.8.0 - December 11, 2014
-------------------------
  * Added order/auth/capture support.
  * Grouped tests in 2 categories: unit tests, integration(functional) tests.
  * Disabled some tests that involve manual steps (e.g., log in to PayPal website).

v0.7.3 - November 21, 2014
-------------------------
  * Changed Correlation ID header for future payment.
  * Added data model for Order/Auth/Capture.

v0.7.2 - October 20, 2014
------------------------
  * Added Order support.

v0.7.1 - October 8, 2014
-----------------------
  * Added Auth support.

v0.7.0 - July 1, 2014
--------------------
  * Added future payment support.

v0.6.1 - Apr 04, 2014
--------------------
  * Added support for Invoice APIs.

v0.6.0 - May 30, 2013
--------------------
  * Added support for Auth and Capture APIs.

v0.5.1 - Apr 26, 2013
--------------------
  * Update core version to 0.2.3 for OpenID Connect.

v0.5.0 - Mar 07, 2013
--------------------
  * Initial Release.
