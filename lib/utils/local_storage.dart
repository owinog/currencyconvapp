import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<void> savePreferredCurrencies(List<String> currencies) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('preferred_currencies', currencies);
  }

  Future<List<String>?> loadPreferredCurrencies() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('preferred_currencies');
  }
}
