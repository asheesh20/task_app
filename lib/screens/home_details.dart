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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    widget.roomImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height / 2,
                  ),
                  Container(
                    height: height / 2,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFBFBFB),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFBFBFB),
                          blurRadius: 20,
                          spreadRadius: 20,
                          offset: Offset(5, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
