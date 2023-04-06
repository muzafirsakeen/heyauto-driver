import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:heyauto/widget/password.dart';
import '../generated/l10n.dart';
import '../widget/buttonNewUser.dart';
import '../widget/singup.dart';
import '../widget/textNew.dart';
import '../widget/userOld.dart';


class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff04491e), Color(0xff0e6390)]),        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SingUp(),
                    TextNew(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: namecontroller,
                      style: const TextStyle(
                        color: Color(0xffffffff),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0x76ffffff),
                        hintText: S.of(context).name,
                        prefixIcon:  const Icon(Icons.person_2_outlined),


                        labelStyle: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),                Padding(
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
                ),
                PasswordInput(),
                ButtonNewUser(),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
