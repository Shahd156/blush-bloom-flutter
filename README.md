# BrightPath Flutter Navigation App

A polished Flutter assignment demonstrating three-page navigation with Home, About, and Contact screens.

## Features

- Three pages: Home, About, and Contact
- Home → About → Contact navigation buttons
- Bottom navigation bar for quick navigation
- Local SVG illustration on the Home page
- Material icons and a custom color theme
- Responsive layout using `Scaffold`, `AppBar`, `SafeArea`, `Column`, and `SingleChildScrollView`

## Run locally

```bash
flutter pub get
flutter run
```

## Project structure

```text
lib/main.dart                 # App entry point and all UI screens
assets/home_illustration.svg  # Local Home page illustration
pubspec.yaml                  # Flutter dependencies and asset declaration
```

## تشغيل المشروع على Windows

1. ثبّت Flutter SDK وأضف مجلد `flutter\bin` إلى متغير PATH.
2. ثبّت VS Code مع إضافتي **Flutter** و **Dart**.
3. فك ضغط المشروع وافتح مجلد `flutter_navigation_app` في VS Code.
4. شغّل الملف `run_on_windows.bat`، أو نفّذ الأوامر التالية في Terminal:

```powershell
flutter create .
flutter pub get
flutter run -d chrome
```

يمكن أيضًا اختيار جهاز Android من VS Code بعد تشغيل Android Emulator من Android Studio.
