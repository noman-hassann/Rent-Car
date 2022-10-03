import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rent_house/View/Admin/Add_New_Property/AddProperty.dart';
import 'package:rent_house/View/Admin/View_Property/AdminView.dart';
import 'package:rent_house/View/Drawer/drawerData.dart';
import 'package:rent_house/View/Explore/ExploreView.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});
  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String? stringResponse;
  Map? mapResponse;
  Map? dataResponce;
  List? _users;
  List? image;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  @override
  void initState() {
    // listItem = _searchResult();
    apiCall();

    super.initState();
  }
  // var image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: orange,
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const AddProperty()),
        //     );
        //   },
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //   ),
        //   child: const Icon(Icons.add),
        // ),
        key: _scaffoldkey,
        drawer: SizedBox(
            width: size.width * 0.6, child: const Drawer(child: DrawerData())),
        body: SafeArea(
            child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            // color: Color.fromARGB(255, 207, 89, 89),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        title: "Properties List",
                        fontsize: 20.0,
                        fontweight: FontWeight.normal,
                        color: const Color.fromARGB(255, 15, 5, 5)),
                    const Image(
                      image: AssetImage('assets/images/iconTop.png'),
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
              ),
              // //  rowButtonFun(
              //         backgroundcolor: orange,
              //         title1: "Add Property",
              //         height: size.height * 0.03,
              //         width: size.width * 0.30,
              //         textColor: Color.fromARGB(255, 255, 255, 255),
              //         ontap: () {
              //           // Navigator.push(
              //           //   context,
              //           //   MaterialPageRoute(
              //           //       builder: (context) => const login()),
              //           // );
              //         }),
              SizedBox(
                height: size.height * 0.02,
              ),

              Expanded(
                child: _users == null
                    ? Container()
                    : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: _users!.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            // childAspectRatio: 12.0,
                            mainAxisExtent: 145,
                            maxCrossAxisExtent: 400,
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              (AdminView(indexPass: _users![index])),
                        ),
                      ),
              )
            ]),
          ),
        )));
  }

  // List<ExploreModel> _searchResult() {
  //   List<ExploreModel> newProduct = <ExploreModel>[];
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   newProduct.add(ExploreModel(
  //     image1: "room.png",
  //     image2: "bedroom.png",
  //     image3: "apartment1.png",
  //     image4: "bedroom.png",
  //   ));
  //   return newProduct;
  // }
  Future apiCall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    http.Response response;
    response = await http.post(
        Uri.parse("https://denga.r3therapeutic.com/public/api/getagentpost"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      setState(() {
        //  stringResponse = response.body;
        mapResponse = jsonDecode(response.body);
        _users = mapResponse?['data'];
        // image = _users?['images'];
        //  image= _users![0]['images'];
        // var images=image![0]['image_name'];
        //  print(images);
        // print(image2);
      });
    }
  }
}
