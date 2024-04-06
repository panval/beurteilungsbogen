import 'package:beurteilungsbogen/startseite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beurteilung',
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Beurteilungen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: false,
          ),
          body: const Startseite(),
        ),
      ),
    );
  }
}
