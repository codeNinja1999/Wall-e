// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/source/history/presentation/pages/transactionlist_page.dart';
import 'package:wall_e/source/config/pop_config.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

List<String> months = [
  'January',
  'Feburary',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

List<String> expense = ['Netflix', 'PLN', 'Top Up', 'Game', 'Phone'];

List<String> expenseRemarks = [
  'Monthly Subscription',
  'Token',
  'Top up balance',
  'PUBG voucher 20% off',
  'Telkomatu halo'
];

List<String> expenseAmount = [
  '-Rs 49.00',
  '-Rs 300.00',
  '+Rs 500.00',
  '-Rs 100.00',
  '-Rs 143.253'
];

class _HistoryScreenState extends State<HistoryScreen> {
  bool selectedItem = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: WillPopScope(
        onWillPop: () => PopApp.popApp(context),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Inbox
                Text(
                  'History',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                SizedBox(
                  height: 20,
                ),
                //notification information

                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
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

                SizedBox(
                  height: 20,
                ),

                Padding(
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
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Your monthly Expense',
                                  style: TextStyle(
                                      color: ThemeAppColors.light,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                '- Rs 3.240.000',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ThemeAppColors.light,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Transaction',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionListPage(),
                          )),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          color: ThemeAppColors.secondary,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.primaryColorLight,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Today, August 29',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView.separated(
                          itemCount: 2,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: theme.disabledColor,
                                backgroundImage: AssetImage(Images.usericon),
                              ),
                              title: Text(
                                expense[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              subtitle: Text(
                                expenseRemarks[index],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ThemeAppColors.secondary),
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
                                      style: TextStyle(
                                          color: ThemeAppColors.secondary),
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
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.primaryColorLight,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Friday, August 20',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: theme.disabledColor,
                                  backgroundImage: AssetImage(Images.usericon)),
                              title: Text(
                                expense[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              subtitle: Text(
                                expenseRemarks[index],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ThemeAppColors.secondary),
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
                                      style: TextStyle(
                                          color: ThemeAppColors.secondary),
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
                ),
              ],
            ),
          ),
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
      leading: CircleAvatar(
        radius: 30,
      ),
      title: Text(
        paidText,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              '-RP ' + '${amount}',
              style: TextStyle(color: Colors.red[300], fontSize: 16),
            ),
            Text(
              '${DateTime.now().hour}:${DateTime.now().minute} ' + 'PM',
              style: TextStyle(color: ThemeAppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
