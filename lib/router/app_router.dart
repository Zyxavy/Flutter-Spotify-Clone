import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/library/library_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/premium/premium_screen.dart';
import '../screens/search/search_screen.dart';
import '../widgets/shell_scaffold.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => ShellScaffold(child: child),
      routes: [
        GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/search', builder: (_, __) => const SearchScreen()),
        GoRoute(path: '/library', builder: (_, __) => const LibraryScreen()),
        GoRoute(path: '/premium', builder: (_, __) => const PremiumScreen()),
        GoRoute(
          path: '/create',
          builder: (_, __) => const Scaffold(
            body: Center(child: Text('Create (stub)')),
          ),
        ),
      ],
    ),
  ],
);