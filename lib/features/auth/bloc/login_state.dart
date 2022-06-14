import 'package:equatable/equatable.dart';

enum LoginStateEnum { init, success, error }

class LoginState extends Equatable {
  final LoginStateEnum? loginState;
  final Object? error;

  const LoginState({
    this.loginState = LoginStateEnum.init,
    this.error,
  });

  LoginState copyWith({
    LoginStateEnum? loginState = LoginStateEnum.init,
    Object? error,
  }) =>
      LoginState(
        loginState: loginState ?? this.loginState,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [loginState, error];
}
