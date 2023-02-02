import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/register/route/register_route.dart';

class RegisttrationSuccessPage extends StatefulWidget {
  const RegisttrationSuccessPage({Key? key, required this.backButtonAction})
      : super(key: key);
  final VoidCallback backButtonAction;

  @override
  State<RegisttrationSuccessPage> createState() =>
      _RegisttrationSuccessPageState();
}

class _RegisttrationSuccessPageState extends State<RegisttrationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: deviceSize.height * 0.20, right: AppSize.viewMargin),
            child: SvgPicture.asset(
              Images.registered,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              width: (deviceSize.width * 0.75),
              height: (deviceSize.width) * 0.5,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(AppSize.viewMargin,
                AppSize.spacedViewSpacing, AppSize.viewMargin, 0),
            child: Text(Localize.registtrationSuccessTitle.value,
                textAlign: TextAlign.center, style: theme.textTheme.titleLarge),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
                AppSize.viewMargin, AppSize.inset, AppSize.viewMargin, 0),
            child: Text(
              Localize.registtrationSuccessDescription.value,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: AppSize.spacedViewSpacing,
                left: AppSize.viewMargin * 1.5,
                right: AppSize.viewMargin * 1.5),
            child: CustomButton(
              title: Localize.gotologin.value,
              buttonType: ButtonType.round,
              onPressed: () {
                Navigator.pushNamed(context, RegisterRoute.login);
              },
            ),
          ),
        ],
      ),
    );
  }
}
