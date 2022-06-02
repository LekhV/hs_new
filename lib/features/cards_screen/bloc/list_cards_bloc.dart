import 'package:bloc/bloc.dart';
import 'package:flutter_hs/domain/cards/cards_repository.dart';

import 'package:get_it/get_it.dart';

import 'list_cards_event.dart';
import 'list_cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final _cardsRepository = GetIt.instance.get<CardsRepository>();

  CardsBloc() : super(CardsInitial()) {
    on<CardsFetched>((event, emit) async {
      try {
        final listCards = await _cardsRepository.fetchCardByParams(event.parameter);
        emit(CardsSuccess(listCards: listCards));
      } catch (_) {
        emit(CardsFailure());
      }
    });

    on<SearchCards>((event, emit) async {
      emit(CardsLoading());
      try {
        final listCards = await _cardsRepository.fetchCardByParams(event.parameter);
        emit(CardsSuccess(listCards: listCards));
      } catch (_) {
        emit(CardsFailure());
      }
    });
  }
}
