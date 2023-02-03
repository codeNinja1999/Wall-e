import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/home/presentation/widget/textfield.dart';
import 'package:wall_e/source/reciever/router/beneficiary_route.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class BankPage extends StatefulWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  late ThemeData theme;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: const [
            EsStepperHeader(totalStps: 3, currentStep: 3, title: "Bank Detail"),
            BankPageBody(),
          ],
        ),
      ),
    );
  }
}

class BankPageBody extends StatefulWidget {
  const BankPageBody({Key? key}) : super(key: key);

  @override
  State<BankPageBody> createState() => _BankPageBodyState();
}

class _BankPageBodyState extends State<BankPageBody> {
  late ThemeData theme;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    List<DropDownItem> menuItems = <DropDownItem>[
      const DropDownItem(
          'Cash Pickup',
          '1',
          Icon(
            Icons.android,
            color: Color(0xFF167F67),
          )),
      const DropDownItem(
          'Bank Transfer',
          '2',
          Icon(
            Icons.flag,
            color: Color(0xFF167F67),
          )),
    ];
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: AppSize.viewMargin, right: AppSize.viewMargin),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: AppSize.inset),
                  width: double.infinity,
                  child: CustomDropdown(
                      items: menuItems,
                      onChange: (DropDownItem data) {},
                      placeholderLabel: Localize.payoutType.value,
                      enableSearch: true,
                  ),
                ),
                payoutMethodDropDown(),
                Padding(
                  padding: const EdgeInsets.only(top: AppSize.inset),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          // textColor: theme.bottomAppBarColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          title: Localize.backButtonTitle.value,
                          buttonType: ButtonType.round,
                        ),
                      ),
                      const SizedBox(width: AppSize.inset),
                      Expanded(
                        child: CustomButton(
                          // textColor: theme.bottomAppBarColor,
                          onPressed: () {
                            //navigateTobeneficiarysuccess(context);
                            Navigator.pushNamed(
                                context, BeneficiaryRoute.successBeneficiary);
                          },
                          title: Localize.addReceiver.value,
                          buttonType: ButtonType.round,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

Widget payoutMethodDropDown() {
  List<DropDownItem> menuItems = <DropDownItem>[
    const DropDownItem(
        'ABC Stationary',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    const DropDownItem(
        'abcd',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
  ];
  return SizedBox(
    width: double.infinity,
    child: CustomDropdown(
        items: menuItems,
        onChange: (DropDownItem data) {},
        placeholderLabel: Localize.payoutLocation.value,
        enableSearch: true,
        mode: Mode.BOTTOM_SHEET),
  );
}

Widget bankListDown() {
  List<DropDownItem> menuItems = <DropDownItem>[
    const DropDownItem(
        'prabhu Bank',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    const DropDownItem(
        'sanima bank',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
  ];
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(top: AppSize.inset),
        width: double.infinity,
        child: CustomDropdown(
            items: menuItems,
            onChange: (DropDownItem data) {
              print(data.data);
            },
            placeholderLabel: Localize.bankErrorMessage.value,
            enableSearch: true,
            mode: Mode.BOTTOM_SHEET),
      ),
      Container(
        padding: const EdgeInsets.only(top: AppSize.inset),
        width: double.infinity,
        child: CustomTextField(
            textInputType: TextInputType.text,
            labelText: Localize.branchLabel.value,
            onChanged: (value) {}),
      ),
      Container(
          padding: const EdgeInsets.only(top: AppSize.inset),
          width: double.infinity,
          child: CustomTextField(
            textInputType: TextInputType.number,
            labelText: Localize.accountNumber.value,
            validator: (value) {
              return null;
            },
            onChanged: (accountNumber) {},
          )),
    ],
  );
}
