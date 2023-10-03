import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_smart_home/icons/my_icons.dart';
import 'package:ui_smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of smart devices
  List mySmartDevices = [
    // name , icon path , power status
    ['Smart Light', MyIcon.lightBulb, true],
    ['Smart AC', MyIcon.airConditioner, true],
    ['Smart TV', MyIcon.smartTv, true],
    ['Smart Fan', MyIcon.fan, true],
  ];


  // change power status
  void chnagePowerStatus(bool value , int index){
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // menu and person icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    MyIcon.menu,
                    height: 45,
                  ),
                  const Icon(
                    Icons.person,
                    size: 45,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // welcome home haroon text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome Home,'),
                  Text(
                    'Haroon',
                    style: GoogleFonts.bebasNeue(  
                      fontSize: 64,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Divider(thickness: 1,),

            const SizedBox(height: 20,),

            //smart home text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Smart Devices',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // home items + grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.3,
                  ),
                  itemBuilder: (context, index) => SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    deviceIconPath: mySmartDevices[index][1],
                    powerStatus: mySmartDevices[index][2],
                    onChanged: (value) => chnagePowerStatus(value,index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
