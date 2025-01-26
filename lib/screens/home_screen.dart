import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentDate = '';

  void displayCurrentDate() {
    setState(() {
      currentDate = DateFormat('EEEE, d MMMM y').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Welcome to the Home Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildImageCard("assets/image1.jpg"),
              _buildImageCard("assets/image2.jpg"),
              _buildImageCard("assets/image3.jpg"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: displayCurrentDate,
          child: const Text("Today")
        ),
        const SizedBox(height: 10),
        if (currentDate.isNotEmpty)
          Text(
            currentDate,
            style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
      ],
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(imagePath, width: 150, fit: BoxFit.cover),
    );
  }
}
