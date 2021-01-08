import 'package:auto_route/auto_route_annotations.dart';
import 'package:personal_assistant/screens/dashboard.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: DashboardScreen, initial: true),
  ]
)
class $AssistantRoutes {}
