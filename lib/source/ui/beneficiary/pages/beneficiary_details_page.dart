import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:flutter/material.dart';

class BeneficiaryDetailsPage extends StatefulWidget {
  const BeneficiaryDetailsPage({super.key});

  @override
  State<BeneficiaryDetailsPage> createState() => _BeneficiaryDetailsPageState();
}

class _BeneficiaryDetailsPageState extends State<BeneficiaryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        leadingIcon: true,
        title: 'Recipient Details',
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSize.viewMargin,
            left: AppSize.inset,
            right: AppSize.inset,
            bottom: AppSize.viewMargin,
          ),
          child: Container(
            padding: const EdgeInsets.only(bottom: AppSize.inset),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.primaryColorLight,
            ),
            child: Column(
              children: [
                const BeneficiaryPersonalDetails(),

                //contact details
                BeneficiaryContactDetails(theme: theme),

                //Payout details
                BeneficiaryPayoutDetails(theme: theme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BeneficiaryPersonalDetails extends StatelessWidget {
  const BeneficiaryPersonalDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(AppSize.inset),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/icon/girl.jpg'),
              radius: 50,
            ),
          ),
        ),
        ReceiverDetails(
          data: 'Name : ',
          name: 'Rejina Luitel',
        ),
        ReceiverDetails(
          data: 'Account type : ',
          name: 'AUD Account',
        ),
        ReceiverDetails(
          data: 'Gender : ',
          name: 'Female',
        ),
      ],
    );
  }
}

class BeneficiaryContactDetails extends StatelessWidget {
  const BeneficiaryContactDetails({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSize.inset,
            right: AppSize.inset,
            bottom: AppSize.inset,
            top: AppSize.viewSpacing,
          ),
          child: Text(
            'Contact Details',
            style: theme.textTheme.titleMedium,
          ),
        ),
        const ReceiverDetails(
          data: 'Country : ',
          name: 'Australia',
        ),
        const ReceiverDetails(
          data: 'State  : ',
          name: 'Sydney',
        ),
        const ReceiverDetails(
          data: 'Address: ',
          name: 'this street 1234',
        ),
        const ReceiverDetails(
          data: 'Mobile number : ',
          name: '+977 9845123645',
        ),
      ],
    );
  }
}

class BeneficiaryPayoutDetails extends StatelessWidget {
  const BeneficiaryPayoutDetails({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSize.inset,
            right: AppSize.inset,
            bottom: AppSize.inset,
            top: AppSize.viewSpacing,
          ),
          child: Text(
            'Payout Details',
            style: theme.textTheme.titleMedium,
          ),
        ),
        const ReceiverDetails(data: 'Source of funds :', name: 'Enterpreneur'),
        const ReceiverDetails(
            data: 'Purpose of Remittance :', name: 'Education'),
        const ReceiverDetails(data: 'Payment method :', name: 'Bank Transfer'),
        const ReceiverDetails(data: 'Payout Location :', name: 'ABC bank'),
      ],
    );
  }
}

class ReceiverDetails extends StatelessWidget {
  const ReceiverDetails({
    Key? key,
    required this.name,
    required this.data,
  }) : super(key: key);

  final String name;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.inset,
        left: AppSize.inset,
        right: AppSize.inset,
        // bottom: AppSize.cornerRadiusSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
