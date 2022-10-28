import 'package:injectable/injectable.dart';

import '../../data/collectios/db_realm/db_realm_repository_impl.dart';
import '../../domain/collections/db_realm/db_realm_repository.dart';

@module
abstract class DBRealmModule {
  @lazySingleton
  DBRealmRepository getDBSQLiteRepository() {
    return DBRealmRepositoryImpl();
  }
}
