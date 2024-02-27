import 'package:flutter/material.dart';

class HomeModel {
  HomeModel({
    required this.roomName,
    required this.roomImage,
    required this.roomTemperature,
    this.roomStatus = false,
    this.devices,
  });

  String roomName;
  String roomImage;
  String roomTemperature;
  bool roomStatus;
  List<DeviceInRoom>? devices;
}

class DeviceInRoom {
  DeviceInRoom({
    required this.deviceName,
    required this.iconOn,
    required this.iconOff,
    this.deviceStatus = false,
  });
  String deviceName;
  IconData iconOn;
  IconData iconOff;
  bool deviceStatus;
}

List<HomeModel> smartHomeData = [
  HomeModel(
    roomName: 'Dining Room',
    roomImage: 'assets/images/Dinningroom.jpg',
    roomTemperature: '25°',
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  HomeModel(
    roomName: 'Living Room',
    roomImage: 'assets/images/Livingroom.jpg',
    roomTemperature: '25°',
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: 'Wifi',
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: 'Light',
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: 'TV',
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: 'AC',
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: 'Home Theater',
        iconOn: Icons.speaker_outlined,
        iconOff: Icons.volume_off_outlined,
        deviceStatus: false,
      ),
    ],
  ),
  HomeModel(
    roomName: 'Master Bedroom',
    roomImage: 'assets/images/Bedroom.jpg',
    roomTemperature: '25°',
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "TV",
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Home Theater",
        iconOn: Icons.speaker_outlined,
        iconOff: Icons.volume_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  HomeModel(
    roomName: 'Kitchen',
    roomImage: 'assets/images/Kitchen.jpg',
    roomTemperature: '25°',
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Chimney",
        iconOn: Icons.air,
        iconOff: Icons.power_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fridge",
        iconOn: Icons.kitchen,
        iconOff: Icons.power_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Microwave",
        iconOn: Icons.microwave,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Grinder",
        iconOn: Icons.power,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Induction",
        iconOn: Icons.power,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Coffee Maker",
        iconOn: Icons.coffee_maker_outlined,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  HomeModel(
    roomName: 'Home Office',
    roomImage: 'assets/images/Homeoffice.jpg',
    roomTemperature: '25°',
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  HomeModel(
    roomName: 'Guest Room',
    roomImage: 'assets/images/Guestroom.jpg',
    roomTemperature: '25°',
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "TV",
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  HomeModel(
    roomName: 'Laundry Room',
    roomImage: 'assets/images/Laundryroom.jpg',
    roomTemperature: '25°',
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Water Pump",
        iconOn: Icons.water_drop,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Washing Machine",
        iconOn: Icons.local_laundry_service,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
    ],
  ),
  HomeModel(
      roomName: 'Bathroom',
      roomImage: 'assets/images/Bathroom.jpg',
      roomTemperature: '25°',
      roomStatus: true,
      devices: [
        DeviceInRoom(
          deviceName: "Light",
          iconOn: Icons.lightbulb_rounded,
          iconOff: Icons.lightbulb_outline_rounded,
          deviceStatus: true,
        ),
        DeviceInRoom(
          deviceName: "Geysers",
          iconOn: Icons.water_drop,
          iconOff: Icons.power_off_outlined,
          deviceStatus: false,
        ),
      ]),
];
