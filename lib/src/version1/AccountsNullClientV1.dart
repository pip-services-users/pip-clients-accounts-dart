import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_accounts/pip_services_accounts.dart';
import './IAccountsClientV1.dart';

class AccountsNullClientV1 implements IAccountsClientV1 {
  @override
  Future<DataPage<AccountV1>> getAccounts(
      String correlationId, FilterParams filter, PagingParams paging) async {
    return DataPage<AccountV1>([], 0);
  }

  @override
  Future<AccountV1> getAccountById(String correlationId, String id) async {
    return null;
  }

  @override
  Future<AccountV1> getAccountByLogin(
      String correlationId, String login) async {
    return null;
  }

  @override
  Future<AccountV1> getAccountByIdOrLogin(
      String correlationId, String idOrLogin) async {
    return null;
  }

  @override
  Future<AccountV1> createAccount(String correlationId, AccountV1 account) {
    return null;
  }

  @override
  Future<AccountV1> updateAccount(String correlationId, AccountV1 account) {
    return null;
  }

  @override
  Future<AccountV1> deleteAccountById(String correlationId, String id) {
    return null;
  }
}
