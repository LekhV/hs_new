import 'models/cardback.dart';

abstract class CardBacksRepository {
  Future<List<CardBack>> fetchCardBacks();
}
