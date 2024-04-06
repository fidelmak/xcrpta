import 'package:flutter/material.dart';
import 'package:xcrpta/welcome.dart';
import 'package:get_it/get_it.dart';

import 'chart/service/ably_service.dart';
import 'chart/view/dashboard.dart';

void main() {
  getIt.registerSingletonAsync<AblyService>(() => AblyService.init(),
      signalsReady: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'XCRPTA',
      home: Container(
        child: DashboardPage(),
      ),
    );
  }
}
