import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListWheelScrollView(
        itemExtent: 200,
        children: [
          for (var x in [1, 2, 3, 4, 5, 6, 7, 87, 9])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.teal,
                alignment: Alignment.center,
                child: const Text(
                  'Pick me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size48,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
