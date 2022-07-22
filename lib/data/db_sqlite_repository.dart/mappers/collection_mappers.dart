import 'package:flutter_hs/api/db_sqlite/dtos/collection_card_dto.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';
import 'package:flutter_hs/domain/db_sqlite/models/collection_card_model.dart';

extension CardMapper on CardByParams {
  CollectionCardDTO toCollectionCard({required int collectionModelId}) {
    return CollectionCardDTO(
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

extension CardDTOMapper on CollectionCardDTO {
  CollectionCard toModel() {
    return CollectionCard(
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

extension CollectionModelDTOMappers on List<CollectionCardDTO> {
  List<CollectionCard> toModels() {
    return map((cardByParamsDTO) => cardByParamsDTO.toModel()).toList();
  }
}
