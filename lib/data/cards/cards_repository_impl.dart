import 'package:flutter_hs/api/cards/cards_api.dart';
import 'package:flutter_hs/data/cards/mappers/cards_mapper.dart';
import 'package:flutter_hs/domain/cards/cards_repository.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

class CardsRepositoryImpl implements CardsRepository {
  final CardsApi cardsApi;

  CardsRepositoryImpl(this.cardsApi);

  @override
  Future<List<CardByParams>> fetchCardByParams(String params) async {
    try {
      final response = await cardsApi.fetchCardByParams(params).then((dto) => dto.toModels());
      return response;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<CardByParams> fetchCardDetails(String id) async {
    try {
      // ignore: todo
      //TODO : dto.first - because cardDetails its list cards
      final response = await cardsApi.fetchCardDetails(id).then((dto) => dto.first.toModel());
      return response;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CardByParams>> fetchCardByCost(String params, List<int> selectedCoins) async {
    try {
      final cards = await cardsApi.fetchCardByParams(params).then((dto) => dto.toModels());

      return cards.where((card) {
        final check = selectedCoins.firstWhere(
          (coin) => card.cost == coin,
          orElse: () => -1,
        );
        return check != -1;
      }).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
