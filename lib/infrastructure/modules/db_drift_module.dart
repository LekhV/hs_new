import 'package:injectable/injectable.dart';

import '../../data/collectios/db_drift/db_drift_repository_impl.dart';
import '../../domain/collections/db_drift/db_drift_repository.dart';

@module
abstract class DBDriftModule {
  @lazySingleton
  DBDriftRepository getDBDriftRepository() {
    return DBDriftRepositoryImpl();
  }
}
