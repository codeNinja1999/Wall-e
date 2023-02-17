import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/exit_app_widget/exit_app_widget.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool selectedItem = true;

  final List<String> months = ListDropDown.months;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'History',
      ),
      body: WillPopScope(
        onWillPop: () => PopApp.popApp(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.viewMargin,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: SizedBox(
                  height: 50,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: months.length,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ThemeAppColors.greyShade,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: Text(months[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const ExpenseCard(),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppSize.viewMargin,
                    left: AppSize.viewMargin,
                    right: AppSize.viewMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Transaction',
                      style: theme.textTheme.titleMedium,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoute.allTranscationListRoute),
                      child: Text(
                        'Details',
                        style: theme.textTheme.labelLarge,
                      ),
                    )
                  ],
                ),
              ),
              const LatestTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}

class LatestTransaction extends StatelessWidget {
  const LatestTransaction({
    Key? key,
  }) : super(key: key);

  final List<String> expense = ListDropDown.expense;
  final List<String> expenseRemarks = ListDropDown.expenseRemarks;
  final List<String> expenseAmount = ListDropDown.expenseAmount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.inset,
        left: AppSize.viewMargin,
        right: AppSize.viewMargin,
        bottom: AppSize.viewMargin,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(AppSize.inset),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: AppSize.inset,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImageExtension.success),
              ),
              title: Text(
                expense[index],
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                expenseRemarks[index],
                style: theme.textTheme.bodySmall,
              ),
              trailing: SizedBox(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      expenseAmount[index],
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      '${DateTime.now().hour}:${DateTime.now().minute} '
                      'PM',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.viewMargin,
        left: AppSize.spacedViewSpacing,
        right: AppSize.spacedViewSpacing,
      ),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.viewMargin),
          color: Colors.red[300],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 30,
                color: ThemeAppColors.light,
              ),
            ),
            const SizedBox(width: 20),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Your monthly Expense',
                  style: TextStyle(
                      color: ThemeAppColors.light,
                      fontWeight: FontWeight.bold)),
              Text(
                'Rs 3.240.000',
                style: TextStyle(
                    fontSize: 20,
                    color: ThemeAppColors.light,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class PaidupTransaction extends StatelessWidget {
  const PaidupTransaction({
    Key? key,
    required this.paidText,
    required this.remarksText,
    required this.amount,
  }) : super(key: key);

  final String paidText;
  final String remarksText;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
      ),
      title: Text(
        paidText,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        remarksText,
        style: TextStyle(fontSize: 12, color: ThemeAppColors.secondary),
      ),
      trailing: SizedBox(
        height: 50,
        child: Column(
          children: [
            Text(
              '-RP $amount',
              style: TextStyle(color: Colors.red[300], fontSize: 16),
            ),
            Text(
              '${DateTime.now().hour}:${DateTime.now().minute} ' 'PM',
              style: TextStyle(color: ThemeAppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
