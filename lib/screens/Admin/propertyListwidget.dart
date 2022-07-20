import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Admin/Widgets/dropDownRadio.dart';
import 'package:rent_house/widgets/widgets.dart';


// class WidgetIcon extends StatefulWidget {
//   var text1;
//   WidgetIcon({super.key, this.text1});

//   @override
//   State<WidgetIcon> createState() => _WidgetIconState();
// }

// class _WidgetIconState extends State<WidgetIcon> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Container(
//         //width: size.width * 0.35,
//         height: size.height * 0.05,
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//           boxShadow: [
//             BoxShadow(
//               color: const Color.fromARGB(255, 175, 174, 174).withOpacity(0.3),
//               offset: const Offset(10.0, 10.0),
//               blurRadius: 10.0,
//             ),
//           ],
//         ),
//         child: Container(
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 255, 255, 255),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10.0),
//               ),
//             ),
//             child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 18.0,
//                 ),
//                 child: Container(
//                   // color: Colors.amber,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         text(
//                             title: widget.text1,
//                             fontsize: 14.0,
//                             fontweight: FontWeight.normal,
//                             color: Colors.black),
//                         SizedBox(width: size.width * 0.012),
//                         IconButton(
//                             onPressed: () {
//                               CustDropDown(
//                                 items: const [
//                                   CustDropdownMenuItem(
//                                     value: 0,
//                                     child: Text("Day"),
//                                   ),
//                                   CustDropdownMenuItem(
//                                     value: 0,
//                                     child: Text("Week"),
//                                   )
//                                 ],
//                                 hintText: "DropDown",
//                                 borderRadius: 5,
//                                 onChanged: (val) {
//                                   print(val);
//                                 },
//                               );
                            
//                             },
//                             icon: Icon(Icons.keyboard_arrow_down))
//                       ]),
//                 ))));
 
//   }
// }


// Container widgetIcon({var size, text1}) {

// }




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
//                               color: textwhite),
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
//                                 color: textwhite,
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



