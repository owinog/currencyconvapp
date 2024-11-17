import 'package:currencyconvapp/utils/styles.dart';
import 'package:currencyconvapp/view_models/currency_view_model.dart';
import 'package:flutter/material.dart';

class CurrencyConvertionCard extends StatelessWidget {
  const CurrencyConvertionCard({
    super.key,
    required this.convertedAmount,
    required this.currency,
    required this.viewModel,
  });

  final double convertedAmount;
  final String currency;
  final CurrencyViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(currency),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSizes.padding),
        child: const Icon(
          Icons.delete,
          color: AppColors.accent,
        ),
      ),
      onDismissed: (direction) {
        viewModel.removeTargetCurrency(currency);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(convertedAmount.toStringAsFixed(2), style: AppFonts.input),
            Row(
              children: [
                DropdownButton<String>(
                  value: currency,
                  dropdownColor: Colors.grey[850],
                  underline: Container(),
                  style: AppFonts.dropdown,
                  items: viewModel.rates.keys.map((currency) {
                    return DropdownMenuItem(
                      value: currency,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: AppSizes.flagSize,
                            backgroundImage: NetworkImage(
                              'https://flagcdn.com/w40/${currency.substring(0, 2).toLowerCase()}.png', // Placeholder for flag URL
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(currency, style: AppFonts.dropdown),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.changeTargetCurrency(currency, value!);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
