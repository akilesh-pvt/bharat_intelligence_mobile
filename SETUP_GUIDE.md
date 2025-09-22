# 🚀 Complete Setup Guide for Bharat Intelligence Mobile App

## Step-by-Step Installation

### 1. System Requirements

**Minimum Requirements:**
- **RAM**: 8GB (16GB recommended)
- **Storage**: 10GB free space
- **OS**: Windows 10+, macOS 10.14+, or Ubuntu 18.04+
- **Internet**: Stable connection for dependencies

### 2. Install Flutter SDK

#### Windows:
1. Download Flutter SDK: https://docs.flutter.dev/get-started/install/windows
2. Extract to `C:\flutter`
3. Add `C:\flutter\bin` to PATH environment variable
4. Run `flutter doctor` in Command Prompt

#### macOS:
```bash
# Using Homebrew (recommended)
brew install flutter

# Or download and extract manually
# Add to ~/.zshrc or ~/.bash_profile:
export PATH="$PATH:/path/to/flutter/bin"
```

#### Linux:
```bash
# Download Flutter
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.0-stable.tar.xz
tar xf flutter_linux_3.24.0-stable.tar.xz

# Add to PATH
echo 'export PATH="$PATH:`pwd`/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
```

### 3. Install Required Tools

#### For All Platforms:
- **Chrome Browser**: Latest version
- **Git**: https://git-scm.com/downloads
- **VS Code**: https://code.visualstudio.com/ (recommended)
  - Install Flutter extension
  - Install Dart extension

#### For Android Development (Optional):
- **Android Studio**: https://developer.android.com/studio
- **Android SDK**: Installed with Android Studio

#### For iOS Development (macOS only):
- **Xcode**: From Mac App Store
- **iOS Simulator**: Included with Xcode

### 4. Verify Flutter Installation

```bash
flutter doctor
```

Expected output:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.24.0, on macOS 14.0 darwin-arm64, locale en-US)
[✓] Chrome - develop for the web
[✓] VS Code (version 1.82.0)
```

### 5. Clone and Setup Project

```bash
# Clone the repository
git clone https://github.com/akilesh-pvt/bharat_intelligence_mobile.git
cd bharat_intelligence_mobile

# Install dependencies
flutter pub get

# Create environment file
cp .env.example .env
```

### 6. Configure Environment Variables

Edit `.env` file with your credentials:

```env
# Required: Supabase Configuration
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your_anon_key_here

# Required: Google OAuth Configuration
GOOGLE_CLIENT_ID_WEB=your_web_client_id.apps.googleusercontent.com
GOOGLE_CLIENT_ID_ANDROID=your_android_client_id.apps.googleusercontent.com

# Optional: Additional configurations
ENVIRONMENT=development
DEBUG_MODE=true
```

### 7. Backend Setup (Supabase)

#### Create Supabase Project:
1. Go to https://supabase.com
2. Sign up/Login
3. Create new project
4. Wait for project to be ready (2-3 minutes)

#### Get Credentials:
1. Go to **Settings** → **API**
2. Copy **Project URL**
3. Copy **anon/public** key
4. Update `.env` file with these values

#### Setup Database:
1. Go to **SQL Editor** in Supabase dashboard
2. Create a new query
3. Copy and paste the database schema (provided separately)
4. Run the query

### 8. Google OAuth Setup (Optional for full functionality)

#### Create Google Cloud Project:
1. Go to https://console.cloud.google.com
2. Create new project or select existing
3. Enable Google+ API

#### Create OAuth Credentials:
1. Go to **Credentials** → **Create Credentials** → **OAuth 2.0 Client IDs**
2. Create **Web application** credential:
   - Authorized JavaScript origins: `http://localhost`
   - Authorized redirect URIs: `http://localhost:port`
3. Create **Android** credential (optional)
4. Copy client IDs to `.env` file

### 9. Run the Application

#### Option 1: Chrome (Recommended for Development)
```bash
# Enable web support
flutter config --enable-web

# Run in Chrome with mobile simulation
flutter run -d chrome

# Alternative with specific renderer
flutter run -d chrome --web-renderer html
```

#### Option 2: Android Emulator
```bash
# Start Android emulator (if Android Studio installed)
emulator -avd Pixel_7_API_34

# Run app on Android
flutter run -d android
```

### 10. Development Tips

#### Hot Reload:
- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

#### Chrome DevTools:
1. Open app in Chrome
2. Press F12 to open DevTools
3. Click device toggle (📱 icon)
4. Select mobile device (iPhone, Pixel, etc.)
5. Test touch interactions

#### VS Code Setup:
1. Open project folder in VS Code
2. Press `Ctrl+Shift+P` (or `Cmd+Shift+P`)
3. Type "Flutter: Select Device"
4. Choose Chrome or connected device
5. Press F5 to run in debug mode

## 🛠️ Troubleshooting Common Issues

### Flutter Doctor Issues

**Issue**: Android licenses not accepted
```bash
flutter doctor --android-licenses
```

**Issue**: Chrome not detected
```bash
flutter config --enable-web
flutter devices
```

**Issue**: No devices available
- Ensure Chrome is installed
- For Android: Enable USB debugging
- For iOS: Trust computer on device

### Dependency Issues

**Issue**: Package conflicts
```bash
flutter clean
flutter pub get
```

**Issue**: Outdated packages
```bash
flutter pub upgrade
```

### Environment Issues

**Issue**: `.env` file not found
- Ensure file is in project root
- Check file extension (should be `.env`, not `.env.txt`)

**Issue**: Environment variables not loading
- Restart the application
- Check file syntax (no quotes around values unless needed)

### Performance Issues

**Issue**: Slow startup
- Use `flutter run --release` for better performance
- Close other resource-heavy applications

**Issue**: Hot reload not working
- Save files before testing
- Restart app with `R` if needed

## 📱 Mobile Testing Options

### 1. Chrome Mobile Simulation (Easiest)
- **Pros**: No additional setup, fast testing
- **Cons**: Not 100% accurate to real mobile
- **Best for**: UI testing, layout verification

### 2. Android Physical Device
- **Pros**: Real mobile experience
- **Cons**: Requires USB debugging setup
- **Best for**: Performance testing, real-world usage

### 3. iOS Simulator (macOS only)
- **Pros**: Apple ecosystem testing
- **Cons**: macOS and Xcode required
- **Best for**: iOS-specific features

## 🚀 Ready to Start!

Once setup is complete, you should be able to:
1. ✅ Run `flutter doctor` with no critical issues
2. ✅ Start the app with `flutter run -d chrome`
3. ✅ See the splash screen and login interface
4. ✅ Navigate through the mobile-optimized interface

**Next Steps:**
- Explore the dashboard and navigation
- Test responsive design in Chrome DevTools
- Start implementing Phase 2 features
- Deploy to actual mobile devices when ready

**Need Help?**
Create an issue in the GitHub repository with:
- Your operating system
- Flutter doctor output
- Error messages (if any)
- Steps you've tried