import 'package:flutter/material.dart';
import 'package:task_app/models/home_model.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.roomData});

  final HomeModel roomData;

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //height: size.height * 0.5,
      width: size.width * 0.4,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(size.width * 0.07),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(roomData.roomImage),
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
        child: Text(
          roomData.roomName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
