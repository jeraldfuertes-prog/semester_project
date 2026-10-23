# CampusHub — IT 110 Activities 8 and 9

This repository continues the original **CampusHub Activity 8** Flutter Web
project with **Activity 9: Report Form and UI State Responses**.

## What is implemented

- Existing Home (`/`) and Login (`/login`) screens are preserved.
- New Campus Report form (`/report`) is linked from Home.
- Shared `AppButton` is used on Home, Login, and Report screens.
- Shared `AppTextField` is used on Login and Report screens.
- Report form validates title, category and description.
- The four reproducible states are **Loading**, **Success**, **Empty**, and
  **Error**, with a working **Retry** action.

**Important:** This activity is a frontend-only simulation using
`Future.delayed`. Submitted reports live in memory only and disappear if the
app is restarted. No REST API, authentication, or PostgreSQL database is
connected.

## Run the same existing project

```bash
flutter doctor
flutter pub get
flutter run -d chrome
```

The uploaded project archive did not include Flutter's `web/` directory;
`web/index.html` has been restored in this Activity 9 copy without generating
a new project or resetting the existing Git history. If your original working
Activity 8 checkout has other web assets, keep those assets as well.

## Demonstration sequence

1. Home > **Submit a Campus Report** (shows route).
2. Enter blank or short fields, then click **Submit Report** (validation).
3. Click **View Reports (0)** before adding a record (Empty).
4. Click **Create your first report**, complete fields, leave simulated error
   off, and submit. Capture Loading while the five-second delay runs.
5. Wait for Success; click **View submitted reports** to see the session record.
6. Click **Create another report**, complete the fields, turn on **Simulate
   an error**, and submit. Wait for Error, then click **Retry submission**.
   Retry clears the deliberate failure and produces Loading then Success.

## Submission and Git checkpoint

See `ACTIVITY9_SUBMISSION_GUIDE.md` and `activity9_report_template.md`.
From this **same** existing repository, once you have actually run the app:

```bash
git status
git log -1 --oneline
git add .
git commit -m "Add report form and Flutter UI states"
git push origin main
```

Screenshots must be genuine captures from your own running Chrome app.
