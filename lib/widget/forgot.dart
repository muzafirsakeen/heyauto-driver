import 'package:flutter/material.dart';
import 'password.dart';

import '../generated/l10n.dart';

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left: 50, right: 50),
      child: Container(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: (){




          },
          child: Text(
            S.of(context).forgotpass,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
