import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import './AccountV1.dart';
import './IAccountsClientV1.dart';

class AccountsDirectClientV1 extends DirectClient<dynamic>
    implements IAccountsClientV1 {
  AccountsDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-services-accounts', 'controller', '*', '*', '1.0'));
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
    var timing = instrument(correlationId, 'accounts.get_accounts');
    var page = await controller.getAccounts(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  /// Gets an account by its unique id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [id]                an id of account to be retrieved.
  /// Return         Future that receives account or error.
  @override
  Future<AccountV1> getAccountById(String correlationId, String id) async {
    var timing = instrument(correlationId, 'accounts.get_account_by_id');
    var account = await controller.getAccountById(correlationId, id);
    timing.endTiming();
    return account;
  }

  /// Gets an account by its login.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [login]                a login of account to be retrieved.
  /// Return         Future that receives account or error.
  @override
  Future<AccountV1> getAccountByLogin(
      String correlationId, String login) async {
    var timing = instrument(correlationId, 'accounts.get_account_by_login');
    var account = await controller.getAccountById(correlationId, login);
    timing.endTiming();
    return account;
  }

  /// Gets an account by its unique id or login.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [idOrLogin]                an unique id or login of account to be retrieved.
  /// Return         Future that receives account or error.
  @override
  Future<AccountV1> getAccountByIdOrLogin(
      String correlationId, String idOrLogin) async {
    var timing =
        instrument(correlationId, 'accounts.get_account_by_id_or_login');
    var account = await controller.getAccountById(correlationId, idOrLogin);
    timing.endTiming();
    return account;
  }

  /// Creates an account.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [account]              an account to be created.
  /// Return         (optional) Future that receives created account or error.
  @override
  Future<AccountV1> createAccount(
      String correlationId, AccountV1 account) async {
    var timing = instrument(correlationId, 'accounts.create_account');
    var result = await controller.createAccount(correlationId, account);
    timing.endTiming();
    return result;
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
    var timing = instrument(correlationId, 'accounts.update_account');
    var result = await controller.updateAccount(correlationId, account);
    timing.endTiming();
    return result;
  }

  /// Deleted an account by it's unique id.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [id]                an id of the account to be deleted
  /// Return                Future that receives deleted account
  /// Throws error.
  @override
  Future<AccountV1> deleteAccountById(String correlationId, String id) async {
    var timing = instrument(correlationId, 'accounts.delete_account_by_id');
    var account = await controller.deleteAccountById(correlationId, id);
    timing.endTiming();
    return account;
  }
}
