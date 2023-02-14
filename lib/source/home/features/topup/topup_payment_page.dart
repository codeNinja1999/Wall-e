import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class TopupPaymentPage extends StatefulWidget {
  const TopupPaymentPage({super.key});
  // final String amount;

  @override
  State<TopupPaymentPage> createState() => _TopupPaymentPageState();
}

class _TopupPaymentPageState extends State<TopupPaymentPage> {
  String dropdownvalue = 'Esewa';

  final amountController = TextEditingController();
  final esewaNumber = TextEditingController();
  final holderName = TextEditingController();
  final creditNumber = TextEditingController();
  final expirationDate = TextEditingController();
  final cvcNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        leadingIcon: true,
        title: 'Topup Payment',
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.inset),
              child: DropdownButton(
                value: dropdownvalue,
                dropdownColor: theme.backgroundColor,
                elevation: 0,
                onChanged: (val) {
                  setState(() {
                    dropdownvalue = val;
                  });
                },
                isExpanded: true,
                items: ListDropDown.paymentMethod,
              ),
            ),
            (dropdownvalue == 'Esewa')
                ? const EsewaPayment()
                : const VisaCardPayment(),
            const Padding(
              padding: EdgeInsets.only(
                top: AppSize.inset,
                left: AppSize.inset,
                right: AppSize.inset,
              ),
              child: Text('Amount'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: AppSize.cornerRadiusMedium,
                  left: AppSize.inset,
                  right: AppSize.inset),
              child: CustomTextField(
                textController: TextEditingController(text: '500'),
                textInputAction: TextInputAction.next,
                hintText: 'Enter amount',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.viewSpacing,
                horizontal: AppSize.viewSpacing,
              ),
              child: CustomElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.viewMargin),
                        topRight: Radius.circular(AppSize.viewMargin),
                      ),
                    ),
                    context: context,
                    backgroundColor: theme.primaryColorLight,
                    builder: (context) {
                      return const Checkout();
                    },
                  );
                },
                buttonText: 'Confirm Payment',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VisaCardPayment extends StatelessWidget {
  const VisaCardPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: AppSize.inset,
            left: AppSize.inset,
            right: AppSize.inset,
          ),
          child: Text('Card holder*'),
        ),
        const Padding(
          padding: EdgeInsets.only(
              top: AppSize.cornerRadiusMedium,
              left: AppSize.inset,
              right: AppSize.inset),
          child: CustomTextField(
            textInputAction: TextInputAction.next,
            hintText: 'Enter card holder name',
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: AppSize.inset,
            left: AppSize.inset,
            right: AppSize.inset,
          ),
          child: Text('Credit/Debit card number*'),
        ),
        const Padding(
          padding: EdgeInsets.only(
              top: AppSize.cornerRadiusMedium,
              left: AppSize.inset,
              right: AppSize.inset),
          child: CustomTextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            hintText: '1234-5678-9012-3456',
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppSize.inset,
                      left: AppSize.inset,
                      right: AppSize.inset,
                    ),
                    child: Text('Expiration date*'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppSize.cornerRadiusMedium,
                        left: AppSize.inset,
                        right: AppSize.inset),
                    child: CustomTextField(
                      textInputAction: TextInputAction.next,
                      hintText: 'MM/YYYY',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppSize.inset,
                      left: AppSize.inset,
                      right: AppSize.inset,
                    ),
                    child: Text('CVC*'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppSize.cornerRadiusMedium,
                        left: AppSize.inset,
                        right: AppSize.inset),
                    child: CustomTextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      hintText: 'Enter CVC number',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EsewaPayment extends StatelessWidget {
  const EsewaPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.only(
            top: AppSize.inset,
            left: AppSize.inset,
            right: AppSize.inset,
          ),
          child: Text('Esewa Id*'),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: AppSize.cornerRadiusMedium,
              left: AppSize.inset,
              right: AppSize.inset),
          child: CustomTextField(
            textInputAction: TextInputAction.next,
            hintText: '9812345678',
          ),
        ),
      ],
    );
  }
}

class Checkout extends StatefulWidget {
  const Checkout({
    Key? key,
  }) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSize.viewMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Payment Method',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Esewa',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          const Text('Payment Summary'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Up',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: ThemeAppColors.greyShade),
              ),
              Text(
                'Rs. 500.00',
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Service charge',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: ThemeAppColors.greyShade),
              ),
              Text(
                'Rs. 5.00',
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: theme.textTheme.titleSmall
                    ?.copyWith(color: theme.primaryColor),
              ),
              Text(
                'Rs. 505.00',
                style: theme.textTheme.titleSmall
                    ?.copyWith(color: theme.primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 30),
          CustomElevatedButton(
            buttonText: 'Checkout',
            onPressed: () => Navigator.pushNamed(
              context,
              AppRoute.tranSuccessPage,
            ),
          ),
        ],
      ),
    );
  }
}
