import 'package:flutter/material.dart';

class MultiTextButton extends StatelessWidget {
  final List<Text> childrenTxt;
  final VoidCallback onPressed;

  const MultiTextButton({
    super.key,
    required this.childrenTxt,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: childrenTxt,
        ));
  }
}
