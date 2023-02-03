import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/source/home/presentation/widget/appbar/appbar.dart';

class RecieverPage extends StatefulWidget {
  const RecieverPage({Key? key}) : super(key: key);

  @override
  State<RecieverPage> createState() => _RecieverPageState();
}

class _RecieverPageState extends State<RecieverPage> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Recipients',
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Recipients',
                  style: theme.textTheme.titleLarge,
                ),
                const Icon(
                  Icons.search,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 400,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ThemeAppColors.grey,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My faviourite account (2)",
                      style: theme.textTheme.bodyLarge?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 28.0),
              child: Text("OTHER ACCOUNTS",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: ThemeAppColors.grey)),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    Images.girl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Rejina Luitel",
                        style:
                            theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16 * 0.5),
                        child: Text(
                          "EUR Account",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.disabledColor),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Send",
                      style:
                          theme.textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
