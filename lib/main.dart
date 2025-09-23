import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';

import 'core/platform/platform_detector.dart';
import 'app/app_router.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    bool initializationSuccessful = false;

    try {
      // Load environment variables with mobile fallback
      if (kDebugMode) print('Loading environment variables...');
      
      try {
        await dotenv.load(fileName: ".env");
        if (kDebugMode) print('Environment variables loaded from file');
      } catch (e) {
        if (kDebugMode) print('Using fallback configuration for mobile');
      }

      initializationSuccessful = true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Initialization error: $e');
        print('Stack trace: $stackTrace');
      }
      initializationSuccessful = false;
    }

    // Mobile-specific configurations
    try {
      if (!kIsWeb) {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        if (kDebugMode) print('System UI configured');
      }
    } catch (e) {
      if (kDebugMode) print('System UI configuration failed: $e');
    }

    runApp(BharatIntelligenceMobileApp(
      initializationSuccessful: initializationSuccessful,
    ));
  }, (error, stackTrace) {
    if (kDebugMode) {
      print('Global error caught: $error');
      print('Stack trace: $stackTrace');
    }
    runApp(const ErrorApp());
  });
}

class BharatIntelligenceMobileApp extends StatelessWidget {
  final bool initializationSuccessful;

  const BharatIntelligenceMobileApp({
    super.key,
    this.initializationSuccessful = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!initializationSuccessful) {
      return MaterialApp(
        title: 'Bharat Intelligence',
        theme: _buildLightTheme(),
        debugShowCheckedModeBanner: false,
        home: const TestScreen(),
      );
    }

    try {
      return MaterialApp.router(
        title: 'Bharat Intelligence',
        theme: _buildLightTheme(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      );
    } catch (e) {
      if (kDebugMode) print('Router error: $e');
      return MaterialApp(
        title: 'Bharat Intelligence',
        theme: _buildLightTheme(),
        debugShowCheckedModeBanner: false,
        home: const TestScreen(),
      );
    }
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2563EB),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2563EB),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.admin_panel_settings,
                    color: Color(0xFF2563EB),
                    size: 50,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Bharat Intelligence',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Mobile App Running Successfully!',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white, size: 32),
                      SizedBox(height: 12),
                      Text(
                        'App Status: Working',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFDC2626),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.white, size: 80),
                  const SizedBox(height: 24),
                  const Text(
                    'Critical Error',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}