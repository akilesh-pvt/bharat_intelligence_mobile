import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/mobile_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobileTheme.grey50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App Logo
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: MobileTheme.primaryBlue,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
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
                            child: Icon(
                              Icons.admin_panel_settings,
                              size: 40,
                              color: MobileTheme.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Welcome Text
                    Text(
                      'Welcome Back!',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MobileTheme.grey900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to manage field operations',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: MobileTheme.grey600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 80),
              
              // Google Sign-In Button
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleGoogleSignIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MobileTheme.primaryBlue,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'G',
                                        style: TextStyle(
                                          color: MobileTheme.primaryBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
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
                        color: MobileTheme.grey500,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Footer
              Center(
                child: Column(
                  children: [
                    Text(
                      'Bharat Intelligence Admin Dashboard',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MobileTheme.grey400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'v1.0.0 • Field Operations Management',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MobileTheme.grey400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);
    
    try {
      // Simulate authentication process
      await Future.delayed(const Duration(seconds: 2));
      
      // For demo purposes, always succeed and navigate to dashboard
      if (mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
            backgroundColor: MobileTheme.errorRed,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}