import 'package:flutter_hs/api/collections/db_realm/dtos/realm_card_dto.dart';
import 'package:flutter_hs/api/collections/db_realm/dtos/realm_collection_card_dto.dart';
import 'package:flutter_hs/api/collections/db_realm/dtos/realm_collection_model_dto.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

import 'package:flutter_hs/domain/collections/models/db_collection_card_model.dart';
import 'package:flutter_hs/domain/collections/models/db_collection_model.dart';

extension CardMapper on CardByParams {
  RealmCardDTO toDTO() {
    return RealmCardDTO(
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
  List<RealmCardDTO> toDTOs() {
    return map((cardByParamsDTO) => cardByParamsDTO.toDTO()).toList();
  }
}

extension CardDTOMapper on RealmCardDTO {
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

extension CardDTOMappers on List<RealmCardDTO> {
  List<CardByParams> toModels() {
    return map((cardDTO) => cardDTO.toModel()).toList();
  }
}

extension CollectionCardDTOMapper on RealmCollectionCardDTO {
  CollectionCard toModel() {
    return CollectionCard(
      card: card!.toModel(),
      collectionCardId: collectionCardId,
    );
  }
}

extension CollectionCardDTOMappers on List<RealmCollectionCardDTO> {
  List<CollectionCard> toModels() {
    return map((collectionCard) => collectionCard.toModel()).toList();
  }
}

extension RealmCollectionModelDTOMapper on RealmCollectionModelDTO {
  CollectionModel toModel() {
    return CollectionModel(
      heroType: heroType!,
      nameCollection: nameCollection,
      collectionCardsLenght: collectionCards.length,
    );
  }
}

extension RealmCollectionModelDTOMappers on List<RealmCollectionModelDTO> {
  List<CollectionModel> toModels() {
    return map((collection) => collection.toModel()).toList();
  }
}
