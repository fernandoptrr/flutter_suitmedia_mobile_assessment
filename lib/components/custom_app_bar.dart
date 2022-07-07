import 'package:flutter/material.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/colors.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTheme.h2,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 14,
          color: AppColor.accend,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
