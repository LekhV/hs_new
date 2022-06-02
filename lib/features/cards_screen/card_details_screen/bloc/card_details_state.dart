import 'package:equatable/equatable.dart';

import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

abstract class CardDetailsState extends Equatable {
  const CardDetailsState();

  @override
  List<Object?> get props => [];
}

class CardDetailsInitial extends CardDetailsState {}

class CardDetailsFailure extends CardDetailsState {}

class CardDetailsSuccess extends CardDetailsState {
  final CardByParams? cardDetails;

  const CardDetailsSuccess({
    this.cardDetails,
  });

  @override
  List<Object?> get props => [cardDetails];
}
