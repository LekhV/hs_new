import 'models/info_hs_model.dart';

abstract class InfoHSRepository {
  Future<InfoHS> fetchInfoHS();
}
