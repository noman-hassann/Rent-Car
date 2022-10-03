import 'dart:io';

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_house/Conrtoller/AdminApis/adminApis.dart';
import 'package:rent_house/View/Drawer/drawerData.dart';
import 'package:rent_house/View/Services/multipleCheckBox.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/rowButton.dart';
import 'package:rent_house/widgets/widgets.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});
  @override
  State<AddProperty> createState() => _AddPropertyState();
}

bool isloading = false;
GroupController controller = GroupController();

final ImagePicker imagePicker = ImagePicker();
List<File>? imageFileList = [];
List<String> nearByLocations = [];

class _AddPropertyState extends State<AddProperty> {
  final myControllerTitle = TextEditingController();
  final myControllerPrice = TextEditingController();
  final myControllerLandArea = TextEditingController();
  final myControllerDescription = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerTitle.dispose();
    myControllerPrice.dispose();
    myControllerLandArea.dispose();
    myControllerDescription.dispose();
    super.dispose();
  }

  String? bedRoom;
  String? washRoom;
  String? park;
  String? locate;
  String? property_type;
  String? property_value;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  List<String> _selectedItems = [];
  final List<String> bedRooms = [
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
  final List<String> washRooms = [
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
  final List<String> parking = [
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
  @override
  void initState() {
    // TODO: implement initState
    isloading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    bool validData() {
      if (myControllerTitle.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Title"),
          duration: Duration(milliseconds: 500),
        ));

        return false;
      }
      if (myControllerPrice.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Price"),
          duration: Duration(milliseconds: 1000),
        ));
        return false;
      }
      if (myControllerLandArea.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Area"),
          duration: Duration(milliseconds: 1000),
        ));
        return false;
      }
      if (myControllerDescription.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Description "),
          duration: Duration(milliseconds: 1000),
        ));
        return false;
      }
      if (washRoom == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Number WashRoom "),
          duration: Duration(milliseconds: 1000),
        ));
        return false;
      }
      if (park == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Select Parking "),
          duration: Duration(milliseconds: 1000),
        ));
        return false;
      }
      if (locate == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Select Location"),
          duration: Duration(milliseconds: 500),
        ));

        return false;
      }
      if (bedRoom == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Select Bed Rooms "),
          duration: Duration(milliseconds: 1000),
        ));
        return false;
      }
      if (property_value == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Select Property For Sell or For Rent"),
          duration: Duration(milliseconds: 1000),
        ));
        return false;
      }
      if (property_type == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Select Property Type "),
          duration: Duration(milliseconds: 500),
        ));
        return false;
      }

      if (imageFileList != null) {
        if (imageFileList!.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Please Select Image"),
            duration: Duration(milliseconds: 500),
          ));
          return false;
        }
        return true;
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
          //  isloading == true
          //       ? Center(child: CircularProgressIndicator())
          //       :
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
                    const Image(image: AssetImage('assets/images/iconTop.png')),
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
                  // Location Drop down
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
                        dropdownWidth: size.width * 0.87,
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
                  SizedBox(height: size.height * 0.025),

                  // Type DropDown
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
                        dropdownWidth: size.width * 0.87,
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

                  // AdminTextWidget(
                  //   size: size,
                  //   hint: "Address",
                  //   height: 0.07,
                  //   textediting: myControllerAddress,
                  // ),
                  isloading == true
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(height: size.height * 0.025),
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
                                color: const Color.fromARGB(255, 199, 197, 197)
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
                                color: const Color.fromARGB(255, 199, 197, 197)
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
                                color: const Color.fromARGB(255, 199, 197, 197)
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
                              icon: const Icon(Icons.arrow_drop_down, size: 35),
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
                              child: TextButton(
                                  child: text(
                                      title: "Other",
                                      color: Colors.black,
                                      fontsize: 12.0,
                                      fontweight: FontWeight.normal),
                                  onPressed: () async {
                                    nearByLocations =
                                        await showDialog<List<String>>(
                                                context: context,
                                                builder: (_) =>
                                                    MultiSelectDialog(
                                                        question: const Text(
                                                          'Select Your Flavours',
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        answers: const [
                                                          'Nearby Gym',
                                                          'Nearby Bar',
                                                          'Nearby Restaurants',
                                                          'Nearby Malls',
                                                          'Nearby Scool',
                                                          'Nearby Hospital',
                                                        ])) ??
                                            [];
                                    // print(nearByLocations);
                                    // Logic to save selected flavours in the database
                                  })),
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
                                title: imageFileList!.isEmpty
                                    ? "Select Images"
                                    : "${imageFileList!.length} Selected",
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
              SizedBox(
                width: mediaWidth * 0.87,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: text(title: "Property :", fontsize: 13.0),
                    ),
                    RadioButton(
                      description: "For Rent",
                      value: "for_rent",
                      groupValue: property_value,
                      onChanged: (value) => setState(
                        () => property_value = value.toString(),
                      ),
                      activeColor: orange,
                    ),
                    RadioButton(
                      description: "For Sell",
                      value: "for_sell",
                      groupValue: property_value,
                      onChanged: (value) => setState(
                        () => property_value = value.toString(),
                      ),
                      activeColor: orange,
                    ),
                  ],
                ),
              ),

              SizedBox(height: mediaHeight * 0.02),

              //Description
              AdminTextWidget(
                  size: size,
                  hint: "Description",
                  height: 0.15,
                  textediting: myControllerDescription),
              SizedBox(height: size.height * 0.025),
              rowButtonFun(
                  backgroundcolor: orange,
                  title1: "Add Property",
                  height: size.height * 0.03,
                  width: size.width * 0.30,
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  ontap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    setState(() {
                      isloading = true;
                    });
                    if (validData() == true) {
                      // print({
                      //   myControllerTitle.text,
                      //   locate,
                      //   myControllerPrice.text,
                      //   myControllerLandArea.text,
                      //   bedRoom,
                      //   washRoom,
                      //   park,
                      //   myControllerDescription.text,
                      //   nearByLocations.toString(),
                      //   imageFileList,
                      //   property_value,
                      //   property_type
                      // });
                      adminAddproperty(
                              title: myControllerTitle.text,
                              address: locate,
                              price: myControllerPrice.text,
                              area: myControllerLandArea.text,
                              bedrooms: bedRoom,
                              bathrooms: washRoom,
                              parking: park,
                              description: myControllerDescription.text,
                              other: nearByLocations.toString(),
                              imageFileList: imageFileList,
                              property_value: property_value,
                              property_type: property_type,
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
                  })

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
    ));
  }

  pickMultipleImage() async {
    try {
      final images = await imagePicker.pickMultiImage(
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 50,
      );

      if (images == null) return;
      for (XFile image in images) {
        var imagesTemporary = File(image.path);
        setState(() {
          imageFileList!.add(imagesTemporary);
        });
      }
    } catch (e) {}
  }

  Container AdminTextWidget({var size, var hint, height, textediting}) {
    return Container(
      width: size.width * 0.87,
      height: size.height * height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 199, 197, 197).withOpacity(0.4),
            offset: const Offset(10.0, 8.0),
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
        child: TextField(
          controller: textediting,
          style: const TextStyle(
              fontSize: 16.0, color: textwhite, fontWeight: FontWeight.normal),
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
    );
  }
}

class MultiSelectDialog extends StatelessWidget {
  /// List to display the answer.
  final List<String> answers;

  /// Widget to display the question.
  final Widget question;

  /// List to hold the selected answer
  /// i.e. ['a'] or ['a','b'] or ['a','b','c'] etc.
  final List<String> selectedItems = [];

  static Map<String, bool>? mappedItem;

  MultiSelectDialog({required this.answers, required this.question});

  /// Function that converts the list answer to a map.
  Map<String, bool> initMap() {
    return mappedItem = Map.fromIterable(answers,
        key: (k) => k.toString(),
        value: (v) {
          if (v != true && v != false)
            return false;
          else
            return v as bool;
        });
  }

  @override
  Widget build(BuildContext context) {
    if (mappedItem == null) {
      initMap();
    }
    return SimpleDialog(
      title: question,
      children: [
        ...mappedItem!.keys.map((String key) {
          return StatefulBuilder(
            builder: (_, StateSetter setState) => CheckboxListTile(
                title: Text(key), // Displays the option
                value: mappedItem![key], // Displays checked or unchecked value
                controlAffinity: ListTileControlAffinity.platform,
                onChanged: (value) =>
                    setState(() => mappedItem![key] = value!)),
          );
        }).toList(),
        Align(
            alignment: Alignment.center,
            child: Container(
              //  color: Colors.amber,
              child: ElevatedButton(
                  style: ButtonStyle(
                    visualDensity: VisualDensity.comfortable,
                    backgroundColor: MaterialStateProperty.all<Color>(orange),
                  ),
                  child: Text('Submit'),
                  onPressed: () {
                    // Clear the list
                    selectedItems.clear();

                    // Traverse each map entry
                    mappedItem!.forEach((key, value) {
                      if (value == true) {
                        selectedItems.add(key);
                      }
                    });

                    // Close the Dialog & return selectedItems
                    Navigator.pop(context, selectedItems);
                  }),
            ))
      ],
    );
  }
}
