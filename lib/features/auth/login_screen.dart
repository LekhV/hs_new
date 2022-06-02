import 'package:flutter/material.dart';
import 'package:flutter_hs/features/auth/bloc/login_event.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
import 'package:flutter_hs/ui_kit/background_container.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';
import 'package:provider/provider.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<LoginBloc>(
      create: (_) => LoginBloc(),
      builder: (context, state) {
        String email = '';
        String password = '';

        return Scaffold(
          body: BackgroundContainer(
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    context.read<LoginBloc>().add(SignInEvent(email, password));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EmailTextField extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String> onChanged;
  final bool withError;

  const EmailTextField({
    this.initialValue,
    required this.onChanged,
    this.withError = false,
    Key? key,
  }) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late final _controller = TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: buildInputDecoration(
        label: context.localizations!.emailAddress,
        withError: widget.withError,
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String> onChanged;
  final bool withError;

  const PasswordTextField({
    this.initialValue,
    required this.onChanged,
    this.withError = false,
    Key? key,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late final _controller = TextEditingController(text: widget.initialValue);

  bool _obscureText = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      textInputAction: TextInputAction.done,
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: buildInputDecoration(
        label: context.localizations!.password,
        withError: widget.withError,
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    final icon = _obscureText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye;
    return IconButton(
      onPressed: _onTapSuffixIcon,
      icon: Icon(
        icon,
        color: AppColors.white,
      ),
    );
  }

  void _onTapSuffixIcon() {
    setState(() => _obscureText = !_obscureText);
  }
}

InputDecoration buildInputDecoration({
  required String label,
  bool withError = false,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(
      color: withError ? AppColors.white : AppColors.white,
      height: 0.9,
      fontSize: 15,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: withError ? AppColors.white : AppColors.white.withOpacity(0.2),
      ),
    ),
    contentPadding: const EdgeInsetsDirectional.only(bottom: 12),
    suffixIcon: suffixIcon,
  );
}
