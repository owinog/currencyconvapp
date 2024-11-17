import 'package:currencyconvapp/utils/styles.dart';
import 'package:currencyconvapp/widgets/currency_conversion_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/currency_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double amount = 1.0;
    final viewModel = Provider.of<CurrencyViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Advanced Exchanger',
          style: AppFonts.title,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text('INSERT AMOUNT:', style: AppFonts.body),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.accent,
                      keyboardType: TextInputType.number,
                      style: AppFonts.input,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: amount.toString()),
                      onChanged: (value) {
                        amount = double.tryParse(value) ?? 1.0;
                        viewModel.setInputAmount(amount);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<String>(
                    value: viewModel.baseCurrency,
                    dropdownColor: AppColors.cardBackground,
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
                                'https://flagcdn.com/w40/${currency.substring(0, 2).toLowerCase()}.png',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(currency, style: AppFonts.dropdown),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.setBaseCurrency(value!);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text('CONVERT TO:', style: AppFonts.body),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.targetCurrencies.length,
                itemBuilder: (context, index) {
                  final currency = viewModel.targetCurrencies[index];
                  final rate = viewModel.rates[currency] ?? 1.0;
                  final convertedAmount = viewModel.inputAmount * rate;

                  return CurrencyConvertionCard(
                      convertedAmount: convertedAmount,
                      currency: currency,
                      viewModel: viewModel);
                },
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: AppColors.cardBackground,
                        title:
                            const Text('Add Converter', style: AppFonts.title),
                        content: DropdownButton<String>(
                          value: null,
                          underline: Container(),
                          dropdownColor: AppColors.cardBackground,
                          style: AppFonts.dropdown,
                          items: viewModel.rates.keys
                              .where((currency) => !viewModel.targetCurrencies
                                  .contains(currency))
                              .map((currency) {
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
                            if (value != null) {
                              viewModel.addTargetCurrency(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppSizes.cardCornerRadius),
                  ),
                ),
                child: const Text(
                  '+ ADD CONVERTER',
                  style: AppFonts.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
