import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/home/presentation/widget/textfield.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class AddressInformation extends StatefulWidget {
  const AddressInformation({Key? key}) : super(key: key);

  @override
  State<AddressInformation> createState() => _AddressInformationState();
}

class _AddressInformationState extends State<AddressInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EsStepperHeader(
                totalStps: 4,
                currentStep: 4,
                title: Localize.address.value,
                description: "Note: Provide your address",
              ),
              const _RegisterAddressInformationPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterAddressInformationPageBody extends StatefulWidget {
  const _RegisterAddressInformationPageBody({Key? key}) : super(key: key);

  @override
  State<_RegisterAddressInformationPageBody> createState() =>
      __RegisterAddressInformationPageBodyState();
}

class __RegisterAddressInformationPageBodyState
    extends State<_RegisterAddressInformationPageBody> {
  late ThemeData theme;
  bool dateValidate = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final formKey = GlobalKey<FormState>();
    // List<DropDownItem> menuItems = <DropDownItem>[
    //   const DropDownItem(
    //       'Tokyo',
    //       '1',
    //       Icon(
    //         Icons.android,
    //         color: Color(0xFF167F67),
    //       )),
    //   const DropDownItem(
    //       'Oita',
    //       '2',
    //       Icon(
    //         Icons.flag,
    //         color: Color(0xFF167F67),
    //       )),
    //   const DropDownItem(
    //       'Fukuoka',
    //       '3',
    //       Icon(
    //         Icons.format_indent_decrease,
    //         color: Color(0xFF167F67),
    //       )),
    // ];
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            AppSize.viewMargin, AppSize.inset, AppSize.viewMargin, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                  enabled: false,
                  textInputType: TextInputType.text,
                  labelText: Localize.countryPlaceholder.value,
                  textController: TextEditingController()..text = "Japan"),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSize.inset),
                    child: CustomTextField(
                        textInputType: TextInputType.text,
                        labelText: Localize.streetPlaceholder.value,
                        onChanged: (value) {},
                        validator: (_) {
                          (value) {
                            if (value == "") {
                              return Localize.streetErrorMessage.value;
                            }
                          };
                          return null;
                        }),
                  ),
                ),
                const SizedBox(width: AppSize.inset * 0.5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSize.inset),
                    child: CustomTextField(
                        textInputType: TextInputType.text,
                        labelText: Localize.suburbPlaceholder.value,
                        onChanged: (value) {
                          (value) {
                            if (value == "") {
                              return "Please enter postalcode.";
                            }
                            return null;
                          };
                        }),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSize.inset),
                    child: CustomTextField(
                        textInputType: TextInputType.text,
                        labelText: Localize.postalCodePlaceholder.value,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == "") {
                            return Localize.postalCodeErrorMessage.value;
                          }
                          return null;
                        }),
                  ),
                ),
                const SizedBox(width: AppSize.inset * 0.5),
                // Expanded(
                //   child: CustomDropdown(
                //     items: menuItems,
                //     onChange: (DropDownItem data) {},
                //     placeholderLabel: Localize.statePlaceholder.value,
                //     enableSearch: true,
                //     mode: Mode.BOTTOM_SHEET,
                //     validator: (_) {
                //       return Localize.stateErrorMessage.value;
                //     },
                //   ),
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.viewSpacing),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
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
                    child: CustomButton(
                      // textColor: theme.bottomAppBarColor,
                      buttonType: ButtonType.round,
                      onPressed: () {
                        // navigateToRegisterSuccess(context);
                        Navigator.pushNamed(
                            context, RegisterRoute.successbeneficiary);
                        // if (formKey.currentState!.validate()) {

                        // }
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
