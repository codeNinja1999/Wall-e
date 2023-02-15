import 'package:flutter/material.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
import 'package:wall_e/source/sendMoney/router/sendmoney_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';

class SendmoneyPayoutInfoPage extends StatefulWidget {
  const SendmoneyPayoutInfoPage({Key? key}) : super(key: key);

  @override
  State<SendmoneyPayoutInfoPage> createState() =>
      _SendmoneyPayoutInfoPageState();
}

class _SendmoneyPayoutInfoPageState extends State<SendmoneyPayoutInfoPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MyAppBar(
        leadingIcon: true,
        title: 'Payout Detail',
        onPressed: () => Navigator.pop(context),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.viewMargin,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: CustomDropdown(
                  items: ListDropDown.selectBank,
                  onChange: (DropDownItem data) {},
                  placeholderLabel: Localize.selectBank.value,
                  enableSearch: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.inset,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: CustomDropdown(
                  items: ListDropDown.selectBranch,
                  onChange: (DropDownItem data) {},
                  placeholderLabel: Localize.branch.value,
                  enableSearch: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.inset,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: CustomDropdown(
                  items: ListDropDown.remittancePurpose,
                  onChange: (DropDownItem data) {},
                  placeholderLabel: Localize.purposeRemit.value,
                  enableSearch: true,
                  validator: (_) {
                    return Localize.stateErrorMessage.value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.inset,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: CustomDropdown(
                  items: ListDropDown.sourceofFund,
                  onChange: (DropDownItem data) {},
                  placeholderLabel: Localize.sourceoffund.value,
                  enableSearch: true,
                  validator: (_) {
                    return Localize.stateErrorMessage.value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.inset,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: CustomTextField(
                  labelText: 'Account number*',
                  labelStyle: theme.textTheme.labelLarge,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.viewSpacing,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextButton(
                        onPressed: () => Navigator.pop(context),
                        title: Localize.backButtonTitle.value,
                        buttonType: ButtonType.round,
                      ),
                    ),
                    const SizedBox(width: AppSize.inset),
                    Expanded(
                      child: CustomTextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, SendmoneyRoute.successSendmoney),
                        title: Localize.nextButtonTitle.value,
                        buttonType: ButtonType.round,
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
