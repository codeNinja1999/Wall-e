import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  MyAppBar({this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text(title ?? "",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 20)),
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
