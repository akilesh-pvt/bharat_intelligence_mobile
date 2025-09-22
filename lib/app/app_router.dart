import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screens/splash/mobile_splash_screen.dart';
import '../presentation/screens/auth/mobile_login_screen.dart';
import '../presentation/screens/dashboard/mobile_dashboard_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const MobileSplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const MobileLoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const MobileDashboardScreen(),
        routes: [
          GoRoute(
            path: '/visitors',
            name: 'visitors',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Visitors Screen - Coming Soon'),
              ),
            ),
          ),
          GoRoute(
            path: '/farmers',
            name: 'farmers',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Farmers Screen - Coming Soon'),
              ),
            ),
          ),
          GoRoute(
            path: '/tasks',
            name: 'tasks',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Tasks Screen - Coming Soon'),
              ),
            ),
          ),
          GoRoute(
            path: '/allowances',
            name: 'allowances',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Allowances Screen - Coming Soon'),
              ),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found: ${state.uri}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    ),
  );
}