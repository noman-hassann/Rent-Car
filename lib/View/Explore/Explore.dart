import 'package:flutter/material.dart';
import 'package:rent_house/View/Drawer/drawerData.dart';
import 'package:rent_house/View/Explore/SearchDeligate.dart';
import '../../Config/color.dart';
import '../Home/homeView.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
 

  // Map? mapResponse;
  // Map? dataResponce;
  List titles = ['Audi','Mercedies','BMW'];
  // ignore: unused_field
  // List _users=[1,2,3,4,5,6,7,8,];

  @override
  void initState() {
    super.initState();
  }

  // ignore: prefer_final_fields
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldkey,
        drawer: SizedBox(
            width: size.width * 0.6, child: const Drawer(child: DrawerData())),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              // color: Color.fromARGB(255, 207, 89, 89),
              child: Column(children: [
                Row(
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
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        child: IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 25,
                            color: blue,
                          ),
                          onPressed: () {
                            _scaffoldkey.currentState!.openDrawer();
                          },
                        ),
                      ),
                    ),
                   
                  ],
                ),
                SizedBox(height: size.height * 0.042),
                InkWell(
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: MySearchDelegate(titles: titles));
                  },
                  child: Container(
                    width: size.width * 0.87,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 199, 197, 197)
                              .withOpacity(0.3),
                          offset: const Offset(5.0, 10.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.8),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.search), onPressed: () {}),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Expanded(
                  child:
                  //  _users == null
                  //     ? const Center(child: CircularProgressIndicator())
                  //     : 
                      
                      SingleChildScrollView(
                          child:GridView.builder(
                                        physics: const ScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: 10,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                          mainAxisSpacing: 1.0,
                                          crossAxisSpacing: 1.0,
                                          // childAspectRatio: 12.0,
                                          mainAxisExtent: 200,
                                          maxCrossAxisExtent: 200,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return (RentailView(
                                              indexPass: [index]));
                                        }),
                        ),
                )
              ]),
          ),
        ),
            )));
  }
}

  // Future apiCall() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var token = pref.getString('token');
  //   http.Response response;
  //   response = await http.post(
  //       Uri.parse("https://denga.r3therapeutic.com/public/api/getpost"),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       });
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       mapResponse = jsonDecode(response.body);
  //       _users = mapResponse?['data'];
  //     });
  //   }
  // }

  // void _getNames() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var token = pref.getString('token');
  //   final response =
  //       await dio.post('https://denga.r3therapeutic.com/public/api/searchpost',
  //           options: Options(
  //             headers: {"authorization": "Bearer $token"},
  //           ));

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       List tempList = [];
  //       tempList = response.data as List;
  //       for (var i = 0; i <= tempList.length - 1; i++) {
  //         titles.add(tempList[i]['title']);
  //       }
  //     });
  //   }

    // setState(() {
    //   names = titles;
    //   names.shuffle();
    //   filteredNames = names;
    // });


