import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_2/controller/homecontroller.dart';
import 'package:test_2/screens/mapscreen.dart';
import 'package:test_2/screens/profilescreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());
    return Scaffold(
      body: Obx(() {
        switch (homeC.selectedIndex.value) {
          case 0:
            return const ProfileScreen();
          case 1:
            return const MapScreen();
          case 2:
            return const Center(
              child: Text('Contact'),
            );
          case 3:
            return const Center(
              child: Text('Camera'),
            );
          case 4:
            return const Center(
              child: Text('Book'),
            );
          default:
            return const Center(
              child: Text('Profile'),
            );
        }
      }),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.grey,
        items: const <Widget>[
          Icon(Icons.person, size: 30),
          Icon(Icons.map, size: 30),
          Icon(Icons.contact_phone, size: 30),
          Icon(Icons.camera_alt, size: 30),
          Icon(Icons.menu_book, size: 30),
        ],
        onTap: (index) {
          homeC.changeIndex(index);
        },
      ),
    );
  }
}
