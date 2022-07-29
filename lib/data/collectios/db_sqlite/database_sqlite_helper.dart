import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseSQLiteHelper {
  final _databaseName = '19hs_collections.db';
  final _databaseVersion = 1;

  final _cardsTableName = 'Cards';
  final _collectionsTableName = 'Collections';

  final _id = 'id';
  final _nameCollection = 'nameCollection';
  final _heroType = 'heroType';
  final _collectionCardsLenght = 'collectionCardsLenght';

  final _collectionCardId = 'collectionCardId';
  final _collectionModelId = 'collectionModelId';

  final _cardId = 'cardId';
  final _dbfId = 'dbfId';
  final _name = 'name';
  final _cardSet = 'cardSet';
  final _type = 'type';
  final _faction = 'faction';
  final _rarity = 'rarity';
  final _cost = 'cost';
  final _attack = 'attack';
  final _health = 'health';
  final _text = 'text';
  final _flavor = 'flavor';
  final _artist = 'artist';
  final _collectible = 'collectible';
  final _elite = 'elite';
  final _playerClass = 'playerClass';
  final _img = 'img';
  final _imgGold = 'imgGold';
  final _locale = 'locale';

  String get cardsTableName => _cardsTableName;
  String get collectionsTableName => _collectionsTableName;

  String get id => _id;
  String get nameCollection => _nameCollection;
  String get heroType => _heroType;
  String get collectionCardsLenght => _collectionCardsLenght;
  String get collectionCardId => _collectionCardId;
  String get collectionModelId => _collectionModelId;
  String get cardId => _cardId;
  String get dbfId => _dbfId;
  String get name => _name;
  String get cardSet => _cardSet;
  String get type => _type;
  String get faction => _faction;
  String get rarity => _rarity;
  String get cost => _cost;
  String get attack => _attack;
  String get health => _health;
  String get text => _text;
  String get flavor => _flavor;
  String get artist => _artist;
  String get collectible => _collectible;
  String get elite => _elite;
  String get playerClass => _playerClass;
  String get img => _img;
  String get imgGold => _imgGold;
  String get locale => _locale;

  Future<Database> _initDataBase() async {
    void _createDB(Database db, int version) async {
      await db.execute(
          'CREATE TABLE $collectionsTableName( $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,  $nameCollection TEXT NOT NULL UNIQUE,  $heroType TEXT,  $collectionCardsLenght INT)');

      await db.execute(
          'CREATE TABLE $cardsTableName( $collectionCardId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,  $collectionModelId INT,  $cardId TEXT,  $dbfId TEXT,  $name TEXT,  $cardSet TEXT,  $type TEXT,  $faction TEXT,  $rarity TEXT,  $cost INT,  $attack INT,  $health INT,  $text TEXT,  $flavor TEXT,  $artist TEXT,  $collectible INT,  $elite INT,  $playerClass TEXT,  $img TEXT,  $imgGold  TEXT,  $locale TEXT)');
    }

    return openDatabase(
      // join(await getDatabasesPath(), '16hs_collections.db'),
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return _createDB(db, _databaseVersion);
      },
      version: _databaseVersion,
    );
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDataBase();
    return _database!;
  }
}

final DatabaseSQLiteHelper sqliteHelper = DatabaseSQLiteHelper();
