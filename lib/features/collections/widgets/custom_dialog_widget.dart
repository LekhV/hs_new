import 'package:flutter/material.dart';
import 'package:flutter_hs/utils/helpers.dart';

class CustomDialogWidget extends StatefulWidget {
  final ValueChanged<String> onTapOk;
  const CustomDialogWidget({Key? key, required this.onTapOk}) : super(key: key);

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  late final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add name collection'),
      content: TextField(
        controller: _controller,
        decoration: buildInputDecoration(
          label: 'Name colletion',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onTapOk(_controller.text);
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
