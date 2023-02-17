import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/list_of_dropdown_item_widget/list_of_dropdown_item_widget.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class AllTransactionListPage extends StatefulWidget {
  const AllTransactionListPage({super.key});

  @override
  State<AllTransactionListPage> createState() => _AllTransactionListPageState();
}

class _AllTransactionListPageState extends State<AllTransactionListPage> {
  bool selectedItem = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'All Transaction List',
        onPressed: () => Navigator.pop(context),
        leadingIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppSize.viewMargin,
          left: AppSize.viewMargin,
          right: AppSize.viewMargin,
          bottom: AppSize.viewMargin,
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme.primaryColorLight),
          padding: const EdgeInsets.only(
              top: AppSize.inset,
              left: AppSize.cornerRadiusMedium,
              bottom: AppSize.inset,
              right: AppSize.cornerRadiusMedium),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: theme.primaryColorLight,
                  automaticallyImplyLeading: false,
                  title: const CustomTextField(
                    leadingIcon: Icons.search,
                    hintText: "Search",
                    trailingIcon: Icons.list,
                  ),
                ),
              ];
            },
            body: const Padding(
              padding: EdgeInsets.only(top: AppSize.inset),
              child: AllTransaction(),
            ),
          ),
        ),
      ),
    );
  }
}

class AllTransaction extends StatelessWidget {
  const AllTransaction({
    Key? key,
  }) : super(key: key);

  final expense = ListDropDown.expense;
  final expenseRemarks = ListDropDown.expenseRemarks;
  final expenseAmount = ListDropDown.expenseAmount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: expense.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSize.cornerRadiusSmall),
            leading: CircleAvatar(
              radius: AppSize.inset,
              backgroundColor: Theme.of(context).disabledColor,
              backgroundImage: AssetImage(ImageExtension.success),
            ),
            title: Text(
              expense[index],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              expenseRemarks[index],
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  expenseAmount[index],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${DateTime.now().hour}:${DateTime.now().minute} '
                  'PM',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
