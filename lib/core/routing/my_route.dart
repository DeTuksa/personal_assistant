import 'package:auto_route/auto_route_annotations.dart';
import 'package:personal_assistant/screens/dashboard.dart';
import 'package:personal_assistant/screens/listening_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: DashboardScreen, initial: true),
    MaterialRoute(page: ListeningScreen)
  ]
)
class $AssistantRoutes {}
