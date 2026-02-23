# Roadrunner Connect Club — Demo Workshop 1
### Build Your First Flutter App: A To-Do List from Scratch

This repo is your reference for the workshop. If you get stuck at any step, open the matching folder inside `steps/` and compare it to your own `lib/main.dart`.

---

## Step Reference

| Step | Folder | What you should see |
|------|--------|---------------------|
| 2 | `steps/step_02_hello_flutter` | "Hello Flutter!" centered on screen |
| 3 | `steps/step_03_stateful_widget` | AppBar + "Coming soon..." placeholder |
| 4 | `steps/step_04_build_ui` | Text box and Add button visible (not functional yet) |
| 5 | `steps/step_05_logic` | Add and delete tasks working |
| 6a | `steps/step_06a_checkboxes` | Checkbox + strikethrough on completed tasks |
| 6b | `steps/step_06b_empty_state` | "No tasks yet!" message when list is empty |
| 6c | `steps/step_06c_theming` | Deep purple theme applied — final app |

---

## Quick Setup

```bash
# 1. Check that Flutter is installed correctly
flutter doctor

# 2. Create your project
flutter create todo_app
cd todo_app
code .

# 3. Run the app (make sure your emulator is open first)
flutter run
```

---

## Common Issues & Fixes

**`flutter` is not recognized as a command**
> Close your terminal completely and reopen it. PATH changes don't apply to already-open windows.

**Red squiggles in VS Code after Step 4**
> Expected! `_addTask` and `_deleteTask` are called but not written yet. They get added in Step 5.

**Emulator is slow or won't start**
> In Android Studio → Device Manager → Edit your emulator → set Graphics to `Hardware - GLES 2.0`.
> AMD users: make sure Hyper-V and Windows Hypervisor Platform are enabled in Windows Features.

**Hot reload isn't updating the screen**
> Save the file with `Ctrl+S` (Windows) or `Cmd+S` (Mac), or press `r` in the terminal where `flutter run` is running.

**`flutter doctor` shows Android licenses not accepted**
```bash
flutter doctor --android-licenses
# Press y and Enter for each prompt
```

**App builds but crashes immediately**
> Look at the terminal where `flutter run` is running — the error message is printed there. Most often it's a missing comma or bracket.

---

## Resources

- **Flutter docs:** [docs.flutter.dev](https://docs.flutter.dev)
- **DartPad** (run Flutter in your browser, no install needed): [dartpad.dev](https://dartpad.dev)
- **Flutter Widget of the Week** (short YouTube videos): [youtube.com/@flutterdev](https://www.youtube.com/@flutterdev)
- **pub.dev** (Flutter packages): [pub.dev](https://pub.dev)

---

*Roadrunner Connect Club | Workshop #1 | Happy Coding!*
