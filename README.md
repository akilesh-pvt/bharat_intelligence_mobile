# Bharat Intelligence Mobile App

A Flutter mobile application for Bharat Intelligence's field operations management - managing field visitors, farming operations, task assignments, and petrol allowance approvals with real-time data synchronization.

## 🚀 Quick Start

### Prerequisites

Before running this project, ensure you have:

1. **Flutter SDK 3.16.0 or higher**
   ```bash
   flutter --version
   ```
   If not installed, follow: https://docs.flutter.dev/get-started/install

2. **Chrome Browser** (for mobile testing during development)

3. **Git** (to clone the repository)

4. **Code Editor** (VS Code with Flutter extension recommended)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/akilesh-pvt/bharat_intelligence_mobile.git
   cd bharat_intelligence_mobile
   ```

2. **Install Flutter Dependencies**
   ```bash
   flutter pub get
   ```

3. **Create Environment File**
   ```bash
   cp .env.example .env
   ```
   
   Then edit the `.env` file with your actual credentials:
   - Supabase URL and keys
   - Google OAuth client IDs
   - Other configuration values

4. **Enable Web Support** (for Chrome testing)
   ```bash
   flutter config --enable-web
   ```

5. **Check Flutter Setup**
   ```bash
   flutter doctor
   ```
   Fix any issues reported by flutter doctor.

### Running the App

#### Option 1: Run in Chrome (Recommended for Development)
```bash
# Run with mobile device simulation
flutter run -d chrome

# Or run with specific mobile viewport
flutter run -d chrome --web-renderer html --device-id chrome
```

#### Option 2: Run on Android Device/Emulator
```bash
# List available devices
flutter devices

# Run on Android
flutter run -d android
```

#### Option 3: Run on iOS Simulator (macOS only)
```bash
flutter run -d ios
```

### Chrome Mobile Testing Setup

1. **Open Chrome DevTools** (F12)
2. **Click Device Toggle** (Ctrl+Shift+M or Cmd+Shift+M)
3. **Select Mobile Device** (iPhone 12 Pro, Pixel 5, etc.)
4. **Test Touch Interactions** and responsive behavior

## 🛠️ Development

### Project Structure
```
bharat_intelligence_mobile/
├── lib/
│   ├── app/                    # App configuration & routing
│   ├── core/                   # Platform detection & utilities
│   ├── config/                 # Environment & theme config
│   ├── presentation/           # UI screens & widgets
│   │   ├── screens/           # Main app screens
│   │   └── widgets/           # Reusable UI components
│   └── main.dart              # App entry point
├── assets/                     # Images, fonts, icons
├── .env.example               # Environment template
└── pubspec.yaml               # Dependencies
```

### Key Features
- 📱 **Mobile-First Design** with Chrome testing support
- 🔐 **Google OAuth Authentication** (multi-platform)
- 🗄️ **Supabase Backend** with real-time sync
- 📊 **Admin Dashboard** with metrics and analytics
- 👥 **Field Visitor Management**
- 🌾 **Farmer Database Management**
- ✅ **Task Assignment & Tracking**
- 💰 **Petrol Allowance Approval System**

### Development Commands

```bash
# Hot reload in Chrome
flutter run -d chrome --hot

# Build for web
flutter build web

# Build for Android
flutter build apk

# Build for iOS (macOS only)
flutter build ios

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
flutter format .
```

## 🔧 Configuration

### Environment Variables

Copy `.env.example` to `.env` and configure:

```env
# Supabase Configuration
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key

# Google OAuth (get from Google Cloud Console)
GOOGLE_CLIENT_ID_WEB=your_web_client_id
GOOGLE_CLIENT_ID_ANDROID=your_android_client_id
GOOGLE_CLIENT_ID_IOS=your_ios_client_id
```

### Supabase Setup

1. **Create Supabase Project**: https://supabase.com
2. **Get Project URL and Keys** from Settings > API
3. **Run Database Schema** (provided in project documentation)
4. **Configure Row Level Security** policies

### Google OAuth Setup

1. **Go to Google Cloud Console**: https://console.cloud.google.com
2. **Create OAuth 2.0 Client IDs** for:
   - Web application (for Chrome testing)
   - Android application
   - iOS application (if needed)
3. **Add authorized redirect URIs**

## 🐛 Troubleshooting

### Common Issues

1. **Flutter Doctor Issues**
   ```bash
   flutter doctor
   flutter doctor --android-licenses
   ```

2. **Dependency Conflicts**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Chrome Not Found**
   ```bash
   flutter config --enable-web
   flutter devices
   ```

4. **Environment Variables Not Loading**
   - Ensure `.env` file exists in project root
   - Check file has no syntax errors
   - Restart the app after changes

### Platform-Specific Issues

**Windows:**
- Enable Developer Mode
- Install Visual Studio Build Tools if needed

**macOS:**
- Install Xcode for iOS development
- Accept Xcode license agreements

**Linux:**
- Install additional dependencies for web development

## 📱 Mobile Testing

The app is designed mobile-first but can be tested in Chrome:

1. **Chrome Testing**: Simulates mobile experience in browser
2. **Android Testing**: Real device or emulator
3. **iOS Testing**: Simulator (macOS) or real device

### Responsive Breakpoints
- **Mobile Small**: 320px
- **Mobile**: 375px
- **Mobile Large**: 414px
- **Tablet**: 768px+

## 🚀 Deployment

### Web Deployment
```bash
flutter build web --release
# Deploy 'build/web' folder to your hosting service
```

### Android Deployment
```bash
flutter build apk --release
# Or for app bundle:
flutter build appbundle --release
```

### iOS Deployment
```bash
flutter build ios --release
# Then archive in Xcode
```

## 📄 License

This project is proprietary software for Bharat Intelligence.

## 🤝 Contributing

This is a private project. Contact the development team for contribution guidelines.

## 📞 Support

For technical support or questions:
- Create an issue in this repository
- Contact the development team

---

**Note**: This app is optimized for mobile devices but includes Chrome testing capabilities for development purposes.