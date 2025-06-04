import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/details_screen.dart';
import '../screens/form_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/details/:index',
      builder: (context, state) {
        final index = int.parse(state.pathParameters['index']!);
        return DetailsScreen(index: index);
      },
    ),
    GoRoute(
      path: '/form',
      builder: (context, state) => FormScreen(),
    ),
    GoRoute(
      path: '/form/:index',
      builder: (context, state) {
        final index = int.parse(state.pathParameters['index']!);
        return FormScreen(index: index);
      },
    ),
  ],
);
