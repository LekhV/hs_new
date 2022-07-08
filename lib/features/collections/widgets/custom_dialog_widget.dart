import 'package:flutter/material.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../../auth/login_screen.dart';

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
    final localizations = context.localizations!;

    return AlertDialog(
      title: Text(localizations.addNameCollection),
      content: TextField(
        controller: _controller,
        decoration: buildInputDecoration(
          label: localizations.nameCollection,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, localizations.cancel),
          child: Text(localizations.cancel),
        ),
        TextButton(
          onPressed: () {
            widget.onTapOk(_controller.text);
            Navigator.pop(context);
          },
          child: Text(localizations.ok),
        ),
      ],
    );
  }
}
