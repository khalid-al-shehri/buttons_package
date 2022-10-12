import 'package:flutter/material.dart';

class BluFlatButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const BluFlatButton({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
