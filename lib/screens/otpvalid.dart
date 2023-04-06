import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../generated/l10n.dart';

class otpvalid extends StatefulWidget {
  const otpvalid({Key? key}) : super(key: key);

  @override
  State<otpvalid> createState() => _HomePageState();
}

class _HomePageState extends State<otpvalid> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffcdd9d5),


      body:

      Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Image.asset("assets/images/heyautoc.png",
        height: 200,
        width: 200,),
          const Text('Please enter OPT Recieved in your Phone'),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_fieldOne, true), // auto focus
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(

              onPressed: () {
                setState(() {
                  _otp = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text;
                  if((((_fieldOne.text=='')||(_fieldTwo.text=='')||(_fieldThree.text=='')||(_fieldFour.text=='')))){
                    Fluttertoast.showToast(
                        msg: S
                            .of(context)
                            .pleasefillotp,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xd1c80c0c),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                }


                );

              },
              child:  Text(S.of(context).signup)

          ),
          const SizedBox(

            height: 30,
          ),
          // Display the entered OTP code
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.current.Notrecieved),
              TextButton.icon(onPressed:(){
                Navigator.pop(context);
              } , icon: const Icon(Icons.refresh), label: Text(S.of(context).resendotp)),
            ],
          ),

          // Text(
          //   _otp ?? 'Please enter OTP',
          //   style: const TextStyle(fontSize: 30),
          // ),
          TextButton.icon(onPressed:(){
            Navigator.pop(context);
          } , icon: Icon(Icons.arrow_back), label: Text(S.current.backsign)),

        ],
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
