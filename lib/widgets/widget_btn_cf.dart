import 'package:dev_deva_test/utils/app_color.dart';
import 'package:dev_deva_test/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WidgetBtnCf extends StatelessWidget {
  const WidgetBtnCf(
      {super.key,
      required this.title,
      this.onPressed,
      this.backgroundColor = green,
      this.textColor = white,
      this.icon,
      this.height = 54});

  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Icon? icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              WidgetText(
                  data: title,
                  size: 16,
                  color: textColor!,
                  weight: FontWeight.w700),
            ],
          )),
    );
  }
}
