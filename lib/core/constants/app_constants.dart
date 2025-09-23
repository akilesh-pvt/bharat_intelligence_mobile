class AppConstants {
  AppConstants._();

  // App Information
  static const String appName = 'Bharat Intelligence';
  static const String appDisplayName = 'BI Admin Dashboard';
  static const String appVersion = '1.0.0';
  static const String buildNumber = '1';
  static const String packageName = 'com.bharatintelligence.admin';

  // Company Information
  static const String companyName = 'Bharat Intelligence';
  static const String companyWebsite = 'https://bharatintelligence.com';
  static const String supportEmail = 'support@bharatintelligence.com';
  static const String adminEmail = 'admin@bharatintelligence.com';

  // Navigation Routes
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String dashboardRoute = '/dashboard';
  static const String visitorsRoute = '/visitors';
  static const String visitorsListRoute = '/visitors/list';
  static const String visitorsDetailRoute = '/visitors/detail';
  static const String visitorsFormRoute = '/visitors/form';
  static const String farmersRoute = '/farmers';
  static const String farmersListRoute = '/farmers/list';
  static const String farmersDetailRoute = '/farmers/detail';
  static const String farmersFormRoute = '/farmers/form';
  static const String tasksRoute = '/tasks';
  static const String tasksListRoute = '/tasks/list';
  static const String tasksDetailRoute = '/tasks/detail';
  static const String tasksFormRoute = '/tasks/form';
  static const String allowancesRoute = '/allowances';
  static const String allowancesListRoute = '/allowances/list';
  static const String allowancesDetailRoute = '/allowances/detail';
  static const String allowancesApprovalRoute = '/allowances/approval';
  static const String profileRoute = '/profile';
  static const String settingsRoute = '/settings';
  static const String reportsRoute = '/reports';
  static const String notificationsRoute = '/notifications';

  // Asset Paths
  static const String logoPath = 'assets/logo/app_logo.png';
  static const String logoIconPath = 'assets/logo/app_icon.png';
  static const String googleLogoPath = 'assets/images/google_logo.png';
  static const String placeholderImagePath = 'assets/images/placeholder.png';
  static const String noDataImagePath = 'assets/images/no_data.svg';
  static const String errorImagePath = 'assets/images/error.svg';
  static const String emptyStateImagePath = 'assets/images/empty_state.svg';

  // Animation Durations
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);
  static const Duration refreshIndicatorDuration = Duration(seconds: 2);
  static const Duration snackBarDuration = Duration(seconds: 3);
  static const Duration toastDuration = Duration(seconds: 2);

  // UI Measurements
  static const double borderRadius = 12.0;
  static const double cardBorderRadius = 16.0;
  static const double buttonBorderRadius = 12.0;
  static const double inputBorderRadius = 12.0;
  static const double chipBorderRadius = 20.0;
  static const double fabBorderRadius = 16.0;

  // Padding & Margins
  static const double paddingXS = 4.0;
  static const double paddingSM = 8.0;
  static const double paddingMD = 16.0;
  static const double paddingLG = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconSM = 20.0;
  static const double iconMD = 24.0;
  static const double iconLG = 32.0;
  static const double iconXL = 48.0;
  static const double iconXXL = 64.0;

  // Font Sizes
  static const double fontSizeXS = 10.0;
  static const double fontSizeSM = 12.0;
  static const double fontSizeMD = 14.0;
  static const double fontSizeLG = 16.0;
  static const double fontSizeXL = 18.0;
  static const double fontSizeXXL = 20.0;
  static const double fontSizeTitle = 24.0;
  static const double fontSizeHeading = 28.0;
  static const double fontSizeDisplay = 32.0;

  // Button Heights
  static const double buttonHeightSM = 40.0;
  static const double buttonHeightMD = 48.0;
  static const double buttonHeightLG = 56.0;

  // List Item Heights
  static const double listItemHeight = 72.0;
  static const double compactListItemHeight = 56.0;
  static const double expandedListItemHeight = 88.0;

  // Dialog & Bottom Sheet
  static const double dialogBorderRadius = 20.0;
  static const double bottomSheetBorderRadius = 24.0;
  static const double bottomSheetMaxHeight = 0.9;

  // Image & Avatar Sizes
  static const double avatarSizeSM = 32.0;
  static const double avatarSizeMD = 48.0;
  static const double avatarSizeLG = 64.0;
  static const double avatarSizeXL = 96.0;
  static const double profileImageSize = 120.0;

  // Grid & Layout
  static const double gridSpacing = 16.0;
  static const double cardElevation = 2.0;
  static const double modalElevation = 8.0;
  static const double appBarElevation = 0.0;
  static const double bottomNavElevation = 8.0;

  // Network & API
  static const int apiTimeoutSeconds = 30;
  static const int apiRetryCount = 3;
  static const int refreshThreshold = 5; // seconds
  static const int cacheExpiryMinutes = 15;
  static const int sessionTimeoutMinutes = 30;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  static const int minPageSize = 5;
  static const int loadMoreThreshold = 5; // items from bottom

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;
  static const int maxCommentLength = 500;
  static const int maxDescriptionLength = 1000;
  static const int phoneNumberLength = 10;
  static const int otpLength = 6;

  // File Upload
  static const int maxImageSizeMB = 10;
  static const int maxDocumentSizeMB = 5;
  static const List<String> allowedImageExtensions = ['jpg', 'jpeg', 'png', 'webp', 'heic'];
  static const List<String> allowedDocumentExtensions = ['pdf', 'doc', 'docx'];
  static const int imageCompressionQuality = 80;
  static const double imageMaxWidth = 1920;
  static const double imageMaxHeight = 1080;
  static const double thumbnailSize = 200;

  // Location & Maps
  static const double defaultLatitude = 28.6139; // New Delhi
  static const double defaultLongitude = 77.2090;
  static const double defaultZoomLevel = 15.0;
  static const double locationAccuracyMeters = 10.0;
  static const int locationTimeoutSeconds = 30;

  // Business Logic
  static const double defaultFuelRate = 5.50; // per km
  static const double maxAllowanceAmount = 10000.0;
  static const int maxTasksPerUser = 50;
  static const int maxAttachmentsPerTask = 5;
  static const int taskDeadlineWarningDays = 3;
  static const double overtimeMultiplier = 1.5;

  // Error Messages
  static const String genericErrorMessage = 'Something went wrong. Please try again.';
  static const String networkErrorMessage = 'Please check your internet connection.';
  static const String sessionExpiredMessage = 'Your session has expired. Please login again.';
  static const String unauthorizedMessage = 'You are not authorized to perform this action.';
  static const String validationErrorMessage = 'Please check the entered information.';
  static const String fileUploadErrorMessage = 'Failed to upload file. Please try again.';
  static const String locationErrorMessage = 'Unable to get your location. Please try again.';

  // Success Messages
  static const String loginSuccessMessage = 'Welcome back!';
  static const String logoutSuccessMessage = 'Logged out successfully';
  static const String saveSuccessMessage = 'Saved successfully';
  static const String deleteSuccessMessage = 'Deleted successfully';
  static const String uploadSuccessMessage = 'Uploaded successfully';
  static const String updateSuccessMessage = 'Updated successfully';

  // Loading Messages
  static const String loadingMessage = 'Loading...';
  static const String savingMessage = 'Saving...';
  static const String uploadingMessage = 'Uploading...';
  static const String deletingMessage = 'Deleting...';
  static const String processingMessage = 'Processing...';
  static const String signingInMessage = 'Signing in...';
  static const String signingOutMessage = 'Signing out...';

  // Empty State Messages
  static const String noDataMessage = 'No data available';
  static const String noResultsMessage = 'No results found';
  static const String noNotificationsMessage = 'No new notifications';
  static const String noTasksMessage = 'No tasks assigned';
  static const String noAllowancesMessage = 'No allowance requests';
  static const String noVisitorsMessage = 'No field visitors';
  static const String noFarmersMessage = 'No farmers registered';

  // Permission Messages
  static const String cameraPermissionMessage = 'Camera permission is required to take photos';
  static const String storagePermissionMessage = 'Storage permission is required to access files';
  static const String locationPermissionMessage = 'Location permission is required for this feature';
  static const String phonePermissionMessage = 'Phone permission is required to make calls';

  // Feature Flags (default values)
  static const bool enableDarkMode = true;
  static const bool enableNotifications = true;
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
  static const bool enableBiometricAuth = false;
  static const bool enableOfflineMode = true;
  static const bool enableLocationTracking = true;
  static const bool enablePushNotifications = true;
  static const bool enableRealTimeSync = true;

  // Currency & Localization
  static const String currencySymbol = '₹';
  static const String currencyCode = 'INR';
  static const String defaultLocale = 'en_IN';
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';

  // Social & Contact
  static const String phoneNumber = '+91-XXXXXXXXXX';
  static const String whatsappNumber = '+91-XXXXXXXXXX';
  static const String facebookUrl = 'https://facebook.com/bharatintelligence';
  static const String twitterUrl = 'https://twitter.com/bharatintelligence';
  static const String linkedinUrl = 'https://linkedin.com/company/bharatintelligence';
  static const String instagramUrl = 'https://instagram.com/bharatintelligence';

  // Debug & Development
  static const bool showDebugBanner = false;
  static const bool enableLogging = true;
  static const bool enablePerformanceOverlay = false;
  static const bool showInspector = false;
}