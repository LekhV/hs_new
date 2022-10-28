import 'package:hive_flutter/hive_flutter.dart';

class DatabaseHiveHelper {
  //final _hiveCollection = 'CollectionsHSs';

  final _hiveCollection = 'newsCollectionHS';
  Future<Box<dynamic>> _initDataBase() async {
    return Hive.openBox(_hiveCollection);
  }

  Box<dynamic>? _box;

  Future<Box<dynamic>> get hiveBox async {
    if (_box != null) return _box!;
    _box = await _initDataBase();
    return _box!;
  }
}

final DatabaseHiveHelper hiveHelper = DatabaseHiveHelper();
