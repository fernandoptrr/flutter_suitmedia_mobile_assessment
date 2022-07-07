import 'package:flutter/material.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/colors.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.onFieldTap})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onFieldTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.secondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0.5, color: AppColor.secondary),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        hintStyle: AppTheme.h3
            .copyWith(color: const Color(0xFF686777).withOpacity(0.36)),
        hintText: hintText,
      ),
      onTap: onFieldTap,
      validator: validator,
    );
  }
}
