import 'package:equatable/equatable.dart';
import 'package:flutter_hs/domain/info_hs/models/info_hs_model.dart';

abstract class InfoHSState extends Equatable {
  const InfoHSState();

  @override
  List<Object?> get props => [];
}

class InfoHSInitial extends InfoHSState {}

class InfoHSFailure extends InfoHSState {}

class InfoHSSuccess extends InfoHSState {
  final InfoHS? infoHSs;

  const InfoHSSuccess({
    this.infoHSs,
  });

  InfoHSSuccess copyWith({
    InfoHS? infoHSs,
  }) =>
      InfoHSSuccess(
        infoHSs: infoHSs ?? this.infoHSs,
      );

  @override
  List<Object?> get props => [infoHSs];

  @override
  String toString() => 'InfoHSSuccess { InfoHSs: ${infoHSs.toString()}, }';
}

class LogoutSuccess extends InfoHSState {}
