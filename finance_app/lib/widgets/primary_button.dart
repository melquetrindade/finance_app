import 'package:finance_app/common/constants/app_colos.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(38),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.greelightOne, AppColors.greelightTwo])),
        child: InkWell(
          borderRadius: BorderRadius.circular(38),
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            height: 64.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
