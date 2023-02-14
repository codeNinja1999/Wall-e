import 'package:wall_e/source/beneficiary/router/beneficiary_route.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class BeneficiaryContactInformationPage extends StatefulWidget {
  const BeneficiaryContactInformationPage({Key? key}) : super(key: key);

  @override
  State<BeneficiaryContactInformationPage> createState() =>
      _BeneficiaryContactInformationPageState();
}

class _BeneficiaryContactInformationPageState
    extends State<BeneficiaryContactInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            EsStepperHeader(
              totalStps: 3,
              currentStep: 2,
              title: "Contact Information",
              description: 'Next: Payout Details',
            ),
            ContactInformationBody(),
          ],
        ),
      ),
    );
  }
}

class ContactInformationBody extends StatefulWidget {
  const ContactInformationBody({Key? key}) : super(key: key);

  @override
  State<ContactInformationBody> createState() => _ContactInformationBodyState();
}

class _ContactInformationBodyState extends State<ContactInformationBody> {
  late ThemeData theme;
  bool dateValidate = true;
  final formKey = GlobalKey<FormState>();
  final _mobileNumberEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final formKey = GlobalKey<FormState>();
    List<DropDownItem> menuItems = <DropDownItem>[
      const DropDownItem(
          'Tokyo',
          '1',
          Icon(
            Icons.android,
            color: Color(0xFF167F67),
          )),
      const DropDownItem(
          'Oita',
          '2',
          Icon(
            Icons.flag,
            color: Color(0xFF167F67),
          )),
      const DropDownItem(
          'Fukuoka',
          '3',
          Icon(
            Icons.format_indent_decrease,
            color: Color(0xFF167F67),
          )),
    ];
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            AppSize.viewMargin, AppSize.inset, AppSize.viewMargin, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomDropdown(
              items: menuItems,
              onChange: (DropDownItem data) {},
              placeholderLabel: "Country",
              enableSearch: true,
              validator: (_) {
                return "Select country";
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                  keyboardType: TextInputType.text,
                  labelText: 'Address',
                  labelStyle: theme.textTheme.labelLarge,
                  validator: (_) {
                    (value) {
                      if (value == "") {
                        return "Please enter address";
                      }
                    };
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                  keyboardType: TextInputType.text,
                  labelText: 'State',
                  labelStyle: theme.textTheme.labelLarge,
                  validator: (value) {
                    if (value == "") {
                      return "Please enter address";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                validator: (value) {
                  return null;
                },
                textController: _mobileNumberEditingController,
                prefixIcon: Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 13, right: 15),
                    child: Text(
                      '+977',
                      style: theme.textTheme.subtitle2,
                    )),
                keyboardType: TextInputType.number,
                hintText: Localize.mobileNumber.value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.viewSpacing),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      // textColor: theme.bottomAppBarColor,
                      buttonType: ButtonType.round,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: Localize.backButtonTitle.value,
                    ),
                  ),
                  const SizedBox(width: AppSize.inset * 0.5),
                  Expanded(
                    child: CustomTextButton(
                      // textColor: theme.bottomAppBarColor,
                      buttonType: ButtonType.round,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, BeneficiaryRoute.payoutInfoPage);
                      },
                      title: Localize.nextButtonTitle.value,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
