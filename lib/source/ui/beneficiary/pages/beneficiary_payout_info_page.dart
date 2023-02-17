import 'package:flutter/material.dart';
import 'package:wall_e/source/ui/beneficiary/router/beneficiary_route.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class BeneficiaryPayoutInfoPage extends StatefulWidget {
  const BeneficiaryPayoutInfoPage({Key? key}) : super(key: key);

  @override
  State<BeneficiaryPayoutInfoPage> createState() =>
      _BeneficiaryPayoutInfoPageState();
}

class _BeneficiaryPayoutInfoPageState extends State<BeneficiaryPayoutInfoPage> {
  late ThemeData theme;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.viewMargin),
                child: EsStepperHeader(
                  totalStps: 3,
                  currentStep: 3,
                  title: "Payout Detail",
                ),
              ),
              PayoutInfoPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class PayoutInfoPageBody extends StatefulWidget {
  const PayoutInfoPageBody({Key? key}) : super(key: key);

  @override
  State<PayoutInfoPageBody> createState() => _PayoutInfoPageBodyState();
}

class _PayoutInfoPageBodyState extends State<PayoutInfoPageBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: formKey,
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
              labelStyle: theme.textTheme.bodyMedium,
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
                        context, BeneficiaryRoute.successBeneficiaryPage),
                    title: Localize.nextButtonTitle.value,
                    buttonType: ButtonType.round,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
