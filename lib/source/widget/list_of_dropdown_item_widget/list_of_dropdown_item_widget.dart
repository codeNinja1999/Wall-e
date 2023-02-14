import 'package:flutter/material.dart';
import 'package:wall_e/source/widget/drop_down/app_dropdown.dart';

class ListDropDown {
  static const List<DropDownItem> selectBranch = <DropDownItem>[
    DropDownItem(
        'ABC Branch',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'XYZ Branch',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
  ];

  static const List<DropDownItem> selectBank = <DropDownItem>[
    DropDownItem(
        'ABC Bank',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'XYZ Bank',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
  ];

  static const List<DropDownItem> remittancePurpose = <DropDownItem>[
    DropDownItem(
        'Utility',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Education',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Self',
        '3',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
  ];

  static const List<DropDownItem> sourceofFund = <DropDownItem>[
    DropDownItem(
        'Government employee',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Construction worker',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Army, marine',
        '3',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
  ];

  static const List<DropDownItem> countryList = <DropDownItem>[
    DropDownItem(
        'Japan',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Thailand',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Nepal',
        '3',
        Icon(
          Icons.format_indent_decrease,
          color: Color(0xFF167F67),
        )),
  ];

  static const List<DropDownItem> stateList = <DropDownItem>[
    DropDownItem(
        'Tokyo',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Oita',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Fukuoka',
        '3',
        Icon(
          Icons.format_indent_decrease,
          color: Color(0xFF167F67),
        )),
  ];

  static const List<DropDownItem> relationship = <DropDownItem>[
    DropDownItem(
        'Father',
        '1',
        Icon(
          Icons.android,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Mother',
        '2',
        Icon(
          Icons.flag,
          color: Color(0xFF167F67),
        )),
    DropDownItem(
        'Sister',
        '3',
        Icon(
          Icons.format_indent_decrease,
          color: Color(0xFF167F67),
        )),
  ];
  static const List<String> expense = [
    'United uk',
    'test',
    'Top up',
    'Game',
    'Phone',
    'Test Receiver',
    'Netflix',
    'Movie Ticket',
    'Fonepay',
    'FGFG',
    'PLN'
  ];

  static const List<String> expenseRemarks = [
    'Monthly Subscription',
    'Token',
    'PUBG voucher 20% off',
    'Top up Gems',
    'Top up balance',
    'Subscribe netflix',
    'PUBG voucher 20% off',
    'Pathaan movie',
    'Khaja',
    'Telkomatu',
    'Nothing'
  ];

  static const List<String> expenseAmount = [
    'Rs. 1,170.00',
    'Rs. 3,845.00',
    'Rs. 207.00',
    'Rs. 207.00',
    'Rs. 207.00',
    'Rs. 207.00',
    'Rs. 108.00',
    'Rs. 1,071.00',
    'Rs. 1,071.00',
    'Rs. 1,071.00',
    'Rs. 1,071.00',
  ];

  static const List<String> months = [
    'January',
    'Feburary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  static const List<DropdownMenuItem> paymentMethod = [
    DropdownMenuItem(
      child: Text("Esewa"),
      value: 'Esewa',
    ),

    DropdownMenuItem(
      child: Text("Paypal"),
      value: 'Paypal',
    ),

    DropdownMenuItem(
      child: Text("Visa Card"),
      value: 'Visa Card',
    ),
    // 'E-sewa',
    // 'Paypal',
    // 'Credit card',
    // 'Debit card',
    // 'Visa card',
  ];
}
