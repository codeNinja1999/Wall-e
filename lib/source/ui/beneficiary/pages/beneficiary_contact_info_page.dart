import 'package:wall_e/source/ui/beneficiary/router/beneficiary_route.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.viewSpacing),
              child: EsStepperHeader(
                totalStps: 3,
                currentStep: 2,
                title: "Contact Information",
                description: 'Next: Payout Details',
              ),
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
  final formKey = GlobalKey<FormState>();
  final mobileNumberController = TextEditingController();
  final addressTextController = TextEditingController();
  final stateTextController = TextEditingController();

  @override
  void dispose() {
    mobileNumberController.dispose();
    addressTextController.dispose();
    stateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            AppSize.viewMargin, AppSize.inset, AppSize.viewMargin, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomDropdown(
              items: ListDropDown.countryList,
              onChange: (DropDownItem data) {},
              placeholderLabel: "Country",
              enableSearch: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                textController: addressTextController,
                keyboardType: TextInputType.text,
                labelText: 'Address',
                labelStyle: theme.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                textController: stateTextController,
                keyboardType: TextInputType.text,
                labelText: 'State',
                labelStyle: theme.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                textController: mobileNumberController,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.inset,
                    left: AppSize.inset,
                    right: AppSize.inset,
                    bottom: AppSize.inset,
                  ),
                  child: Text(
                    '+977',
                  ),
                ),
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
                      buttonType: ButtonType.round,
                      onPressed: () => Navigator.of(context).pop(),
                      title: Localize.backButtonTitle.value,
                    ),
                  ),
                  const SizedBox(width: AppSize.inset * 0.5),
                  Expanded(
                    child: CustomTextButton(
                      buttonType: ButtonType.round,
                      onPressed: () => Navigator.pushNamed(
                          context, BeneficiaryRoute.payoutInfoPage),
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
