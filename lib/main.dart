import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/nav_controller.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());

    final List<Widget> screens = [
      const HomeScreen(),
      const ProfileScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation with GetX'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Obx(() => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: screens[navController.selectedIndex.value],
        ),
        ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: navController.changeTab,
          selectedItemColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
