import 'models/card_by_params.dart';

abstract class CardsRepository {
  Future<List<CardByParams>> fetchCardByParams(String params);
  Future<List<CardByParams>> fetchCardByCost(String params, List<int> selectedCoins);
  Future<CardByParams> fetchCardDetails(String id);
}
