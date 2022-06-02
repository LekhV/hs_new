import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'dto/card_by_params_dto.dart';

part 'cards_api.g.dart';

@RestApi()
abstract class CardsApi {
  factory CardsApi(Dio dio) = _CardsApi;

  @GET('cards/{params}')
  Future<List<CardByParamsDTO>> fetchCardByParams(
    @Path() String params,
  );

  @GET('cards/{id}')
  Future<List<CardByParamsDTO>> fetchCardDetails(
    @Path() String id,
  );
}
