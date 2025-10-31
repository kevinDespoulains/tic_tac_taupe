import 'package:shared_preferences/shared_preferences.dart';

/// A class that provides local storage functionalities for the app.
class AppLocalStorage {
  const AppLocalStorage();

  /// Saves a string value in local storage with the given [key].
  Future<void> saveString({required String key, required String data}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  /// Retrieves a string value from local storage for the given [key].
  Future<String?> getString({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}