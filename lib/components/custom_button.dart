import 'package:flutter/material.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/colors.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.hintText,
    required this.onTapped,
  }) : super(key: key);

  final String hintText;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        // onSurface: AppColor.white,
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size.fromHeight(41),
        backgroundColor: AppColor.primary,
        textStyle: AppTheme.title,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onPressed: onTapped,
      child: Text(hintText),
    );
  }
}
