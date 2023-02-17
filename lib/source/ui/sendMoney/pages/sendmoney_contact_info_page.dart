import 'package:flutter/material.dart';
import 'package:wall_e/source/ui/sendMoney/router/sendmoney_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';

class SendmoneyContactInformationPage extends StatefulWidget {
  final VoidCallback backButtonAction;
  const SendmoneyContactInformationPage(
      {Key? key, required this.backButtonAction})
      : super(key: key);

  @override
  State<SendmoneyContactInformationPage> createState() =>
      _SendmoneyContactInformationPageState();
}

class _SendmoneyContactInformationPageState
    extends State<SendmoneyContactInformationPage> {
  final formKey = GlobalKey<FormState>();
  final _mobileNumberEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(
        leadingIcon: true,
        title: 'Contact Information',
        onPressed: () => widget.backButtonAction(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                  top: AppSize.viewMargin,
                ),
                child: CustomDropdown(
                  items: ListDropDown.countryList,
                  onChange: (DropDownItem data) {},
                  placeholderLabel: "Country",
                  enableSearch: true,
                  validator: (_) {
                    return "Select country";
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
                  keyboardType: TextInputType.text,
                  labelText: "Address",
                  labelStyle: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.inset,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  labelText: "State",
                  labelStyle: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.inset,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: CustomTextField(
                  textController: _mobileNumberEditingController,
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: AppSize.inset,
                        left: AppSize.inset,
                        right: AppSize.inset,
                        bottom: AppSize.inset,
                      ),
                      child: Text(
                        '+977',
                        style: theme.textTheme.bodyMedium,
                      )),
                  keyboardType: TextInputType.number,
                  hintText: Localize.mobileNumber.value,
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
                        buttonType: ButtonType.round,
                        onPressed: () => widget.backButtonAction(),
                        title: Localize.backButtonTitle.value,
                      ),
                    ),
                    const SizedBox(width: AppSize.inset * 0.5),
                    Expanded(
                      child: CustomTextButton(
                        buttonType: ButtonType.round,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, SendmoneyRoute.payoutInfo);
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
      ),
    );
  }
}
