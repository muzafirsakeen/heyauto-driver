import 'package:flutter/material.dart';

import 'login_screen/homescreen.dart';

class SendFeedbackPage extends StatefulWidget {
  @override
  _SendFeedbackPageState createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.white,
        child:  ListView(
        children: <Widget>[ //////
        Column(
        children: <Widget>[
            Container(
            height: 250.0,
            color: Colors.white,
            child:  Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          IconButton(onPressed:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));

                          }, icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 22.0,
                          ),) ,

                          Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child:  Text('PROFILE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    fontFamily: 'sans-serif-light',
                                    color: Colors.black)),
                          ),

                        ],
                      )

        ),
                  Text("Privacy Policy content here")

                ]
            )
        )
        ]
        ),/////

          ]
        )
    );




  }
}