import 'package:finance_app/common/constants/app_colos.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextCapitalization? textCapitalization;
  final TextInputType textInputType;
  final String hintText;
  final String labelText;
  final Widget? suffixIcon;
  final bool? obscureText;

  CustomTextField(
      {super.key,
      required this.textEditingController,
      this.textCapitalization,
      required this.textInputType,
      required this.hintText,
      required this.labelText,
      this.obscureText,
      this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        controller: widget.textEditingController,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.words,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon ?? null,
            hintStyle: TextStyle(
              color: const Color.fromARGB(255, 81, 81, 81),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: widget.labelText.toUpperCase(),
            labelStyle: TextStyle(
                color: const Color.fromARGB(255, 81, 81, 81),
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.greelightOne, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.greelightOne, width: 2))),
      ),
    );
  }
}
