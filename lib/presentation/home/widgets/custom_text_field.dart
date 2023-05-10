import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? type;
  final String? hinText;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final String? errorText;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool readOnly, greyed;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidate;
  final bool hidden;
  final Color? bg;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool expands;
  final TextCapitalization textCapitalization;
  final TextInputAction? inputAction;
  final int? maxLength;
  final String? initialValue;

  const CustomTextField({
    Key? key,
    this.initialValue,
    this.bg,
    this.type,
    this.hinText,
    this.suffixIcon,
    this.errorText,
    this.controller,
    this.focusNode,
    this.onTap,
    this.suffixText,
    this.suffixTextStyle,
    this.readOnly = false,
    this.greyed = false,
    this.validator,
    this.autoValidate,
    this.onChanged,
    this.hidden = false,
    this.inputFormatters,
    this.maxLines = 1,
    this.expands = false,
    this.textCapitalization = TextCapitalization.none,
    this.inputAction,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      onChanged: onChanged,
      decoration: const InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.greenAccent),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.greenAccent), // Change the color here
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.greenAccent), // Change the color here
          ),
          focusColor: Colors.greenAccent,
          labelText: 'Search by title',
          suffixIcon: Icon(
            Icons.search_outlined,
            color: Colors.greenAccent,
          )),
    );
  }
}
