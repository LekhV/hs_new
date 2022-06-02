import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SignInEvent>((event, emit) async {
      try {
        print('EMAIL: ${event.email}  PASSWORD: ${event.password}');
        emit(LoginSuccess());
      } catch (_) {
        emit(LoginFailure());
      }
    });
  }
}
