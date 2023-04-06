import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Widget _buildPopupDialog(BuildContext context) {
  final ImagePicker _picker = ImagePicker();

  return AlertDialog(
    title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
    actions: <Widget>[
      new ElevatedButton(
        onPressed: () async {
          final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
        },
        child: const Text('Close'),
      ),
    ],
  );
}