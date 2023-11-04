import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: _notification,
            onChanged: _onNotificationChanged,
            title: const Text('Enable Notifications'),
            activeColor: Theme.of(context).primaryColor,
          ),
          CheckboxListTile(
            value: _notification,
            onChanged: _onNotificationChanged,
            title: const Text('Enable notifications'),
            subtitle: const Text('Enable notifications'),
            activeColor: Colors.black,
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
