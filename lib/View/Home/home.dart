import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rent_house/Conrtoller/AdminApis/adminApis.dart';
import 'package:rent_house/View/Drawer/drawerData.dart';
import 'package:rent_house/View/Explore/SearchDeligate.dart';
import 'package:rent_house/View/Home/homeView.dart';
import 'package:rent_house/View/Home/widgets/PopUpOverLay.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

final GlobalKey<_HomeState> _myWidgetState = GlobalKey<_HomeState>();

class _HomeState extends State<Home> {
  // bool isfilter = false;
  // ignore: non_constant_identifier_names
  // callback(varLocate, varProperty, varMax, varMin) {
  //   setState(() {
  //     locate = varLocate;
  //     property_type = varProperty;
  //     min = varMin;
  //     max = varMax;
  //     isfilter = true;
  //   });
  //   filterApis(
  //       locate: locate, property_type: property_type, max: max, min: min);
  // }
  // List<HomeRoom> listItem = [];
  // bool pressAttention = true;
  bool pressForRent = false;
  bool pressForSell = false;
  String? stringResponse;
  Map? mapResponse;
  Map? dataResponce;
  List? _users;
  List? forSell;
  List? forRent;
  List? image;
  bool isLoading = true;
  List titles = [];
  List sortedAsc = [];
  // List filter = [];
  //  List? filter;
  bool rent = false;
  bool sell = false;

  @override
  void initState() {
    // listItem = _hotelRoom();

    apiCall();
    _getNames();

    super.initState();
  }
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          //  backgroundColor: Colors.white,
          key: _scaffoldkey,
          drawer: Container(
              width: size.width * 0.6,
              child: const Drawer(child: DrawerData())),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.97,
              // color: Color.fromARGB(255, 207, 89, 89),

              child: Column(children: [
                SizedBox(height: size.height * 0.010),
                Row(
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
                        title: "Find Your New Home",
                        fontsize: 20.0,
                        fontweight: FontWeight.normal,
                        color: const Color.fromARGB(255, 15, 5, 5)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            sell = false;
                            rent = false;
                            pressForSell = false;
                            pressForRent = false;
                          });
                        },
                        child: const Image(
                            image: AssetImage('assets/images/iconTop.png'))),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
                Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 199, 197, 197)
                            .withOpacity(0.3),
                        offset: const Offset(1.0, 5.0),
                        blurRadius: 7.0,
                      ),
                    ],
                  ),
                  height: size.height * 0.055,
                  width: size.width * 0.86,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Custom Button For Sell
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                sell = true;
                                getCategoryForSell(_users!);
                              });

                              setState(() {
                                pressForSell = true;
                                pressForRent = false;
                              });
                              //  print(pressAttention);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: pressForSell == true
                                    ? orange
                                    : Colors.white,
                                //    backgroundColor: Colors.white,
                                // primary: Colors.white,
                                minimumSize:
                                    Size(size.width * 0.42, size.height * 0.07),
                                textStyle: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500)),
                            child: text(
                                title: " For Sale",
                                fontsize: 15.0,
                                color: pressForSell == true
                                    ? Colors.white
                                    : Colors.black,
                                fontweight: FontWeight.normal),
                          ),
                        ),
                        //Custom Button for Rent
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                sell = false;
                                rent = true;
                                getCategoryForRent(_users!);
                              });
                              setState(() {
                                pressForRent = true;
                                pressForSell = false;
                              });
                              //  print(pressAttention);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: pressForRent == true
                                    ? orange
                                    : Colors.white,
                                //    backgroundColor: Colors.white,
                                primary: Colors.black,
                                minimumSize:
                                    Size(size.width * 0.42, size.height * 0.07),
                                textStyle: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500)),
                            child: text(
                                title: "For Rent",
                                fontsize: 15.0,
                                color: pressForRent == true
                                    ? Colors.white
                                    : Colors.black,
                                fontweight: FontWeight.normal),
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: size.height * 0.020),
                Container(
                  width: size.width * 0.87,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 199, 197, 197)
                            .withOpacity(0.3),
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      enableSuggestions: false,
                      onTap: () {
                        showSearch(
                            context: context,
                            delegate: MySearchDelegate(titles: titles));
                      },
                      style: const TextStyle(fontSize: 17.0, color: textwhite),
                      decoration: InputDecoration(
                        //  fillColor: Colors.amber,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: textwhite,
                        ),
                        hintText: "Search Here",
                        disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 101, 100, 100),
                                width: 40.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        suffixIcon: GestureDetector(
                          onTap: (() {
                            showDialog(
                              context: context,
                              builder: (_) => PopUpOverLay(
                                  // callbackFunction: callback,
                                  ),
                            );
                          }),
                          child: const Icon(
                            Icons.sort,
                            color: textwhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.010),
                // Center(
                //   child: SizedBox(
                //     // color: Colors.amber,
                //     width: size.width * 0.85,
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 8.0),
                //           child: text(title: "Sort :", fontsize: 17.0),
                //         ),
                //         RadioButton(
                //           description: "Low to High",
                //           value: "High to Low",
                //           groupValue: _singleValue,
                //           onChanged: (value) => setState(
                //             () => _singleValue = value.toString(),
                //           ),
                //           activeColor: orange,
                //         ),
                //         RadioButton(
                //           description: "High to low",
                //           value: "Text alignment left",
                //           groupValue: _singleValue,
                //           onChanged: (value) => setState(() {
                //             _singleValue = value.toString();
                //             sort();
                //             print(sort);
                //           }),
                //           activeColor: orange,
                //         ),
                //       ],
                //     ),

                //   ),
                // ),
                sell == true
                    ? Expanded(
                        child: forSell == null
                            ? const Center(child: CircularProgressIndicator())
                            : SingleChildScrollView(
                                child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: forSell!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      mainAxisSpacing: 1.0,
                                      crossAxisSpacing: 1.0,
                                      // childAspectRatio: 12.0,
                                      mainAxisExtent: 263,
                                      maxCrossAxisExtent: 200,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return (HomeRoomView(
                                          indexPass: forSell![index]));
                                    }),
                              ),
                      )
                    : rent == true
                        ? Expanded(
                            child: forRent == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : SingleChildScrollView(
                                    child: GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: forRent!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                          mainAxisSpacing: 1.0,
                                          crossAxisSpacing: 1.0,
                                          // childAspectRatio: 12.0,
                                          mainAxisExtent: 263,
                                          maxCrossAxisExtent: 200,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return (HomeRoomView(
                                              indexPass: forRent![index]));
                                        }),
                                  ),
                          )
                        : Expanded(
                            child: _users == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : SingleChildScrollView(
                                    child: GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: _users!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                          mainAxisSpacing: 1.0,
                                          crossAxisSpacing: 1.0,
                                          // childAspectRatio: 12.0,
                                          mainAxisExtent: 263,
                                          maxCrossAxisExtent: 200,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return (HomeRoomView(
                                              indexPass: _users![index]));
                                        }),
                                  ),
                          )
              ]),
            ),
          )),
    );
  }
  Future apiCall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    // print(token);
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
        mapResponse = jsonDecode(response.body);
        _users = mapResponse?['data'];

        // for (int i = 0; i <= mapResponse!.length - 1; i++) {
        //   mapResponse!['data'][i]['property_value'] == 'for_sale'
        //       ? forSell=(mapResponse?['data'][i])
        //       : '';
        //           // print("forSell $forSell");
        // }
        // getCategoryForRent(_users!);

        // for (int i = 0; i <= mapResponse?['data'].length - 1; i++) {
        //   mapResponse!['data'][i]['property_value'] == 'for_sale'
        //       ? _users1.add(mapResponse!['data'][i]['property_value'])
        //       : '';
        // }
      });
    }
  }

  List<dynamic> getCategoryForRent(List inputlist) {
    forRent =
        inputlist.where((o) => o['property_value'] == 'for_rent').toList();
    return forRent!;
  }

  List<dynamic> getCategoryForSell(List inputlist) {
    // forRent =
    //     inputlist.where((o) => o['property_value'] == 'for_rent').toList();
    forSell =
        inputlist.where((o) => o['property_value'] == 'for_sell').toList();
    print("forSell $forSell ");
    return forSell!;
  }

  void _getNames() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    final response =
        await dio.post('https://denga.r3therapeutic.com/public/api/searchpost',
            options: Options(
              headers: {"authorization": "Bearer $token"},
            ));
    if (response.statusCode == 200) {
      setState(() {
        List tempList = [];
        tempList = response.data as List;
        for (var i = 0; i <= tempList.length - 1; i++) {
          titles.add(tempList[i]['title']);
          print(titles);
        }
      });
    }
  }

  sort() {
    for (int i = 0; i < _users!.length; i++) {
      _users!.sort((p1, p2) {
        // sortedAsc
        //     .add(Comparable.compare(p1._users['price'], p2._users['price']));
        // print("print function invoked");
        return Comparable.compare(p1._users['price'], p2._users['price']);
      });
    }
  }
}

class _Person {
  final int age;
  final String name;
  _Person({required this.age, required this.name});
}

void _test() {
  final array = [
    _Person(age: 10, name: 'Dean'),
    _Person(age: 20, name: 'Jack'),
    _Person(age: 30, name: 'Ben'),
  ];

  // ascend with age
  // Dean Jack Ben
  array.sort((p1, p2) {
    return Comparable.compare(p1.age, p2.age);
  });

  // decend with age
  // Ben Jack Dean
  array.sort((p1, p2) {
    return Comparable.compare(p2.age, p1.age);
  });

  // ascend with name
  // Ben Dean Jack
  array.sort((p1, p2) {
    return Comparable.compare(p1.name, p2.name);
  });
}
