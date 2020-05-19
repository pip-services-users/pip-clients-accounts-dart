# <img src="https://github.com/pip-services/pip-services/raw/master/design/Logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br> User Accounts Microservice Client SDK for Dart

This is a Dart client SDK for [pip-services-accounts](https://github.com/pip-services-users/pip-services-accounts-dart) microservice.

## Download

Right now the only way to get the microservice is to check it out directly from github repository
```bash
git clone git@github.com:pip-services-users/pip-clients-accounts-dart.git
```

Pip.Service team is working to implement packaging and make stable releases available for your 
as zip downloadable archieves.

## Contract

Logical contract of the microservice is presented below. For physical implementation (HTTP/REST),
please, refer to documentation of the specific protocol.

```dart
class AccountV1 implements IStringIdentifiable {
  /* Identification */
  String id;
  String login;
  String name;
  
  /* Activity tracking */
  DateTime create_time;
  bool deleted;
  bool active;

  /* User preferences */
  String about;
  String time_zone;
  String language;
  String theme;

  /* Custom fields */
  var custom_hdr;
  var custom_dat;
}

abstract class IAccountsV1 {
  Future<DataPage<AccountV1>> getAccounts(
      String correlationId, FilterParams filter, PagingParams paging);

  Future<AccountV1> getAccountById(String correlationId, String id);

  Future<AccountV1> getAccountByLogin(String correlationId, String login);

  Future<AccountV1> getAccountByIdOrLogin(String correlationId, String idOrLogin);

  Future<AccountV1> createAccount(String correlationId, AccountV1 account);

  Future<AccountV1> updateAccount(String correlationId, AccountV1 account);

  Future<AccountV1> deleteAccountById(String correlationId, String accountId);
}
```

## Use

The easiest way to work with the microservice is to use client SDK. 

Define client configuration parameters that match the configuration of the microservice's external API
```dart
// Client configuration
var httpConfig = ConfigParams.fromTuples(
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
);
```

Instantiate the client and open connection to the microservice
```dart
// Create the client instance
var client = AccountsHttpClientV1(config);

// Configure the client
client.configure(httpConfig);

// Connect to the microservice
try{
  await client.open(null)
}catch() {
  // Error handling...
}       
// Work with the microservice
// ...
```

Now the client is ready to perform operations
```dart
// Create a new account
final ACCOUNT = AccountV1(
    id: '1',
    login: 'user1@conceptual.vision',
    name: 'Test User 1',
    deleted: false
);

    // Create the account
    try {
      var account = await client.createAccount('123', ACCOUNT);
      // Do something with the returned account...
    } catch(err) {
      // Error handling...     
    }
```

```dart
// Get the account
try {
var account = await client.getAccountByLogin(
    null,
    'somebody@somewhere.com');
    // Do something with account...

    } catch(err) { // Error handling}
```

## Acknowledgements

This microservice was created and currently maintained by
- **Sergey Seroukhov**.
- **Nuzhnykh Egor**
