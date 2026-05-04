import 'package:docdocnasr66/core/theming/colors_manager.dart';
import 'package:docdocnasr66/core/theming/txt_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  double width;
  String txt;

  AppButton({super.key, required this.width, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      decoration: BoxDecoration(
        color: ColorsManager.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(txt, style: TxtStyle.fontSize14W600White),
    );
  }
}
