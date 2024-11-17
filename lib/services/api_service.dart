import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.exchangerate-api.com/v4/latest/';

  Future<Map<String, dynamic>> fetchRates(String baseCurrency) async {
    final response = await http.get(Uri.parse('$baseUrl$baseCurrency'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Map<String, dynamic>.from(data['rates']);
    } else {
      throw Exception('Failed to fetch exchange rates');
    }
  }
}
