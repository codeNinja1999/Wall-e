import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/source/home/presentation/widget/appbar/appbar.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/home/presentation/widget/textfield.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Send Money',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 160,
              width: 340,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ThemeAppColors.grey,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22.0,
                          backgroundImage: AssetImage(Images.usericon),
                          backgroundColor: theme.disabledColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Rejina Luitel",
                                style: theme.textTheme.titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16 * 0.5),
                                child: Text(
                                  "Safe to spend : \$123456.00",
                                  style: theme.textTheme.bodySmall
                                      ?.copyWith(color: theme.disabledColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 20, right: 12, bottom: 8),
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              Icon(Icons.fiber_manual_record,
                                  color: Colors.grey, size: 5),
                              Icon(Icons.fiber_manual_record,
                                  color: Colors.grey, size: 5),
                              Icon(Icons.fiber_manual_record,
                                  color: Colors.grey, size: 5),
                            ],
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color(0xff818181),
                              indent: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    //   child: Row(
                    //     children: [
                    //       Column(
                    //         children: const [
                    //           Icon(Icons.fiber_manual_record,
                    //               color: Colors.grey, size: 5),
                    //           Icon(Icons.fiber_manual_record,
                    //               color: Colors.grey, size: 5),
                    //           Icon(Icons.fiber_manual_record,
                    //               color: Colors.grey, size: 5),
                    //         ],
                    //       ),
                    // const Divider(
                    //   thickness: 1,
                    //   color: Colors.grey,
                    //   indent: 40,
                    // ),
                    //     ],
                    //   ),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22.0,
                          backgroundImage: AssetImage(Images.girl),
                          backgroundColor: theme.disabledColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Melisa Serchan",
                                style: theme.textTheme.titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16 * 0.5),
                                child: Text(
                                  "1234 5678 9012 3456",
                                  style: theme.textTheme.bodySmall
                                      ?.copyWith(color: theme.disabledColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _bottomSheet(context);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: ThemeAppColors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 48.0, top: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "Enter Amount",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ThemeAppColors.grey,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 20, right: 20),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 16, left: 48),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.australia,
                                fit: BoxFit.fill,
                                height: 18,
                                width: 18,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16 * 0.5),
                                child: Text('1 AUD = Rs. 120',
                                    style: theme.textTheme.titleMedium),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                            textInputType: TextInputType.number,
                            prefixIcon: const Icon(Icons.money),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 8, bottom: 8),
                              child: Expanded(
                                child: SvgPicture.asset(
                                  Images.australia,
                                  height: 5,
                                  width: 5,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            labelText: "Send Money",
                            onChanged: (value) {},
                            validator: (_) {
                              return null;
                            }),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.currency_exchange_sharp,
                              size: 30, color: ThemeAppColors.mainColor),
                        ),
                        CustomTextField(
                            textInputType: TextInputType.number,
                            prefixIcon: const Icon(Icons.money),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Expanded(
                                child: Image.asset(Images.nepal,
                                    width: 30, height: 30),
                              ),
                            ),
                            labelText: "Reciever get",
                            onChanged: (value) {},
                            validator: (_) {
                              return null;
                            }),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Our Transaction Fee",
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 4.0),
                              child: Text("1.50% only",
                                  style: theme.textTheme.bodyMedium),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 4.0),
                              child: Text("AUD 12000",
                                  style: theme.textTheme.bodyMedium),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onPressed: () {},
                          title: 'Transfer Now',
                          buttonType: ButtonType.plain,
                          trailingIcon: Icons.arrow_forward,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_bottomSheet(context) {
  final theme = Theme.of(context);
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.1,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ThemeAppColors.light,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 14,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: ThemeAppColors.primaryBlue,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, bottom: 12),
                        child: IconButton(
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, AppRoute.recieverNavigationPage);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: MediaQuery.of(context).size.height / 7.3,
                    child: Text(
                      "Add Reciever",
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                Positioned(
                  top: MediaQuery.of(context).size.height / 5.5,

                  ///
                  child: SizedBox(
                    height: 250,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FriendList(
                              title: 'Rejina Luitel', image: Images.usericon),
                          FriendList(
                              title: 'Melisa Serchan', image: Images.usericon),
                          FriendList(
                              title: 'Somi Joshi', image: Images.usericon),
                          FriendList(
                              title: 'Sujata Bajracharya',
                              image: Images.usericon)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

class FriendList extends StatelessWidget {
  final String title;
  final String image;
  const FriendList({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 350,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22.0,
            backgroundImage: AssetImage(image),
            backgroundColor: Theme.of(context).disabledColor,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
