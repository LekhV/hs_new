import 'package:flutter_hs/data/db_sqlite/db_sqlite_repository_impl.dart';
import 'package:flutter_hs/domain/db_sqlite/db_sqlite_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DBSQLiteModule {
  @lazySingleton
  DBSQLiteRepository getDBSQLiteRepository() {
    return DBSQLiteRepositoryImpl();
  }
}
