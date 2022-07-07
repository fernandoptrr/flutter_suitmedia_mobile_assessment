import 'package:flutter/material.dart';
import 'package:flutter_suitmedia_mobile_assessment/components/custom_app_bar.dart';
import 'package:flutter_suitmedia_mobile_assessment/components/custom_button.dart';
import 'package:flutter_suitmedia_mobile_assessment/pages/third_screen.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/theme.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, this.userName}) : super(key: key);

  final String? userName;
  static const nameRoute = '/second';

  @override
  Widget build(BuildContext context) {
    final String headerName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: CustomAppBar(title: "Second Page"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome', style: AppTheme.body),
                    Text(headerName, style: AppTheme.h2),
                  ],
                ),
              ),
              Text(userName ?? 'Selected User Name', style: AppTheme.h1),
              CustomButton(
                  hintText: "Choose a User",
                  onTapped: () {
                    Navigator.pushNamed(context, ThirdScreen.nameRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
