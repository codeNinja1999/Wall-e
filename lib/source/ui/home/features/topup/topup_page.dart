import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Top Up',
        leadingIcon: true,
        onPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.viewMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Insert amount (Min. Rs 500)',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.cornerRadiusMedium),
              child: CustomTextField(
                textController: amountController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                leadingIcon: Icons.currency_rupee_rounded,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.cornerRadiusMedium,
              ),
              child: Row(
                children: [
                  CustomChip(amount: '500', amountController: amountController),
                  const SizedBox(width: 10),
                  CustomChip(
                      amount: '1000', amountController: amountController),
                  const SizedBox(width: 10),
                  CustomChip(
                      amount: '2000', amountController: amountController),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.cornerRadiusMedium),
              child: Row(
                children: [
                  CustomChip(
                      amount: '3000', amountController: amountController),
                  const SizedBox(width: 20),
                  CustomChip(
                      amount: '5000', amountController: amountController),
                  const SizedBox(width: 20),
                  CustomChip(
                      amount: '10000', amountController: amountController),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.viewSpacing),
              child: CustomElevatedButton(
                onPressed: () =>
                  Navigator.pushNamed(context, AppRoute.topuppaymentPage),
                buttonText: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.amount,
    required this.amountController,
  }) : super(key: key);
  final String amount;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => amountController.text = amount,
      child: Chip(
        label: Text(amount),
        avatar: const Text('Rs.'),
        labelPadding: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(AppSize.cornerRadiusMedium),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.inset)),
        // labelPadding: EdgeInsets.all(8),
      ),
    );
  }
}
