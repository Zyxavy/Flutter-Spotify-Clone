
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, __) => LoginScreen()),
    ShellRoute(
      builder: (ctx, state, child) => ShellScaffold(child: child),
      routes: [
        GoRoute(path: '/home', builder: (_, __) => HomeScreen()),
        GoRoute(path: '/search', builder: (_, __) => SearchScreen()),
        GoRoute(path: '/library', builder: (_, __) => LibraryScreen()),
      ],
    ),
    GoRoute(path: '/player', builder: (_, __) => NowPlayingScreen()),
  ],
);