import 'package:flutter_hs/api/db_hive/dtos/card_dto.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';

import '../../../api/db_hive/dtos/collection_card_dto.dart';
import '../../../api/db_hive/dtos/collection_model_dto.dart';
import '../../../domain/db_hive/models/hive_collection_card_model.dart';
import '../../../domain/db_hive/models/hive_collection_model.dart';

extension CardDTOMapper on CardDTO {
  CardByParams toModel() {
    return CardByParams(
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

extension CardDTOMappers on List<CardDTO> {
  List<CardByParams> toModels() {
    return map((cardByParamsDTO) => cardByParamsDTO.toModel()).toList();
  }
}

extension CollectionCardDTOMapper on CollectionCardDTO {
  HiveCollectionCard toModel() {
    return HiveCollectionCard(
      card: card.toModel(),
      collectionCardId: collectionCardId,
    );
  }
}

extension CollectionCardDTOMappers on List<CollectionCardDTO> {
  List<HiveCollectionCard> toModels() {
    return map((collectionCards) => collectionCards.toModel()).toList();
  }
}

extension CardMapper on CardByParams {
  CardDTO toDTO() {
    return CardDTO(
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

extension CardMappers on List<CardByParams> {
  List<CardDTO> toDTOs() {
    return map((cardByParamsDTO) => cardByParamsDTO.toDTO()).toList();
  }
}

extension HiveCollectionCardMapper on HiveCollectionCard {
  CollectionCardDTO toDTO() {
    return CollectionCardDTO(
      card: card.toDTO(),
      collectionCardId: collectionCardId,
    );
  }
}

extension HiveCollectionCardMappers on List<HiveCollectionCard> {
  List<CollectionCardDTO> toDTOs() {
    return map((collectionCards) => collectionCards.toDTO()).toList();
  }
}

extension HiveCollectionModelDTOMapper on CollectionModelDTO {
  HiveCollectionModel toModel() {
    return HiveCollectionModel(
      heroType: heroType,
      nameCollection: nameCollection,
      collectionCards: collectionCards?.toModels(),
    );
  }
}

extension HiveCollectionModelDTOMappers on List<CollectionModelDTO> {
  List<HiveCollectionModel> toModels() {
    return map((cardByParamsDTO) => cardByParamsDTO.toModel()).toList();
  }
}

extension HiveCollectionModelMapper on HiveCollectionModel {
  CollectionModelDTO toDTO() {
    return CollectionModelDTO(
      heroType: heroType,
      nameCollection: nameCollection,
      collectionCards: collectionCards?.toDTOs(),
    );
  }
}

extension HiveCollectionModelMappers on List<HiveCollectionModel> {
  List<CollectionModelDTO> toDTOs() {
    return map((collectionModelDTOs) => collectionModelDTOs.toDTO()).toList();
  }
}

extension CollectionModelMapper on HiveCollectionModel {
  CollectionModel toModel() {
    return CollectionModel(
      heroType: heroType,
      nameCollection: nameCollection,
      collectionCardsLenght: collectionCards?.length ?? 0,
    );
  }
}

extension CollectionModelMappers on List<HiveCollectionModel> {
  List<CollectionModel> toModels() {
    return map((collection) => collection.toModel()).toList();
  }
}

extension CollectionCardMapper on HiveCollectionCard {
  CollectionCard toModel() {
    return CollectionCard(
      collectionCardId: collectionCardId,
      card: card,
    );
  }
}

extension CollectionCardMappers on List<HiveCollectionCard> {
  List<CollectionCard> toModels() {
    return map((collectionCard) => collectionCard.toModel()).toList();
  }
}
