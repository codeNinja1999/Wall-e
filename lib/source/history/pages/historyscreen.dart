import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/source/history/pages/transactionlist_page.dart';
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
  final List<String> expense = ListDropDown.expense;
  final List<String> expenseRemarks = ListDropDown.expenseRemarks;
  final List<String> expenseAmount = ListDropDown.expenseAmount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        backgroundColor: Colors.transparent,
        title: 'History',
        titleStyle: theme.textTheme.titleLarge,
      ),
      body: WillPopScope(
        onWillPop: () => PopApp.popApp(context),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.separated(
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
                            backgroundColor: ThemeAppColors.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: Text(months[index]),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const ExpenseCard(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest Transaction',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionListPage(),
                        )),
                    child: Text(
                      'Details',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const LatestTransaction(),
              const SizedBox(height: 20),
              const PreviousTransaction(),
            ],
          ),
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
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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

class PreviousTransaction extends StatelessWidget {
  const PreviousTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primaryColorLight,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Friday, August 20',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: theme.disabledColor,
                      backgroundImage: AssetImage(Images.usericon)),
                  title: Text(
                    expense[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  subtitle: Text(
                    expenseRemarks[index],
                    style: TextStyle(
                        fontSize: 12, color: ThemeAppColors.secondary),
                  ),
                  trailing: SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        Text(
                          expenseAmount[index],
                          style: TextStyle(
                            color: ThemeAppColors.red,
                          ),
                        ),
                        Text(
                          '${DateTime.now().hour}:${DateTime.now().minute} ' +
                              'PM',
                          style: TextStyle(color: ThemeAppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LatestTransaction extends StatelessWidget {
  const LatestTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Today, August 29',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 160,
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Theme.of(context).disabledColor,
                    backgroundImage: AssetImage(Images.usericon),
                  ),
                  title: Text(
                    expense[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  subtitle: Text(
                    expenseRemarks[index],
                    style: TextStyle(
                        fontSize: 12, color: ThemeAppColors.secondary),
                  ),
                  trailing: SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        Text(
                          expenseAmount[index],
                          style: TextStyle(
                            color: ThemeAppColors.red,
                          ),
                        ),
                        Text(
                          '${DateTime.now().hour}:${DateTime.now().minute} '
                          'PM',
                          style: TextStyle(color: ThemeAppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
