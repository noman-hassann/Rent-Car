import 'dart:ui';

import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchbarAnimationExample extends StatefulWidget {
  const SearchbarAnimationExample({Key? key}) : super(key: key);

  @override
  _SearchbarAnimationExampleState createState() =>
      _SearchbarAnimationExampleState();
}

class _SearchbarAnimationExampleState extends State<SearchbarAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSearchbarAnimation(),
    );
  }
  Widget _buildSearchbarAnimation() {
    return SafeArea(
      child: SingleChildScrollView(
        child:
          
              Container(
                height: 660.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SearchBarAnimation(
                        textEditingController: TextEditingController(),
                        isOriginalAnimation: true,
                        enableKeyboardFocus: true,
                        onExpansionComplete: () {
                          debugPrint(
                              'do something just after searchbox is opened.');
                        },
                        onCollapseComplete: () {
                          debugPrint(
                              'do something just after searchbox is closed.');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            
          ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:group_radio_button/group_radio_button.dart';
// import 'package:rent_house/constants.dart';
// import 'package:rent_house/widgets/widgets.dart';



// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//  Widget build(BuildContext context) {
//      String _singleValue = "";
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//           width: size.width * 0.85,
//         child: Row(
//           children: [
//             text(title: "Sort :", fontsize: 20.0),
//             RadioButton(
//               description: "Low to High",
//               value: "High to Low",
//               groupValue: _singleValue,
//               onChanged: (value) => setState(
//                 () => _singleValue = value.toString(),
//               ),
//               activeColor: orange,
//             ),
//             RadioButton(
//               description: "High to low",
//               value: "Text alignment left",
//               groupValue: _singleValue,
//               onChanged: (value) => setState(
//                 () => _singleValue = value.toString(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }