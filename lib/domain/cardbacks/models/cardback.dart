import 'package:json_annotation/json_annotation.dart';

part 'cardback.g.dart';

@JsonSerializable()
class CardBack {
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

  CardBack({
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
}
