import 'package:flutter/material.dart';
import 'package:rent_house/View/Home/widgets/seachBox.dart';
import 'package:rent_house/widgets/widgets.dart';

class GenderPopUP extends StatefulWidget {
  const GenderPopUP({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => GenderPopUPState();
}

class GenderPopUPState extends State<GenderPopUP>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

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
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, bottom: 20, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(
                          title: "Filter",
                          fontsize: 20.0,
                          fontweight: FontWeight.normal),
                      InkWell(onTap: () {
                      Navigator.pop(context);
                      },
                       child: Icon(Icons.cancel_outlined)),
                    ],
                  ),
                ),
                // txtField(text: "Location", icon: Icons.sort, ontap: () {},hintText:"Locathion"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // txtField(text: "Type", icon: Icons.sort, ontap: () {},hintText:"Type"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
