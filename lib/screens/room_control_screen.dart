import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:task_app/models/home_model.dart';
import 'package:task_app/widgets/device_switch.dart';
import 'dart:io' show Platform;

import 'package:task_app/widgets/glass_morphism.dart';

class RoomControlScreen extends StatefulWidget {
  const RoomControlScreen({super.key, required this.roomData});

  final HomeModel roomData;
  @override
  State<RoomControlScreen> createState() => _RoomControlScreenState();
}

class _RoomControlScreenState extends State<RoomControlScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeModel roomData = this.widget.roomData;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          SizedBox(
            width: 4,
          )
        ],
      ),*/
      body: Container(
        // height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(roomData.roomImage), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Platform.isAndroid
                          ? null
                          : const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                    ),
                  )
                ],
              ),
            ),
            bottomCard(size, roomData),
          ],
        ),
      ),
    );
  }

  Widget bottomCard(Size size, HomeModel roomData) {
    return GlassMorphism(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.49,
        //color: Colors.white.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomData.roomName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                    child: FittedBox(
                      child: CupertinoSwitch(
                          value: roomData.roomStatus,
                          activeColor: Colors.white,
                          trackColor: Colors.black.withOpacity(0.3),
                          thumbColor: Colors.brown,
                          onChanged: (value) {
                            setState(() {
                              roomData.roomStatus = value;
                            });
                          }),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                roomData.roomTemperature,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.5),
              thickness: 2,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Devices',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.22,
              child: ListView.builder(
                  itemCount: roomData.devices!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = roomData.devices![index];
                    return DeviceSwitch(data: data);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
