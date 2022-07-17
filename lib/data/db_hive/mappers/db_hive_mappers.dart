import 'package:flutter_hs/api/db_hive/dtos/card_dto.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

import '../../../api/db_hive/dtos/collection_card_dto.dart';
import '../../../api/db_hive/dtos/collection_model_dto.dart';
import '../../../domain/db_hive/models/collection_card_model.dart';
import '../../../domain/db_hive/models/collection_model.dart';

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
  CollectionCard toModel() {
    return CollectionCard(
      card: card.toModel(),
      collectionCardId: collectionCardId,
    );
  }
}

extension CollectionCardDTOMappers on List<CollectionCardDTO> {
  List<CollectionCard> toModels() {
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

extension CollectionCardMapper on CollectionCard {
  CollectionCardDTO toDTO() {
    return CollectionCardDTO(
      card: card.toDTO(),
      collectionCardId: collectionCardId,
    );
  }
}

extension CollectionCardMappers on List<CollectionCard> {
  List<CollectionCardDTO> toDTOs() {
    return map((collectionCards) => collectionCards.toDTO()).toList();
  }
}

extension CollectionModelDTOMapper on CollectionModelDTO {
  CollectionModel toModel() {
    return CollectionModel(
      heroType: heroType,
      nameCollection: nameCollection,
      collectionCards: collectionCards?.toModels(),
    );
  }
}

extension CollectionModelDTOMappers on List<CollectionModelDTO> {
  List<CollectionModel> toModels() {
    return map((cardByParamsDTO) => cardByParamsDTO.toModel()).toList();
  }
}

extension CollectionModelMapper on CollectionModel {
  CollectionModelDTO toDTO() {
    return CollectionModelDTO(
      heroType: heroType,
      nameCollection: nameCollection,
      collectionCards: collectionCards?.toDTOs(),
    );
  }
}

extension CollectionModelMappers on List<CollectionModel> {
  List<CollectionModelDTO> toDTOs() {
    return map((collectionModelDTOs) => collectionModelDTOs.toDTO()).toList();
  }
}
