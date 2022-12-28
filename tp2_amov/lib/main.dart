import 'package:flutter/material.dart';
import 'package:tp2_amov/views/edit_page.dart';
import 'package:tp2_amov/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMov TP2',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //home: const MyHomePage(title: 'First Flutter App'),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        EditPage.routeName: (context) => const EditPage(),
      },
      debugShowCheckedModeBanner:
          false, // remove o simbolo debug que aparece no canto do ecra
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  static const String routeName = '/';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
