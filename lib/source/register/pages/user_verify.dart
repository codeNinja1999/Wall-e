import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/home/presentation/widget/textfield.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class UserVerifyPage extends StatefulWidget {
  const UserVerifyPage({Key? key}) : super(key: key);

  @override
  State<UserVerifyPage> createState() => _MobileState();
}

class _MobileState extends State<UserVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              EsStepperHeader(
                totalStps: 4,
                currentStep: 1,
                title: "Login Information",
                description: "Next: OTP Verification",
              ),
              _UserVerifyPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserVerifyPageBody extends StatefulWidget {
  const _UserVerifyPageBody({Key? key}) : super(key: key);

  @override
  _UserVerifyState createState() => _UserVerifyState();
}

class _UserVerifyState extends State<_UserVerifyPageBody> {
  late ThemeData theme;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
                AppSize.viewMargin, AppSize.inset, AppSize.viewMargin, 0),
            child: Text(Localize.signupsecureway.value,
                textAlign: TextAlign.center, style: theme.textTheme.bodyLarge),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSize.viewMargin, AppSize.inset, AppSize.viewMargin, 0),
              child: SizedBox(
                width: 400,
                height: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: theme.primaryColorLight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Email_Mobile(),
                        const PinInput(),
                        const ConfirmPinInput(),
                        const SizedBox(height: 20),
                        NextPageButton(theme: theme),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //  _verifyButton(),
        ],
      ),
    );
  }

  Widget _verifyButton() {
    return Padding(
      padding: const EdgeInsets.all(AppSize.viewMargin),
      child: CustomButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // navigateToregisterotpverify(context);
            Navigator.pushNamed(context, RegisterRoute.otpVerification);
          }
        },
        title: Localize.nextButtonTitle.value,
        buttonType: ButtonType.bordered,
      ),
    );
  }
}

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Change', style: theme.textTheme.titleLarge),
          Container(
            height: 45,
            width: 45,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: theme.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterRoute.otpVerification);
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmPinInput extends StatelessWidget {
  const ConfirmPinInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.inset),
      child: CustomTextField(
        textInputType: TextInputType.text,
        labelText: Localize.confirmPinPlaceholder.value,
        isObscure: true,
        validator: (value) {
          return null;
        },
      ),
    );
  }
}

class PinInput extends StatelessWidget {
  const PinInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.inset),
      child: CustomTextField(
        textInputType: TextInputType.text,
        labelText: Localize.pinPlaceholder.value,
        isObscure: true,
        onChanged: (pin) {},
        validator: (value) {
          return null;
        },
      ),
    );
  }
}

class Email_Mobile extends StatelessWidget {
  const Email_Mobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.cornerRadiusMedium),
      child: CustomTextField(
        labelText: Localize.emailmobile.value,
        validator: (value) {
          return null;
        },
        onChanged: (value) {},
      ),
    );
  }
}
