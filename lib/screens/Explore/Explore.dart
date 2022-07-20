import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Explore/model/ExploreModelClass.dart';
import 'package:rent_house/screens/Explore/view/ExploreView.dart';
import 'package:rent_house/screens/drawer/drawerData.dart';
import 'package:rent_house/widgets/widgets.dart';

class Explore extends StatefulWidget {
   Explore({super.key});
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<ExploreModel> listItem = [];
  String _singleValue = "";

  void initState() {
    listItem = _searchResult();
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldkey,
        drawer: Container(
            width: size.width * 0.6,
             child: const Drawer(child: DrawerData())),
        body: SafeArea(
            child: Center(
          child: Container(
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
                      title: "",
                      fontsize: 20.0,
                      fontweight: FontWeight.normal,
                      color: const Color.fromARGB(255, 15, 5, 5)),
                  const Image(image: AssetImage('assets/images/iconTop.png')),
                ],
              ),
              SizedBox(height: size.height * 0.042),
             
              Container(
                width: size.width * 0.87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 199, 197, 197).withOpacity(0.3),
                      offset: Offset(5.0, 10.0),
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
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide:
                      //         const BorderSide(color: Color.fromARGB(255, 157, 155, 155), width: 32.0),
                      //     borderRadius: BorderRadius.circular(25.0)
                      //     ),
                      // suffixIcon: GestureDetector(
                      //   onTap: (() {
                      //     showDialog(
                      //       context: context,
                      //       builder: (_) => const PopUpOverLay(),
                      //     );
                      //   }),
                      //   child: const Icon(
                      //     Icons.sort,
                      //     color: textwhite,
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
          
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: listItem.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                           mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      // childAspectRatio: 12.0,
                      mainAxisExtent: 145,
                      maxCrossAxisExtent: 400,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        (ExploreView(indexPass: listItem[index])),
                  ),
                ),
              )
            ]),
          ),
        )));
  }

  List<ExploreModel> _searchResult() {
    List<ExploreModel> newProduct = <ExploreModel>[];
    newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
        newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
        newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
        newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
    newProduct.add(ExploreModel(
      image1: "room.png",
      image2: "bedroom.png",
      image3: "apartment1.png",
      image4: "bedroom.png",
    ));
 
    return newProduct;
  }
}
