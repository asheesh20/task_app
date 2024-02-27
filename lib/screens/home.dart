import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/models/home_devices.dart';
import 'package:task_app/models/home_model.dart';
import 'package:task_app/screens/custom_drawer.dart';
import 'package:task_app/screens/roomcard.dart';
import 'package:task_app/widgets/devicesCard.dart';
//import 'package:task_app/widgets/username.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.grey[400],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              /*children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    );
                  },
                ),
              ],*/
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
}
