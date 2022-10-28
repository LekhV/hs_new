import 'dart:io';
import 'package:drift/drift.dart';
import 'package:flutter_hs/api/collections/db_drift/dtos/drift_collection_card_dto.dart';
import 'package:flutter_hs/api/collections/db_drift/dtos/drift_collection_model_dto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;

part 'database_drift_helper.g.dart';

class DriftHelper {
  final _databaseVersion = 1;

  int get databaseVersion => _databaseVersion;

  DatabaseDriftHelper? _database;

  Future<DatabaseDriftHelper> get database async {
    if (_database != null) return _database!;
    _database = DatabaseDriftHelper();
    return _database!;
  }
}

final DriftHelper driftHelper = DriftHelper();

@DriftDatabase(tables: [DriftCollectionCardDTO, DriftCollectionModelDTO])
class DatabaseDriftHelper extends _$DatabaseDriftHelper {
  DatabaseDriftHelper() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => driftHelper.databaseVersion;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, '2hs_database.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/2hs_database.db');
      final buffer = blob.buffer;
      await file.writeAsBytes(buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    return NativeDatabase(file);
  });
}
