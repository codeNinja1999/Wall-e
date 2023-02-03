import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/core/localization/localize.dart';
import 'package:wall_e/core/localization/localize_extenstion.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';

class BeneficiarySuccessPage extends StatefulWidget {
  const BeneficiarySuccessPage({Key? key}) : super(key: key);

  @override
  State<BeneficiarySuccessPage> createState() => _BeneficiarySuccessPageState();
}

class _BeneficiarySuccessPageState extends State<BeneficiarySuccessPage> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
            top: AppSize.spacedViewSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppSize.inset, bottom: AppSize.inset),
              child: SvgPicture.asset(Images.recieveradded,
                  width: 200, height: 200),
            ),
            Text(
              Localize.beneficiarycreatedsuccessfully.value,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: AppSize.inset),
            Text(
              Localize.beneficiarycreateddesc.value,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            Container(
              margin: const EdgeInsets.only(top: AppSize.spacedViewSpacing),
              child: CustomButton(
                //  textColor: theme.bottomAppBarColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.sendmoney);
                  //  widget.backButtonAction();
                },
                title: Localize.finish.value,
                buttonType: ButtonType.round,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
