import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/ui_kit/custom_indicator.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import 'bloc/user_profile_bloc.dart';
import 'bloc/user_profile_event.dart';
import 'bloc/user_profile_state.dart';
import 'widgets/custom_text_field.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserProfileBloc>().add(InitUser());
  }

  @override
  Widget build(BuildContext context) {
    String displayName = '';
    return BlocConsumer<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state.userProfileState == UserProfileStateEnum.error && state.error != null) {
          _showMessage(context, context.localizations!.getErrorMessage(state.error!));
        }
      },
      builder: (context, state) {
        if (state.userProfileState == UserProfileStateEnum.init) {
          return const CustomIndicator();
        }
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: BackgroundContainer(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    initText: state.user?.displayName,
                    labelText: context.localizations!.displayName,
                    onChanged: (String value) {
                      displayName = value;
                    },
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    child: Text(
                      context.localizations!.changeIt,
                      style: const TextStyle(fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 100.0),
                    ),
                    onPressed: () {
                      context.read<UserProfileBloc>().add(UpdateDisplayName(displayName));
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
