# ACTIVITY 9 — Screenshot and Submission Guide

**System:** CampusHub (your Activity 8 project)
**Course:** IT 110 — Web Systems and Technologies

## Files changed

- `lib/app.dart`: new `/report` named route.
- `lib/screens/home_screen.dart`: links to the report form using `AppButton`.
- `lib/screens/report_form_screen.dart`: new form, validation, in-memory report list,
  simulated async state machine, explicit error switch and Retry action.
- `lib/widgets/app_button.dart`: supports `onPressed: null` while loading.
- `lib/widgets/app_text_field.dart`: adds `maxLines` and `enabled` options.
- `web/index.html`: minimal Flutter Web entry page, omitted from the supplied ZIP.
- `README.md`: repaired existing merge-conflict text and documented Activity 9.
- Existing Login, models, services, routes and constants are retained.

## Before taking screenshots

1. Open `semester_project` in VS Code. Do not run `flutter create` or `git init`.
2. Run `git status` and `git log -1 --oneline` to see the existing repository.
3. Run `flutter doctor`, `flutter pub get`, and `flutter run -d chrome`.
4. Verify Home -> Login -> Back, and Home -> Submit a Campus Report.
5. Work with a browser window wide enough to show the full form.
6. Test blank fields: clicking Submit Report must show errors under required
   fields. Test a 3-letter title and a short description too.

## Mandatory screenshot evidence — 6 numbered figures

### Screenshot 1 — Folder structure

In VS Code Explorer, expand `lib/screens`, `lib/widgets`, `services`,
`models`, `routes`, `constants`; show project folder name `semester_project`
and `report_form_screen.dart`. Include `app.dart` and `main.dart`.
**Caption:** "Updated CampusHub Activity 9 source structure preserving the
Activity 8 screens and shared widgets."

### Screenshot 2 — Widget reuse AND running form

Use a high-resolution split-screen/composite **Figure 2**: show
`report_form_screen.dart` containing `AppTextField` and `AppButton`, and
`login_screen.dart` or `home_screen.dart` using those same widgets in VS Code;
place the running Chrome report form beside/below the snippets. Two underlying
captures may be arranged into one labeled figure in Word so the report has
six numbered figures. Do not make code too small to read.
**Caption:** "Shared AppButton and AppTextField reused in existing and new
screens; CampusHub report form open in Chrome."

### Screenshot 3 — LOADING

1. Choose **Report Form** and fill title `Broken classroom projector`,
   category `Facilities`, description `The projector is not working during
   our class.`, location `Room 201`.
2. Leave **Simulate an error** turned OFF.
3. Click **Submit Report** and immediately capture the Chrome window during
   the five-second delay. The loading spinner, `LOADING` banner, and disabled
   `Submitting...` button should all be visible.
**Caption:** "Loading state during a simulated asynchronous submission;
duplicate submission is disabled."

### Screenshot 4 — SUCCESS

With the same valid submission as Screenshot 3, wait for the completion
message; capture the `SUCCESS: Report submitted` banner and **View submitted
reports** action. This confirms only in-memory demo success, not real
PostgreSQL saving.
**Caption:** "Success state after the simulated request completed and the
report was added to this browser session."

### Screenshot 5 — EMPTY

For a clean no-data state, refresh/restart the app, navigate from Home to
Report Form, then click **View Reports (0)** *before* submitting a new report.
Capture `EMPTY: No reports yet` and **Create your first report**.
This is a no-record response, not an invalid field or error state.
**Caption:** "Empty state when no campus reports exist in the current demo
session, with an action to create one."

### Screenshot 6 — ERROR

Navigate back to the report form, fill valid fields, enable **Simulate an
error**, click **Submit Report**, and wait five seconds. Capture
`ERROR: Submission failed` and the visible **Retry submission** button.
Click Retry during the live demonstration: it clears the simulated fault,
returns to Loading, then produces Success.
**Caption:** "Error response triggered by a deliberate simulated failure;
Retry allows the user to submit again."

## Checklist for oral demonstration

- Home to Report Form named navigation works.
- Required fields show field-level validation.
- Button disabled while Loading; no duplicate submission.
- Success explicitly says "demo session only".
- View Reports (0) shows Empty when none exist.
- Error is caused by Switch; Retry works.
- AppButton reused in Home, Login, and Report; AppTextField in Login and Report.
- Git second checkpoint recorded in original repository and screenshots are authentic.

## Git commands (same repo, not a new repository)

```bash
git status
git log -1 --oneline
git add .
git commit -m "Add report form and Flutter UI states"
git push origin main
```

After committing, paste your real GitHub repo URL and commit hash into your
Word/PDF evidence report. Do not claim a push occurred until `git push`
actually succeeds.
