import 'package:flutter/material.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/widgets/widgets.dart';

import '../../widgets/textButton.dart';

class SelectAbleListView extends StatefulWidget {
  final indexPass;
  const SelectAbleListView({Key? key, required this.indexPass})
      : super(key: key);

  @override
  State<SelectAbleListView> createState() => _SelectAbleListViewState();
}

class _SelectAbleListViewState extends State<SelectAbleListView> {
  @override
  void initState() {
    // userRole = getRole();
    super.initState();
  }

  // getRole() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     userRole = pref.getString('role')!;
  //   });
  //   if (kDebugMode) {
  //     print("role1  $userRole");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
            height:  size.height * 0.3,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: orange.withOpacity(0.5),
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        
          child:
           Padding(
             padding: const EdgeInsets.all(8.0,),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Center(
                   child: text(
                       title: widget.indexPass['package_name']
                           .toString()
                           .toUpperCase(),
                           fontsize: 15.0,
                       fontweight: FontWeight.bold),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      text(
                         title:'Price :',
                         fontsize: 15.0,
                         fontweight: FontWeight.bold
                             ),
                     text(
                         title: widget.indexPass['subscription_amount']
                             .toString()),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     text(
                         title:'Duration :',
                         fontsize: 15.0,
                         fontweight: FontWeight.bold
                             ),
                     text(
                         title:
                             widget.indexPass['duration'].toString()),
                   ],
                 ),
                 for (var detail in widget.indexPass['details'])
                   Row(
                     children: [
                       Icon(Icons.check_box,color: Colors.white,),
                       text(title: detail['detail'].toString()),
                     ],
                   ),
                   SizedBox(height: size.height*0.02,),
                   Center(child: button2(buttonTitle: 'Buy Now',height: size.height*0.04,width: size.width*0.4))
               ],
             ),
           ),
        ),
      ),
    );
  }
}
