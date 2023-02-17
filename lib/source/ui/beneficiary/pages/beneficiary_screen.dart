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
        appBar: MyAppBar(title: 'Recepient'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.viewSpacing,
                left: AppSize.viewSpacing,
                right: AppSize.viewSpacing,
              ),
              child: Row(
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
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.spacedViewSpacing,
                  left: AppSize.viewSpacing,
                  right: AppSize.viewSpacing,
                ),
                child:
                    Text("SAVED ACCOUNTS", style: theme.textTheme.labelLarge)),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.viewSpacing,
                left: AppSize.viewSpacing,
                right: AppSize.viewSpacing,
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.inset),
                    color: theme.primaryColorLight),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final String receiverName = beneficiaryList[index].name;

                    final String accountType =
                        beneficiaryList[index].accountType;

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoute.beneficiaryDetails);
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSize.cornerRadiusMedium,
                        ),
                        leading: CircleAvatar(
                          radius: AppSize.viewMargin,
                          backgroundImage: AssetImage(Images.girl),
                        ),
                        title: Text(receiverName,
                            style: theme.textTheme.titleMedium),
                        subtitle:
                            Text(accountType, style: theme.textTheme.bodySmall),
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
                          child:
                              Text("Send", style: theme.textTheme.titleMedium),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: beneficiaryList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class RecipientName extends StatelessWidget {
//   const RecipientName({
//     Key? key,
//     required this.receiverName,
//     required this.countryAccount,
//   }) : super(key: key);

//   final String receiverName;
//   final String countryAccount;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return GestureDetector(
//       onTap: () => Navigator.pushNamed(context, AppRoute.beneficiaryDetails),
//       child: ListTile(
//         contentPadding: EdgeInsets.zero,
//         leading: CircleAvatar(
//           radius: AppSize.viewMargin,
//           backgroundImage: AssetImage(Images.girl),
//         ),
//         title: Text(receiverName, style: theme.textTheme.titleMedium),
//         subtitle: Text(countryAccount, style: theme.textTheme.bodySmall),
//         trailing: InkWell(
//           onTap: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 duration: Duration(seconds: 2),
//                 behavior: SnackBarBehavior.floating,
//                 content: Text('You clicked send button'),
//               ),
//             );
//           },
//           child: Text("Send", style: theme.textTheme.titleMedium),
//         ),
//       ),
//     );
//   }
// }

List<Beneficiary> beneficiaryList = [
  Beneficiary(name: 'Rejina Luitel', accountType: 'EUR Account'),
  Beneficiary(name: 'Melisha Sherchan', accountType: 'AUD Account'),
];

class Beneficiary {
  final String name;
  final String accountType;

  Beneficiary({required this.name, required this.accountType});
}
