

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:heyauto/LanguageChangeProvider.dart';
import 'package:heyauto/screens/Splash_screen.dart';
import 'package:heyauto/utils/network_service.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'generated/l10n.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)

  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult > _connectivitySubscription;
  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_UpdateConnectionState);
    super.initState();
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //need to check the code

    [
      StreamProvider(create: (context)=>Networkservice().controller.stream, initialData: Networkstatus.online )
    ];



    return ChangeNotifierProvider<LanguageChangeProvider>(

      create: (context)=>LanguageChangeProvider(),
      child: Builder(
        builder: (context)=>
         MaterialApp(
           debugShowCheckedModeBanner: false,
          locale: Provider.of<LanguageChangeProvider>(context, listen:true).currentlocale,

          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'HeyAuto',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),



         ),

      ),
      
    );

  }

Future  <void> initConnectivity() async{
  late ConnectivityResult result;
  try {
    result = await _connectivity.checkConnectivity();
  } on PlatformException catch (e) {
    print("Error Occurred: ${e.toString()} ");
    return;
  }
  if (!mounted) {
    return Future.value(null);
  }
  return _UpdateConnectionState(result);
}
}

Future<void> _UpdateConnectionState(ConnectivityResult result) async{

  if (result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi) {
    showStatus(result, true);
  } else {
    showStatus(result, false);
  }

}


void showStatus(ConnectivityResult result, bool status) {
  final snackBar = SnackBar(
      content:
      Text("${status ? 'ONLINE\n' : 'OFFLINE\n'}${result.toString()} "),
      backgroundColor: status ? Colors.green : Colors.red);


}
