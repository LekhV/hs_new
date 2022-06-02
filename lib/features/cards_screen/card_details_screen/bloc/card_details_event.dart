import 'package:equatable/equatable.dart';

abstract class CardDetailsEvent extends Equatable {
  const CardDetailsEvent();
}

class CardDetailsStart extends CardDetailsEvent {
  const CardDetailsStart();

  @override
  List<Object> get props => [];
}

class CardDetailsFetched extends CardDetailsEvent {
  final String cardId;

  const CardDetailsFetched({required this.cardId});

  @override
  List<Object> get props => [cardId];
}
