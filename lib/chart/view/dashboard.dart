import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../main.dart';
import 'graph_list.dart';
import 'widgets/loading_container.dart';

GetIt getIt = GetIt.instance;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Live Cryptocurrency Price",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: getIt.allReady(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingContainer();
          } else {
            return const GraphList();
          }
        },
      ),
    );
  }
}
