import 'dart:async';
import 'package:adv_flutter_exam/view/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
    });
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'QuotesApp',
            style: TextStyle(
                color: Colors.yellow, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 2,),
          Text(
            'We have picked some quotes for you.',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400,letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}
