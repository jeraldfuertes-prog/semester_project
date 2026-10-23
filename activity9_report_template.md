# IT 110 — Laboratory Activity No. 9
## CampusHub — Report Form and Four Essential UI States

**Group:** [Enter all members]  
**Date:** [Enter completion date]  
**Original GitHub repository:** https://github.com/jeraldfuertes-prog/semester_project  
**Activity 9 commit hash:** [Copy actual `git log -1 --oneline` after commit]

### Activity 9 summary

For Laboratory Activity 9, we extended the existing CampusHub Flutter Web
project from Activity 8 instead of creating a new project. We retained the Home
and Login screens, added `lib/screens/report_form_screen.dart`, and made it
accessible from the Home screen using the `/report` route. The report form has
a title, category, description, and optional campus location, with field-level
validation. We reused `AppButton` and `AppTextField` in multiple screens and
implemented the four required UI states: Loading, Success, Empty, and Error.
We used `Future.delayed` and an in-memory list to simulate asynchronous
operations. No report is sent to a real API or stored in PostgreSQL.

### Six screenshot evidence figures

**Screenshot 1 — Updated Project Structure**  
[INSERT YOUR AUTHENTIC VS CODE SCREENSHOT HERE]  
Explanation: The Explorer shows the Activity 8 code and the new Report Form
screen, while preserving the shared widgets and supporting folders.

**Screenshot 2 — Reusable Widgets and Running Report Form**  
[INSERT YOUR AUTHENTIC VS CODE + CHROME COMPOSITE HERE]  
Explanation: The new report screen and existing Home/Login screens reuse
`AppButton` and `AppTextField`, while Chrome shows the working form.

**Screenshot 3 — Loading State**  
[INSERT YOUR AUTHENTIC CHROME SCREENSHOT HERE]  
Trigger: Submitting a valid report started a five-second simulated request,
displaying a loading indicator and disabling the submit button.

**Screenshot 4 — Success State**  
[INSERT YOUR AUTHENTIC CHROME SCREENSHOT HERE]  
Trigger: The simulated submission finished without a failure, adding the
report to an in-memory session list and showing a confirmation.

**Screenshot 5 — Empty State**  
[INSERT YOUR AUTHENTIC CHROME SCREENSHOT HERE]  
Trigger: Opening View Reports before adding a report showed that the current
session had no report records and provided a Create action.

**Screenshot 6 — Error State**  
[INSERT YOUR AUTHENTIC CHROME SCREENSHOT HERE]  
Trigger: Enabling Simulate an error before a valid submission deliberately
failed the request, displaying an error explanation and Retry action.

### Functional Verification

| Test | Expected observation to confirm live |
|---|---|
| Home → Report Form | The new screen opens through the `/report` route. |
| Invalid input | Title/category/description validators show field errors. |
| Valid submit | LOADING → SUCCESS after a five-second simulated delay. |
| Zero reports | View Reports (0) shows EMPTY and a Create action. |
| Simulated failure | ERROR shows Retry, then Retry restores success. |
| Shared widgets | AppButton appears in Home, Login and Report; AppTextField appears in Login and Report. |

### Post-Laboratory Reflection (draft answers)

**1. How does the new report screen extend Activity 8?**  
We kept the Activity 8 CampusHub Home and Login screens and added a separate
Report Form screen. We registered the `/report` route in `app.dart` and placed
a new navigation button on Home. This expands the existing app while keeping
its original screens and project structure.

**2. Which widgets were reused and why?**  
We reused `AppButton` from `lib/widgets/app_button.dart` across Home, Login,
and the Report Form, and `AppTextField` across Login and the Report Form. Using
shared widgets makes the interface consistent, minimizes repeated code, and
allows changes to be maintained in one place.

**3. How are invalid inputs and duplicate submissions prevented?**  
A `Form` with a `GlobalKey<FormState>` validates the required report title,
category, and description, and requires reasonable minimum text lengths.
Submission stops when validation fails. When an asynchronous request is
running, the submit button becomes disabled, and `_isLoading` prevents a
second request from starting.

**4. How were Loading, Success, Empty and Error reproduced?**  
We used an asynchronous five-second `Future.delayed` simulation. Submitting a
valid form first displays Loading; after the delay, it displays Success if
the simulated request completes. Opening View Reports with no records shows
Empty. Turning on the simulated failure switch makes submission show Error,
and the Retry button clears the deliberate failure and repeats the request.
All request results are simulated; the list is stored only in memory.

**5. What changes are needed for a real REST API/PostgreSQL connection?**  
We would replace `Future.delayed` and the temporary in-memory list with
real HTTP calls in a service layer. The backend would validate and save
reports in PostgreSQL, return report lists, and provide error responses. The
Flutter app would parse responses, handle timeouts and authorization safely,
and show Loading, Success, Empty, or Error based on real results rather than
a demo switch.

**Important:** Replace all screenshot placeholders with real screenshots,
confirm the observed behavior on your computer, and record the actual commit.
