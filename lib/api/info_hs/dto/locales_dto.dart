import 'package:json_annotation/json_annotation.dart';

part 'locales_dto.g.dart';

@JsonSerializable()
class LocalesDTO {
  LocalesDTO({
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

  factory LocalesDTO.fromJson(Map<String, dynamic> json) => _$LocalesDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocalesDTOToJson(this);
}
