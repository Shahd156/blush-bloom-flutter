# Blush & Bloom Flutter App

A cute, polished makeup-themed Flutter app demonstrating three-page navigation.

## Features

- Three pages: Home, About, and Contact
- Home → About → Contact navigation buttons
- Bottom navigation bar bonus
- Local makeup illustration on the Home page
- Material icons and a custom pink/rose theme
- Responsive layout using `Scaffold`, `AppBar`, `Column`, and `SingleChildScrollView`

## Run locally on Windows

```powershell
flutter create .
flutter pub get
flutter run -d chrome
```

Or double-click `run_on_windows.bat` after installing Flutter and adding it to PATH.

## Project structure

```text
lib/main.dart                    # App entry point and three UI screens
assets/makeup_illustration.svg   # Local makeup illustration
pubspec.yaml                     # Flutter dependencies and assets
```
