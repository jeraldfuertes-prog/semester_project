# IT 110 — Laboratory Activity 8 Report
## CampusHub: Flutter Web Project Initialization

**Student/group:** ____________________  
**Date:** ____________________  
**GitHub repository:** ____________________  
**Commit hash:** ____________________

> Complete the blanks and add three genuine screenshots from your own computer before submitting. This draft does not claim that Flutter was run or GitHub was pushed.

## 1. Project initialization and browser execution
CampusHub is a simple student portal prototype created with Dart and Flutter Web. The Home page introduces the prototype and links to the Login page. To verify the environment and run the application, use `flutter doctor`, `flutter devices`, `flutter pub get`, and `flutter run -d chrome` from the project directory. Record the actual result here: ____________________.

**Screenshot 1:** Insert a genuine screenshot showing the terminal and CampusHub running in Chrome.

## 2. Source-code organization
- `main.dart` starts the Flutter application.
- `app.dart` configures MaterialApp, theme, and named routes.
- `screens/` contains the Home and Login pages.
- `widgets/` contains reusable button and text-field components.
- `services/` is reserved for future API calls.
- `models/` is reserved for data models.
- `routes/` is reserved for future route helpers.
- `constants/` is reserved for shared non-secret values.

**Screenshot 2:** Insert a genuine screenshot of the project tree in VS Code or another editor.

## 3. Initial screens and navigation
The Home page provides an overview and a button to open Login. The Login page includes email and password fields, validation, and a show/hide password control. Successful local validation displays a message explaining that authentication is not connected. No real account or server authentication is implemented.

## 4. Technology stack: implemented versus planned
Flutter Web and Dart are implemented for the client-side interface. REST API integration and PostgreSQL storage are planned for a later stage only; this Activity 8 baseline does not connect to either. Git and GitHub should be used for version control and the first checkpoint.

## 5. Git/GitHub checkpoint and reproducible run
Run the Git commands from the project root:
```bash
git init
git add .
git commit -m "Initial Flutter Web project"
git branch -M main
git remote add origin <YOUR-REPOSITORY-URL>
git push -u origin main
```
If `origin` already exists, inspect it with `git remote -v` rather than adding it again. Replace the repository placeholder with your team's actual URL. Record the real commit hash and repository URL above.

**Screenshot 3:** Insert a genuine screenshot showing successful Git commands and the initial commit visible in GitHub.

## Post-laboratory reflection — draft answers
1. **Which error or dependency took the most time to resolve?**  
   Record the actual error encountered during setup and explain the steps used to resolve it. If there was no error, state that honestly and identify the verification commands used.

2. **Why separate the source folders?**  
   Separating screens, widgets, services, models, routes, and constants keeps each part focused on one responsibility. It makes the code easier to read, test, reuse, and extend as the system grows.

3. **What does a new member need to run the project?**  
   They need the Flutter SDK, Chrome, Git, the repository URL, and the correct project directory. After cloning, they should run `flutter pub get` and `flutter run -d chrome`.

4. **How does the initial Git commit help?**  
   It records a known starting point, provides a history of changes, and lets the team compare or restore earlier versions if later changes introduce errors.

5. **Which feature should be implemented next and why?**  
   A reasonable next step is a real student login flow after the group confirms its approved Activity 6 UI flow. The UI should then connect to an instructor-approved REST API and validate accounts on the server, rather than treating the current demo form as real authentication.
