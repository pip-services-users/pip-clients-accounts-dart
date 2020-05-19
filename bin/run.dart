import 'package:pip_clients_accounts/pip_clients_accounts.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

Future<void> main(List<String> argument) async {
  try {
    var correlationId = '123';
    var config = ConfigParams.fromTuples([
      'connection.type',
      'http',
      'connection.host',
      'localhost',
      'connection.port',
      8080
    ]);
    var client = AccountsHttpClientV1();
    client.configure(config);
    final ACCOUNT1 = AccountV1(
        id: '1',
        login: 'user1@conceptual.vision',
        name: 'Test User 1',
        deleted: false);
    final ACCOUNT2 = AccountV1(
        id: '2',
        login: 'user2@conceptual.vision',
        name: 'Test User 2',
        deleted: false);
    await client.open(correlationId);
    // Create 2 accounts
    await client.createAccount(correlationId, ACCOUNT1);
    await client.createAccount(correlationId, ACCOUNT2);
    var page = await client.getAccounts(null, null, null);
    if (page.data.length == 2) {
      print('Get accounts length: ' +
          page.data.length.toString() +
          '! Everything works well!');
    } else {
      print('Get accounts length: ' +
          page.data.length.toString() +
          ' is not equal! Something was wrong!');
    }
    // Delete all activities
    await client.deleteAccountById(correlationId, '1');
    await client.deleteAccountById(correlationId, '2');
    var del_account1 = await client.getAccountById(correlationId, '1');
    var del_account2 = await client.getAccountById(correlationId, '2');
    print('Deleted account 1 status: ' + del_account1.deleted.toString());
    print('Deleted account 2 status: ' + del_account2.deleted.toString());
    await client.close(correlationId);
  } catch (ex) {
    print(ex);
  }
}
