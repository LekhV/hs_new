import 'package:json_annotation/json_annotation.dart';

part 'cardback_dto.g.dart';

@JsonSerializable()
class CardBackDTO {
  String? cardBackId;
  String? name;
  String? description;
  String? source;
  String? howToGet;
  bool? enabled;
  String? img;
  String? imgAnimated;
  String? sortCategory;
  String? sortOrder;
  String? locale;

  CardBackDTO({
    this.cardBackId,
    this.name,
    this.description,
    this.source,
    this.howToGet,
    this.enabled,
    this.img,
    this.imgAnimated,
    this.sortCategory,
    this.sortOrder,
    this.locale,
  });
  factory CardBackDTO.fromJson(Map<String, dynamic> json) => _$CardBackDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CardBackDTOToJson(this);
}
