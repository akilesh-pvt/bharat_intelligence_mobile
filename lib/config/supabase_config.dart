import 'package:supabase_flutter/supabase_flutter.dart';
import 'environment.dart';

class SupabaseConfig {
  SupabaseConfig._();

  // Initialize Supabase
  static Future<void> initialize() async {
    try {
      await Supabase.initialize(
        url: Environment.supabaseUrl,
        anonKey: Environment.supabaseAnonKey,
        authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.pkce,
        ),
      );
    } catch (e) {
      throw SupabaseConfigException('Failed to initialize Supabase: $e');
    }
  }

  // Core clients - Simplified
  static SupabaseClient get client => Supabase.instance.client;
  static GoTrueClient get auth => client.auth;
  static SupabaseStorageClient get storage => client.storage;

  // Database table names
  static const String adminsTable = 'admins';
  static const String fieldVisitorsTable = 'field_visitors';
  static const String farmersTable = 'farmers';
  static const String tasksTable = 'tasks';
  static const String allowancesTable = 'allowances';

  // Storage bucket names
  static const String adminUploadsBucket = 'admin-uploads';
  static const String profilePicturesBucket = 'profile-pictures';
  static const String taskAttachmentsBucket = 'task-attachments';
  static const String allowancePhotosBucket = 'allowance-photos';

  // Query limits
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

  // Simple database operations
  static Future<List<Map<String, dynamic>>> fetchAll(String tableName) async {
    final response = await client.from(tableName).select();
    return List<Map<String, dynamic>>.from(response);
  }

  static Future<Map<String, dynamic>?> fetchById(String tableName, String id) async {
    final response = await client.from(tableName).select().eq('id', id).maybeSingle();
    return response;
  }

  static Future<void> insertRecord(String tableName, Map<String, dynamic> data) async {
    await client.from(tableName).insert(data);
  }

  static Future<void> updateRecord(String tableName, String id, Map<String, dynamic> data) async {
    await client.from(tableName).update(data).eq('id', id);
  }

  static Future<void> deleteRecord(String tableName, String id) async {
    await client.from(tableName).delete().eq('id', id);
  }

  // Authentication helpers
  static Future<AuthResponse> signInWithGoogle() async {
    return await auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'com.bharatintelligence.admin://auth',
    );
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }

  static User? get currentUser => auth.currentUser;
  static Session? get currentSession => auth.currentSession;
  static bool get isAuthenticated => currentUser != null;

  // Storage operations
  static Future<String> uploadFile(String bucketName, String path, String filePath) async {
    final response = await storage.from(bucketName).upload(path, filePath);
    return response;
  }

  static Future<void> deleteFile(String bucketName, String path) async {
    await storage.from(bucketName).remove([path]);
  }

  static String getPublicUrl(String bucketName, String path) {
    return storage.from(bucketName).getPublicUrl(path);
  }

  // Error handling helpers
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

  // Real-time subscription helper
  static RealtimeChannel subscribeToTable(
    String tableName,
    void Function(PostgrestResponse) callback,
  ) {
    return client.channel('public:$tableName').on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
        event: '*',
        schema: 'public',
        table: tableName,
      ),
      callback,
    );
  }

  // Cleanup
  static Future<void> dispose() async {
    // Cleanup any active subscriptions
    await client.dispose();
  }
}

// Custom exception class
class SupabaseConfigException implements Exception {
  final String message;
  SupabaseConfigException(this.message);
  
  @override
  String toString() => 'SupabaseConfigException: $message';
}

// Database operation result helper
class DatabaseResult<T> {
  final T? data;
  final String? error;
  final bool success;

  const DatabaseResult({this.data, this.error, this.success = true});

  factory DatabaseResult.success(T data) {
    return DatabaseResult(data: data, success: true);
  }

  factory DatabaseResult.error(String error) {
    return DatabaseResult(error: error, success: false);
  }

  bool get hasData => data != null;
  bool get hasError => error != null;
}