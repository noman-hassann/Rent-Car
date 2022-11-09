
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rent_house/View/Home/homedetails.dart';
// import 'package:rent_house/widgets/textIconFunRow.dart';
// import 'package:rent_house/widgets/widgets.dart';

// import '../../../Config/color.dart';
// import '../../../widgets/colorText.dart';
// class FilterView extends StatelessWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final indexPass;
//   const FilterView({Key? key, required this.indexPass}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var image = indexPass['images'];
//     print("index   $indexPass");

//     return Scaffold(
//         body: SafeArea(
//             child:
//              InkWell(
//       onTap: () {
//         Get.to(HomeDetail(indexPass: indexPass),
//             transition: Transition.rightToLeft,
//             duration: const Duration(milliseconds: 300));
//       },
//       child:indexPass!=null? Container(
//           width: size.width * 0.95,
//           // color: Colors.amber,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             //  alignment: Alignment.topCenter,
//             children: [
//               Material(
//                 shadowColor: const Color.fromARGB(255, 149, 148, 148),
//                 elevation: 4,
//                 borderRadius: const BorderRadius.all(Radius.circular(25)),
//                 child: Container(
//                   alignment: Alignment.centerLeft,
//                   height: size.height * 0.3,
//                   width: size.width * 0.45,
//                   child: Padding(
//                     padding: const EdgeInsets.only(),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(25),
//                                 topRight: Radius.circular(25)),
//                             child: Image.network(
//                                 "https://denga.r3therapeutic.com/public${image[0]['image_name']}",
//                                 width: size.width * 1,
//                                 height: 150,
//                                 fit: BoxFit.fill),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(left: 10.0, bottom: 10),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               text(
//                                 title: indexPass['title'].toString(),
//                                 fontsize: 12.0,
//                                 fontweight: FontWeight.normal,
//                               ),
//                               Center(
//                                 child: textIconFunRow(
//                                     title: indexPass['address'].toString(),
//                                     icon: Icons.location_on,
//                                     fontsize: 12.0,
//                                     fontColor: white,
//                                     iconColor: Colors.black),
//                               ),
//                               colorText(
//                                   title1: "Price:",
//                                   t1Color: white,
//                                   title2: '${indexPass['bedrooms']}/ Month',
//                                   t2Color: black,
//                                   fontsize: 10.0),
//                               colorText(
//                                   title1: "Neighbourhood:",
//                                   t1Color: white,
//                                   title2: "Chinsapo",
//                                   t2Color: black,
//                                   fontsize: 10.0),
//                               colorText(
//                                   title1: "Bedroom:",
//                                   t1Color: white,
//                                   title2: '${indexPass['bedrooms']}',
//                                   t2Color: black,
//                                   fontsize: 10.0),
//                               colorText(
//                                   title1: "Date:",
//                                   t1Color: white,
//                                   title2:
//                                       '/t ${indexPass['user']['created_at']}'
//                                           .substring(2, 13),
//                                   t2Color: black,
//                                   fontsize: 10.0),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           )):text(title: 'No such data available',fontsize: 20,fontweight: FontWeight.bold),
//     )));
//   }
 
// }
  