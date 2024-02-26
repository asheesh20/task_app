import 'package:flutter/material.dart';
import 'package:task_app/models/home_model.dart';

class HomeDetail extends StatefulWidget {
  HomeDetail(
      {super.key,
      required this.roomImage,
      required this.roomName,
      required this.devices,
      required this.roomStatus,
      required this.roomTemperature});

  String roomName;
  String roomImage;
  String roomTemperature;
  bool roomStatus;
  List<DeviceInRoom>? devices;

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
