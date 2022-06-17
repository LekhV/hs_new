import 'package:equatable/equatable.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

abstract class CardsCollectionsEvent extends Equatable {
  const CardsCollectionsEvent();
}

class CardsFetched extends CardsCollectionsEvent {
  final String parameter;

  const CardsFetched({required this.parameter});

  @override
  List<Object> get props => [parameter];
}

class AddCard extends CardsCollectionsEvent {
  final CardByParams card;
  const AddCard({required this.card});

  @override
  List<Object> get props => [];
}

class DeleteCard extends CardsCollectionsEvent {
  final CardByParams card;
  const DeleteCard({required this.card});

  @override
  List<Object> get props => [];
}

class GetCardsCollection extends CardsCollectionsEvent {
  @override
  List<Object> get props => [];
}
