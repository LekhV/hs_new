import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/domain/auth/auth_repository.dart';
import 'package:flutter_hs/domain/info_hs/info_hs_repository.dart';
import 'package:flutter_hs/domain/info_hs/models/info_hs_model.dart';
import 'package:get_it/get_it.dart';

import 'info_hs_event.dart';
import 'info_hs_state.dart';

class InfoHSBloc extends Bloc<InfoHSEvent, InfoHSState> {
  final _infoHSRepository = GetIt.instance.get<InfoHSRepository>();
  final _authRepository = GetIt.instance.get<AuthRepository>();

  InfoHSBloc() : super(InfoHSInitial()) {
    on<InfoHSEvent>((event, emit) async {
      final InfoHSState currentState = state;
      try {
        if (currentState is InfoHSInitial) {
          final InfoHS infoHS = await _infoHSRepository.fetchInfoHS();
          emit(InfoHSSuccess(infoHSs: infoHS));
        }
        if (currentState is InfoHSSuccess) {
          final InfoHS infoHS = await _infoHSRepository.fetchInfoHS();
          emit(currentState.copyWith(infoHSs: infoHS));
        }
      } catch (_) {
        emit(InfoHSFailure());
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        await _authRepository.logout();
        emit(LogoutSuccess());
      } catch (_) {
        emit(InfoHSFailure());
      }
    });
  }
}
