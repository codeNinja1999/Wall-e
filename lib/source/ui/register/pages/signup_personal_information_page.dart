import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wall_e/source/ui/register/route/register_route.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class SignupPersonalInformationPage extends StatefulWidget {
  const SignupPersonalInformationPage({Key? key}) : super(key: key);

  @override
  State<SignupPersonalInformationPage> createState() =>
      _SignupPersonalInformationPageState();
}

class _SignupPersonalInformationPageState
    extends State<SignupPersonalInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Header(),
              _RegisterPersonalDetailPageBody(),
            ],
          ),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.viewMargin),
      child: EsStepperHeader(
        totalStps: 4,
        currentStep: 3,
        title: Localize.personalInformation.value,
        description: "Next: Address Information",
      ),
    );
  }
}

class _RegisterPersonalDetailPageBody extends StatefulWidget {
  const _RegisterPersonalDetailPageBody({Key? key}) : super(key: key);

  @override
  State<_RegisterPersonalDetailPageBody> createState() =>
      _RegisterPersonalDetailPageBodyState();
}

class _RegisterPersonalDetailPageBodyState
    extends State<_RegisterPersonalDetailPageBody> {
  final formKey = GlobalKey<FormState>();
  String? gender;

  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.viewSpacing,
              left: AppSize.viewSpacing,
              right: AppSize.viewSpacing,
            ),
            child: CustomTextField(
              textController: firstNameController,
              labelText: 'First Name',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewSpacing,
              right: AppSize.viewSpacing,
            ),
            child: CustomTextField(
              textController: middleNameController,
              labelText: 'Middle Name(Optional)',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewSpacing,
              right: AppSize.viewSpacing,
            ),
            child: CustomTextField(
              textController: lastNameController,
              labelText: 'Last Name',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewSpacing,
              right: AppSize.viewSpacing,
            ),
            child: CustomTextField(
              textController: mobileNumberController,
              labelText: 'Mobile Number',
              keyboardType: TextInputType.number,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewSpacing,
              right: AppSize.viewSpacing,
            ),
            child: InkWell(
              onTap: () async {
                DateTime? datePicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (datePicked != null) {
                  setState(() {
                    datePicked;
                  });
                } else {}
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(datePicked!);
                _dateController.text = formattedDate;
              },
              child: CustomTextField(
                enabled: false,
                labelText: 'Date of Birth',
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                suffixIcon: Icon(
                  Icons.calendar_today,
                  color: theme.primaryColor,
                ),
                textController: _dateController,
                validator: (value) {
                  if (value == "") {
                    return Localize.dobErrorMessage.value;
                  }
                  return null;
                },
                onSaved: (value) async {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.viewSpacing,
              right: AppSize.viewSpacing,
            ),
            child: Text("Gender", style: theme.textTheme.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.inset,
              right: AppSize.inset,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize.viewMargin * 6,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Female',
                      style: theme.textTheme.labelLarge,
                    ),
                    leading: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => ThemeAppColors.primaryBlue),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSize.viewMargin * 6,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Male',
                      style: theme.textTheme.labelLarge,
                    ),
                    leading: Radio(
                      toggleable: true,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => ThemeAppColors.primaryBlue),
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.viewSpacing,
              left: AppSize.viewSpacing,
              right: AppSize.viewSpacing,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize.viewMargin * 6,
                  child: CustomTextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    title: 'back',
                    buttonType: ButtonType.round,
                  ),
                ),
                const SizedBox(width: AppSize.inset),
                SizedBox(
                  width: AppSize.viewMargin * 6,
                  child: CustomTextButton(
                    onPressed: () => Navigator.pushNamed(
                        context, RegisterRoute.addressInformation),
                    title: Localize.nextButtonTitle.value,
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
