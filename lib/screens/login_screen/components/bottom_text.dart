// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:heyauto/screens/login_screen/animations/change_screen_animation.dart';
// import 'package:heyauto/utils/helper_functions.dart';
//
// import '../../../generated/l10n.dart';
// import '../../../utils/constants.dart';
// import 'login_content.dart';
//
// class BottomText extends StatefulWidget {
//   const BottomText({Key? key}) : super(key: key);
//
//   @override
//   State<BottomText> createState() => _BottomTextState();
// }
//
// class _BottomTextState extends State<BottomText> {
//   @override
//   void initState() {
//     ChangeScreenAnimation.bottomTextAnimation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {});
//       }
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return HelperFunctions.wrapWithAnimatedBuilder(
//       animation: ChangeScreenAnimation.bottomTextAnimation,
//       child: GestureDetector(
//         onTap: () {
//           if (!ChangeScreenAnimation.isPlaying) {
//             ChangeScreenAnimation.currentScreen == Screens.createAccount
//                 ? ChangeScreenAnimation.forward()
//                 : ChangeScreenAnimation.reverse();
//
//             ChangeScreenAnimation.currentScreen =
//                 Screens.values[1 - ChangeScreenAnimation.currentScreen.index];
//           }
//         },
//         behavior: HitTestBehavior.opaque,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: RichText(
//             text: TextSpan(
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontFamily: 'Montserrat',
//               ),
//               children: [
//                 TextSpan(
//                   text: ChangeScreenAnimation.currentScreen ==
//                           Screens.createAccount
//                       ? (S.of(context).alreadyhave)
//                       : (S.of(context).donthaveacc),
//                   style: const TextStyle(
//                     color: kPrimaryColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextSpan(
//                   text: ChangeScreenAnimation.currentScreen ==
//                           Screens.createAccount
//                       ? (S.of(context).login)
//                       : (S.of(context).signup),
//                   style: const TextStyle(
//                     color: kSecondaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
