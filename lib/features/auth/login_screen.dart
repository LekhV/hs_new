import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hs/darwer/bloc/info_hs_bloc.dart';
import 'package:flutter_hs/darwer/drawer_screen.dart';
import 'package:flutter_hs/features/auth/bloc/login_event.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';
import 'widgets/email_text_field.dart';
import 'widgets/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginState == LoginStateEnum.error && state.error != null) {
          _showMessage(context, context.localizations!.getErrorMessage(state.error!));
        }
        if (state.loginState == LoginStateEnum.success) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => BlocProvider<InfoHSBloc>(
                create: (BuildContext context) => InfoHSBloc(),
                child: const DrawerScreen(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
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
                  EmailTextField(
                    onChanged: (String value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 24),
                  PasswordTextField(
                    onChanged: (String value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    child: Text(
                      context.localizations!.signIn,
                      style: const TextStyle(fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 100.0),
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(SignInEvent(email, password));
                    },
                  ),
                  OutlinedButton(
                    child: Text(
                      context.localizations!.signUp,
                      style: const TextStyle(fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 100.0),
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(SignUpEvent(email, password));
                    },
                  ),
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
