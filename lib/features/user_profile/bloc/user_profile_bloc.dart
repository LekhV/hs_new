import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_profile_event.dart';
import 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(const UserProfileState()) {
    on<InitUser>((event, emit) async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        emit(state.copyWith(userProfileState: UserProfileStateEnum.success, user: user));
      } catch (e) {
        emit(state.copyWith(userProfileState: UserProfileStateEnum.error, error: e));
      }
    });

    on<UpdateDisplayName>((event, emit) async {
      emit(state.copyWith(userProfileState: UserProfileStateEnum.init));

      try {
        User? user = FirebaseAuth.instance.currentUser;
        await user?.updateDisplayName(event.displayName);
        user = FirebaseAuth.instance.currentUser;

        emit(state.copyWith(userProfileState: UserProfileStateEnum.success, user: user));
      } catch (e) {
        emit(state.copyWith(userProfileState: UserProfileStateEnum.error, error: e));
      }
    });
  }
}
