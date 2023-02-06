import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/history/presentation/pages/historyscreen.dart';
import 'package:wall_e/source/widget/exit_app_widget/exit_app_widget.dart';
import 'package:wall_e/source/home/presentation/widget/button_widget.dart';
import 'package:wall_e/source/home/presentation/widget/small_button_widget.dart';
import 'package:wall_e/source/inbox/presentation/pages/inboxscreen.dart';
import 'package:wall_e/source/profile/presentation/pages/profilescreen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final pageController = PageController();
  int _selectedIndex = 0;
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(AppIcon.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(AppIcon.accessTime), label: 'History'),
    BottomNavigationBarItem(icon: Icon(AppIcon.emailRounded), label: 'Inbox'),
    BottomNavigationBarItem(icon: Icon(AppIcon.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.primaryColorLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Colors.black26),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ThemeAppColors.primaryBlue,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (value) {
            pageController.jumpToPage(value);
          },
          items: items,
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        children: const [
          HomeScreen(),
          HistoryScreen(),
          InboxScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: WillPopScope(
        onWillPop: () => PopApp.popApp(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //profile pic and name
                  const UserAvatar(),
                  const SizedBox(height: 10),
                  //balance card
                  const BalanceCard(),
                  const SizedBox(height: 25),
                  const PayBills(),
                  const SizedBox(height: 20),
                  const Text(
                    "What's new?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Check out our new features",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  //carousel
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeAppColors.secondary),
                    child: const ListTile(
                      leading: Icon(Icons.nature_people),
                      title: Text(
                        'Split bills with your friends',
                      ),
                      trailing: Icon(AppIcon.arrowForward),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PayBills extends StatelessWidget {
  const PayBills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pay Bill',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SmallButtonWidget(icon: AppIcon.phoneAndroid, text: 'Phone'),
                  SmallButtonWidget(icon: AppIcon.language, text: 'Data'),
                  SmallButtonWidget(icon: AppIcon.favorite, text: 'BPJS'),
                  SmallButtonWidget(icon: AppIcon.waterDrop, text: 'PDAM'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SmallButtonWidget(icon: AppIcon.wifi, text: 'Wifi'),
                  SmallButtonWidget(icon: AppIcon.desktopMac, text: 'Stream'),
                  SmallButtonWidget(icon: AppIcon.electricBolt, text: 'PLN'),
                  SmallButtonWidget(icon: AppIcon.moreHoriz, text: 'More'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue.shade50,
          backgroundImage: const AssetImage(
            'assets/images/profile1.png',
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade400),
            ),
            const Text(
              'Stephanie',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeAppColors.primaryBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 220,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //your balance
          Text(
            'Your Balance',
            style: TextStyle(color: ThemeAppColors.light),
          ),

          //Rs. 2000.00
          Expanded(
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  'Rs. ',
                  style: TextStyle(
                    color: ThemeAppColors.light,
                  ),
                ),
                Text(
                  '2,780.000',
                  style: TextStyle(
                      fontSize: 22,
                      color: ThemeAppColors.light,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //row
          const TransferScanTopUpRow(),
        ]),
      ),
    );
  }
}

class TransferScanTopUpRow extends StatelessWidget {
  const TransferScanTopUpRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonWidget(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.recieverNavigationPage);
            },
            icon: AppIcon.send,
            text: 'Transfer'),
        ButtonWidget(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.qrScan);
            },
            icon: AppIcon.qrScanner,
            text: 'Scan'),
        ButtonWidget(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.topup);
            },
            icon: AppIcon.addCircle,
            text: 'Top Up'),
      ],
    );
  }
}
