import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:rent_house/Screens/Drawer/drawerData.dart';
import 'package:rent_house/Screens/Home/view/homeView.dart';
import 'package:rent_house/Screens/Home/widgets/PopUpOverLay.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Home/model/HomeModelClass.dart';
import 'package:rent_house/widgets/rowButton.dart';
import 'package:rent_house/widgets/widgets.dart';

class Home extends StatefulWidget {
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HomeRoom> listItem = [];
  String _singleValue = "";
  bool pressAttention = true;
  void initState() {
    listItem = _hotelRoom();
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          key: _scaffoldkey,
          drawer: Container(
              width: size.width * 0.6,
              child: const Drawer(child: DrawerData())),
          body: SafeArea(
              child: Center(
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
                    const Image(image: AssetImage('assets/images/iconTop.png')),
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
                  child: Row(children: [
                    ///Custom Button
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextButton(
                        onPressed: () {
                          print("button");
                          setState(() => pressAttention = false);
                          print(pressAttention);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                pressAttention == false ? orange : Colors.white,
                            //    backgroundColor: Colors.white,
                            // primary: Colors.white,
                            minimumSize:
                                Size(size.width * 0.43, size.height * 0.07),
                            textStyle: const TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w500)),
                        child: text(
                            title: " For Sale",
                            fontsize: 15.0,
                            color: pressAttention == false
                                ? Colors.white
                                : Colors.black,
                            fontweight: FontWeight.normal),
                      ),
                    ),

                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextButton(
                        onPressed: () {
                          setState(() => pressAttention = true);
                          print(pressAttention);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                pressAttention == true ? orange : Colors.white,
                            //    backgroundColor: Colors.white,
                            primary: Colors.black,
                            minimumSize:
                                Size(size.width * 0.43, size.height * 0.07),
                            textStyle: const TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w500)),
                        child: text(
                            title: "For Rent",
                            fontsize: 15.0,
                            color: pressAttention == true
                                ? Colors.white
                                : Colors.black,
                            fontweight: FontWeight.normal),
                      ),
                    ),

                    // rowButtonFun(
                    //     backgroundcolor: Colors.white,
                    //     title1: "For Sale",
                    //     textColor: Colors.black,
                    //     height: size.height * 0.07,
                    //     width: size.width * 0.43,
                    //     ontap: () {
                    //       // Navigator.push(
                    //       //   context,
                    //       //   MaterialPageRoute(
                    //       //       builder: (context) => const loginScreen()),
                    //       // );
                    //     }),
                  ]),
                ),
                SizedBox(height: size.height * 0.020),
                Container(
                  width: size.width * 0.87,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 199, 197, 197).withOpacity(0.3),
                        offset: Offset(5.0, 5.0),
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
                              builder: (_) => const PopUpOverLay(),
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
                Center(
                  child: SizedBox(
                    // color: Colors.amber,
                    width: size.width * 0.85,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: text(title: "Sort :", fontsize: 17.0),
                        ),
                        RadioButton(
                          description: "Low to High",
                          value: "High to Low",
                          groupValue: _singleValue,
                          onChanged: (value) => setState(
                            () => _singleValue = value.toString(),
                          ),
                          activeColor: orange,
                        ),
                        RadioButton(
                          description: "High to low",
                          value: "Text alignment left",
                          groupValue: _singleValue,
                          onChanged: (value) => setState(
                            () => _singleValue = value.toString(),
                          ),
                          activeColor: orange,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: listItem.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        // childAspectRatio: 12.0,
                        mainAxisExtent: 233,
                        maxCrossAxisExtent: 200,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          (HomeRoomView(indexPass: listItem[index])),
                    ),
                  ),
                )
              ]),
            ),
          ))),
    );
  }

  List<HomeRoom> _hotelRoom() {
    List<HomeRoom> newProduct = <HomeRoom>[];
    newProduct.add(HomeRoom(
      image1: "apartment1.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(HomeRoom(
      image1: "apartment1.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(HomeRoom(
      image1: "apartment1.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(HomeRoom(
      image1: "apartment1.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(HomeRoom(
      image1: "apartment1.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(HomeRoom(
      image1: "apartment1.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    return newProduct;
  }
}
