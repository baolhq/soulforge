# Translation Guide

This guide outlines the process for adding and updating translations in the **SoulForge** project. The project uses the `l18n` package for localization with `.arb` files for managing translations.

### Project Structure

- `/docs/translation_guide.md` - This translation guide.
- `/lib/l18n/app_en.arb` - English translations.
- `/lib/l18n/app_vi.arb` - Vietnamese translations.

### Adding a New Language

1. **Create a New `.arb` File**: 
   - Duplicate the `app_en.arb` file and rename it to `app_<languageCode>.arb`, where `<languageCode>` corresponds to the new language. For example, for French, use `app_fr.arb`.

2. **Edit the New `.arb` File**:
   - Translate each string in the new `.arb` file. Each entry follows the format:
     ```json
     "key": "translated string",
     ```

3. **Add the Locale to `main.dart`**:
   - Open `main.dart` and add the new locale to the `supportedLocales` list. For example, for French:
     ```dart
     supportedLocales: [
       Locale("en", "US"),
       Locale("vi", "VN"),
       Locale("fr", "FR"),
     ],
     ```

4. **Ensure Proper Delegates**:
   - Confirm that `localizationsDelegates` in `main.dart` includes the necessary delegates for your language.

### Updating Existing Translations

1. **Edit the Corresponding `.arb` File**:
   - Open the `.arb` file for the language you want to update.
   - Modify the values for the keys that need translation updates.

2. **Check for Consistency**:
   - Ensure that all keys are present in both `app_en.arb` and the file being updated. Missing keys may lead to runtime errors.

3. **Run the App**:
   - Test the app to make sure that the updates are reflected correctly in the UI.

### Formatting Rules

- **Keys**: Use consistent and descriptive keys in `snake_case`. For example, `welcome_message`.
- **Values**: Translate values accurately and ensure they reflect the intended meaning in context.
- **Placeholders**: If a string includes dynamic content, use placeholders in the format `{placeholderName}`. For example:
  ```json
  "welcome_user": "Welcome, {userName}!"
