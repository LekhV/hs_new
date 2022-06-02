import 'package:json_annotation/json_annotation.dart';

import 'locales_dto.dart';
part 'info_hs_dto.g.dart';

@JsonSerializable(createToJson: false)
class InfoHSDTO {
  InfoHSDTO({
    this.patch,
    this.classes,
    this.sets,
    this.standard,
    this.wild,
    this.types,
    this.factions,
    this.qualities,
    this.races,
    this.locales,
  });

  String? patch;
  List<String>? classes;
  List<String>? sets;
  List<String>? standard;
  List<String>? wild;
  List<String>? types;
  List<String>? factions;
  List<String>? qualities;
  List<String>? races;
  LocalesDTO? locales;

  factory InfoHSDTO.fromJson(Map<String, dynamic> json) => _$InfoHSDTOFromJson(json);
}
