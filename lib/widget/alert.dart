import 'package:flutter/material.dart';

showAlert({required BuildContext bContext, required String title, required String content}) {
  return showDialog(
      context: bContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title ?? "",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(content ?? ""),
          actions: [
            TextButton(
                onPressed: () => {Navigator.pop(context)}, child: Text("Okay"))
          ],
        );
      });
}
