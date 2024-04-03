import 'dart:convert';
import 'package:flutter/material.dart';

import 'display.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return CryptoPriceWidget();
  }
}
