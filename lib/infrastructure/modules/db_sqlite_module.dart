import 'package:injectable/injectable.dart';

import '../../data/collectios/db_sqlite/db_sqlite_repository_impl.dart';
import '../../domain/collections/db_sqlite/db_sqlite_repository.dart';

@module
abstract class DBSQLiteModule {
  @lazySingleton
  DBSQLiteRepository getDBSQLiteRepository() {
    return DBSQLiteRepositoryImpl();
  }
}
