import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import '../version1/AccountsNullClientV1.dart';
import '../version1/AccountsDirectClientV1.dart';
import '../version1/AccountsHttpClientV1.dart';

class AccountsClientFactory extends Factory {
  static final NullClientDescriptor =
      Descriptor('pip-services-accounts', 'client', 'null', '*', '1.0');
  static final DirectClientDescriptor =
      Descriptor('pip-services-accounts', 'client', 'direct', '*', '1.0');
  static final HttpClientDescriptor =
      Descriptor('pip-services-accounts', 'client', 'http', '*', '1.0');

  AccountsClientFactory() : super() {
    registerAsType(
        AccountsClientFactory.NullClientDescriptor, AccountsNullClientV1);
    registerAsType(
        AccountsClientFactory.DirectClientDescriptor, AccountsDirectClientV1);
    registerAsType(
        AccountsClientFactory.HttpClientDescriptor, AccountsHttpClientV1);
  }
}
