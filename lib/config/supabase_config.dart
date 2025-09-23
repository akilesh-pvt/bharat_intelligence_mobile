import 'package:supabase_flutter/supabase_flutter.dart';
import 'environment.dart';

class SupabaseConfig {
  SupabaseConfig._();

  // Supabase client instance
  static SupabaseClient get client => Supabase.instance.client;

  // Initialize Supabase
  static Future<void> initialize() async {
    try {
      await Supabase.initialize(
        url: Environment.supabaseUrl,
        anonKey: Environment.supabaseAnonKey,
        authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.pkce,
        ),
        realtimeClientOptions: const RealtimeClientOptions(
          logLevel: RealtimeLogLevel.info,
        ),
      );
    } catch (e) {
      throw SupabaseConfigException('Failed to initialize Supabase: $e');
    }
  }

  // Database configuration
  static const String adminsTable = 'admins';
  static const String fieldVisitorsTable = 'field_visitors';
  static const String farmersTable = 'farmers';
  static const String tasksTable = 'tasks';
  static const String allowancesTable = 'allowances';

  // Storage configuration
  static const String adminUploadsBucket = 'admin-uploads';
  static const String profilePicturesBucket = 'profile-pictures';
  static const String taskAttachmentsBucket = 'task-attachments';
  static const String allowancePhotosBucket = 'allowance-photos';

  // Real-time subscriptions
  static const String notificationsChannel = 'notifications';
  static const String tasksChannel = 'tasks';
  static const String allowancesChannel = 'allowances';

  // Auth configuration
  static const List<OAuthProvider> supportedProviders = [
    OAuthProvider.google,
  ];

  // RLS policies (for reference)
  static const Map<String, String> rlsPolicies = {
    'admins_read': 'Admins can view all records',
    'field_visitors_manage': 'Admins can manage field visitors',
    'farmers_manage': 'Admins can manage farmers',
    'tasks_manage': 'Admins can manage tasks',
    'allowances_manage': 'Admins can manage allowances',
  };

  // Database query limits
  static const int defaultLimit = 20;
  static const int maxLimit = 100;
  static const int minLimit = 5;

  // File upload limits
  static const int maxFileSizeBytes = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = [
    'image/jpeg',
    'image/png',
    'image/webp',
    'image/heic'
  ];
  static const List<String> allowedDocumentTypes = [
    'application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  ];

  // Error handling
  static bool isAuthError(Object error) {
    return error is AuthException;
  }

  static bool isNetworkError(Object error) {
    return error.toString().contains('network') ||
           error.toString().contains('timeout') ||
           error.toString().contains('connection');
  }

  static bool isPermissionError(Object error) {
    return error.toString().contains('permission') ||
           error.toString().contains('unauthorized') ||
           error.toString().contains('403');
  }

  // Subscription management
  static final Map<String, RealtimeChannel> _activeChannels = {};

  static RealtimeChannel getOrCreateChannel(String channelName) {
    if (!_activeChannels.containsKey(channelName)) {
      _activeChannels[channelName] = client.channel(channelName);
    }
    return _activeChannels[channelName]!;
  }

  static void removeChannel(String channelName) {
    if (_activeChannels.containsKey(channelName)) {
      _activeChannels[channelName]?.unsubscribe();
      _activeChannels.remove(channelName);
    }
  }

  static void cleanupAllChannels() {
    for (var channel in _activeChannels.values) {
      channel.unsubscribe();
    }
    _activeChannels.clear();
  }

  // Helper methods for common queries
  static SupabaseQueryBuilder get admins => client.from(adminsTable);
  static SupabaseQueryBuilder get fieldVisitors => client.from(fieldVisitorsTable);
  static SupabaseQueryBuilder get farmers => client.from(farmersTable);
  static SupabaseQueryBuilder get tasks => client.from(tasksTable);
  static SupabaseQueryBuilder get allowances => client.from(allowancesTable);

  // Storage helpers
  static SupabaseStorageClient get storage => client.storage;
  static SupabaseStorageFileApi adminUploads() => storage.from(adminUploadsBucket);
  static SupabaseStorageFileApi profilePictures() => storage.from(profilePicturesBucket);
  static SupabaseStorageFileApi taskAttachments() => storage.from(taskAttachmentsBucket);
  static SupabaseStorageFileApi allowancePhotos() => storage.from(allowancePhotosBucket);

  // Auth helpers
  static GoTrueClient get auth => client.auth;
  static Session? get currentSession => auth.currentSession;
  static User? get currentUser => auth.currentUser;
  static bool get isAuthenticated => currentUser != null;

  // Common query filters
  static PostgrestFilterBuilder activeOnly(PostgrestFilterBuilder query) {
    return query.eq('is_active', true);
  }

  static PostgrestFilterBuilder orderByCreatedAt(PostgrestFilterBuilder query, {bool ascending = false}) {
    return query.order('created_at', ascending: ascending);
  }

  static PostgrestFilterBuilder orderByUpdatedAt(PostgrestFilterBuilder query, {bool ascending = false}) {
    return query.order('updated_at', ascending: ascending);
  }

  static PostgrestFilterBuilder limitResults(PostgrestFilterBuilder query, {int limit = defaultLimit}) {
    return query.limit(limit.clamp(minLimit, maxLimit));
  }

  // Pagination helpers
  static PostgrestFilterBuilder paginate(PostgrestFilterBuilder query, int page, {int pageSize = defaultLimit}) {
    final from = page * pageSize;
    final to = from + pageSize - 1;
    return query.range(from, to);
  }
}

// Custom exception class
class SupabaseConfigException implements Exception {
  final String message;
  SupabaseConfigException(this.message);
  
  @override
  String toString() => 'SupabaseConfigException: $message';
}

// Enum for database operations
enum DatabaseOperation {
  create,
  read,
  update,
  delete,
}

// Enum for subscription events
enum SubscriptionEvent {
  insert,
  update,
  delete,
  all,
}

// Helper class for database responses
class DatabaseResponse<T> {
  final T? data;
  final String? error;
  final bool success;

  const DatabaseResponse({this.data, this.error, this.success = true});

  factory DatabaseResponse.success(T data) {
    return DatabaseResponse(data: data, success: true);
  }

  factory DatabaseResponse.error(String error) {
    return DatabaseResponse(error: error, success: false);
  }

  bool get hasData => data != null;
  bool get hasError => error != null;
}