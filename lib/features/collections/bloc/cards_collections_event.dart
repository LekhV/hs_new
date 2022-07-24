import 'package:equatable/equatable.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/db_hive/models/hive_collection_card_model.dart';

import '../collection_content_enum.dart';

abstract class CardsCollectionsEvent extends Equatable {
  const CardsCollectionsEvent();
}

class CardsFetched extends CardsCollectionsEvent {
  final String parameter;
  final bool isShowDialog;

  const CardsFetched({required this.parameter, this.isShowDialog = false});

  @override
  List<Object> get props => [parameter];
}

class CreateCollection extends CardsCollectionsEvent {
  final String nameCollection;
  const CreateCollection({required this.nameCollection});

  @override
  List<Object> get props => [nameCollection];
}

class AddCard extends CardsCollectionsEvent {
  final CardByParams card;
  final String nameCollection;

  const AddCard({required this.card, required this.nameCollection});

  @override
  List<Object> get props => [];
}

class DeleteCard extends CardsCollectionsEvent {
  final CardByParams card;
  final dynamic cardId;
  final String nameCollection;

  const DeleteCard({required this.card, required this.cardId, required this.nameCollection});

  @override
  List<Object> get props => [];
}

class GetCardsCollection extends CardsCollectionsEvent {
  final String nameCollection;

  const GetCardsCollection({required this.nameCollection});

  @override
  List<Object> get props => [];
}

class GetCollections extends CardsCollectionsEvent {
  final String heroType;

  const GetCollections(this.heroType);

  @override
  List<Object> get props => [];
}

class DeleteCardsCollection extends CardsCollectionsEvent {
  final String? nameCollection;

  const DeleteCardsCollection({
    this.nameCollection,
  });

  @override
  List<Object> get props => [];
}

class ChangeContent extends CardsCollectionsEvent {
  final CollectionsContentEnum typeContent;

  const ChangeContent({
    required this.typeContent,
  });

  @override
  List<Object> get props => [];
}
