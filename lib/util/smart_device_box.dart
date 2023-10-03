import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String deviceIconPath;
  final bool powerStatus;
  final Function(bool)? onChanged;

  const SmartDeviceBox(
      {super.key,
      required this.smartDeviceName,
      required this.deviceIconPath,
      required this.powerStatus,
      required this.onChanged
      }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: powerStatus ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            Image.asset(
              deviceIconPath,
              height: 60,
              color: powerStatus ? Colors.white : Colors.black,
            ),

            // name and button
            Row(
              children: [
                Expanded(
                  child: Text(
                    smartDeviceName,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold,color: powerStatus ? Colors.white : Colors.black),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerStatus,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
