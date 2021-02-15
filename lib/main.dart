import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_assistant/core/models/article_model.dart';
import 'package:personal_assistant/core/models/location_model.dart';
import 'package:personal_assistant/core/models/speech_recognition_model.dart';
import 'package:personal_assistant/core/routing/my_route.gr.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocationModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SpeechRecModel(),
        )
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder<AssistantRoutes>(
        router: AssistantRoutes(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
