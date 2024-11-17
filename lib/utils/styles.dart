import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF171717);
  static const Color cardBackground = Color(0xFF2D2D2D);
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Colors.grey;
  static const Color accent = Colors.red;
  static const Color buttonBackground = Color(0x81225C26);
  static const Color buttonText = Colors.lightGreen;
}

class AppFonts {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.secondaryText,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonText,
  );

  static const TextStyle input = TextStyle(
    fontSize: 24,
    color: AppColors.primaryText,
  );

  static const TextStyle currencyAmountText = TextStyle(
    fontSize: 24,
    color: AppColors.primaryText,
  );

  static const TextStyle dropdown = TextStyle(
    fontSize: 20,
    color: AppColors.primaryText,
  );
}

class AppSizes {
  static const double padding = 24.0;
  static const double cardCornerRadius = 22.0;
  static const double flagSize = 12.0;
}
