import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum Networkstatus {online,offline}

class Networkservice{

  StreamController<Networkstatus> controller = StreamController();

  Networkservice(){
    Connectivity().onConnectivityChanged.listen((event){
      controller.add(_networkstatus(event));
    });
  }

  Networkstatus _networkstatus (ConnectivityResult connectivityResult){
    return connectivityResult == ConnectivityResult.mobile ||
          connectivityResult ==  ConnectivityResult.wifi
        ?Networkstatus.online : Networkstatus.offline;

  }
}