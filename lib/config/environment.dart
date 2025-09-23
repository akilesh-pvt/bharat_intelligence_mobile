import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // Prevent instantiation
  Environment._();

  // Supabase Configuration
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get supabaseServiceRoleKey => dotenv.env['SUPABASE_SERVICE_ROLE_KEY'] ?? '';

  // Google OAuth Configuration
  static String get googleClientIdWeb => dotenv.env['GOOGLE_CLIENT_ID_WEB'] ?? '';
  static String get googleClientIdAndroid => dotenv.env['GOOGLE_CLIENT_ID_ANDROID'] ?? '';
  static String get googleClientIdIOS => dotenv.env['GOOGLE_CLIENT_ID_IOS'] ?? '';
  static String get googleClientSecretWeb => dotenv.env['GOOGLE_CLIENT_SECRET_WEB'] ?? '';

  // API Configuration
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
  static String get apiRestUrl => dotenv.env['API_REST_URL'] ?? '';
  static String get apiRealtimeUrl => dotenv.env['API_REALTIME_URL'] ?? '';
  static String get apiStorageUrl => dotenv.env['API_STORAGE_URL'] ?? '';
  static int get apiTimeout => int.tryParse(dotenv.env['API_TIMEOUT'] ?? '30000') ?? 30000;
  static int get apiRetryCount => int.tryParse(dotenv.env['API_RETRY_COUNT'] ?? '3') ?? 3;

  // App Configuration
  static String get appName => dotenv.env['APP_NAME'] ?? 'Bharat Intelligence Admin';
  static String get appDisplayName => dotenv.env['APP_DISPLAY_NAME'] ?? 'BI Admin Dashboard';
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '1.0.0';
  static String get buildNumber => dotenv.env['BUILD_NUMBER'] ?? '1';
  static String get packageName => dotenv.env['PACKAGE_NAME'] ?? 'com.bharatintelligence.admin';
  static String get bundleId => dotenv.env['BUNDLE_ID'] ?? 'com.bharatintelligence.admin';
  static String get environment => dotenv.env['ENVIRONMENT'] ?? 'development';

  // Security Configuration
  static int get sessionTimeout => int.tryParse(dotenv.env['SESSION_TIMEOUT'] ?? '86400') ?? 86400;
  static int get maxLoginAttempts => int.tryParse(dotenv.env['MAX_LOGIN_ATTEMPTS'] ?? '5') ?? 5;
  static int get jwtExpiry => int.tryParse(dotenv.env['JWT_EXPIRY'] ?? '7200') ?? 7200;
  static int get refreshTokenExpiry => int.tryParse(dotenv.env['REFRESH_TOKEN_EXPIRY'] ?? '604800') ?? 604800;

  // Feature Flags
  static bool get enableAnalytics => dotenv.env['ENABLE_ANALYTICS']?.toLowerCase() == 'true';
  static bool get enablePushNotifications => dotenv.env['ENABLE_PUSH_NOTIFICATIONS']?.toLowerCase() == 'true';
  static bool get enableBiometricAuth => dotenv.env['ENABLE_BIOMETRIC_AUTH']?.toLowerCase() == 'true';
  static bool get enableOfflineMode => dotenv.env['ENABLE_OFFLINE_MODE']?.toLowerCase() == 'true';
  static bool get enableDarkMode => dotenv.env['ENABLE_DARK_MODE']?.toLowerCase() == 'true';
  static bool get debugMode => dotenv.env['DEBUG_MODE']?.toLowerCase() == 'true';
  static bool get enableLogging => dotenv.env['ENABLE_LOGGING']?.toLowerCase() == 'true';

  // File Upload Configuration
  static int get maxFileSizeMB => int.tryParse(dotenv.env['MAX_FILE_SIZE_MB'] ?? '10') ?? 10;
  static String get allowedImageFormats => dotenv.env['ALLOWED_IMAGE_FORMATS'] ?? 'jpg,jpeg,png,webp,heic';
  static String get storageBucketUploads => dotenv.env['STORAGE_BUCKET_UPLOADS'] ?? 'admin-uploads';
  static int get imageCompressionQuality => int.tryParse(dotenv.env['IMAGE_COMPRESSION_QUALITY'] ?? '80') ?? 80;

  // Maps & Location Configuration
  static String get googleMapsApiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  static int get locationAccuracyMeters => int.tryParse(dotenv.env['LOCATION_ACCURACY_METERS'] ?? '10') ?? 10;
  static double get defaultMapZoom => double.tryParse(dotenv.env['DEFAULT_MAP_ZOOM'] ?? '15') ?? 15;

  // Business Logic Configuration
  static double get fuelRatePerKm => double.tryParse(dotenv.env['FUEL_RATE_PER_KM'] ?? '5.50') ?? 5.50;
  static double get overtimeRateMultiplier => double.tryParse(dotenv.env['OVERTIME_RATE_MULTIPLIER'] ?? '1.5') ?? 1.5;
  static int get taskDeadlineWarningDays => int.tryParse(dotenv.env['TASK_DEADLINE_WARNING_DAYS'] ?? '3') ?? 3;
  static double get autoApproveAllowanceThreshold => double.tryParse(dotenv.env['AUTO_APPROVE_ALLOWANCE_THRESHOLD'] ?? '500') ?? 500;

  // Development & Testing
  static bool get mockData => dotenv.env['MOCK_DATA']?.toLowerCase() == 'true';
  static bool get enableInspector => dotenv.env['ENABLE_INSPECTOR']?.toLowerCase() == 'true';
  static String get testUserEmail => dotenv.env['TEST_USER_EMAIL'] ?? 'test@bharatintelligence.com';
  static bool get testMode => dotenv.env['TEST_MODE']?.toLowerCase() == 'true';

  // Localization
  static String get defaultLocale => dotenv.env['DEFAULT_LOCALE'] ?? 'en_IN';
  static String get currencyCode => dotenv.env['CURRENCY_CODE'] ?? 'INR';
  static String get currencySymbol => dotenv.env['CURRENCY_SYMBOL'] ?? '₹';
  static String get dateFormat => dotenv.env['DATE_FORMAT'] ?? 'dd/MM/yyyy';

  // Environment checks
  static bool get isDevelopment => environment == 'development';
  static bool get isProduction => environment == 'production';
  static bool get isStaging => environment == 'staging';
}