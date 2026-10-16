# CampusHub — Flutter Web Starter System

## Summary
CampusHub is a simple student portal prototype. The Home screen introduces the system and provides navigation to a Login screen. The Login form checks that the email and password fields are not empty; it is a UI demonstration only and does not authenticate users against a server.

## Current technology stack
- Implemented now: Dart, Flutter Web, Material UI, local screen navigation, basic form validation.
- Planned only: REST API for server-side business rules and PostgreSQL for persistent data. No backend or database is connected in Activity 8.

## Requirements
- Flutter SDK with web support
- Google Chrome
- Git (for the GitHub checkpoint)

## Run locally
Open a terminal in this project folder, then run:
```bash
flutter doctor
flutter devices
flutter pub get
flutter run -d chrome
```
If Chrome is not listed as a device, check the Flutter web setup and Chrome installation.

## Source structure
- `lib/main.dart`: application entry point
- `lib/app.dart`: theme and named routes
- `lib/screens/`: Home and Login screens
- `lib/widgets/`: reusable button and text-field widgets
- `lib/services/`, `lib/models/`, `lib/routes/`, `lib/constants/`: reserved for future API, data models, route helpers, and shared constants

## First checkpoint
Date: fill in the actual date of your first commit.
Commit: fill in the actual commit hash after committing.
GitHub repository: add your team's real repository URL after creating and pushing it.

## Evidence reminder
Capture your own screenshots showing (1) the app running in Chrome and terminal, (2) the `lib/` folder structure, and (3) successful Git commit/push and the repository on GitHub. These screenshots must be from your actual execution.
