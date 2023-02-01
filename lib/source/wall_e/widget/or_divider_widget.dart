// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          endIndent: 10,
        )),
        Text(
          'or',
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Expanded(
          child: Divider(
            indent: 10,
          ),
        ),
      ],
    );
  }
}
