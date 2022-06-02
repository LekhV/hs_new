import 'package:bloc/bloc.dart';
import 'package:flutter_hs/domain/cardbacks/cardbacks_repository.dart';

import 'package:get_it/get_it.dart';

import 'cardbacks_event.dart';
import 'cardbacks_state.dart';

class CardBacksBloc extends Bloc<CardBacksEvent, CardBacksState> {
  final _cardsRepository = GetIt.instance.get<CardBacksRepository>();

  CardBacksBloc() : super(CardBacksInitial()) {
    on<CardBacksFetched>((event, emit) async {
      try {
        final listCardBacks = await _cardsRepository.fetchCardBacks();
        emit(CardBacksSuccess(listCardBacks: listCardBacks));
      } catch (_) {
        emit(CardBacksFailure());
      }
    });
  }
}
