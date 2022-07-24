import 'package:flutter_hs/api/db_sqlite/dtos/sql_collection_card_dto.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';
import 'package:flutter_hs/domain/db_hive/models/hive_collection_card_model.dart';
import 'package:flutter_hs/domain/db_sqlite/models/sqlite_collection_card.dart';
import 'package:flutter_hs/domain/db_sqlite/models/sqlite_collection_model.dart';

extension CardMapper on CardByParams {
  SQLiteCollectionCardDTO toDTO({required int collectionModelId}) {
    return SQLiteCollectionCardDTO(
      collectionModelId: collectionModelId,
      cardId: cardId,
      dbfId: dbfId,
      name: name,
      cardSet: cardSet,
      type: type,
      faction: faction,
      rarity: rarity,
      cost: cost,
      attack: attack,
      health: health,
      text: text,
      flavor: flavor,
      artist: artist,
      collectible: collectible,
      elite: elite,
      playerClass: playerClass,
      img: img,
      imgGold: imgGold,
      locale: locale,
    );
  }
}

extension SQLiteCardDTOMapper on SQLiteCollectionCardDTO {
  SQLiteCollectionCard toModel() {
    return SQLiteCollectionCard(
      collectionModelId: collectionModelId,
      collectionCardId: collectionCardId,
      card: CardByParams(
        cardId: cardId,
        dbfId: dbfId,
        name: name,
        cardSet: cardSet,
        type: type,
        faction: faction,
        rarity: rarity,
        cost: cost,
        attack: attack,
        health: health,
        text: text,
        flavor: flavor,
        artist: artist,
        collectible: collectible,
        elite: elite,
        playerClass: playerClass,
        img: img,
        imgGold: imgGold,
        locale: locale,
      ),
    );
  }
}

extension SQLiteCollectionCardsDTOMappers on List<SQLiteCollectionCardDTO> {
  List<SQLiteCollectionCard> toModels() {
    return map((cardByParamsDTO) => cardByParamsDTO.toModel()).toList();
  }
}

extension CardDTOMapper on SQLiteCollectionCard {
  CollectionCard toModel() {
    return CollectionCard(collectionCardId: collectionCardId, card: card!);
  }
}

extension CollectionCardsDTOMappers on List<SQLiteCollectionCard> {
  List<CollectionCard> toModels() {
    return map((collectionCard) => collectionCard.toModel()).toList();
  }
}

extension CollectionModelMapper on SQLiteCollectionModel {
  CollectionModel toModel() {
    return CollectionModel(
      heroType: heroType!,
      nameCollection: nameCollection!,
      collectionCardsLenght: collectionCardsLenght,
    );
  }
}

extension CollectionModelMappers on List<SQLiteCollectionModel> {
  List<CollectionModel> toModels() {
    return map((collection) => collection.toModel()).toList();
  }
}
