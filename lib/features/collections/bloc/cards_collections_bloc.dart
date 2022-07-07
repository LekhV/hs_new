import 'package:bloc/bloc.dart';
import 'package:flutter_hs/domain/bd_firestore/bd_firestore_repository.dart';
import 'package:flutter_hs/domain/bd_firestore/models/collection_card_model.dart';
import 'package:flutter_hs/domain/cards/cards_repository.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';

import 'package:get_it/get_it.dart';

import 'cards_collections_event.dart';
import 'cards_collections_state.dart';

class CardsCollectionsBloc extends Bloc<CardsCollectionsEvent, CardsCollectionsState> {
  final _cardsRepository = GetIt.instance.get<CardsRepository>();
  final _firestore = GetIt.instance.get<BDFirestoreRepository>();

  CardsCollectionsBloc() : super(const CardsCollectionsState(parameter: '', nameCollection: '')) {
    on<CardsFetched>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        final listCards = await _cardsRepository.fetchCardByParams('classes/${event.parameter}');
        emit(
          state.copyWith(
            collectionsState: CollectionsStateEnum.success,
            iShowDialog: event.isShowDialog,
            listCards: listCards,
            parameter: event.parameter,
            nameCollection: event.isShowDialog ? '' : state.nameCollection,
          ),
        );
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<CreateCollection>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        final listCollections = await _firestore.getCollections(state.parameter);
        final listName = listCollections.map((e) => e.nameCollection);
        String? checkSameCollection = listName.firstWhere(
          (element) => element == event.nameCollection,
          orElse: () => '',
        );

        if (checkSameCollection!.isNotEmpty) {
          emit(
            state.copyWith(
              nameCollection: '',
              collectionsState: CollectionsStateEnum.success,
              isShowRule: true,
              error: const SameCardsException(),
            ),
          );
        } else {
          emit(
            state.copyWith(
              nameCollection: event.nameCollection,
              collectionsState: CollectionsStateEnum.success,
            ),
          );
        }

        if (state.card != null) {
          CardsCollectionsBloc().add(
            AddCard(
              card: state.card!,
              nameCollection: event.nameCollection,
            ),
          );
        }
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<AddCard>((event, emit) async {
      emit(state.copyWith(
        collectionsState: CollectionsStateEnum.init,
        card: event.card,
      ));
      if (state.nameCollection.isEmpty && event.nameCollection.isEmpty) {
        emit(
          state.copyWith(
            collectionsState: CollectionsStateEnum.loadAdd,
            iShowDialog: true,
            card: event.card,
          ),
        );
      } else {
        try {
          emit(state.copyWith(
            collectionsState: CollectionsStateEnum.loadAdd,
            card: event.card,
          ));
          List<CollectionCard>? cardsCollection = [];
          final nameCollection =
              event.nameCollection.isNotEmpty ? event.nameCollection : state.nameCollection;
          cardsCollection = await _firestore.createCollection(
            nameCollection,
            event.card,
            state.parameter,
          );

          emit(state.copyWith(
            collectionsState: CollectionsStateEnum.success,
            cardsCollection: cardsCollection,
          ));
        } on CollectionLimitExceededException catch (e) {
          emit(
            state.copyWith(
              collectionsState: CollectionsStateEnum.success,
              isShowRule: true,
              error: e,
            ),
          );
        } on CardsLimitExceededException catch (_) {
          emit(
            state.copyWith(
              collectionsState: CollectionsStateEnum.success,
              isShowRule: true,
              error: _,
            ),
          );
        } on SameCardsException catch (e) {
          emit(
            state.copyWith(
              collectionsState: CollectionsStateEnum.success,
              isShowRule: true,
              error: e,
            ),
          );
        } catch (e) {
          emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
        }
      }
    });

    on<DeleteCard>((event, emit) async {
      emit(state.copyWith(
        collectionsState: CollectionsStateEnum.loadDelete,
        card: event.card,
      ));
      final nameCollection = event.nameCollection ?? state.nameCollection;

      try {
        if (nameCollection.isEmpty) {
          emit(
            state.copyWith(
              collectionsState: CollectionsStateEnum.success,
              isShowRule: true,
              error: const NoCollectionException(),
            ),
          );
        } else {
          List<CollectionCard> cardsCollection = [];
          cardsCollection = await _firestore.deleteCard(nameCollection, event.card.cardId!);

          emit(
            state.copyWith(
              collectionsState: CollectionsStateEnum.success,
              cardsCollection: cardsCollection,
            ),
          );
        }
      } on CollectionLimitExceededException catch (e) {
        emit(state.copyWith(
            collectionsState: CollectionsStateEnum.success, isShowRule: true, error: e));
      } on CardsLimitExceededException catch (e) {
        emit(state.copyWith(
            collectionsState: CollectionsStateEnum.success, isShowRule: true, error: e));
      } on NoElementException catch (e) {
        emit(state.copyWith(
            collectionsState: CollectionsStateEnum.success, isShowRule: true, error: e));
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<GetCardsCollection>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        final nameCollection = event.nameCollection ?? state.nameCollection;
        final cardsCollection = await _firestore.getCollection(nameCollection);

        emit(
          state.copyWith(
            nameCollection: nameCollection,
            cardsCollection: cardsCollection,
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
        final listCollections = await _firestore.getCollections(event.heroType);
        emit(
          state.copyWith(
            parameter: event.heroType,
            listCollections: listCollections,
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
        final nameCollection = event.nameCollection ?? state.nameCollection;
        await _firestore.deleteCollection(nameCollection);
        final listCollections = await _firestore.getCollections(state.parameter);

        emit(
          state.copyWith(
            cardsCollection: [],
            listCollections: listCollections,
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
