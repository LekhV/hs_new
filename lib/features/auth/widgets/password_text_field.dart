import 'package:flutter/material.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';
import 'package:flutter_hs/utils/helpers.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const PasswordTextField({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late final _controller = TextEditingController();
  final focusNode = FocusNode();

  bool _obscureText = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isError =
        !focusNode.hasFocus && _controller.text.isNotEmpty && _controller.text.length < 4;
    return TextField(
      obscureText: _obscureText,
      textInputAction: TextInputAction.done,
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: buildInputDecoration(
        label: context.localizations!.password,
        withError: isError,
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
