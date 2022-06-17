import 'package:equatable/equatable.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

enum CollectionsStateEnum { init, success, error }

class CardsCollectionsState extends Equatable {
  final CollectionsStateEnum? collectionsState;
  final Object? error;
  final List<CardByParams>? listCards;
  final String? parameter;

  const CardsCollectionsState({
    this.collectionsState = CollectionsStateEnum.init,
    this.error,
    this.listCards,
    this.parameter,
  });

  CardsCollectionsState copyWith({
    CollectionsStateEnum? collectionsState = CollectionsStateEnum.init,
    Object? error,
    List<CardByParams>? listCards,
    String? parameter,
  }) =>
      CardsCollectionsState(
        collectionsState: collectionsState ?? this.collectionsState,
        error: error ?? this.error,
        listCards: listCards ?? this.listCards,
        parameter: parameter ?? this.parameter,
      );

  @override
  List<Object?> get props => [collectionsState, error];
}
