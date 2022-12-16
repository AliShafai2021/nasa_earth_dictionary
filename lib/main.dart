import 'package:flutter/material.dart';
import 'package:nasa/constants/colors.dart';
import 'package:nasa/constants/theme.dart';
import 'package:nasa/screens/Home_page/home_page.dart';
import 'package:nasa/screens/login_page/login_screen.dart';
import 'package:nasa/screens/welcome_page/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA Abbreviation',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // To Navigate to the first page
      home: const LoginWidget(),
      color: AppColors.color,
    );
  }
}
