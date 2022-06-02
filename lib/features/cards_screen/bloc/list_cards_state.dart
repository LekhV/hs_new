import 'package:equatable/equatable.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

abstract class CardsState extends Equatable {
  const CardsState();

  @override
  List<Object?> get props => [];
}

class CardsInitial extends CardsState {}

class CardsFailure extends CardsState {}

class CardsLoading extends CardsState {}

class CardsSuccess extends CardsState {
  final List<CardByParams>? listCards;

  const CardsSuccess({
    this.listCards,
  });

  @override
  List<Object?> get props => [listCards];
}
