import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            onChanged: (value) {
              setState(() => isDarkMode = value);
            },
          ),
          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() => notificationsEnabled = value);
            },
          ),
          const SizedBox(height: 20),
          const Text("Language", style: TextStyle(fontSize: 18)),
          DropdownButton<String>(
            value: selectedLanguage,
            onChanged: (value) {
              setState(() => selectedLanguage = value!);
            },
            items: const [
              DropdownMenuItem(value: "English", child: Text("English")),
              DropdownMenuItem(value: "Sinhala", child: Text("Sinhala")),
              DropdownMenuItem(value: "Tamil", child: Text("Tamil")),
            ],
          ),
        ],
      ),
    );
  }
}
