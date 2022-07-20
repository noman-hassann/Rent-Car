import 'dart:io';

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_house/Apis/AdminApis/adminApis.dart';
import 'package:rent_house/Screens/Drawer/drawerData.dart';

import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/rowButton.dart';
import 'package:rent_house/widgets/widgets.dart';

class ListProperty extends StatefulWidget {
  const ListProperty({super.key});
  @override
  State<ListProperty> createState() => _ListPropertyState();
}

final myControllerTitle = TextEditingController();
final myControllerAddress = TextEditingController();
final myControllerPrice = TextEditingController();
final myControllerLandArea = TextEditingController();
final myControllerDescription = TextEditingController();

bool isloading = false;
GroupController controller = GroupController();

final ImagePicker imagePicker = ImagePicker();

class _ListPropertyState extends State<ListProperty> {
  // List<XFile>? imageFileList = [];
    List<File>? imageFileList = [];
  // printList() {
  //   imageFileList!.forEach((element) {
  //     print(element);
  //   });
  // }

  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final List<String> bedRooms = [
    'Bed Rooms',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  String? bedRoom;
  final List<String> washRooms = [
    'Wash Rooms',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  String? washRoom;
  final List<String> parking = [
    'Parking',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  String? park;
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myControllerTitle.dispose();
      myControllerAddress.dispose();
      myControllerPrice.dispose();
      myControllerLandArea.dispose();
      myControllerDescription.dispose();
      super.dispose();
    }

    bool validData() {
      if (myControllerTitle.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Your Name"),
          duration: Duration(milliseconds: 300),
        ));

        return false;
      }
      if (myControllerAddress.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter Valid Email Address"),
          duration: Duration(milliseconds: 400),
        ));

        return false;
      }
      if (myControllerPrice.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Phone Number"),
          duration: Duration(milliseconds: 300),
        ));
        return false;
      }
      if (myControllerLandArea.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Address"),
        ));
        return false;
      }
      if (washRoom.toString().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Address"),
        ));
        return false;
      }
      if (park.toString().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Address"),
        ));
        return false;
      }
      if (bedRoom.toString().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Address"),
        ));
        return false;
      }

      //    if (.text.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text("Please enter Address"),
      //   ));
      //   return false;
      // }

      if (myControllerDescription.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Address"),
        ));
        return false;
      }

      return true;
    }

    Size size = MediaQuery.of(context).size;
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        drawer: Container(
            width: mediaWidth * 0.6, child: const Drawer(child: DrawerData())),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: mediaHeight * 0.010),
                //top bar
                Container(
                  width: mediaWidth * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 214, 210, 210),
                              offset: Offset(1.0, 1.0),
                              blurRadius: 9.0,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          child: IconButton(
                            icon: const Icon(
                              Icons.menu,
                              size: 25,
                              color: orange,
                            ),
                            onPressed: () {
                              _scaffoldkey.currentState!.openDrawer();
                            },
                          ),
                        ),
                      ),
                      text(
                          title: "List New Property",
                          fontsize: 20.0,
                          fontweight: FontWeight.normal,
                          color: const Color.fromARGB(255, 15, 5, 5)),
                      const Image(
                          image: AssetImage('assets/images/iconTop.png')),
                    ],
                  ),
                ),
                // text field
                Column(
                  children: [
                    SizedBox(height: mediaHeight * 0.025),
                    AdminTextWidget(
                      size: size,
                      hint: "Title",
                      height: 0.07,
                      textediting: myControllerTitle,
                    ),
                    SizedBox(height: size.height * 0.025),
                    AdminTextWidget(
                      size: size,
                      hint: "Address",
                      height: 0.07,
                      textediting: myControllerAddress,
                    ),
                    SizedBox(height: size.height * 0.025),
                    AdminTextWidget(
                      size: size,
                      hint: "Price",
                      height: 0.07,
                      textediting: myControllerPrice,
                    ),
                    SizedBox(height: size.height * 0.025),
                    AdminTextWidget(
                        size: size,
                        hint: "Land Area    (Square Feet)",
                        height: 0.07,
                        textediting: myControllerLandArea),
                    SizedBox(height: size.height * 0.025),
                  ],
                ),

                //drop down code
                Container(
                  width: mediaWidth * 0.87,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //drop down row wise
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.4,
                            // height: size.height * ,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 199, 197, 197)
                                          .withOpacity(0.4),
                                  offset: Offset(10.0, 8.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            //Bed rooms code here
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(.8),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: CustomDropdownButton2(
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 35,
                                ),
                                buttonDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                ),
                                hint: 'Bed Rooms',
                                dropdownItems: bedRooms,
                                value: bedRoom,
                                onChanged: (value) {
                                  setState(() {
                                    bedRoom = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          //Wash rooms code here
                          Container(
                            width: size.width * 0.4,
                            // height: size.height * ,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 199, 197, 197)
                                          .withOpacity(0.4),
                                  offset: const Offset(10.0, 8.0),
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
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 32,
                                ),
                                buttonDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                ),
                                hint: 'Wash Rooms',
                                dropdownItems: washRooms,
                                value: washRoom,
                                onChanged: (value) {
                                  setState(() {
                                    washRoom = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaHeight * 0.02),
                      //drop down row wise
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.4,
                            // height: size.height * ,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 199, 197, 197)
                                          .withOpacity(0.4),
                                  offset: Offset(10.0, 8.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            //parking code
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(.8),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: CustomDropdownButton2(
                                icon:
                                    const Icon(Icons.arrow_drop_down, size: 35),
                                buttonDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                ),
                                hint: 'Parking',
                                dropdownItems: parking,
                                value: park,
                                onChanged: (value) {
                                  setState(() {
                                    park = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          //bottom sheet code
                          Container(
                            width: size.width * 0.4,
                            // height: size.height * ,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 199, 197, 197)
                                          .withOpacity(0.4),
                                  offset: Offset(10.0, 8.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(.8),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextButton(
                                  child: text(
                                      title: "Other",
                                      color: Colors.black,
                                      fontsize: 13.0,
                                      fontweight: FontWeight.normal),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Icon(Icons.abc);
                                        });
                                  },
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //Images select bnutton
                      Container(
                        width: size.width * 0.5,
                        // height: size.height * ,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 199, 197, 197)
                                  .withOpacity(0.4),
                              offset: Offset(10.0, 8.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        //Image code here
                        child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(.8),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: TextButton(
                              child: text(
                                  title: "Select Images",
                                  color: Colors.black,
                                  fontsize: 13.0,
                                  fontweight: FontWeight.normal),
                              onPressed: () {
                                pickMultipleImage();
                              //  printList();
                              },
                            )),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: mediaHeight * 0.02),

                //Description
                AdminTextWidget(
                    size: size,
                    hint: "Description",
                    height: 0.1,
                    textediting: myControllerDescription),
                SizedBox(height: size.height * 0.025),
                rowButtonFun(
                    backgroundcolor: orange,
                    title1: "Add Property",
                    height: size.height * 0.03,
                    width: size.width * 0.30,
                    textColor: Color.fromARGB(255, 255, 255, 255),
                    ontap: () {
                      setState(() {
                        isloading = true;
                      });
                      if (validData() == true) {
                        adminAddproperty(
                                title: myControllerTitle.text,
                                address: myControllerAddress.text,
                                price: myControllerPrice.text,
                                area: myControllerLandArea.text,
                                bedrooms: bedRoom,
                                bathrooms: washRoom,
                                parking: park,
                                other: "hello",
                                imageFileList: imageFileList,
                                context: context)
                            .then((value) => {
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
                //  Image.file(File(imageFileList.toString())),
                // GridView.builder(
                //     itemCount: imageFileList!.length,

                //     itemBuilder: (BuildContext context, int index) {
                //       return textWidget(text1: imageFileList![index].path);
                //     }, ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  pickMultipleImage() async {
    try {
      final images = await imagePicker.pickMultiImage(
        maxWidth: 600,
        maxHeight: 600,
        
      );

      if (images == null) return;
      for (XFile image in images) {
        var imagesTemporary = File(image.path);
      
        imageFileList!.add(imagesTemporary);
      }
      
    } catch (e) {}
  }

  Container AdminTextWidget({var size, var hint, height, textediting}) {
    return Container(
      width: size.width * 0.87,
      height: size.height * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 199, 197, 197).withOpacity(0.4),
            offset: Offset(10.0, 8.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255).withOpacity(.8),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: TextField(
            controller: textediting,
            style: const TextStyle(
                fontSize: 16.0,
                color: textwhite,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              //  fillColor: Colors.amber,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

              hintText: hint,
              disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 101, 100, 100), width: 40.0),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
