import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/home/presentation/widget/textfield.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/formfield/custom_textformfield_widget.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

List<DropDownItem> menuItems = <DropDownItem>[
  const DropDownItem(
      'Android',
      '1',
      Icon(
        Icons.android,
        color: Color(0xFF167F67),
      )),
  const DropDownItem(
      'Flutter',
      '2',
      Icon(
        Icons.flag,
        color: Color(0xFF167F67),
      )),
  const DropDownItem(
      'ReactNative',
      '3',
      Icon(
        Icons.format_indent_decrease,
        color: Color(0xFF167F67),
      )),
  const DropDownItem(
      'iOS',
      '4',
      Icon(
        Icons.mobile_screen_share,
        color: Color(0xFF167F67),
      )),
];

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
    return EsStepperHeader(
      totalStps: 4,
      currentStep: 3,
      title: Localize.personalInformation.value,
      description: "Next: Address Information",
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
  bool dateValidate = true;
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            AppSize.viewMargin, AppSize.inset, AppSize.viewMargin, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextFormField(
                textController: firstNameController,
                hintText: 'First Name',
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextFormField(
                textController: middleNameController,
                hintText: 'Middle Name(Optional)',
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextFormField(
                textController: lastNameController,
                hintText: 'Last Name',
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextFormField(
                textController: mobileNumberController,
                hintText: 'Mobile Number',
                textInputAction: TextInputAction.next,
              ),
            ),
            InkWell(
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
              child: Padding(
                padding: const EdgeInsets.only(
                    top: AppSize.inset, bottom: AppSize.inset),
                child: CustomTextFormField(
                  enabled: false,
                  hintText: 'Date of Birth',
                  suffixIcon: const Icon(Icons.calendar_today),
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
            Text("Gender", style: theme.textTheme.titleMedium),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Female'),
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
                Expanded(
                  child: ListTile(
                    title: const Text('Male'),
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
            Container(
              padding: const EdgeInsets.only(
                  top: AppSize.inset, bottom: AppSize.inset),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      // textColor: theme.bottomAppBarColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: 'back',
                      buttonType: ButtonType.round,
                    ),
                  ),
                  const SizedBox(width: AppSize.inset),
                  Expanded(
                    child: CustomButton(
                      // textColor: theme.bottomAppBarColor,
                      onPressed: () {
                        //avigateToAddressInformation(context);
                        Navigator.pushNamed(
                            context, RegisterRoute.addressInformation);
                      },
                      title: Localize.nextButtonTitle.value,
                      buttonType: ButtonType.round,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
