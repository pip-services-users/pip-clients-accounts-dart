import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'package:pip_clients_accounts/pip_clients_accounts.dart';

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

class AccountsClientFixtureV1 {
  IAccountsClientV1 _client;

  AccountsClientFixtureV1(IAccountsClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testCrudOperations() async {
    AccountV1 account1, account2;

    // Create the first account
    account1 = await _client.createAccount(null, ACCOUNT1);
    expect(account1, isNotNull);
    expect(ACCOUNT1.name, account1.name);
    expect(ACCOUNT1.login, account1.login);

    // Create the second account
    account2 = await _client.createAccount(null, ACCOUNT2);
    expect(account2, isNotNull);
    expect(ACCOUNT2.name, account2.name);
    expect(ACCOUNT2.login, account2.login);

    // Get all accounts
    var page = await _client.getAccounts(null, FilterParams(), PagingParams());
    expect(page, isNotNull);
    expect(page.data.length, 2);

    var account = await _client.getAccountByIdOrLogin(null, ACCOUNT1.login);
    expect(account, isNotNull);
    expect(ACCOUNT1.name, account.name);
    expect(ACCOUNT1.login, account.login);

    // Update the account
    account1.name = 'Updated Account 1';

    account = await _client.updateAccount(null, account1);
    expect(account, isNotNull);
    expect(account1.login, account.login);
    expect('Updated Account 1', account.name);

    // Delete the account
    account = await _client.deleteAccountById(null, account1.id);
    expect(account, isNotNull);
    expect(account1.id, account.id);

    // Try to get deleted account
    account = await _client.getAccountById(null, account1.id);
    expect(account, isNotNull);
    expect(account1.id, account.id);
    expect(account.deleted, isTrue);
  }
}
