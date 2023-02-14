// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/core/icons/app_icons.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({super.key});

  @override
  State<TransactionListPage> createState() => _TransactionListPageState();
}

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

class _TransactionListPageState extends State<TransactionListPage> {
  int activeState = 0;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(AppIcon.arrowBack),
                  ),
                  Text(
                    'Transaction List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeAppColors.primaryBlue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'All',
                      style: TextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isActive = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isActive
                          ? ThemeAppColors.primaryBlue
                          : ThemeAppColors.secondary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text(
                      'Debit',
                      style: TextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isActive = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isActive
                          ? ThemeAppColors.primaryBlue
                          : ThemeAppColors.secondary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'Credit',
                      style: TextStyle(),
                    ),
                  ),
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
                                backgroundImage: AssetImage(Images.usericon)),
                            title: Text(
                              expense[index],
                              style: theme.textTheme.titleSmall,
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
                height: 300,
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
                      height: 200,
                      child: ListView.separated(
                        itemCount: expense.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: theme.disabledColor,
                                backgroundImage: AssetImage(Images.usericon)),
                            title: Text(
                              expense[index],
                              style: theme.textTheme.titleSmall,
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
    );
  }
}
