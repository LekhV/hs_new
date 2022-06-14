import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum UserProfileStateEnum { init, success, successSignUp, error }

class UserProfileState extends Equatable {
  final UserProfileStateEnum? userProfileState;
  final User? user;

  final Object? error;

  const UserProfileState({
    this.userProfileState = UserProfileStateEnum.init,
    this.user,
    this.error,
  });

  UserProfileState copyWith({
    UserProfileStateEnum? userProfileState = UserProfileStateEnum.init,
    User? user,
    Object? error,
  }) =>
      UserProfileState(
        userProfileState: userProfileState ?? this.userProfileState,
        user: user ?? this.user,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [UserProfileState, error];
}
