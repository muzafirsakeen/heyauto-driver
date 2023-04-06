// import 'package:flutter/material.dart';
// import 'package:heyauto/screens/login_screen/animations/change_screen_animation.dart';
// import 'package:heyauto/utils/helper_functions.dart';
//
// import '../../../generated/l10n.dart';
// import 'login_content.dart';
//
// class TopText extends StatefulWidget {
//   const TopText({Key? key}) : super(key: key);
//
//   @override
//   State<TopText> createState() => _TopTextState();
// }
//
// class _TopTextState extends State<TopText> {
//   @override
//   void initState() {
//     ChangeScreenAnimation.topTextAnimation.addStatusListener((status) {
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
//       animation: ChangeScreenAnimation.topTextAnimation,
//       child: Text(
//         ChangeScreenAnimation.currentScreen == Screens.createAccount
//             ? (S.of(context).createacc)
//             : (S.of(context).welcomeback),
//         style: const TextStyle(
//           fontSize: 40,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }
