import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetInputThaiId extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hasError;

  const WidgetInputThaiId({
    Key? key,
    required this.controller,
    this.hintText = 'กรอกเลขบัตรประชาชน 13 หลัก',
    this.hasError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 14, fontFamily: 'Prompt'),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasError ? Colors.red : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasError ? Colors.red : Colors.blue),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(13),
        ],
      ),
    );
  }
}
