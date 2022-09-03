import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Admin/Add_New_Property/listProperty.dart';
import 'package:rent_house/screens/Explore/model/ExploreModelClass.dart';
import 'package:rent_house/screens/Explore/view/ExploreView.dart';
import 'package:rent_house/screens/drawer/drawerData.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class AdminProperty extends StatefulWidget {
  const AdminProperty({super.key});
  @override
  State<AdminProperty> createState() => _AdminPropertyState();
}

class _AdminPropertyState extends State<AdminProperty> {
  String _singleValue = "";

  String? stringResponse;
  Map? mapResponse;
  Map? dataResponce;
  void initState() {
   // listItem = _searchResult();
    apiCall();

    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  List? _users;
  List? image;
 // var image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: orange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListProperty()),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Icon(Icons.add),
        ),
        key: _scaffoldkey,
        drawer: Container(
            width: size.width * 0.6, child: const Drawer(child: DrawerData())),
        body: SafeArea(
            child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            // color: Color.fromARGB(255, 207, 89, 89),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
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

              //  rowButtonFun(
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
               
                child:_users==null?Container():
                
                 SingleChildScrollView(
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
                        (ExploreView(indexPass: _users![index])),
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

  var token = 'Bearer 68|V2gnBMtaOjS2exRW2LhNKh7djOg3RxURT0OL2yL5';

  Future apiCall() async {
    http.Response response;
    response = await http.post(
        Uri.parse("https://denga.r3therapeutic.com/public/api/getpost"),
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
     image= _users![0]['images'];
     print(image);
    // print(image2);
      });
    }
  }
}
