import 'package:bloc/bloc.dart';
import 'package:flutter_hs/domain/auth/auth_repository.dart';
import 'package:get_it/get_it.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _authRepository = GetIt.instance.get<AuthRepository>();

  LoginBloc() : super(const LoginState()) {
    on<SignInEvent>((event, emit) async {
      emit(state.copyWith(loginState: LoginStateEnum.init));

      try {
        await _authRepository.login(event.email, event.password);
        emit(state.copyWith(loginState: LoginStateEnum.success));
      } catch (e) {
        emit(state.copyWith(loginState: LoginStateEnum.error, error: e));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(loginState: LoginStateEnum.init));

      try {
        await _authRepository.createUser(event.email, event.password);
        emit(state.copyWith(loginState: LoginStateEnum.success));
      } catch (e) {
        emit(state.copyWith(loginState: LoginStateEnum.error, error: e));
      }
    });
  }
}
