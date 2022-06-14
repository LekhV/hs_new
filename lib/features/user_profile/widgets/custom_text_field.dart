import 'package:flutter/material.dart';
import 'package:flutter_hs/utils/helpers.dart';

class CustomTextField extends StatefulWidget {
  final String? initText;
  final String labelText;

  final ValueChanged<String> onChanged;

  const CustomTextField({
    required this.onChanged,
    required this.labelText,
    this.initText,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final _controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initText ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: _controller,
      focusNode: focusNode,
      onChanged: widget.onChanged,
      decoration: buildInputDecoration(
        label: widget.labelText,
      ),
    );
  }
}
