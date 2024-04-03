import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xcrpta/widgets/bottom.dart';

import 'Api/display.dart';
import 'utils/colors.dart';
import 'widgets/my_icons.dart';
import 'widgets/price.dart';
import 'widgets/profile_card.dart';
import 'widgets/time_card.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // 80% of the screen width
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 30,
          foregroundColor: Colors.white,
          title: Text(
            'Crypto Nerd',
            style: TextStyle(fontSize: 12),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              ProfileCard(width: width),
              SizedBox(
                height: 20,
              ),
              const TimeCard(),
              const SizedBox(
                height: 20,
              ),
              MyIcons(),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(child: PriceList()),
              SizedBox(
                height: 30,
              ),
              BottomNav(),
            ],
          ),
        ));
  }
}
