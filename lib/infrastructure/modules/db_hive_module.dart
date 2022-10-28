import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../api/collections/db_hive/dtos/card_dto.dart';
import '../../api/collections/db_hive/dtos/collection_card_dto.dart';
import '../../api/collections/db_hive/dtos/collection_model_dto.dart';

import '../../data/collectios/db_hive/db_hive_repository_impl.dart';
import '../../domain/collections/db_hive/db_hive_repository.dart';

@module
abstract class DBHiveModule {
  @lazySingleton
  DBHiveRepository getDBHiveRepository() {
    Hive.registerAdapter(CardDTOAdapter());
    Hive.registerAdapter(CollectionCardDTOAdapter());
    Hive.registerAdapter(CollectionModelDTOAdapter());

    return DBHiveRepositoryImpl();
  }
}
