import 'package:bloc/bloc.dart';
import 'package:flutter_hs/domain/cards/cards_repository.dart';

import 'package:get_it/get_it.dart';

import 'card_details_event.dart';
import 'card_details_state.dart';

class CardDetailsBloc extends Bloc<CardDetailsEvent, CardDetailsState> {
  final _cardsRepository = GetIt.instance.get<CardsRepository>();

  CardDetailsBloc() : super(CardDetailsInitial()) {
    on<CardDetailsFetched>((event, emit) async {
      try {
        final cardDetails = await _cardsRepository.fetchCardDetails(event.cardId);
        emit(CardDetailsSuccess(cardDetails: cardDetails));
      } catch (_) {
        emit(CardDetailsFailure());
      }
    });
  }
}
