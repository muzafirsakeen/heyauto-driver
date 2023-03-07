import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class InputEmail extends StatefulWidget {
  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: emailcontroller,
          style: TextStyle(
            color: Color(0xffffffff),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0x76ffffff),
            hintText: S.of(context).email,
            prefixIcon:  Icon(Icons.mail_outline_rounded),


            labelStyle: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}