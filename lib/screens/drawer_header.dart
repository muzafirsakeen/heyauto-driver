import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff071b2c),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/dummy.webp'),
              ),
            ),
          ),
          Text(
            "Driver Name",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          // Text(
          //   "driver@gmail.com",
          //   style: TextStyle(
          //     color: Colors.grey[200],
          //     fontSize: 14,
          //   ),
          // ),
  Divider(),



        ],
      ),
    );
  }
}