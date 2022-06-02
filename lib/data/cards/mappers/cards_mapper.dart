import 'package:flutter_hs/api/cards/dto/card_by_params_dto.dart';
import 'package:flutter_hs/domain/cards/models/card_by_params.dart';

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

extension CardByParamsDTOMappers on List<CardByParamsDTO> {
  List<CardByParams> toModels() {
    return map((cardByParamsDTO) => cardByParamsDTO.toModel()).toList();
  }
}
