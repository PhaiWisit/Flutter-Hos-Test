import 'package:dev_deva_test/utils/app_color.dart';
import 'package:flutter/material.dart';

class WidgetInputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const WidgetInputPassword({
    Key? key,
    required this.controller,
    this.labelText = 'รหัสผ่าน',
    this.hintText = 'กรอกรหัสผ่าน',
  }) : super(key: key);

  @override
  _WidgetInputPasswordState createState() => _WidgetInputPasswordState();
}

class _WidgetInputPasswordState extends State<WidgetInputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(fontSize: 14, fontFamily: 'Prompt'),
        decoration: InputDecoration(
          // labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: green,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
