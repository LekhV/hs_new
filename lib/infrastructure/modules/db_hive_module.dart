import 'package:flutter_hs/data/db_hive/db_hive_repository_impl.dart';
import 'package:flutter_hs/domain/db_hive/db_hive_repository.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../api/db_hive/dtos/card_dto.dart';
import '../../api/db_hive/dtos/collection_card_dto.dart';
import '../../api/db_hive/dtos/collection_model_dto.dart';

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
