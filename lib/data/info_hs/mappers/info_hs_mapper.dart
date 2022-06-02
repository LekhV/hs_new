import 'package:flutter_hs/api/info_hs/dto/info_hs_dto.dart';
import 'package:flutter_hs/api/info_hs/dto/locales_dto.dart';
import 'package:flutter_hs/domain/info_hs/models/info_hs_model.dart';
import 'package:flutter_hs/domain/info_hs/models/locales_model.dart';

extension InfoHSDTOMapper on InfoHSDTO {
  InfoHS toModel() {
    return InfoHS(
      patch: patch,
      classes: classes,
      sets: sets,
      standard: standard,
      wild: wild,
      types: types,
      factions: factions,
      qualities: qualities,
      races: races,
      locales: locales?.toModel(),
    );
  }
}

extension on LocalesDTO {
  LocalesModel toModel() {
    return LocalesModel(
      deDe: deDe,
      enGb: enGb,
      enUs: enUs,
      esEs: esEs,
      esMx: esMx,
      frFr: frFr,
      itIt: itIt,
      koKr: koKr,
      plPl: plPl,
      ptBr: ptBr,
      ruRu: ruRu,
      zhCn: zhCn,
      zhTw: zhTw,
      jaJp: jaJp,
      thTh: thTh,
    );
  }
}
