import 'package:flutter/material.dart';

class logintextfeild extends StatelessWidget {
  logintextfeild({Key? key, this.ctrl, this.icon, this.type, this.hint})
      : super(key: key);
  String? hint;
  TextEditingController? ctrl;
  IconData? icon;
  TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE8EAED))),
      ),
      child: TextFormField(
        keyboardType: type,
        controller: ctrl,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
