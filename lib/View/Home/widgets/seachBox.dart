import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/View/Home/widgets/PopUpOverLay.dart';
import 'package:rent_house/config/color.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

// Container txtField({text, context, ontap, icon, hintText}) {
//   return Container(
//     width: 250,
//     decoration: BoxDecoration(
//       borderRadius: const BorderRadius.all(Radius.circular(30)),
//       color: const Color.fromARGB(255, 255, 253, 253).withOpacity(0.3),
//       boxShadow: [
//         BoxShadow(
//           color: const Color.fromARGB(255, 122, 120, 120).withOpacity(0.3),
//           blurRadius: 13.0,
//         ),
//       ],
//     ),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.8),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(20.0),
//         ),
//       ),
//       child: TextField(
//         style: const TextStyle(fontSize: 13.0, color: textwhite),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: hintText,
//           // disabledBorder: OutlineInputBorder(
//           //     borderSide: const BorderSide(
//           //         color: Color.fromARGB(255, 101, 100, 100), width: 40.0),
//           //     borderRadius: BorderRadius.circular(30.0)),
//           suffixIcon: GestureDetector(
//             onTap: (() {
//               showDialog(
//                 context: context,
//                 builder: (_) => const PopUpOverLay(),
//               );
//             }),
//             child: const Icon(
//               CupertinoIcons.money_dollar,
//               color: textwhite,
//               size: 20,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

Container search_box() {
  return Container(
    height: 60.0,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.8),
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    child: Column(
      children: <Widget>[
        SearchBarAnimation(
          textEditingController: TextEditingController(),
          buttonIcon: Icons.search,
          trailingIcon: Icons.sort,
          secondaryButtonIcon: Icons.search,
          isOriginalAnimation: true,
          enableKeyboardFocus: true,
          isSearchBoxOnRightSide: false,
          onExpansionComplete: () {
            debugPrint('do something just after searchbox is opened.');
          },
          onCollapseComplete: () {
            debugPrint('do something just after searchbox is closed.');
          },
        ),
      ],
    ),
  );
}
