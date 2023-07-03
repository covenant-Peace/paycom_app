import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.svgName, required this.controller, required this.hint, required this.keyboard});

  final String svgName;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 25, right: 25),
      // height: 40,
      alignment: Alignment.center,
      constraints: const BoxConstraints(
        minHeight: 40,
        maxHeight: 50,
      ),
      // padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(
              color: Color(0xFF64ccc5),
              width: 1,
              style: BorderStyle.solid),
          bottom: BorderSide(
              color: Color(0xFF64ccc5),
              width: 1,
              style: BorderStyle.solid),
          left: BorderSide(
              color: Color(0xFF64ccc5),
              width: 1,
              style: BorderStyle.solid),
          right: BorderSide(
              color: Color(0xFF64ccc5),
              width: 1,
              style: BorderStyle.solid),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: SvgPicture.asset(svgName),
        title: TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: kText3,
            border: InputBorder.none,
          ),
          keyboardType: keyboard,
          controller: controller,
          style: kText3,
        ),
      ),
    );
  }
}
