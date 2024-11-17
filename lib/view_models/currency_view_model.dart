import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../utils/local_storage.dart';

class CurrencyViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final LocalStorage _localStorage = LocalStorage();

  String _baseCurrency = 'USD';
  double _inputAmount = 1.0;
  List<String> _targetCurrencies = [];
  Map<String, dynamic> _rates = {};

  String get baseCurrency => _baseCurrency;
  double get inputAmount => _inputAmount;
  List<String> get targetCurrencies => _targetCurrencies;
  Map<String, dynamic> get rates => _rates;

  CurrencyViewModel() {
    _loadPreferences();
    fetchRates();
  }

  Future<void> fetchRates() async {
    try {
      _rates = await _apiService.fetchRates(_baseCurrency);
      notifyListeners();
    } catch (e) {
      print('Error fetching rates: $e');
    }
  }

  void setBaseCurrency(String currency) {
    _baseCurrency = currency;
    fetchRates();
  }

  void setInputAmount(double amount) {
    _inputAmount = amount;
    notifyListeners();
  }

  void addTargetCurrency(String currency) {
    if (!_targetCurrencies.contains(currency)) {
      _targetCurrencies.add(currency);
      _localStorage.savePreferredCurrencies(_targetCurrencies);
      notifyListeners();
    }
  }

  void removeTargetCurrency(String currency) {
    _targetCurrencies.remove(currency);
    _localStorage.savePreferredCurrencies(_targetCurrencies);
    notifyListeners();
  }

  void changeTargetCurrency(String oldCurrency, String newCurrency) {
    final index = _targetCurrencies.indexOf(oldCurrency);
    _targetCurrencies[index] = newCurrency;
    _localStorage.savePreferredCurrencies(_targetCurrencies);
    notifyListeners();
  }

  Future<void> _loadPreferences() async {
    _targetCurrencies = await _localStorage.loadPreferredCurrencies() ?? [];
    notifyListeners();
  }
}
