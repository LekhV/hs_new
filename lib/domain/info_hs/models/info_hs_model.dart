import 'package:json_annotation/json_annotation.dart';

import 'locales_model.dart';

part 'info_hs_model.g.dart';

@JsonSerializable()
class InfoHS {
  InfoHS({
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
  LocalesModel? locales;

  factory InfoHS.fromJson(Map<String, dynamic> json) => _$InfoHSFromJson(json);
  Map<String, dynamic> toJson() => _$InfoHSToJson(this);
}
