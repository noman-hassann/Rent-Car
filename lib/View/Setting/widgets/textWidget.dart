import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';


import 'package:rent_house/View/Setting/widgets/pop.dart';
import 'package:rent_house/widgets/widgets.dart';

import '../../../Config/color.dart';

class textWidget extends StatefulWidget {
  final text1;
  final text2;
  const textWidget({super.key, this.text1, this.text2});

  @override
  State<textWidget> createState() => _textWidgetState();
}

class _textWidgetState extends State<textWidget> {
  String _singleValue = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.95,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 175, 174, 174).withOpacity(0.3),
              offset: const Offset(10.0, 10.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Container(
                // color: Colors.amber,
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text(
                              title: widget.text1,
                              fontsize: 14.0,
                              fontweight: FontWeight.normal,
                              color: Colors.black),
                          SizedBox(height: size.height * 0.012),
                          text(
                              title: widget.text2,
                              fontsize: 14.0,
                              fontweight: FontWeight.normal,
                              color: white),
                        ],
                      ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(bottom: 18.0, right: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           showDialog(
                      //             context: context,
                      //             builder: (_) {
                      //               var emailController =
                      //                   TextEditingController();
                      //               var messageController =
                      //                   TextEditingController();
                      //               return AlertDialog(
                      //                 title:
                      //                     Text('Update Your ' + widget.text1),
                      //                 content: ListView(
                      //                   shrinkWrap: true,
                      //                   children: [
                      //                     // widget.text1 == 'Gender'
                      //                     //     ? GenderPopUP()
                      //                     TextFormField(
                      //                       controller: messageController,
                      //                       decoration: InputDecoration(
                      //                           hintText: widget.text1),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 actions: [
                      //                   TextButton(
                      //                     onPressed: () =>
                      //                         Navigator.pop(context),
                      //                     child: Text('Cancel'),
                      //                   ),
                      //                   TextButton(
                      //                     onPressed: () {
                      //                       // Send them to your email maybe?
                      //                       var email = emailController.text;
                      //                       var message =
                      //                           messageController.text;
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: Text('Save'),
                      //                   ),
                      //                 ],
                      //               );
                      //             },
                      //           );
                      //         },
                      //         child: const Icon(
                      //           Icons.arrow_forward_ios_outlined,
                      //           color: white,
                      //           size: 25,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                   
                    ]),
              ),
            )));
  }
}





// Container    textWidget({size,context,text1,text2}){
//     return Container(
//       width: size.width * 0.95,
//       height: size.height * 0.1,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(30)),
//         boxShadow: [
//           BoxShadow(
//             color: const Color.fromARGB(255, 175, 174, 174).withOpacity(0.3),
//             offset: const Offset(10.0, 10.0),
//             blurRadius: 10.0,
//           ),
//         ],
//       ),
//       child: Container(
//           decoration: const BoxDecoration(
//             color: Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.all(
//               Radius.circular(20.0),
//             ),
//           ),
//           child: Padding(
//               padding: const EdgeInsets.only(left: 18.0, top: 15),
//               child: Container(
//                 // color: Colors.amber,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           text(
//                               title: text1,
//                               fontsize: 14.0,
//                               fontweight: FontWeight.normal,
//                               color: Colors.black),
//                           SizedBox(height: size.height * 0.012),
//                           text(
//                               title: text2,
//                               fontsize: 14.0,
//                               fontweight: FontWeight.normal,
//                               color: white),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 18.0, right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 showDialogWithFields(
//                                     text1:text1 ,
//                                   );
//                               },
//                               child: const Icon(
//                                 Icons.arrow_forward_ios_outlined,
//                                 color: white,
//                                 size: 25,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//               ))),
//     );
// }


