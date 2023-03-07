import 'package:flutter/material.dart';
import 'package:heyauto/utils/network_service.dart';
import 'package:provider/provider.dart';
class error extends StatelessWidget {
  const error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var networkstatus = Provider.of<Networkstatus>(context);
    return Scaffold(
        backgroundColor: const Color(0xffd8f3dc),
        body: /*networkstatus == Networkstatus.online
            ? */const Center(
          child: Text('Hello World'),
        ));
  }
}