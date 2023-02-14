import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/source/beneficiary/router/beneficiary_route.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class BeneficiaryPersonalInformationPage extends StatefulWidget {
  final VoidCallback backButtonaction;
  const BeneficiaryPersonalInformationPage(
      {Key? key, required this.backButtonaction})
      : super(key: key);

  @override
  State<BeneficiaryPersonalInformationPage> createState() =>
      _BeneficiaryPersonalInformationPageState();
}

class _BeneficiaryPersonalInformationPageState
    extends State<BeneficiaryPersonalInformationPage> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const EsStepperHeader(
                totalStps: 3,
                currentStep: 1,
                title: "Personal Information",
                description: 'Next: Contact Information',
              ),
              PersonalInformationody(backButtonaction: widget.backButtonaction),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalInformationody extends StatefulWidget {
  final VoidCallback backButtonaction;
  const PersonalInformationody({Key? key, required this.backButtonaction})
      : super(key: key);

  @override
  State<PersonalInformationody> createState() => _PersonalInformationodyState();
}

class _PersonalInformationodyState extends State<PersonalInformationody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final firstNameEditingController = TextEditingController();
    final middleEditingController = TextEditingController();
    final lastNameEditingController = TextEditingController();
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.viewSpacing,
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
            ),
            child: CustomTextField(
              textController: firstNameEditingController,
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.text,
              labelText: 'First Name',
              labelStyle: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
            ),
            child: CustomTextField(
              textController: middleEditingController,
              keyboardType: TextInputType.text,
              labelText: 'Middle Name',
              labelStyle: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
            ),
            child: CustomTextField(
              validator: (value) {
                return null;
              },
              textController: lastNameEditingController,
              keyboardType: TextInputType.text,
              labelText: 'Last Name',
              labelStyle: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
            ),
            child: CustomTextField(
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.text,
              labelText: 'Location',
              labelStyle: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
            ),
            child: CustomDropdown(
              items: ListDropDown.relationship,
              onChange: (DropDownItem data) {},
              placeholderLabel: "RelationShip",
              enableSearch: true,
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
                    onPressed: () => widget.backButtonaction(),
                    title: "Back",
                    buttonType: ButtonType.round,
                  ),
                ),
                const SizedBox(width: AppSize.inset),
                Expanded(
                  child: CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, BeneficiaryRoute.contactInformationPage);
                    },
                    title: "Next",
                    buttonType: ButtonType.round,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
