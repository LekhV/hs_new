import 'package:flutter_hs/api/info_hs/info_hs_api.dart';
import 'package:flutter_hs/data/info_hs/mappers/info_hs_mapper.dart';
import 'package:flutter_hs/domain/info_hs/models/info_hs_model.dart';
import 'package:flutter_hs/domain/info_hs/info_hs_repository.dart';

class InfoHSRepositoryImpl implements InfoHSRepository {
  final InfoHSApi infoHSApi;

  InfoHSRepositoryImpl(this.infoHSApi);

  @override
  Future<InfoHS> fetchInfoHS() async {
    try {
      final response = await infoHSApi.fetchInfoHS().then((dto) => dto.toModel());
      return response;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
