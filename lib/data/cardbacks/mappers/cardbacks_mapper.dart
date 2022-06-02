import 'package:flutter_hs/api/cardback/dto/cardback_dto.dart';
import 'package:flutter_hs/domain/cardbacks/models/cardback.dart';

extension CardBackDTOMapper on CardBackDTO {
  CardBack toModel() {
    return CardBack(
      cardBackId: cardBackId,
      name: name,
      description: description,
      source: source,
      howToGet: howToGet,
      sortCategory: sortCategory,
      img: img,
      sortOrder: sortOrder,
      enabled: enabled,
      imgAnimated: imgAnimated,
      locale: locale,
    );
  }
}

extension CardBackDTOMappers on List<CardBackDTO> {
  List<CardBack> toModels() {
    return map((cardBackDTO) => cardBackDTO.toModel()).toList();
  }
}
