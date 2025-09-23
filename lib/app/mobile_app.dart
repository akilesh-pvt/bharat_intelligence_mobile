import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../config/environment.dart';
import '../config/mobile_theme.dart';
import 'app_router.dart';

class MobileApp extends StatefulWidget {
  const MobileApp({super.key});

  @override
  State<MobileApp> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('🚀 MobileApp initialized successfully');
      print('🎨 Theme: ${Environment.enableDarkMode ? "Dark + Light" : "Light Only"}');
      print('📱 Environment: ${Environment.isDevelopment ? "Development" : Environment.isProduction ? "Production" : "Staging"}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // App configuration
      title: Environment.appDisplayName,
      debugShowCheckedModeBanner: Environment.debugMode && kDebugMode,
      
      // Router configuration
      routerConfig: AppRouter.router,
      
      // Theme configuration
      theme: MobileTheme.lightTheme,
      darkTheme: Environment.enableDarkMode ? MobileTheme.darkTheme : null,
      themeMode: Environment.enableDarkMode ? ThemeMode.system : ThemeMode.light,
      
      // Localization configuration
      locale: Locale(Environment.defaultLocale.split('_').first, Environment.defaultLocale.split('_').last),
      
      // Builder for global app-wide widgets
      builder: (context, child) {
        return MediaQuery(
          // Ensure text scaling doesn't break layout
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaler.scale(1.0).clamp(0.8, 1.2),
            ),
          ),
          child: _buildAppWrapper(context, child),
        );
      },
    );
  }

  Widget _buildAppWrapper(BuildContext context, Widget? child) {
    return Stack(
      children: [
        // Main app content
        child ?? const SizedBox.shrink(),
        
        // Development overlay (only in debug mode)
        if (Environment.debugMode && kDebugMode)
          _buildDevelopmentOverlay(context),
      ],
    );
  }

  Widget _buildDevelopmentOverlay(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      right: 10,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Environment.isDevelopment 
                ? Colors.orange.withValues(alpha: 0.9)
                : Environment.isStaging 
                    ? Colors.purple.withValues(alpha: 0.9)
                    : Colors.red.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Environment.isDevelopment 
                    ? Icons.code 
                    : Environment.isStaging 
                        ? Icons.science 
                        : Icons.rocket_launch,
                color: Colors.white,
                size: 12,
              ),
              const SizedBox(width: 4),
              Text(
                Environment.isDevelopment 
                    ? 'DEV' 
                    : Environment.isStaging 
                        ? 'STAGE' 
                        : 'PROD',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mobile App Status Screen (for Phase 1 testing)
class MobileAppStatusScreen extends StatelessWidget {
  const MobileAppStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobileTheme.primaryBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo/Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.admin_panel_settings,
                  color: MobileTheme.primaryBlue,
                  size: 60,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // App Title
              Text(
                Environment.appName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              Text(
                Environment.appDisplayName,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 48),
              
              // Status Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Phase 1 Complete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Foundation Setup Successful',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Status Items
                    _buildStatusItem('✅ Dependencies Configured', true),
                    _buildStatusItem('✅ Environment Setup', true),
                    _buildStatusItem('✅ Supabase Integration', true),
                    _buildStatusItem('✅ Mobile Theme Applied', true),
                    _buildStatusItem('✅ Router Configuration', true),
                    _buildStatusItem('✅ Core Screens Created', true),
                    _buildStatusItem('🚧 Authentication (Phase 2)', false),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Version Info
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'v${Environment.appVersion} (${Environment.buildNumber}) - ${Environment.environment.toUpperCase()}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusItem(String text, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isCompleted 
                  ? MobileTheme.successGreen.withValues(alpha: 0.2)
                  : MobileTheme.warningOrange.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isCompleted ? Icons.check : Icons.schedule,
              size: 12,
              color: isCompleted 
                  ? MobileTheme.successGreen
                  : MobileTheme.warningOrange,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: isCompleted ? Colors.white : Colors.white70,
                fontSize: 14,
                fontWeight: isCompleted ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}