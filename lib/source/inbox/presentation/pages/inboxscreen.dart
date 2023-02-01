// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/source/config/pop_config.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  bool isVisible = false;
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
                  'Inbox',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                SizedBox(
                  height: 20,
                ),
                //notification information

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isVisible = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !isVisible
                                ? ThemeAppColors.primaryBlue
                                : ThemeAppColors.secondary,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Notification'),
                            ],
                          ),
                        )),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isVisible
                                ? ThemeAppColors.primaryBlue
                                : ThemeAppColors.secondary,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.info,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Information'),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  height: 500,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: theme.primaryColorLight,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return TransactionList();
                    },
                  ),
                ), //transaction
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(20),
        leading: Icon(Icons.download_done),
        title: Text(
          'Transaction Success',
          style: TextStyle(fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Netflix monthly subscription'),
            Row(
              children: [
                Text(
                    '${'${DateTime.now().day}' '/' '${DateTime.now().month}'.padLeft(2, '0')}/${DateTime.now().year} '
                        .padLeft(2, '0')),
                Text('${' ${DateTime.now().hour}'
                    ':'
                    "${DateTime.now().minute} ".padLeft(2, '0')}PM'),
              ],
            ),
          ],
        ));
  }
}
