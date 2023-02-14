import 'package:wall_e/core/app_size/app_size.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

class CustomDropdown<T> extends StatefulWidget {
  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(T) onChange;
  final List<T> items;
  final T? selectedItem;
  final bool enableSearch;
  final String placeholderLabel;
  final IconData? leadingIcon;
  final void Function(T?)? onSaved;
  final String? Function(T?)? validator;
  final Future<List<T>> Function(String?)? onFind;
  final bool? enabled;

  const CustomDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.enableSearch = false,
    required this.placeholderLabel,
    required this.onChange,
    this.leadingIcon,
    this.onSaved,
    this.validator,
    this.onFind,
    this.enabled,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    int itemCount = widget.items.length;
    if (itemCount > 0 && widget.items[0].toString() != "Loading...") {}
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(subtitle1: Theme.of(context).textTheme.bodySmall),
      ),
      child: DropdownSearch<T>(
        popupProps: PopupProps.bottomSheet(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 2.5),
          bottomSheetProps: BottomSheetProps(
            backgroundColor: theme.primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.viewMargin),
            ),
          ),
          showSearchBox: widget.enableSearch,
          loadingBuilder: loadingView,
          emptyBuilder: emptyView,
          searchDelay: const Duration(microseconds: 10),
          searchFieldProps: TextFieldProps(
            padding: const EdgeInsets.all(AppSize.inset),
            cursorColor: ThemeAppColors.grey,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              fillColor: ThemeAppColors.grey.withOpacity(0.2),
              filled: true,
              hintText: "Search",
              prefixIcon: Icon(Icons.search, color: ThemeAppColors.grey),
              hintStyle: theme.textTheme.labelLarge,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
              ),
            ),
          ),
        ),
        asyncItems: widget.onFind,
        enabled: widget.enabled ?? true,
        items: widget.items,
        selectedItem: widget.selectedItem,
        onChanged: (data) {
          widget.onChange(data as T);
        },
        onSaved: widget.onSaved,
        validator: widget.validator,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: widget.placeholderLabel,
            labelStyle: theme.textTheme.bodyMedium,
            hintText: widget.placeholderLabel,
            hintStyle: theme.textTheme.bodySmall,
            contentPadding: const EdgeInsets.fromLTRB(12, 4, 0, 0),
            fillColor: Theme.of(context).primaryColorLight,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeAppColors.primaryBlue),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeAppColors.primaryBlue),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: ThemeAppColors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: ThemeAppColors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusColor: ThemeAppColors.primaryBlue,
            prefixIcon: widget.leadingIcon != null
                ? Icon(
                    widget.leadingIcon,
                    color: ThemeAppColors.grey,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

Widget loadingView(BuildContext context, String? loading) {
  return Center(
      child: SizedBox(
          height: 18,
          width: 18,
          child: CircularProgressIndicator(color: ThemeAppColors.primaryBlue)));
}

Widget emptyView(BuildContext context, String? error) {
  return Center(
      child: Text("No Data Found",
          style: Theme.of(context).textTheme.titleMedium));
}

class DropDownItem {
  const DropDownItem(this.name, this.data, this.icon);
  final String name;
  final String data;
  final Icon icon;

  @override
  String toString() => name;
}
