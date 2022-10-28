import 'package:flutter_hs/data/collectios/db_drift/database_drift_helper.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/db_drift/models/drift_collection_card.dart';
import 'package:flutter_hs/domain/collections/db_drift/models/drift_collection_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';

extension CardMapper on CardByParams {
  DriftCollectionCardDTOData toDTO({required int collectionModelId}) {
    return DriftCollectionCardDTOData(
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
      textContent: text,
      flavor: flavor,
      artist: artist,
      collectible: collectible,
      elite: elite,
      playerClass: playerClass,
      img: img,
      imgGold: imgGold,
      locale: locale,
      collectionModelId: collectionModelId,
    );
  }
}

extension DriftCardDTOMapper on DriftCollectionCard {
  CollectionCard toModel() {
    return CollectionCard(
      collectionCardId: collectionCardId,
      card: card!,
    );
  }
}

extension DriftCardsDTOMappers on List<DriftCollectionCard> {
  List<CollectionCard> toModels() {
    return map((cardDTO) => cardDTO.toModel()).toList();
  }
}

extension DriftCollectionModelDTOMapper on DriftCollectionModel {
  DriftCollectionModelDTOData toDTO() {
    return DriftCollectionModelDTOData(
      collectionModelId: id,
      heroType: heroType,
      nameCollection: nameCollection,
      collectionCardsLenght: collectionCardsLenght,
    );
  }
}

extension CollectionModelDTOMapper on DriftCollectionModelDTOData {
  DriftCollectionModel toModel() {
    return DriftCollectionModel(
      heroType: heroType,
      nameCollection: nameCollection,
      collectionCardsLenght: collectionCardsLenght,
    );
  }
}

extension CollectionModelDTOMappers on List<DriftCollectionModelDTOData> {
  List<DriftCollectionModel> toModels() {
    return map((collection) => collection.toModel()).toList();
  }
}

extension CollectionModelMapper on DriftCollectionModel {
  CollectionModel toModel() {
    return CollectionModel(
      heroType: heroType!,
      nameCollection: nameCollection!,
      collectionCardsLenght: collectionCardsLenght,
    );
  }
}

extension CollectionModelMappers on List<DriftCollectionModel> {
  List<CollectionModel> toModels() {
    return map((collection) => collection.toModel()).toList();
  }
}

extension DriftCollectionCardDTOMapper on DriftCollectionCardDTOData {
  DriftCollectionCard toModel() {
    return DriftCollectionCard(
      collectionCardId: collectionCardId,
      collectionModelId: collectionModelId,
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
        text: textContent,
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

extension DriftCollectionCardsDTOMappers on List<DriftCollectionCardDTOData> {
  List<DriftCollectionCard> toModels() {
    return map((cardDTO) => cardDTO.toModel()).toList();
  }
}
