import 'dart:async';
import 'package:test/test.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services_accounts/pip_services_accounts.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_accounts/pip_clients_accounts.dart';
import './AccountsClientFixtureV1.dart';

void main() {
  group('AccountsDirectClientV1', () {
    AccountsDirectClientV1 client;
    AccountsClientFixtureV1 fixture;
    AccountsMemoryPersistence persistence;
    AccountsController controller;

    setUp(() async {
      var logger = ConsoleLogger();
      persistence = AccountsMemoryPersistence();
      controller = AccountsController();
      var references = References.fromTuples([
        Descriptor('pip-services', 'logger', 'console', 'default', '1.0'),
        logger,
        Descriptor('pip-services-accounts', 'persistence', 'memory',
            'default', '1.0'),
        persistence,
        Descriptor('pip-services-accounts', 'controller', 'default',
            'default', '1.0'),
        controller
      ]);
      controller.setReferences(references);

      client = AccountsDirectClientV1();
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
