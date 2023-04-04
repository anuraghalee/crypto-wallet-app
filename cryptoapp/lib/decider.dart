import 'package:cryptoapp/auth.dart';
import 'package:cryptoapp/home/home.dart';
import 'package:cryptoapp/login/login.dart';
import 'package:flutter/material.dart';

class DeciderScreen extends StatelessWidget {
  const DeciderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthState().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
