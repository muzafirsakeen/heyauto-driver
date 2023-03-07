import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'choose_language.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
_SplashScreenState createState()=>_SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Langset())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double .infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors:
              [
                Color(0xff071b2c),
                Color(0xff071b2c),
              ]
          )
        ),
        
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset("assets/images/heyautos.png",
                height: 350,
                  width: 350,

          ),
              ],
            ),

            Column(
              children: [
                Image.asset('assets/images/NewProject.png',width: 200,),
                const Text('You are our valuable Asset',
                  style:
                  TextStyle(
                      color: Color(0xffeeeeee),
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),


          CircularProgressIndicator(),
          ],

        ),

        
      ),
    );
  }
}
