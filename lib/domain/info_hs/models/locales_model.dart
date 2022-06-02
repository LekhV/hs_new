import 'package:json_annotation/json_annotation.dart';

part 'locales_model.g.dart';

@JsonSerializable()
class LocalesModel {
  LocalesModel({
    this.deDe,
    this.enGb,
    this.enUs,
    this.esEs,
    this.esMx,
    this.frFr,
    this.itIt,
    this.koKr,
    this.plPl,
    this.ptBr,
    this.ruRu,
    this.zhCn,
    this.zhTw,
    this.jaJp,
    this.thTh,
  });

  String? deDe;
  String? enGb;
  String? enUs;
  String? esEs;
  String? esMx;
  String? frFr;
  String? itIt;
  String? koKr;
  String? plPl;
  String? ptBr;
  String? ruRu;
  String? zhCn;
  String? zhTw;
  String? jaJp;
  String? thTh;

  factory LocalesModel.fromJson(Map<String, dynamic> json) => _$LocalesModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalesModelToJson(this);
}
