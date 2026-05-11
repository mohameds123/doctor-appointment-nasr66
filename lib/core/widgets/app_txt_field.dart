import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
import '../theming/txt_style.dart';

class Txtfield extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  TextEditingController controller;

   Txtfield({super.key, required this.hintText,  this.prefixIcon,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TxtStyle.size12w400blackhint,
        filled: true,
        fillColor: ColorsManager.field,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8,),
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}