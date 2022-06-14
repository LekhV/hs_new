import 'package:flutter/material.dart';
import 'package:flutter_hs/utils/helpers.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

class EmailTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const EmailTextField({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late final _controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isError =
        !focusNode.hasFocus && _controller.text.isNotEmpty && !validateEmail(_controller.text);
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _controller,
      focusNode: focusNode,
      onChanged: widget.onChanged,
      decoration: buildInputDecoration(
        label: context.localizations!.emailAddress,
        withError: isError,
      ),
    );
  }
}
