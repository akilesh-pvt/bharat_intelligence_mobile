import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // Supabase Configuration
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get supabaseServiceRoleKey => dotenv.env['SUPABASE_SERVICE_ROLE_KEY'] ?? '';
  
  // Google OAuth Configuration
  static String get googleClientIdWeb => dotenv.env['GOOGLE_CLIENT_ID_WEB'] ?? '';
  static String get googleClientIdAndroid => dotenv.env['GOOGLE_CLIENT_ID_ANDROID'] ?? '';
  static String get googleClientIdIOS => dotenv.env['GOOGLE_CLIENT_ID_IOS'] ?? '';
  static String get googleClientSecretWeb => dotenv.env['GOOGLE_CLIENT_SECRET_WEB'] ?? '';
  
  // App Configuration
  static String get appName => dotenv.env['APP_NAME'] ?? 'Bharat Intelligence';
  static String get appDisplayName => dotenv.env['APP_DISPLAY_NAME'] ?? 'BI Admin';
  static String get packageName => dotenv.env['PACKAGE_NAME'] ?? 'com.bharatintelligence.admin';
  static String get environment => dotenv.env['ENVIRONMENT'] ?? 'development';
  
  // API Configuration
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
  static String get apiTimeout => dotenv.env['API_TIMEOUT'] ?? '30000';
  
  // Feature Flags
  static bool get enableAnalytics => dotenv.env['ENABLE_ANALYTICS']?.toLowerCase() == 'true';
  static bool get enablePushNotifications => dotenv.env['ENABLE_PUSH_NOTIFICATIONS']?.toLowerCase() == 'true';
  static bool get enableBiometricAuth => dotenv.env['ENABLE_BIOMETRIC_AUTH']?.toLowerCase() == 'true';
  static bool get enableOfflineMode => dotenv.env['ENABLE_OFFLINE_MODE']?.toLowerCase() == 'true';
  static bool get debugMode => dotenv.env['DEBUG_MODE']?.toLowerCase() == 'true';
  
  // Business Logic
  static double get fuelRatePerKm => double.tryParse(dotenv.env['FUEL_RATE_PER_KM'] ?? '5.50') ?? 5.50;
  static String get currencySymbol => dotenv.env['CURRENCY_SYMBOL'] ?? '₹';
  static String get defaultLocale => dotenv.env['DEFAULT_LOCALE'] ?? 'en_IN';
  
  // Development
  static bool get isProduction => environment == 'production';
  static bool get isDevelopment => environment == 'development';
  static bool get isStaging => environment == 'staging';
}