// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// enum ImageSourceType { gallery, camera }
//
// class HomePage extends StatelessWidget {
//   void _handleURLButtonPress(BuildContext context, var type) {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image Picker Example"),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               MaterialButton(
//                 color: Colors.blue,
//                 child: Text(
//                   "Pick Image from Gallery",
//                   style: TextStyle(
//                       color: Colors.white70, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   _handleURLButtonPress(context, ImageSourceType.gallery);
//                 },
//               ),
//               MaterialButton(
//                 color: Colors.blue,
//                 child: Text(
//                   "Pick Image from Camera",
//                   style: TextStyle(
//                       color: Colors.white70, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   _handleURLButtonPress(context, ImageSourceType.camera);
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }