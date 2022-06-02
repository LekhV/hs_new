import 'package:equatable/equatable.dart';

import 'package:flutter_hs/domain/cardbacks/models/cardback.dart';

abstract class CardBacksState extends Equatable {
  const CardBacksState();

  @override
  List<Object?> get props => [];
}

class CardBacksInitial extends CardBacksState {}

class CardBacksFailure extends CardBacksState {}

class CardBacksSuccess extends CardBacksState {
  final List<CardBack>? listCardBacks;

  const CardBacksSuccess({
    this.listCardBacks,
  });

  @override
  List<Object?> get props => [listCardBacks];

  @override
  String toString() => 'CardBacksSuccess { CardBacks: ${listCardBacks.toString()}}';
}
