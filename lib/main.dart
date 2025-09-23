import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

import 'config/environment.dart';
import 'config/supabase_config.dart';
import 'config/mobile_theme.dart';
import 'core/constants/app_constants.dart';
import 'app/mobile_app.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    bool initializationSuccessful = false;

    try {
      // Load environment variables
      if (kDebugMode) print('🔧 Loading environment variables...');
      
      try {
        await dotenv.load(fileName: ".env");
        if (kDebugMode) print('✅ Environment variables loaded successfully');
      } catch (e) {
        if (kDebugMode) print('⚠️  Using fallback configuration: $e');
      }

      // Initialize Supabase
      if (kDebugMode) print('🗄️  Initializing Supabase...');
      await SupabaseConfig.initialize();
      if (kDebugMode) print('✅ Supabase initialized successfully');

      // Mobile-specific configurations
      if (!kIsWeb) {
        if (kDebugMode) print('📱 Configuring mobile-specific settings...');
        
        // Force portrait orientation for mobile
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

        // Configure status bar for mobile
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        );
        
        if (kDebugMode) print('✅ Mobile configuration completed');
      }

      initializationSuccessful = true;
      if (kDebugMode) print('🚀 App initialization completed successfully');
      
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('❌ Initialization error: $e');
        print('📍 Stack trace: $stackTrace');
      }
      initializationSuccessful = false;
    }

    runApp(BharatIntelligenceMobileApp(
      initializationSuccessful: initializationSuccessful,
    ));
    
  }, (error, stackTrace) {
    if (kDebugMode) {
      print('🚨 Global error caught: $error');
      print('📍 Stack trace: $stackTrace');
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
        title: Environment.appName,
        theme: MobileTheme.lightTheme,
        darkTheme: MobileTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const InitializationErrorScreen(),
      );
    }

    return const MobileApp();
  }
}

class InitializationErrorScreen extends StatelessWidget {
  const InitializationErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobileTheme.errorRed,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Initialization Failed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'The app failed to initialize properly. Please check your configuration and try again.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Restart app
                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: MobileTheme.errorRed,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Restart App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
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
      title: 'Error - ${AppConstants.appName}',
      theme: MobileTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MobileTheme.errorRed,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Critical Error',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppConstants.genericErrorMessage,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'App Status: Error',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'A critical error occurred during app startup. Please contact support if this persists.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontFamily: 'Inter',
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
      ),
    );
  }
}