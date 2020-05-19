import 'dart:async';

import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_accounts/pip_clients_accounts.dart';
import './AccountsClientFixtureV1.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  8080
]);

void main() {
  group('AccountsHttpClientV1', () {
    AccountsHttpClientV1 client;
    AccountsClientFixtureV1 fixture;

    setUp(() async {
      client = AccountsHttpClientV1();
      client.configure(httpConfig);
      var references = References.fromTuples([
        Descriptor('pip-services-accounts', 'client', 'http', 'default', '1.0'),
        client
      ]);
      client.setReferences(references);
      fixture = AccountsClientFixtureV1(client);
      await client.open(null);
    });

    tearDown(() async {
      await client.close(null);
      await Future.delayed(Duration(milliseconds: 2000));
    });

    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
