import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxlength;
  final Color? inputTextcolor;
  final Color? hintTextcolor;
  final String? labelText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final Color? labelColor;
  final Function()? onTap;

  const CustomTextFormField({
    super.key,
    this.maxlength,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.inputTextcolor,
    this.hintTextcolor,
    this.labelText,
    this.suffixIcon,
    this.labelColor,
    this.onTap,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: inputTextcolor),
      maxLength: maxlength,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color.fromARGB(255, 171, 170, 170)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color.fromARGB(255, 171, 170, 170)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(255, 171, 170, 170))),
        prefixIcon: prefixIcon,
        suffixIcon:
            IconButton(onPressed: onTap, icon: suffixIcon ?? const SizedBox()),
        label: labelText == ''
            ? Text(
                '$labelText',
                style: TextStyle(color: labelColor),
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextcolor),
        fillColor: Colors.transparent,
        filled: true,
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
