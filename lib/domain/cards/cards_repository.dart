import 'models/card_by_params.dart';

abstract class CardsRepository {
  Future<List<CardByParams>> fetchCardByParams(String params);
  Future<CardByParams> fetchCardDetails(String id);
}
