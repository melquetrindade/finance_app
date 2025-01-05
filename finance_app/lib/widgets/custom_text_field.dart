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
  final FormFieldValidator<String>? validator;
  final String? helperText;

  CustomTextField(
      {super.key,
      required this.textEditingController,
      this.textCapitalization,
      required this.textInputType,
      required this.hintText,
      required this.labelText,
      this.obscureText,
      this.suffixIcon,
      this.validator,
      this.helperText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
          } else {
            setState(() {
              _helperText = null;
            });
          }
        },
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        controller: widget.textEditingController,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.words,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
            errorMaxLines: 3,
            helperText: _helperText,
            helperMaxLines: 3,
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
