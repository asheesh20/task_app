/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/models/home_devices.dart';
//import 'package:flutter/widgets.dart';
import 'package:task_app/models/home_model.dart';
import 'package:task_app/screens/home_details.dart';
import 'package:task_app/screens/roomcard.dart';
import 'package:task_app/widgets/devicesCard.dart';
import 'package:task_app/widgets/username.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Hello Username',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Rooms',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            //Rooms Configuration
            /*Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: smartHomeData.length,
                itemBuilder: (context, index) {
                  final data = smartHomeData[index];
                  return RoomCard(roomData: data);
                  /*if (index == 0 || smartHomeData.length + 1 == index) {
                        return Container(
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.orange,
                        );
                      }*/
                  // data = smartHomeData[index - 1];
                  //return RoomCard(roomData: data);

                  /*Container(
                        height: size.height * 0.08,
                        width: size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.orangeAccent,
                      );*/
                },
              ),
            ),*/
            /*SizedBox(
              height: 350,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(dotColor: Colors.black),
                ),
              ),
            ),*/

            InkWell(
              onTap: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeDetail(
                        roomImage:,
                        roomName: roomName,
                        devices: devices,
                        roomStatus: roomStatus,
                        roomTemperature: roomTemperature),),);*/
              },
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: ListView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: smartHomeData.length,
                  itemBuilder: (context, index) {
                    final data = smartHomeData[index];
                    return RoomCard(roomData: data);
                    /*if (index == 0 || smartHomeData.length + 1 == index) {
                          return Container(
                            height: size.height * 0.08,
                            width: size.width * 0.4,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.orange,
                          );
                        }*/
                    // data = smartHomeData[index - 1];
                    //return RoomCard(roomData: data);

                    /*Container(
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.orangeAccent,
                        );*/
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.grey.shade800.withOpacity(0.3),
                  activeDotColor: const Color(0xFF6A4FB7),
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // My devices
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Devices',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ]),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: demoHomeDevices.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.of(context).size.width / 2 - 36,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final info = demoHomeDevices[index];
                    /*return Padding(
                      // padding: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),

                      child: DeviceCard(deviceData: info),
                    );*/
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: deviceCard(demoHomeDevices[index]),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }

  Container deviceCard(HomeDevices homeDevices) {
    //final HomeDevices deviceData;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F2F8),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(homeDevices.image), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              homeDevices.title,
              style: const TextStyle(
                height: 8,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
          /*SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              homeDevices.image,
              fit: BoxFit.cover,
            ),
          )*/
        ],
      ),
    );
  }
}
*/

//New Code
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/models/home_devices.dart';
//import 'package:flutter/widgets.dart';
import 'package:task_app/models/home_model.dart';
import 'package:task_app/screens/custom_drawer.dart';
import 'package:task_app/screens/roomcard.dart';
import 'package:task_app/widgets/devicesCard.dart';
import 'package:task_app/widgets/username.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Hello Username',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Rooms',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            //Rooms Configuration
            /*Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: smartHomeData.length,
                itemBuilder: (context, index) {
                  final data = smartHomeData[index];
                  return RoomCard(roomData: data);
                  /*if (index == 0 || smartHomeData.length + 1 == index) {
                        return Container(
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.orange,
                        );
                      }*/
                  // data = smartHomeData[index - 1];
                  //return RoomCard(roomData: data);

                  /*Container(
                        height: size.height * 0.08,
                        width: size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.orangeAccent,
                      );*/
                },
              ),
            ),*/
            /*SizedBox(
              height: 350,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(dotColor: Colors.black),
                ),
              ),
            ),*/

            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: smartHomeData.length,
                itemBuilder: (context, index) {
                  final data = smartHomeData[index];
                  return RoomCard(roomData: data);
                  /*if (index == 0 || smartHomeData.length + 1 == index) {
                        return Container(
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.orange,
                        );
                      }*/
                  // data = smartHomeData[index - 1];
                  //return RoomCard(roomData: data);

                  /*Container(
                        height: size.height * 0.08,
                        width: size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.orangeAccent,
                      );*/
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.grey.shade800.withOpacity(0.3),
                  activeDotColor: const Color(0xFF6A4FB7),
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // My devices
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Devices',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ]),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.of(context).size.width / 2 - 36,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final info = demoHomeDevices[index];
                    return Padding(
                      // padding: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),

                      child: DeviceCard(deviceData: info),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }

  /*Container devicesCard(HomeDevices homeDevices) {
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xFFF4F2F8),
          borderRadius: BorderRadius.circular(33),
          image: DecorationImage(image: AssetImage(demoHomeDevices[index]))),
      child: Column(
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
      ),
    );
  } */
}
