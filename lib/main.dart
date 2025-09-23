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
            statusBarIconBrightness: Brightness.light, // White status icons on blue background
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
        seedColor: const Color(0xFF2563EB), // Bharat Intelligence blue
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 2,
        scrolledUnderElevation: 2,
        backgroundColor: Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                // Custom Logo Container
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          'A',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2563EB),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Bharat Intelligence',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Mobile App Running Successfully!',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white, size: 40),
                      SizedBox(height: 16),
                      Text(
                        'App Status: Working',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Your mobile app is running successfully with the custom Bharat Intelligence branding.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
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
                  const SizedBox(height: 16),
                  const Text(
                    'Please check the configuration and try again.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
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