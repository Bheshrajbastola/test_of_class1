import 'package:flutter/material.dart';
import 'package:test_of_class1/view/dashboard.dart';
import 'package:test_of_class1/view/login_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/loginRoute': (context) => const LoginPage(),
      },
    );
  }
}
