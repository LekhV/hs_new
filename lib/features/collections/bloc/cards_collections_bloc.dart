import 'package:bloc/bloc.dart';
import 'package:flutter_hs/domain/cards/cards_repository.dart';
import 'package:flutter_hs/domain/collections/db_hive/db_hive_repository.dart';
import 'package:flutter_hs/domain/collections/db_realm/db_realm_repository.dart';
import 'package:flutter_hs/domain/collections/db_sqlite/db_sqlite_repository.dart';

import 'package:get_it/get_it.dart';

import '../../../domain/common/exceptions.dart';
import 'cards_collections_event.dart';
import 'cards_collections_state.dart';

class CardsCollectionsBloc extends Bloc<CardsCollectionsEvent, CardsCollectionsState> {
  final _cardsRepository = GetIt.instance.get<CardsRepository>();
  final _dbRepository = GetIt.instance.get<DBHiveRepository>();
  //GetIt.instance.get<DBSQLiteRepository>();
  //GetIt.instance.get<DBRealmRepository>();

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

    on<CreateCollection>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        final listName = await _dbRepository.getNamesAllCollections(state.parameter);
        String checkSameCollection = listName.firstWhere(
          (element) => element == event.nameCollection,
          orElse: () => '',
        );

        if (checkSameCollection.isNotEmpty) {
          emit(
            state.copyWith(
              nameCollection: '',
              collectionsState: CollectionsStateEnum.success,
              isShowRule: true,
              error: const SameCardsException(),
              card: null,
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
          add(AddCard(card: state.card!, nameCollection: event.nameCollection));
        }
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<AddCard>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));

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
          emit(state.copyWith(collectionsState: CollectionsStateEnum.loadAdd, card: event.card));

          final nameCollection =
              event.nameCollection.isEmpty ? state.nameCollection : event.nameCollection;
          // TODO: need future becouse show animaion
          await Future.delayed(const Duration(milliseconds: 300), () {});
          final cardsCollection = await _dbRepository.createCollection(
            nameCollection,
            event.card,
            state.parameter,
          );

          emit(
            state.copyWith(
              cardsCollection: cardsCollection,
              collectionsState: CollectionsStateEnum.success,
            ),
          );
        } on CollectionLimitExceededException catch (e) {
          emit(
            state.copyWith(
                collectionsState: CollectionsStateEnum.success, isShowRule: true, error: e),
          );
        } on CardsLimitExceededException catch (e) {
          emit(state.copyWith(
              collectionsState: CollectionsStateEnum.success, isShowRule: true, error: e));
        } on SameCardsException catch (e) {
          emit(
            state.copyWith(
                collectionsState: CollectionsStateEnum.success, isShowRule: true, error: e),
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
      final nameCollection =
          event.nameCollection.isEmpty ? state.nameCollection : event.nameCollection;

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
          // TODO: need future becouse show animaion

          await Future.delayed(const Duration(milliseconds: 300), () {});
          final cardsCollection = await _dbRepository.deleteCard(
            nameCollection: nameCollection,
            heroType: state.parameter,
            card: event.card,
            cardId: event.cardId,
          );

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
        final cardsCollection = await _dbRepository.getCollection(
          event.nameCollection,
          state.parameter,
        );

        emit(
          state.copyWith(
            nameCollection: event.nameCollection,
            cardsCollection: cardsCollection,
            collectionsState: CollectionsStateEnum.success,
          ),
        );
      } on NoElementException catch (e) {
        emit(state.copyWith(
            collectionsState: CollectionsStateEnum.success, isShowRule: true, error: e));
      } catch (e) {
        emit(state.copyWith(collectionsState: CollectionsStateEnum.error, error: e));
      }
    });

    on<GetCollections>((event, emit) async {
      emit(state.copyWith(collectionsState: CollectionsStateEnum.init));
      try {
        final listCollections = await _dbRepository.getCollections(event.heroType);

        emit(
          state.copyWith(
            parameter: event.heroType,
            listCollections: listCollections,
            cardsCollection: [],
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
        await _dbRepository.deleteCollection(event.nameCollection ?? '', state.parameter);
        add(GetCollections(state.parameter));
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
