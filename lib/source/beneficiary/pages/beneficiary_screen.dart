import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/exit_app_widget/exit_app_widget.dart';
import 'package:flutter/material.dart';

class BeneficiaryScreen extends StatefulWidget {
  const BeneficiaryScreen({Key? key}) : super(key: key);

  @override
  State<BeneficiaryScreen> createState() => _BeneficiaryScreenState();
}

class _BeneficiaryScreenState extends State<BeneficiaryScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => PopApp.popApp(context),
      
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: MyAppBar(
          backgroundColor: Colors.transparent,
          title: 'Recipients',
          titleStyle: theme.textTheme.titleLarge,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Recipients',
                    style: theme.textTheme.titleMedium,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, AppRoute.beneficiaryNavigationRoute),
                    child: const Icon(
                      AppIcon.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: AppSize.spacedViewSpacing),
                  child: Text("SAVED ACCOUNTS",
                      style: theme.textTheme.bodyMedium)),
              const SizedBox(height: 28),
              const RecipientName(
                receiverName: "Rejina Luitel",
                countryAccount: "EUR Account",
              ),
              const SizedBox(height: AppSize.inset),
              const RecipientName(
                receiverName: "Melisha Serchan",
                countryAccount: "AUD Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipientName extends StatelessWidget {
  const RecipientName({
    Key? key,
    required this.receiverName,
    required this.countryAccount,
  }) : super(key: key);

  final String receiverName;
  final String countryAccount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.beneficiaryDetails),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(Images.girl),
        ),
        title: Text(receiverName, style: theme.textTheme.bodyLarge),
        subtitle: Text(countryAccount, style: theme.textTheme.bodySmall),
        trailing: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                content: Text('You clicked send button'),
              ),
            );
          },
          child: Text("Send", style: theme.textTheme.titleMedium),
        ),
      ),
    );
  }
}
