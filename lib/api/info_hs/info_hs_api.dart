import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'dto/info_hs_dto.dart';

part 'info_hs_api.g.dart';

@RestApi()
abstract class InfoHSApi {
  factory InfoHSApi(Dio dio) = _InfoHSApi;

  @GET('info')
  Future<InfoHSDTO> fetchInfoHS();
}
