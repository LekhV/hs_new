import 'package:shared_preferences/shared_preferences.dart';

class PersistStorage {
  PersistStorage() {
    initStorage();
  }

  SharedPreferences? _prefs;

  Future<void> initStorage() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print('Error whe try to init storage $e');
    }
  }

  Future<void> setStringForKey(String key, String data) async {
    if (_prefs == null) {
      await initStorage();
    }

    await _prefs!.setString(key, data);
  }

  Future<String?> getStringForKey(String key) async {
    if (_prefs == null) {
      await initStorage();
    }

    return _prefs!.getString(key);
  }
}

final PersistStorage persistStorage = PersistStorage();

const String PREFERENCES_CARDBACK = '@feb_cardback';
const String USER_TOKEN = '@user_token';
