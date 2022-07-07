import 'package:json_annotation/json_annotation.dart';

part 'collections_model.g.dart';

@JsonSerializable()
class CollectionsModel {
  final String? nameCollection;
  final int? lenghtCollection;

  CollectionsModel({
    this.nameCollection,
    this.lenghtCollection,
  });

  factory CollectionsModel.fromJson(Map<String, dynamic> json) => _$CollectionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsModelToJson(this);
}
