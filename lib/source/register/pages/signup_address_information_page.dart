import 'package:flutter/material.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class SignupAddressInformationPage extends StatefulWidget {
  const SignupAddressInformationPage({Key? key}) : super(key: key);

  @override
  State<SignupAddressInformationPage> createState() =>
      _SignupAddressInformationPageState();
}

class _SignupAddressInformationPageState
    extends State<SignupAddressInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(AppSize.cornerRadiusMedium),
                child: EsStepperHeader(
                  totalStps: 4,
                  currentStep: 4,
                  title: 'Address Information',
                  description: "Note: Provide your address",
                ),
              ),
              _RegisterAddressInformationPageBody(),
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSize.viewMargin,
          top: AppSize.inset,
          right: AppSize.viewMargin,
          bottom: AppSize.inset,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSize.inset),
              child: CustomTextField(
                  keyboardType: TextInputType.text,
                  labelText: 'Country',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  textController: TextEditingController()..text = "Japan",),
            ),
            const CityName(),
            const ZipCode(),
            const BackOrNextButton(),
          ],
        ),
      ),
    );
  }
}

class BackOrNextButton extends StatelessWidget {
  const BackOrNextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.viewSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppSize.viewMargin * 6,
            child: CustomTextButton(
              buttonType: ButtonType.round,
              onPressed: () => Navigator.of(context).pop(),
              title: Localize.backButtonTitle.value,
            ),
          ),
          const SizedBox(width: AppSize.cornerRadius),
          SizedBox(
            width: AppSize.viewMargin * 6,
            child: CustomTextButton(
              buttonType: ButtonType.round,
              onPressed: () =>
                  Navigator.pushNamed(context, RegisterRoute.succesSignup),
              title: Localize.nextButtonTitle.value,
            ),
          )
        ],
      ),
    );
  }
}

class ZipCode extends StatelessWidget {
  const ZipCode({Key? key}) : super(key: key);

  final stateList = ListDropDown.countryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.inset),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomTextField(
              keyboardType: TextInputType.text,
              labelText: 'Zip/Postal Code',
              labelStyle: Theme.of(context).textTheme.labelLarge,
              textInputAction: TextInputAction.next,
              
            ),
          ),
          const SizedBox(width: AppSize.cornerRadius),
          Expanded(
            child: CustomDropdown(
              items: stateList,
              onChange: (DropDownItem data) {},
              placeholderLabel: 'State',
              enableSearch: true,
              validator: (_) {
                return Localize.stateErrorMessage.value;
              },
            ),
          )
        ],
      ),
    );
  }
}

class CityName extends StatelessWidget {
  const CityName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.inset),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              keyboardType: TextInputType.text,
              labelText: 'Street name',
              labelStyle: Theme.of(context).textTheme.labelLarge,
              onSaved: (value) {},

            ),
          ),
          const SizedBox(width: AppSize.cornerRadius),
          Expanded(
            child: CustomTextField(
              keyboardType: TextInputType.text,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelText: 'City name',
              
            ),
          ),
        ],
      ),
    );
  }
}
