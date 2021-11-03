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

  final _rootRouter = AssistantRoutes();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'myAssistant',
      debugShowCheckedModeBanner: false,
      routerDelegate: _rootRouter.delegate(),
      routeInformationParser: _rootRouter.defaultRouteParser(),
      routeInformationProvider: _rootRouter.routeInfoProvider(),
      // builder: ExtendedNavigator.builder<app_router.AssistantRoutes>(
      //   router: AssistantRoutes(),
      // ),
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
