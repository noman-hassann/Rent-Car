import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:rent_house/config/color.dart';

// class showDialogWithFields extends StatefulWidget {
//   final text1;
//   const showDialogWithFields({Key? key,required this.text1,}) : super(key: key);
//   @override
//   State<showDialogWithFields> createState() => _showDialogWithFieldsState();
// }
// class _showDialogWithFieldsState extends State<showDialogWithFields> {
//   @override
//   Widget build(BuildContext context) {
//       String _singleValue = "";
//         Size size = MediaQuery.of(context).size;
//           var emailController = TextEditingController();
//       var messageController = TextEditingController();
//     return TextButton(
//       onPressed: () => showDialog<String>(

//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//         title: Text('Update Your ${widget.text1}'),
//         content: ListView(
//           shrinkWrap: true,
//           children: [
//             // widget.text1=='Gender'?
//             //   //  SizedBox(
//             //   //                           // color: Colors.amber,
//             //   //                           width: size.width * 0.85,
//             //   //                           child: Row(
//             //   //                             children: [
//             //   //                               Padding(
//             //   //                                 padding: const EdgeInsets.only(
//             //   //                                     left: 8.0),
//             //   //                                 child: text(
//             //   //                                     title: "Sort :",
//             //   //                                     fontsize: 17.0),
//             //   //                               ),
//             //   //                               RadioButton(
//             //   //                                 description: "Low to High",
//             //   //                                 value: "High to Low",
//             //   //                                 groupValue: _singleValue,
//             //   //                                 onChanged: (value) => setState(
//             //   //                                   () => _singleValue =
//             //   //                                       value.toString(),
//             //   //                                 ),
//             //   //                                 activeColor: orange,
//             //   //                               ),
//             //   //                               RadioButton(
//             //   //                                 description: "High to low",
//             //   //                                 value: "Text alignment left",
//             //   //                                 groupValue: _singleValue,
//             //   //                                 onChanged: (value) => setState(
//             //   //                                   () => _singleValue =
//             //   //                                       value.toString(),
//             //   //                                 ),
//             //   //                                 activeColor: orange,
//             //   //                               ),
//             //   //                             ],
//             //   //                           ),
//             //   //                         );
//             //   text(title: "this is not possible")
//             //  :
//             TextFormField(
//               controller: messageController,
//               decoration: InputDecoration(hintText: '${widget.text1}'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // Send them to your email maybe?
//               var email = emailController.text;
//               var message = messageController.text;
//               Navigator.pop(context);
//             },
//             child: Text('Save'),
//           ),
//         ],
//       ),
//       ),
//       child: const Text('Show Dialog'),
//     );
//   }
// }

// void showDialogWithFields({var context,var text1,radio}) {

//   showDialog(
//     context: context,
//     builder: (_) {
//       var emailController = TextEditingController();
//       var messageController = TextEditingController();
//       return AlertDialog(

//         title: Text('Update Your $text1'),
//         content: ListView(
//           shrinkWrap: true,
//           children: [
//             text1=='Gender'?
//              radio
//           // text(title: "error")
//              :
//             TextFormField(
//               controller: messageController,
//               decoration: InputDecoration(hintText: '$text1'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // Send them to your email maybe?
//               var email = emailController.text;
//               var message = messageController.text;
//               Navigator.pop(context);
//             },
//             child: Text('Save'),
//           ),
//         ],
//       );
//     },

//   );

// }
class GenderPopUP extends StatefulWidget {
  const GenderPopUP({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => GenderPopUPState();
}

class GenderPopUPState extends State<GenderPopUP>
    with SingleTickerProviderStateMixin {
        String _singleValue = "";
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Row(
        children: [
          RadioButton(
            description: "Male",
            value: "High to Low",
            groupValue: _singleValue,
            onChanged: (value) => setState(
              () => _singleValue = value.toString(),
            ),
            activeColor: orange,
          ),
          RadioButton(
            description: "Female",
            value: "Text alignment left",
            groupValue: _singleValue,
            onChanged: (value) => setState(
              () => _singleValue = value.toString(),
            ),
            activeColor: orange,
          ),
        ],
      ),
    );
  }
}
