
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:heyauto/LanguageChangeProvider.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import 'login_screen/signsec.dart';

class Langset extends StatefulWidget {
  const Langset({Key? key}) : super(key: key);

  @override
  State<Langset> createState() => _LangsetState();
}

class _LangsetState extends State<Langset> {

  String dropdownValue = 'en';


  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap:(){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },

      child: Scaffold(




        body: Stack(
          alignment: Alignment.center,

          children:[ Container(
            width: double .infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:
                    [
                    Color(0xff04491e),
                      Color(0xff0e6390)

            ]
                )
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Column(
            children: [
            Image.asset("assets/images/heyautos.png",
              height: 300,
              width: 300,


            ),

              const Divider(),



                   Container(
                     padding: const EdgeInsets.only(left: 50.0,right: 50),

                       child: Center(

                       child: Text(S.of(context).chooselang,style: const TextStyle( color:Color(
                           0xfaf6f3f0),

                           fontWeight: FontWeight.normal,fontSize: 17,wordSpacing: 7),
                       ),
                     ),
                   ),
              const Divider(),
              const Divider(),
              const Divider(),

             Container(margin: new EdgeInsets.symmetric(vertical:40.0),

               height:50,
               width: 200,
               decoration: BoxDecoration(
                   color: const Color(0xb8fdfbfb),
                   borderRadius: BorderRadius.circular(25)
                 //more than 50% of width makes circle
               ),
               padding: const EdgeInsets.only(left:30, right:30),

               child: Center( child:  Theme(

                 data: Theme.of(context).copyWith(
                   canvasColor: const Color(0xff84919e),

                 ),

                 child: DropdownButton<String>(
                     items: const[

                       DropdownMenuItem(value: 'en',child: Text("English"),
                       ),
                       DropdownMenuItem(value: 'ml',child: Text("മലയാളം"),
                       ),
                       DropdownMenuItem(value: 'hi',child: Text("हिन्दी"),
                       )

                     ],


                     value: dropdownValue,
                     icon: const Icon(Icons.language),
                     style: const TextStyle(color: Color(0xff070707),fontSize: 20,),


                     underline: Container(height: 2,
                     color: Colors.transparent,

                     ),

                     onChanged:(String? newValue){
                   setState(() {
                     context.read<LanguageChangeProvider>().changeLocale(newValue!);

                     dropdownValue = newValue;
                   });
                     }

                     ),
               ),
             ),

             ),







              Container(
                margin: new EdgeInsets.symmetric(vertical:60.0),

                  child: ElevatedButton(

                  onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const logins()));
                  if (kDebugMode) {
                    print("work");
                  }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffeeeeee),


                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),


                        //border radius equal to or more than 50% of width

                  ),
                  child: const Icon(Icons.arrow_forward_rounded,color: Color(0xffeddc0a), size: 40,),
                ),
              ),

                ],),
              ],
            ),
          ),
       ],
        ),

      ),
    );
  }
}
