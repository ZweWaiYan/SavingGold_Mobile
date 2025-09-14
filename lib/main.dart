import 'package:flutter/material.dart';
import 'package:gold_td/mainNavigationPage.dart';
import 'package:gold_td/page/authPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/authPage',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFE0DCDC)),
      routes: {
        '/': (context) => const MainNavigationPage(),

        '/authPage': (context) => const Authpage(),
      },
    );
  }
}
