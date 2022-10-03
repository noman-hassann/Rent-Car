import 'dart:convert';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:rent_house/View/Home/homeView.dart';
import 'package:rent_house/View/Home/widgets/filterScreen.dart';
import 'package:rent_house/View/Home/widgets/filterView.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/rowButton.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PopUpOverLay extends StatefulWidget {
  // final Function callbackFunction;
  // required this.callbackFunction,
  PopUpOverLay({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => PopUpOverLayState();
}

class PopUpOverLayState extends State<PopUpOverLay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  String? locate;
  String? property_type;
  Map? mapResponse;
  List? filter;
  RangeValues _currentRangeValues = const RangeValues(0, 99999);
  bool isloading = false;
  bool isFilter=false;
  final List<String> location = [
    'Balaka',
    'Blantyre',
    'Chikwawa',
    'Chiradzulu',
    'Chitipa',
    'Dedza',
    'Dowa',
    'Karonga',
    'Kasungu',
    'Likoma',
    'Lilongwe',
    'Machinga',
    'Mangochi',
    'Mchinji',
    'Mulanje',
    'Mwanza',
    'Mzimba',
    'Mzuzu',
    'Neno',
    'Nkhotabay',
    'Nkhotakota',
    'Nsanje',
    'Ntcheu',
    'Ntchisi',
    'Phalombe',
    'Rumphi',
    'Salima',
    'Thyolo',
    'Zomba',
  ];

  final List<String> type = [
    'House',
    'Flat',
    'Office',
    'Warehouse',
    'Land',
    'Farm',
    'Shop',
  ];

  bool validData() {
    if (locate.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Select Location"),
        duration: Duration(milliseconds: 500),
      ));
      return false;
    }
    if (property_type.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Select Location"),
        duration: Duration(milliseconds: 500),
      ));
      return false;
    }
    return true;
  }

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
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: scaleAnimation,
          child: Container(
            // margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(15.0),
            height: MediaQuery.of(context).size.width * 13,
            width: MediaQuery.of(context).size.width * 1,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 20, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                        title: "Filter",
                        fontsize: 20.0,
                        fontweight: FontWeight.normal),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.cancel_outlined)),
                  ],
                ),
              ),

              //property location
              Container(
                width: size.width * 0.87,
                height: size.height * 0.07,
                // height: size.height * ,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 199, 197, 197)
                          .withOpacity(0.4),
                      offset: Offset(10.0, 8.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),

                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: CustomDropdownButton2(
                    dropdownWidth: size.width * 0.76,
                    // buttonWidth: 500,
                    icon: const Icon(Icons.arrow_drop_down, size: 35),
                    buttonDecoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    hint: 'Location',
                    dropdownItems: location,
                    value: locate,
                    onChanged: (value) {
                      setState(() {
                        locate = value;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // property type
              Container(
                width: size.width * 0.87,
                height: size.height * 0.07,
                // height: size.height * ,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 199, 197, 197)
                          .withOpacity(0.4),
                      offset: Offset(10.0, 8.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),

                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: CustomDropdownButton2(
                    dropdownWidth: size.width * 0.76,
                    // buttonWidth: 500,
                    icon: const Icon(Icons.arrow_drop_down, size: 35),
                    buttonDecoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    hint: 'Type',
                    dropdownItems: type,
                    value: property_type,
                    onChanged: (value) {
                      setState(() {
                        property_type = value;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              text(
                  title: "Select Price Range",
                  fontsize: 15.0,
                  fontweight: FontWeight.normal),
              SizedBox(
                height: size.height * 0.01,
              ),
              RangeSlider(
                values: _currentRangeValues,
                max: 999999,
                divisions: 1000,
                activeColor:orange,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString().substring(1),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                    _currentRangeValues.toString().split(',');
                  });
                },
              ),
              // rowButtonFun(
              //     backgroundcolor: orange,
              //     title1: "Apply",
              //     height: size.height * 0.04,
              //     width: size.width * 0.43,
              //     textColor: Color.fromARGB(255, 255, 255, 255),
              //     ontap: () {
              //       setState(() {
              //         isloading = true;
              //         // ScaffoldMessenger.of(context).clearSnackBars();
              //         int start = _currentRangeValues.start.toInt();
              //         int end = _currentRangeValues.end.toInt();
              //         widget.callbackFunction(
              //           locate,
              //           property_type,
              //           start,
              //           end,
              //         );
              //       });
              //       Navigator.pop(context);
              //     }),

              rowButtonFun(
                  backgroundcolor: orange,
                  title1: "Apply",
                  height: size.height * 0.04,
                  width: size.width * 0.43,
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  ontap: () {
                    setState(() {
                      isloading = true;
                      ScaffoldMessenger.of(context).clearSnackBars();
                      isFilter=true;
                    });
                    if (validData() == true) {
                      filterApis(
                        locate: locate,
                        property_type: property_type,
                        max: _currentRangeValues.end.toInt(),
                        min: _currentRangeValues.start.toInt(),
                      ).then((value) => {
                            setState(() {
                              isloading = false;
                            }),
                          });
                    } else {
                      setState(() {
                        isloading = false;
                      });
                    }
                  }),

            isFilter==true?  Expanded(
                child: filter == null
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: filter!.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 1.0,
                              crossAxisSpacing: 1.0,
                              // childAspectRatio: 12.0,
                              mainAxisExtent: 253,
                              maxCrossAxisExtent: 200,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return (FilterView(indexPass: filter![index]));
                            }),
                      ),
              ):Container(),
            ]),
          ),
        ),
      ),
    );
  }

  Dio dio = Dio();
  var apiURL = 'https://denga.r3therapeutic.com/public/api/filter';
  FormData formData = FormData();
  Future filterApis({
    locate,
    property_type,
    min,
    max,
  }) async {
    // print("'property_value': $property_value");
    FormData formData = FormData.fromMap({
      'location': locate.toString(),
      'property_type': property_type.toString(),
      'min': min,
      'max': max,
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    Response responce;
    responce = await dio.post(apiURL,
        data: formData,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        }));
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (responce.statusCode == 200) {
          filter = responce.data;
          print(filter);
          print(responce.data);
          Fluttertoast.showToast(
              msg: "Filter  Applied", backgroundColor: Colors.orange);
        } else {
          Fluttertoast.showToast(
              msg: "Filter  Applied", backgroundColor: Colors.orange);
        }
        const Duration(milliseconds: 800);
      } else {
        Fluttertoast.showToast(
            msg: "Please connect to internet", backgroundColor: Colors.orange);
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "Something went Wrong try again later",
          backgroundColor: Colors.orange);
      const Duration(milliseconds: 500);
    }
    return "";
  }
}
