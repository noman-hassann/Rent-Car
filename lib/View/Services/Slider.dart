import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:rent_house/config/color.dart';

class AnimationSlider extends StatefulWidget {
  final indexImages;
  AnimationSlider({Key, key, required this.indexImages}) : super(key: key);
// 
  @override
  _AnimationSliderState createState() => _AnimationSliderState();
}

class _AnimationSliderState extends State<AnimationSlider> {
  // final List<String> item = [
  //   "https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
  //   "https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
  //   "https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
  //   "https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
  //   "https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
  // ];
  bool _isPlaying = false;
  late CarouselSliderController _sliderController;
  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
    _sliderController.setAutoSliderEnabled(_isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: height * 0.34,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return Container(
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://denga.r3therapeutic.com/public${ widget.indexImages[index]['image_name']}",
                     // widget.indexImages[index],
                      fit: BoxFit.fill,
                      width: width * 1),
                );
              },
              slideTransform:const AccordionTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 32),
                indicatorBorderColor: textwhite,
                indicatorBackgroundColor: Colors.white,
                currentIndicatorColor: orange,
              ),
              itemCount: widget.indexImages.length,
              initialPage: 0,
              enableAutoSlider: true,
            ),
          ),
        ],
      ),
    );
  }
}
