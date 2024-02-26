//import 'package:flutter/material.dart';

class HomeDevices {
  HomeDevices(
      {required this.title, required this.image, required this.subTitle});

  final String title;
  final String image;
  final String subTitle;
}

List demoHomeDevices = [
  HomeDevices(
      title: 'Alice',
      image: 'assets/images/speakerc.jpg',
      subTitle: 'Speaker column'),
  HomeDevices(
      title: 'Lightstar',
      image: 'assets/images/desklamp.jpg',
      subTitle: 'Desk Lamp'),
  HomeDevices(
      title: 'Kettle',
      image: 'assets/images/kettle.jpg',
      subTitle: 'Wifi kettle'),
  HomeDevices(
      title: 'Xiaomi',
      image: 'assets/images/vacuum.jpg',
      subTitle: 'Robot vacuum cleaner'),
  HomeDevices(
      title: 'Smart Bulb-  2',
      image: 'assets/images/smartbulb.jpg',
      subTitle: 'Smart light Club'),
  HomeDevices(
      title: 'Top Line 3',
      image: 'assets/images/humidifier.jpg',
      subTitle: 'Humidifier'),
  HomeDevices(
      title: 'Broke V530',
      image: 'assets/images/vacuum.jpg',
      subTitle: 'Robot vacuum cleaner'),
];
