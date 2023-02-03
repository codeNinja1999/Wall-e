import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/home/presentation/widget/textfield.dart';
import 'package:wall_e/source/reciever/router/beneficiary_route.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: const [
            EsStepperHeader(
              totalStps: 3,
              currentStep: 1,
              title: "Personal Information",
            ),
            PersonalInformationody(),
          ],
        ),
      ),
    );
  }
}

class PersonalInformationody extends StatefulWidget {
  const PersonalInformationody({Key? key}) : super(key: key);

  @override
  State<PersonalInformationody> createState() => _PersonalInformationodyState();
}

class _PersonalInformationodyState extends State<PersonalInformationody> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    //var isEnable = true;
    final formKey = GlobalKey<FormState>();
    final firstNameEditingController = TextEditingController();
    final middleEditingController = TextEditingController();
    final lastNameEditingController = TextEditingController();
    List<DropDownItem> menuItems = <DropDownItem>[
      const DropDownItem(
          'Father',
          '1',
          Icon(
            Icons.android,
            color: Color(0xFF167F67),
          )),
      const DropDownItem(
          'Mother',
          '2',
          Icon(
            Icons.flag,
            color: Color(0xFF167F67),
          )),
      const DropDownItem(
          'Sister',
          '3',
          Icon(
            Icons.format_indent_decrease,
            color: Color(0xFF167F67),
          )),
    ];
    return Expanded(
      child: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: CustomTextField(
                  textController: firstNameEditingController,
                  validator: (value) {
                    return null;
                  },
                  onChanged: (firstname) {},
                  textInputType: TextInputType.text,
                  labelText: "First Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomTextField(
                  onChanged: (middlename) {},
                  textController: middleEditingController,
                  textInputType: TextInputType.text,
                  labelText: "Middle Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomTextField(
                  validator: (value) {
                    return null;
                  },
                  onChanged: (lastname) {},
                  textController: lastNameEditingController,
                  textInputType: TextInputType.text,
                  labelText: "Last Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomTextField(
                  validator: (value) {
                    return null;
                  },
                  onChanged: (location) {},
                  textInputType: TextInputType.text,
                  labelText: "Location",
                ),
              ),
              CustomDropdown(
                  items: menuItems,
                  onChange: (DropDownItem data) {},
                  placeholderLabel: "RelationShip",
                  enableSearch: true,
                  ),
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        title: "Back",
                        buttonType: ButtonType.round,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
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
        ),
      )),
    );
  }
}
