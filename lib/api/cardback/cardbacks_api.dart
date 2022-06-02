import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/cardback_dto.dart';

part 'cardbacks_api.g.dart';

@RestApi()
abstract class CardBacksApi {
  factory CardBacksApi(Dio dio) = _CardBacksApi;

  @GET('cardbacks')
  Future<List<CardBackDTO>> fetchCardBacks();
}
