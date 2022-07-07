import 'package:flutter_hs/api/cards/dto/card_by_params_dto.dart';
import 'package:flutter_hs/api/collections/dto/collection_card_dto.dart';
import 'package:flutter_hs/domain/bd_firestore/models/collection_card_model.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

extension CardByParamsMapper on CardByParams {
  CardByParamsDTO toDTO() {
    return CardByParamsDTO(
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

extension CardByParamsDTOMapper on CardByParamsDTO {
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

extension CollectionCardDTOMapper on CollectionCardDTO {
  CollectionCard toModel() {
    return CollectionCard(
      cardByParams: CardByParams.fromJson(card),
      collectionCardId: collectionCardId,
      heroType: heroType,
    );
  }
}

extension CollectionCardMapper on CollectionCard {
  CollectionCardDTO toDTO() {
    return CollectionCardDTO(
      collectionCardId: collectionCardId,
      card: cardByParams.toJson(),
      heroType: heroType,
    );
  }
}

extension CollectionCardDTOMappers on List<CollectionCardDTO> {
  List<CollectionCard> toModels() {
    return map((collectionCardDTO) => collectionCardDTO.toModel()).toList();
  }
}

extension CollectionCardMappers on List<CollectionCard> {
  List<CollectionCardDTO> toDTOs() {
    return map((collectionCard) => collectionCard.toDTO()).toList();
  }
}
