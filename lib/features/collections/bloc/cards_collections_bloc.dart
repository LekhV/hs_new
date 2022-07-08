import 'package:bloc/bloc.dart';
import 'package:flutter_hs/domain/cards/cards_repository.dart';

import 'package:get_it/get_it.dart';

import 'cards_collections_event.dart';
import 'cards_collections_state.dart';

class CardsCollectionsBloc extends Bloc<CardsCollectionsEvent, CardsCollectionsState> {
  final _cardsRepository = GetIt.instance.get<CardsRepository>();

  CardsCollectionsBloc() : super(const CardsCollectionsState()) {
    on<CardsFetched>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        final listCards = await _cardsRepository.fetchCardByParams('classes/${event.parameter}');
        emit(
          state.copyWith(
            collectionsState: CollectionsStateEnum.success,
            listCards: listCards,
            parameter: event.parameter,
            iShowDialog: event.isShowDialog,
            nameCollection: event.isShowDialog ? '' : state.nameCollection,
          ),
        );
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<AddCard>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        // TODO: Add Card in BD
        emit(
          state.copyWith(
            collectionsState: CollectionsStateEnum.success,
          ),
        );
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<DeleteCard>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        // TODO: Delete Card in BD
        emit(
          state.copyWith(
            collectionsState: CollectionsStateEnum.success,
          ),
        );
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<GetCardsCollection>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        // TODO: Get Cards Collection in BD
        emit(
          state.copyWith(
            collectionsState: CollectionsStateEnum.success,
          ),
        );
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<GetCollections>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        // TODO: Get  Collectionы in BD

        emit(
          state.copyWith(
            parameter: event.heroType,
            //listCollections: listCollections,
            collectionsState: CollectionsStateEnum.success,
          ),
        );
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<DeleteCardsCollection>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        // TODO: Delete  collection in BD

        emit(
          state.copyWith(
            // cardsCollection: [],
            // listCollections: listCollections,
            collectionsState: CollectionsStateEnum.success,
            isDeletedCollection: true,
          ),
        );
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<ChangeContent>((event, emit) {
      emit(state.copyWith(
        collectionsState: CollectionsStateEnum.success,
        content: event.typeContent,
      ));
    });
  }
}
