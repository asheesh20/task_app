import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_app/models/home_model.dart';
import 'package:task_app/screens/roomcard.dart';
import 'package:task_app/widgets/username.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Expanded(
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
                      //final data = smartHomeData[index - 1];
                      //return RoomCard(roomData: data);

                      /*Container(
                        height: size.height * 0.08,
                        width: size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.orangeAccent,
                      );*/
                    })),
          ],
        ),
      ),
    );
  }
}
