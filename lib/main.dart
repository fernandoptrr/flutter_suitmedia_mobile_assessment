import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suitmedia_mobile_assessment/cubits/list_user_cubit.dart';
import 'package:flutter_suitmedia_mobile_assessment/pages/first_screen.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListUserCubit(),
      child: MaterialApp(
        title: 'Suitmedia Assessment',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: const FirstScreen(),
      ),
    );
  }
}
