import 'dart:async';
import 'dart:convert';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_accounts/pip_services_accounts.dart';
import './IAccountsClientV1.dart';

class AccountsHttpClientV1 extends CommandableHttpClient
    implements IAccountsClientV1 {
  AccountsHttpClientV1([config]) : super('v1/accounts') {
    if (config != null) {
      configure(ConfigParams.fromValue(config));
    }
  }

  /// Gets a page of accounts retrieved by a given filter.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [filter]            (optional) a filter function to filter items
  /// - [paging]            (optional) paging parameters
  /// Return         Future that receives a data page
  /// Throws error.
  @override
  Future<DataPage<AccountV1>> getAccounts(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var result = await callCommand(
      'get_accounts',
      correlationId,
      {'filter': filter, 'paging': paging},
    );
    return DataPage<AccountV1>.fromJson(json.decode(result), (item) {
      var account = AccountV1();
      account.fromJson(item);
      return account;
    });
  }

  /// Gets an account by its unique id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [id]                an id of account to be retrieved.
  /// Return         Future that receives account or error.
  @override
  Future<AccountV1> getAccountById(String correlationId, String id) async {
    var result = await callCommand(
        'get_account_by_id', correlationId, {'account_id': id});
    if (result == null) return null;
    var item = AccountV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Gets an account by its login.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [login]                a login of account to be retrieved.
  /// Return         Future that receives account or error.
  @override
  Future<AccountV1> getAccountByLogin(
      String correlationId, String login) async {
    var result = await callCommand(
        'get_account_by_login', correlationId, {'login': login});
    if (result == null) return null;
    var item = AccountV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Gets an account by its unique id or login.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [idOrLogin]                an unique id or login of account to be retrieved.
  /// Return         Future that receives account or error.
  @override
  Future<AccountV1> getAccountByIdOrLogin(
      String correlationId, String idOrLogin) async {
    var result = await callCommand('get_account_by_id_or_login', correlationId,
        {'id_or_login': idOrLogin});
    if (result == null) return null;
    var item = AccountV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Creates an account.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [account]              an account to be created.
  /// Return         (optional) Future that receives created account or error.
  @override
  Future<AccountV1> createAccount(
      String correlationId, AccountV1 account) async {
    var result = await callCommand(
        'create_account', correlationId, {'account': account});
    if (result == null) return null;
    var item = AccountV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Updates an account.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [account]              an account to be updated.
  /// Return         (optional) Future that receives updated account
  /// Throws error.
  @override
  Future<AccountV1> updateAccount(
      String correlationId, AccountV1 account) async {
    var result = await callCommand(
        'update_account', correlationId, {'account': account});
    if (result == null) return null;
    var item = AccountV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Deleted an account by it's unique id.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [id]                an id of the account to be deleted
  /// Return                Future that receives deleted account
  /// Throws error.
  @override
  Future<AccountV1> deleteAccountById(String correlationId, String id) async {
    var result = await callCommand(
        'delete_account_by_id', correlationId, {'account_id': id});
    if (result == null) return null;
    var item = AccountV1();
    item.fromJson(json.decode(result));
    return item;
  }
}
