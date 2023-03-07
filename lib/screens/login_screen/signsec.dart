import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:heyauto/widget/first.dart';
import 'package:heyauto/widget/forgot.dart';
import 'package:heyauto/widget/textLogin.dart';
import 'package:heyauto/widget/verticalText.dart';
import 'package:http/http.dart' as http;


import '../../generated/l10n.dart';
import '../contacts.dart';
import 'homescreen.dart';


class logins extends StatefulWidget {
  const logins({Key? key}) : super(key: key);

  @override
  State<logins> createState() => _loginsState();
}

class _loginsState extends State<logins> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  bool _isObscure = true;

  bool viewVisible = false;
  void showWidget() {
    setState(() {
      viewVisible = !viewVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff04491e), Color(0xff0e6390)]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
          Padding(
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

          Padding(
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
          ),



          Column(
            children: <Widget>[
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible,
                  child: Container(


                      child: Center(child: Text('Email or password is incorrect',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red,
                              fontSize: 15)))
                  )
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
            child: Container(
              alignment: Alignment.bottomRight,
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () async {
                  // var myuri = Uri(
                  //     scheme: 'http',
                  //     host: '127.0.0.1',
                  //     port: 8000,
                  //     path: '/apis/driver_login/',
                  //     queryParameters: {'d_email': emailcontroller.text,'d_password': passcontroller.text}
                  // );
                  print(emailcontroller.text);
            // here need to write code to check network
            //       final response =  await http.get(myuri);
            //       final bdy = json.decode(response.body);
            //       if (bdy['driverlog']==true) {
            //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homepage()));
            //       } else {
            //         showWidget;
            //       }
            //       print((response.body));

                    if((emailcontroller.text=='')&&(passcontroller.text=='')){
                      Fluttertoast.showToast(
                          msg: S.of(context).pleaseenterboth,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xd1c80c0c),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                    else if(emailcontroller.text ==''){
                      Fluttertoast.showToast(
                          msg: S.of(context).pleaseenteremail,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xd1c80c0c),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                    else if(passcontroller.text ==''){
                      Fluttertoast.showToast(
                          msg: S.of(context).pleaseenterpass,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xd1c80c0c),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                    else {
                      if ((emailcontroller.text == 'admin') &&
                          (passcontroller.text == '12345')) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => HomePage()));
                      }


                      else {
                        Fluttertoast.showToast(
                            msg: S
                                .of(context)
                                .invalidcredential,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color(0xd1c80c0c),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).ok,
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
                Forgot(),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



