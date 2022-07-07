import 'package:equatable/equatable.dart';
import 'package:flutter_hs/domain/bd_firestore/models/collection_card_model.dart';
import 'package:flutter_hs/domain/bd_firestore/models/collections_model.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

import '../collection_content_enum.dart';

enum CollectionsStateEnum { init, loadAdd, loadDelete, success, error }

class CardsCollectionsState extends Equatable {
  final CollectionsStateEnum? collectionsState;
  final Object? error;

  final CardByParams? card;
  final List<CardByParams>? listCards;
  final List<CollectionCard>? cardsCollection;
  final List<CollectionsModel>? listCollections;

  final String parameter;
  final String nameCollection;
  final bool isShowRule;
  final bool isDeletedCollection;
  final bool iShowDialog;

  final CollectionsContentEnum content;

  const CardsCollectionsState({
    this.collectionsState = CollectionsStateEnum.init,
    this.error,
    this.listCards = const [],
    required this.parameter,
    required this.nameCollection,
    this.card,
    this.cardsCollection,
    this.listCollections,
    this.isShowRule = false,
    this.isDeletedCollection = false,
    this.iShowDialog = false,
    this.content = CollectionsContentEnum.initialScreen,
  });

  CardsCollectionsState copyWith({
    CollectionsStateEnum? collectionsState,
    Object? error,
    List<CardByParams>? listCards,
    String? parameter,
    String? nameCollection,
    CardByParams? card,
    List<CollectionCard>? cardsCollection,
    List<CollectionsModel>? listCollections,
    bool? isShowRule,
    bool? isDeletedCollection,
    bool? iShowDialog,
    CollectionsContentEnum? content,
  }) =>
      CardsCollectionsState(
        collectionsState: collectionsState ?? this.collectionsState,
        error: error ?? this.error,
        listCards: listCards ?? this.listCards,
        parameter: parameter ?? this.parameter,
        nameCollection: nameCollection ?? this.nameCollection,
        card: card ?? this.card,
        cardsCollection: cardsCollection ?? this.cardsCollection,
        listCollections: listCollections ?? this.listCollections,
        isShowRule: isShowRule ?? false,
        isDeletedCollection: isDeletedCollection ?? false,
        iShowDialog: iShowDialog ?? false,
        content: content ?? this.content,
      );

  @override
  List<Object?> get props => [collectionsState, error, parameter, nameCollection, content];
}
