import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/platform/platform_detector.dart';
import '../../../config/environment.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              
              // Logo and branding
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.admin_panel_settings,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome Back!',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to manage field operations',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 80),
              
              // Google Sign-In Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleGoogleSignIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey[800],
                            elevation: 0,
                            side: BorderSide(color: Colors.grey[300]!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Icon(
                                        Icons.g_mobiledata,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    const Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Secure admin access only',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Development info (shown only in Chrome)
              if (PlatformDetector.isWeb) ...[
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.amber[200]!),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.amber[700]),
                          const SizedBox(width: 8),
                          Text(
                            'Development Mode',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.amber[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'You\'re viewing the mobile app in Chrome. The actual mobile experience may vary.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.amber[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);
    try {
      if (PlatformDetector.isWeb) {
        // Web-based Google Sign-In for Chrome testing
        final response = await Supabase.instance.client.auth.signInWithOAuth(
          OAuthProvider.google,
        );
        if (response) _navigateToDashboard();
      } else {
        // Mobile Google Sign-In
        final GoogleSignIn googleSignIn = GoogleSignIn(
          clientId: Environment.googleClientIdAndroid,
        );
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        
        if (googleUser != null) {
          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
          final response = await Supabase.instance.client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: googleAuth.idToken!,
            accessToken: googleAuth.accessToken!,
          );
          if (response.user != null) _navigateToDashboard();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _navigateToDashboard() {
    context.go('/dashboard');
  }
}