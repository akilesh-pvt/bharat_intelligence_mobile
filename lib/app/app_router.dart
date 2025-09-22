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
            builder: (context, state) => const DemoScreen(title: 'Visitors Management', subtitle: 'Field visitor registration and tracking'),
          ),
          GoRoute(
            path: '/farmers',
            name: 'farmers',
            builder: (context, state) => const DemoScreen(title: 'Farmers Database', subtitle: 'Farmer profiles and crop information'),
          ),
          GoRoute(
            path: '/tasks',
            name: 'tasks',
            builder: (context, state) => const DemoScreen(title: 'Task Management', subtitle: 'Field task assignments and tracking'),
          ),
          GoRoute(
            path: '/allowances',
            name: 'allowances',
            builder: (context, state) => const DemoScreen(title: 'Allowance Approval', subtitle: 'Petrol allowance requests and approvals'),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const DemoScreen(
      title: 'Page Not Found',
      subtitle: 'The requested page could not be found.',
    ),
  );
}

class DemoScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  
  const DemoScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/dashboard'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.construction,
                size: 64,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Back to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}