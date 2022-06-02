import 'package:equatable/equatable.dart';

abstract class InfoHSEvent extends Equatable {
  const InfoHSEvent();
}

class InfoHSFetched extends InfoHSEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
