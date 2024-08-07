import 'package:adv_flutter_exam/provider/provider_page.dart';
import 'package:adv_flutter_exam/splash_screen.dart';
import 'package:adv_flutter_exam/view/home_page.dart';
import 'package:adv_flutter_exam/view/liked_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
      create: (context) => QuoteProvider(),
      builder: (context, child) =>
          MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => const SplashScreen(),
          '/home' : (context) => const HomePage(),
          '/likePage' : (context) => const LikePage(),
        },
      ),
    );
  }
}
