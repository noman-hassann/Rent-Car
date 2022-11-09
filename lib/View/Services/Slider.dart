import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import '../../Config/color.dart';

class AnimationSlider extends StatefulWidget {
  AnimationSlider({
    Key,
    key,
  }) : super(key: key);
//
  @override
  _AnimationSliderState createState() => _AnimationSliderState();
}

class _AnimationSliderState extends State<AnimationSlider> {
  final List<String> imgesList = [
    "https://images.pexels.com/photos/112460/pexels-photo-112460.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/244206/pexels-photo-244206.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/100656/pexels-photo-100656.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];
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
                  child: Image.network(imgesList[index],
                      fit: BoxFit.fill, width: width * 1),
                );
              },
              slideTransform: const AccordionTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 32),
                indicatorBorderColor: white,
                indicatorBackgroundColor: Colors.white,
                currentIndicatorColor: blue,
              ),
              itemCount: imgesList.length,
              initialPage: 0,
              enableAutoSlider: true,
            ),
          ),
        ],
      ),
    );
  }
}
