// import 'package:bloc_book/core/color/theme_color.dart';
// import 'package:bloc_book/core/localization/localize.dart';
// import 'package:bloc_book/core/localization/localize_extenstion.dart';
// import 'package:bloc_book/core/router/app_route.dart';
// import 'package:bloc_book/core/utils/keyboard.dart';
// import 'package:bloc_book/source/ui/history/presentation/pages/historyscreen.dart';
// import 'package:bloc_book/source/ui/home/presentation/pages/homescreen.dart';
// import 'package:bloc_book/source/ui/receiver/presentation/pages/reciever.dart';
// import 'package:bloc_book/source/ui/setting/presentation/pages/settingscreen.dart';
// import 'package:flutter/material.dart';

// class HomeTabBar extends StatefulWidget {
//   const HomeTabBar({super.key});

//   @override
//   State<HomeTabBar> createState() => _HomeTabBarState();
// }

// class _HomeTabBarState extends State<HomeTabBar> {
//   int currentTab = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   refresh() {
//     setState(() {});
//   }

//   void updateTab(int selectedTab) {
//     KeyboardUtil.hideKeyboard(context);
//     setState(() {
//       currentTab = selectedTab;
//     });
//   }

//   late ThemeData theme;
//   bool keyboardVisible = false;
//   @override
//   Widget build(BuildContext context) {
//     theme = Theme.of(context);
//     return Scaffold(
//       body: Stack(children: <Widget>[
//         Offstage(
//           offstage: currentTab != 0,
//           child: HomeScreen(
//             viewAllAction: () => updateTab(2),
//           ),
//         ),
//         Offstage(
//           offstage: currentTab != 1,
//           child: const RecieverPage(),
//         ),
//         Offstage(
//           offstage: currentTab != 2,
//           child: const HistoryScreen(),
//         ),
//         Offstage(
//           offstage: currentTab != 3,
//           child: const SettingScreen(),
//         )
//       ]),
//       floatingActionButton: Visibility(
//         visible: !keyboardVisible,
//         child: FloatingActionButton(
//           heroTag: "send_money",
//           onPressed: () {
//             Navigator.pushNamed(context, AppRoute.sendmoney);
//           },
//           backgroundColor: theme.primaryColor,
//           child: Container(
//             padding: const EdgeInsets.all(4),
//             child: const Icon(Icons.send),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         color: theme.backgroundColor,
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 10,
//         child: SizedBox(
//           height: 60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   MaterialButton(
//                       minWidth: 40,
//                       onPressed: () => updateTab(0),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.home,
//                               size: 30,
//                               color: currentTab == 0
//                                   ? ThemeAppColors.primaryBlue
//                                   : ThemeAppColors.grey,
//                             ),
//                             Text(Localize.home.value,
//                                 style: TextStyle(
//                                   color: currentTab == 0
//                                       ? ThemeAppColors.primaryBlue
//                                       : ThemeAppColors.grey,
//                                 )),
//                           ])),
//                   MaterialButton(
//                       minWidth: 40,
//                       onPressed: () => updateTab(1),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.person,
//                               size: 30,
//                               color: currentTab == 1
//                                   ? ThemeAppColors.primaryBlue
//                                   : ThemeAppColors.grey,
//                             ),
//                             Text(Localize.receiver.value,
//                                 style: TextStyle(
//                                   color: currentTab == 1
//                                       ? ThemeAppColors.primaryBlue
//                                       : ThemeAppColors.grey,
//                                 )),
//                           ])),
//                 ],
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   MaterialButton(
//                       minWidth: 40,
//                       onPressed: () => updateTab(2),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.history,
//                               size: 30,
//                               color: currentTab == 2
//                                   ? ThemeAppColors.primaryBlue
//                                   : ThemeAppColors.grey,
//                             ),
//                             Text(Localize.history.value,
//                                 style: TextStyle(
//                                   color: currentTab == 2
//                                       ? ThemeAppColors.primaryBlue
//                                       : ThemeAppColors.grey,
//                                 )),
//                           ])),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () => updateTab(3),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Icon(
//                           Icons.settings,
//                           size: 30,
//                           color: currentTab == 3
//                               ? ThemeAppColors.primaryBlue
//                               : ThemeAppColors.grey,
//                         ),
//                         Text(
//                           Localize.settings.value,
//                           style: TextStyle(
//                             color: currentTab == 3
//                                 ? ThemeAppColors.primaryBlue
//                                 : ThemeAppColors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
