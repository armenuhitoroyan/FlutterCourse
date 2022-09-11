import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../widgets/inner_carusel_container_widget.dart';

class HomePAge extends StatefulWidget with ColorS{
  
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  final Random _random = Random();
  
  @override
  Widget build(BuildContext context) {
    ColorS.colors();
    print(Colors.primaries);
    return Container(
      child: CarouselSliderWideget(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CarouselSliderWideget() {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          itemCount: ColorS.colors().length,
          options: CarouselOptions(aspectRatio: 1.2, height: 200,),
          itemBuilder: (context, index, realIndex){
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
               decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: ColorS.colors()
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: InnerCaruselContainerWidget()
              ),
            );
          }
        )
      ),
    );
  }
}