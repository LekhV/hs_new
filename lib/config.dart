import 'package:injectable/injectable.dart';

@singleton
class AppConfig {
  String baseUrl = 'https://omgvamp-hearthstone-v1.p.rapidapi.com/';

  String get mainImgHs => _mainImgHs;
  final String _mainImgHs =
      'https://static.wikia.nocookie.net/hearthstone_gamepedia/images/2/25/Hearthstone_Heroes_of_Warcraft_logo.png/revision/latest/scale-to-width-down/800?cb=20181203195754';

  String mainCollection = 'Users3';
}

final AppConfig config = AppConfig();
