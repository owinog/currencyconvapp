import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/currency_view_model.dart';
import 'views/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrencyViewModel()),
      ],
      child: CurrencyConverterApp(),
    ),
  );
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
