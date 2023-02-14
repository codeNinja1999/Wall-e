import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MyAppBar(
        title: 'Send Money',
        onPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const BeneficiaryCard(),
              Container(
                padding:
                    const EdgeInsets.only(left: AppSize.viewMargin, top: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Amount",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const ExchangeRateCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExchangeRateCard extends StatelessWidget {
  const ExchangeRateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSize.inset),
      child: Container(
        padding: const EdgeInsets.all(AppSize.inset),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme.disabledColor,
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(2, 2),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: theme.primaryColorLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AUDtoNPR(theme: theme),
            CurrencyToBeConverted(theme: theme),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.currency_exchange_sharp,
                size: 30,
                color: theme.primaryColor,
              ),
            ),
            CurrencyToGet(theme: theme),
            const Padding(
              padding:
                  EdgeInsets.symmetric(vertical: AppSize.cornerRadiusMedium),
              child: Divider(
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Transaction Fee",
                  style: theme.textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Text("1.50% only", style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(vertical: AppSize.cornerRadiusSmall),
              child: Divider(
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: theme.textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Text("AUD 12000", style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(vertical: AppSize.cornerRadiusMedium),
              child: Divider(
                thickness: 1,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.sendmoneyNavigationRoute);
              },
              title: 'Transfer Now',
              buttonType: ButtonType.plain,
              trailingIcon: Icons.arrow_forward,
            )
          ],
        ),
      ),
    );
  }
}

class CurrencyToGet extends StatelessWidget {
  const CurrencyToGet({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        keyboardType: TextInputType.number,
        prefixIcon: Icon(
          Icons.money,
          color: theme.primaryColor,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(Images.nepal, width: 30, height: 30),
        ),
        labelText: "Reciever get",
        labelStyle: theme.textTheme.labelLarge);
  }
}

class CurrencyToBeConverted extends StatelessWidget {
  const CurrencyToBeConverted({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.number,
      prefixIcon: Icon(
        Icons.money,
        color: theme.primaryColor,
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
        child: SvgPicture.asset(
          Images.australia,
          height: 5,
          width: 5,
          fit: BoxFit.fill,
        ),
      ),
      labelText: "Send Money",
      labelStyle: theme.textTheme.labelLarge,
    );
  }
}

class BeneficiaryCard extends StatefulWidget {
  const BeneficiaryCard({Key? key}) : super(key: key);

  @override
  State<BeneficiaryCard> createState() => _BeneficiaryCardState();
}

class _BeneficiaryCardState extends State<BeneficiaryCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 160,
      width: 340,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
        color: theme.primaryColorLight,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RejinaLuitel(theme: theme),
          const CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22.0,
                backgroundImage: AssetImage(Images.girl),
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
                        style: theme.textTheme.bodySmall,
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
                  color: theme.primaryColorDark,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSize.inset),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(AppIcon.arrowBack),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSize.inset),
          child: Text(
            'Send Money',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}

class AUDtoNPR extends StatelessWidget {
  const AUDtoNPR({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.cornerRadiusMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Images.australia,
            fit: BoxFit.fill,
            height: 18,
            width: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16 * 0.5),
            child: Text(
              '1 AUD = Rs. 120',
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 12, bottom: 8),
      child: Row(
        children: [
          Column(
            children: const [
              Icon(Icons.fiber_manual_record, color: Colors.grey, size: 5),
              Icon(Icons.fiber_manual_record, color: Colors.grey, size: 5),
              Icon(Icons.fiber_manual_record, color: Colors.grey, size: 5),
            ],
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
              indent: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class RejinaLuitel extends StatelessWidget {
  const RejinaLuitel({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
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
            children: [
              Text(
                "Rejina Luitel",
                style: theme.textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16 * 0.5),
                child: Text(
                  "Safe to spend : \$123456.00",
                  style: theme.textTheme.bodySmall,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

_bottomSheet(context) {
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
                          onPressed: () => Navigator.pushNamed(
                              context, AppRoute.beneficiaryNavigationRoute),
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
