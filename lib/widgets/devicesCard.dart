import 'package:flutter/material.dart';
import 'package:task_app/models/home_devices.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.deviceData});

  final HomeDevices deviceData;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F2F8),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(deviceData.image),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 86, 0, 0),
        child: Text(
          deviceData.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      /*child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: Image.asset(
              homeDevices.image,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),*/
    );
  }
}
