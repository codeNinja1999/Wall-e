import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';

class SignupSuccessPage extends StatefulWidget {
  const SignupSuccessPage({Key? key, required this.backButtonAction})
      : super(key: key);
  final VoidCallback backButtonAction;

  @override
  State<SignupSuccessPage> createState() => _SignupSuccessPageState();
}

class _SignupSuccessPageState extends State<SignupSuccessPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MyAppBar(
        onPressed: () => Navigator.pop(context),
        title: 'Registration Success',
        leadingIcon: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              Images.registered,
              width: (deviceSize.width),
              height: deviceSize.height / 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.viewMargin,
              top: AppSize.viewMargin,
              right: AppSize.viewMargin,
              bottom: 0,
            ),
            child: Text(Localize.registtrationSuccessTitle.value,
                textAlign: TextAlign.center, style: theme.textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: AppSize.viewMargin,
                top: AppSize.inset,
                right: AppSize.viewMargin,
                bottom: 0),
            child: Text(
              Localize.registtrationSuccessDescription.value,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.spacedViewSpacing,
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
            ),
            child: CustomElevatedButton(
              buttonText: Localize.gotologin.value,
              onPressed: () => widget.backButtonAction(),
            ),

            // CustomTextButton(
            //   title: Localize.gotologin.value,
            //   buttonType: ButtonType.round,
            //   onPressed: () {
            //     widget.backButtonAction();
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
