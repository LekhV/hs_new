import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}

class SignUpEvent extends LoginEvent {
  final String email;
  final String password;

  SignUpEvent(this.email, this.password);
}
