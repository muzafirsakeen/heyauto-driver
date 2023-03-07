import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heyauto/screens/home.dart';
import 'package:heyauto/screens/homescreen.dart';
 // import 'package:ionicons/ionicons.dart';
import 'package:heyauto/utils/helper_functions.dart';
import 'package:heyauto/widget/incorrectdata.dart';

import '../../../utils/constants.dart';
import '../../../utils/dbhelper.dart';
import '../animations/change_screen_animation.dart';
import 'bottom_text.dart';
import 'top_text.dart';
import 'package:camera/camera.dart';
import 'package:heyauto/screens/camera.dart';
import 'package:http/http.dart' as http;

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);


  @override
  State<LoginContent> createState() => _LoginContentState();
}



class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;
  // bool invalid_cred = false;
  bool _isObscure = true;
  bool viewVisible = false ;

  void showWidget(){
    setState(() {
      viewVisible = !viewVisible ;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible = false ;
    });
  }

  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final age = TextEditingController();
   final gender = TextEditingController();
   final name =TextEditingController();

  Widget inputField(String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () async {

          if (kDebugMode) {
             print("pressed");
           }
          var myuri = Uri(
            scheme: 'http',
            host: '127.0.0.1',
              port: 8000,
              path: '/apis/driver_login/',
              queryParameters: {'d_email': emailcontroller.text,'d_password': passcontroller.text}
          );
          final response =  await http.get(myuri);
          final bdy = json.decode(response.body);
          if (bdy['driverlog']==true) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homescreen()));
          } else {
              showWidget;
                     }
          print(response.body);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          backgroundColor: kSecondaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),

          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }


  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    createAccountContent = [
      inputField('Name', Icons.person_outline),
      inputField('Email', Icons.mail_outline),
      inputField('Phone', Icons.phone_android_rounded),
      inputField('Password', Icons.lock_outline_rounded),
      loginButton('Sign Up'),
      orDivider(),
    ];

    loginContent = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
        child: SizedBox(
          height: 50,
          child: Material(
            elevation: 8,
            shadowColor: Colors.black87,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: TextField(
              controller: emailcontroller,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                prefixIcon:  Icon(Icons.mail_outline_rounded),
              ),
            ),
          ),
        ),
      ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
    child: SizedBox(
    height: 50,
    child: Material(
    elevation: 8,
    shadowColor: Colors.black87,
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(30),
    child: TextField(


    controller: passcontroller,
    textAlignVertical: TextAlignVertical.bottom,
      obscureText: _isObscure,
      decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: 'Password',
    prefixIcon: Icon(Icons.lock_outline_rounded),

    suffixIcon: IconButton(
    icon: Icon(
    _isObscure ? Icons.visibility : Icons.visibility_off),
    onPressed: () {
    setState(() {
    _isObscure = !_isObscure;
    });
    }),












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
      loginButton('Log In'),
      forgotPassword(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 136,
          left: 24,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createAccountContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(),
          ),
        ),
      ],
    );
  }


  }

// Future<DataModel> submitData() async{
// var response = await http.post(Uri.http(authority))
// }
