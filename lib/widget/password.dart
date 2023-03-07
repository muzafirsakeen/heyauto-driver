import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class PasswordInput extends StatefulWidget {

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  TextEditingController passcontroller = TextEditingController();
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: passcontroller,
          style: TextStyle(
            color: Color(0xffffffff),
          ),
          obscureText: _isObscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0x76ffffff),
            hintText: S.current.password,
            prefixIcon: Icon(Icons.lock_outline_rounded),
            suffixIcon: IconButton(
                icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            labelStyle: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}