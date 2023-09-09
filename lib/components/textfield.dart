import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  late final TextEditingController controller;
  late final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String?)? onChanged;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.suffixIcon,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onChanged

  })

@override
Widget build(BuildContext context){
  return TextFormField(
    validator: validator,
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    focusNode:focusNode,
    onTap: ontap,
    textInputAction: TextInputAction.next,
    onChanged: onChanged,
    decoration: InputDecoration(
      suffixIcon:suffixIcon,
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: colors.transparent),
      ),

    ),
  );
}


}