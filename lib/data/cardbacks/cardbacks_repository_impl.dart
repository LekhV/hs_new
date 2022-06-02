import 'package:flutter_hs/api/cardback/cardbacks_api.dart';
import 'package:flutter_hs/data/cardbacks/mappers/cardbacks_mapper.dart';
import 'package:flutter_hs/domain/cardbacks/cardbacks_repository.dart';
import 'package:flutter_hs/domain/cardbacks/models/cardback.dart';

class CardBacksRepositoryImpl implements CardBacksRepository {
  final CardBacksApi cardBacksApi;

  CardBacksRepositoryImpl(this.cardBacksApi);

  @override
  Future<List<CardBack>> fetchCardBacks() async {
    try {
      final response = await cardBacksApi.fetchCardBacks().then((dto) => dto.toModels());
      return response;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
